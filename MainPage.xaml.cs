using System.Text.Json;
using System.Text.Json.Serialization;

namespace Concurso;

public partial class MainPage : ContentPage
{
    private bool _paginaCarregada = false;

    private static readonly string[] _todosOsEstados =
        ["AC","AL","AM","AP","BA","CE","DF","ES","GO","MA","MG","MS","MT",
         "PA","PB","PE","PI","PR","RJ","RN","RO","RR","RS","SC","SE","SP","TO","Nacional"];

    private const string PrefKeyEstados = "estados_selecionados";

    private readonly HashSet<string> _estadosSelecionados = CarregarEstados();

    private static HashSet<string> CarregarEstados()
    {
        var salvo = Preferences.Get(PrefKeyEstados, string.Empty);
        if (!string.IsNullOrEmpty(salvo))
            return new HashSet<string>(salvo.Split(','));
        // padrão: todos selecionados
        return new HashSet<string>(["AC","AL","AM","AP","BA","CE","DF","ES","GO","MA","MG","MS","MT",
                                    "PA","PB","PE","PI","PR","RJ","RN","RO","RR","RS","SC","SE","SP","TO","Nacional"]);
    }

    private void SalvarEstados() =>
        Preferences.Set(PrefKeyEstados, string.Join(',', _estadosSelecionados));

    public MainPage()
    {
        InitializeComponent();
        AtualizarBotaoEstados();

        this.Loaded += (s, e) => {
            Log("✅ Aplicativo iniciado. Carregando site automaticamente...");
            MainWebView.Source = "https://www.pciconcursos.com.br/concursos/";
        };
    }

    // ── Carregar site ──────────────────────────────────────────────────────────

    private async void OnCarregarClicked(object sender, EventArgs e)
    {
        try
        {
            Log("🌐 Carregando PCI Concursos...");
            SetStatus("Carregando...");
            BtnGerar.IsEnabled = false;

            MainWebView.Source = "https://www.pciconcursos.com.br/concursos/";
        }
        catch (Exception ex)
        {
            Log($"❌ Erro ao carregar: {ex.Message}");
        }
    }

    private void OnWebViewNavigating(object sender, WebNavigatingEventArgs e)
    {
        SetStatus("Navegando...");
        BtnGerar.IsEnabled = false;
        Log($"🔄 Navegando para: {e.Url}");
    }

    private async void OnWebViewNavigated(object sender, WebNavigatedEventArgs e)
    {
        if (e.Result == WebNavigationResult.Success)
        {
            Log($"✅ Página carregada com sucesso!");
            SetStatus("Pronto");
            _paginaCarregada = true;
            BtnGerar.IsEnabled = true;
        }
        else
        {
            Log($"❌ Falha ao carregar: {e.Result}");
            SetStatus("Erro");
            BtnGerar.IsEnabled = false;
            _paginaCarregada = false;
        }
    }

    // ── Gerar relatório ────────────────────────────────────────────────────────

    private async void OnGerarClicked(object sender, EventArgs e)
    {
        await ExecutarRelatorio();
    }

    private async Task ExecutarRelatorio()
    {
        if (!_paginaCarregada)
        {
            Log("⚠️ Site não carregado. Clique em 'Carregar Site' primeiro.");
            return;
        }

        Log("📊 Executando script de monitoramento...");
        SetStatus("Gerando...");

        try
        {
            // Injetar filtro de estados antes de rodar o script
            string[] estados = [.. _estadosSelecionados];
            await MainWebView.EvaluateJavaScriptAsync(
                $"window._estadosFiltro = {JsonSerializer.Serialize(estados)};");

            string script = await LerScriptAsync();
            string? rawResult = await MainWebView.EvaluateJavaScriptAsync(script);

            if (string.IsNullOrEmpty(rawResult) || rawResult == "null")
            {
                Log("⚠️ Script não retornou dados. Verifique se está na página de concursos.");
                SetStatus("Sem dados");
                return;
            }

            // JS retorna apenas {novidades, total} — o HTML fica em window._monitorHtml
            // para evitar o limite de ~4KB do EvaluateJavaScriptAsync no Android
            string jsonStr = NormalizarJsonResult(rawResult.Trim());

            var contagem = JsonSerializer.Deserialize<ResultadoScript>(jsonStr);
            if (contagem is null)
            {
                Log("⚠️ Não foi possível ler contagem do script.");
                SetStatus("Erro");
                return;
            }

            // Ler HTML em Base64 (evita problemas de \u escapes no Android WebView)
            string b64 = await LerStringJsEmChunks("window._monitorHtmlB64");
            string html = string.IsNullOrEmpty(b64)
                ? string.Empty
                : System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(b64));
            contagem.Html = html;

            if (string.IsNullOrEmpty(html))
            {
                Log("⚠️ Relatório vazio.");
                SetStatus("Vazio");
                return;
            }

            Log($"✅ Relatório gerado! Total: {contagem.Total} concursos | Novidades: {contagem.Novidades}");
            SetStatus($"✅ {contagem.Total} concursos");

            await Navigation.PushAsync(new ContentPage
            {
                Title = "Relatório de Concursos",
                Content = new WebView
                {
                    Source = new HtmlWebViewSource
                    {
                        Html = contagem.Html
                    }
                }
            });
        }
        catch (Exception ex)
        {
            Log($"❌ Erro ao executar script: {ex.Message}");
            Log($"Detalhe: {ex.StackTrace}");
            SetStatus("Erro");
        }
    }

    // ── Exportar JSON ──────────────────────────────────────────────────────────

    private async void OnExportarClicked(object sender, EventArgs e)
    {
        if (!_paginaCarregada)
        {
            await DisplayAlertAsync("Aviso", "Carregue o site primeiro.", "OK");
            return;
        }

        try
        {
            Log("💾 Exportando dados...");

            string script = @"
                (function() {
                    const data = localStorage.getItem('monitor_concursos_vagas_pci');
                    return data ? data : 'null';
                })();
            ";

            string? raw = await MainWebView.EvaluateJavaScriptAsync(script) as string;

            if (raw == null || raw == "null")
            {
                Log("⚠️ Nenhum dado salvo. Gere um relatório primeiro.");
                await DisplayAlertAsync("Aviso", "Nenhum dado encontrado. Gere um relatório primeiro.", "OK");
                return;
            }

            string json = raw.Trim();
            if (json.StartsWith("\"") && json.EndsWith("\""))
            {
                json = JsonSerializer.Deserialize<string>(json) ?? json;
            }

            string fileName = $"concursos_{DateTime.Now:yyyy-MM-dd_HH-mm}.json";
            string filePath = Path.Combine(FileSystem.CacheDirectory, fileName);
            await File.WriteAllTextAsync(filePath, json);

            Log($"✅ Exportado: {fileName}");

            await Share.RequestAsync(new ShareFileRequest
            {
                Title = "Compartilhar dados de concursos",
                File = new ShareFile(filePath)
            });
        }
        catch (Exception ex)
        {
            Log($"❌ Erro ao exportar: {ex.Message}");
        }
    }

    // ── Limpar histórico ───────────────────────────────────────────────────────

    private async void OnLimparClicked(object sender, EventArgs e)
    {
        bool confirmar = await DisplayAlertAsync(
            "Limpar Histórico",
            "Isso apagará o histórico salvo e todas as próximas verificações tratarão tudo como novidade. Confirmar?",
            "Sim, limpar", "Cancelar");

        if (!confirmar) return;

        try
        {
            if (_paginaCarregada)
            {
                await MainWebView.EvaluateJavaScriptAsync("localStorage.removeItem('monitor_concursos_vagas_pci')");
            }

            Log("🗑️ Histórico limpo com sucesso.");
            await DisplayAlertAsync("Sucesso", "Histórico limpo!", "OK");
        }
        catch (Exception ex)
        {
            Log($"❌ Erro ao limpar: {ex.Message}");
        }
    }

    private void AtualizarBotaoEstados()
    {
        MainThread.BeginInvokeOnMainThread(() =>
        {
            if (BtnEstados != null)
            {
                BtnEstados.Text = $"\U0001F5FA\uFE0F Estados: {_estadosSelecionados.Count}/{_todosOsEstados.Length}";
                BtnEstados.BackgroundColor = _estadosSelecionados.Count < _todosOsEstados.Length
                    ? Color.FromArgb("#e67e22")
                    : Color.FromArgb("#16a085");
            }
        });
    }

    private async void OnEstadosClicked(object sender, EventArgs e)
    {
        await Navigation.PushModalAsync(new SelectEstadosPage(_estadosSelecionados, () =>
        {
            SalvarEstados();
            AtualizarBotaoEstados();
        }));
    }

    // ── Utilitários ────────────────────────────────────────────────────────────

    private static string NormalizarJsonResult(string raw)
    {
        if (raw.StartsWith("\"") && raw.EndsWith("\""))
            return JsonSerializer.Deserialize<string>(raw) ?? raw;
        if (raw.Contains("\\\""))
            return raw.Replace("\\\"", "\"");
        return raw;
    }

    private async Task<string> LerStringJsEmChunks(string jsVar)
    {
        string? lenRaw = await MainWebView.EvaluateJavaScriptAsync(
            $"(typeof {jsVar} === 'string' ? {jsVar}.length : 0)");
        string lv = (lenRaw ?? "0").Trim().Trim('"');
        if (!int.TryParse(lv, out int totalLen) || totalLen == 0)
            return string.Empty;

        // Base64 só tem ASCII seguro — basta remover as aspas externas que o Android adiciona
        const int chunkSize = 3000;
        var sb = new System.Text.StringBuilder(totalLen);
        for (int offset = 0; offset < totalLen; offset += chunkSize)
        {
            string? chunk = await MainWebView.EvaluateJavaScriptAsync(
                $"{jsVar}.substring({offset}, {offset + chunkSize})");
            if (chunk is null) break;
            string c = chunk.Trim();
            if (c.StartsWith("\"") && c.EndsWith("\""))
                c = c.Substring(1, c.Length - 2);
            sb.Append(c);
        }
        return sb.ToString();
    }

    private static Task<string> LerScriptAsync()
    {
        return Task.FromResult("""
(function(){
    const STORAGE_KEY = 'monitor_concursos_vagas_pci';
    const conteiner = document.querySelector('#concursos');
    if (!conteiner) return null;

    const elementosConcurso = Array.from(conteiner.querySelectorAll('.da, .na, .ea'));
    let listaAtual = [];

    elementosConcurso.forEach(elemento => {
        const ca = elemento.querySelector('.ca');
        if (!ca) return;
        const link = ca.querySelector('a[title]');
        const infoVagas = ca.querySelector('.cd');
        if (!link || !infoVagas) return;
        const nome = link.innerText.trim();
        const matchVagas = infoVagas.innerText.match(/(\d+)\s*vagas?/i);
        const numVagas = matchVagas ? parseInt(matchVagas[1]) : 0;

        const ccDiv = elemento.querySelector('.cc');
        const uf = ccDiv ? ccDiv.innerText.trim().replace(/\u00a0/g, '') : '';
        const estadoRegiao = {
            'SP':'Sudeste','MG':'Sudeste','RJ':'Sudeste','ES':'Sudeste',
            'PR':'Sul','RS':'Sul','SC':'Sul',
            'BA':'Nordeste','CE':'Nordeste','PE':'Nordeste','RN':'Nordeste',
            'AL':'Nordeste','SE':'Nordeste','PB':'Nordeste','MA':'Nordeste','PI':'Nordeste',
            'AM':'Norte','PA':'Norte','TO':'Norte','RO':'Norte','RR':'Norte','AC':'Norte','AP':'Norte',
            'GO':'Centro-Oeste','DF':'Centro-Oeste','MS':'Centro-Oeste','MT':'Centro-Oeste'
        };
        const categoria = uf && estadoRegiao[uf] ? estadoRegiao[uf] : 'Nacional';
        listaAtual.push({ nome, numVagas, uf, categoria, id: `${nome}-${numVagas}` });
    });

    listaAtual.sort((a, b) => b.numVagas - a.numVagas);
    const dadosSalvos = JSON.parse(localStorage.getItem(STORAGE_KEY) || '[]');
    const idsSalvos = dadosSalvos.map(d => d.id);
    const novidades = listaAtual.filter(c => !idsSalvos.includes(c.id));
    localStorage.setItem(STORAGE_KEY, JSON.stringify(listaAtual));

    const listaRelatorio = (window._estadosFiltro && window._estadosFiltro.length > 0)
        ? listaAtual.filter(c => window._estadosFiltro.includes(c.uf || 'Nacional'))
        : listaAtual;
    const novidadesRelatorio = (window._estadosFiltro && window._estadosFiltro.length > 0)
        ? novidades.filter(c => window._estadosFiltro.includes(c.uf || 'Nacional'))
        : novidades;

    const gerarSecaoNovidades = () => {
        if (novidadesRelatorio.length > 0) {
            return `
                <div class='novidade-sec' style='margin-top:0;margin-bottom:30px;'>
                    <h2 style='background:#27ae60;margin-top:0;'>&#x1F195; 1. Novidades Encontradas (${novidadesRelatorio.length})</h2>
                    ${novidadesRelatorio.map(n => `
                        <div class='item'><span class='novo-badge'>NOVO</span><span class='vagas'>${n.numVagas || 'C.R.'} vagas</span><span><strong>[${n.uf || 'Nac.'}]</strong> ${n.nome}</span></div>
                    `).join('')}
                </div>
            `;
        } else {
            return `
                <div class='novidade-sec' style='background:#f0f0f0;border-color:#95a5a6;margin-top:0;margin-bottom:30px;'>
                    <h2 style='background:#7f8c8d;margin-top:0;'>&#x1F4CB; 1. Hist\u00f3rico Atualizado</h2>
                    <div style='padding:20px;text-align:center;color:#555;'>
                        <p style='font-size:16px;margin-bottom:10px;'>&#x2705; Nenhuma novidade encontrada nesta verifica\u00e7\u00e3o.</p>
                        <p style='font-size:14px;'>Total de concursos monitorados: <strong>${listaRelatorio.length}</strong></p>
                        <p style='font-size:12px;color:#888;'>&#xDA;ltima atualiza\u00e7\u00e3o: ${new Date().toLocaleString('pt-BR')}</p>
                    </div>
                </div>
            `;
        }
    };

    const todasCategorias = ['Sudeste', 'Sul', 'Nordeste', 'Norte', 'Centro-Oeste', 'Nacional'];
    const ordemCategorias = todasCategorias.filter(c => listaRelatorio.some(i => i.categoria === c));
    const categorias = {
        'Sudeste':      { titulo: '&#x1F534; Sudeste (SP/MG/RJ/ES)', cor: 'bg-sudeste' },
        'Sul':          { titulo: '&#x1F535; Sul (PR/RS/SC)', cor: 'bg-sul' },
        'Nordeste':     { titulo: '&#x1F7E0; Nordeste', cor: 'bg-nordeste' },
        'Norte':        { titulo: '&#x1F7E2; Norte', cor: 'bg-norte' },
        'Centro-Oeste': { titulo: '&#x1F7E3; Centro-Oeste (DF/GO/MS/MT)', cor: 'bg-centroeste' },
        'Nacional':     { titulo: '&#x1F1E7;&#x1F1F7; Nacional', cor: 'bg-nacional' }
    };

    let htmlRelatorio = `
        <html><head><title>Relat\u00f3rio de Concursos</title><meta charset='UTF-8'>
        <style>
            body { font-family:'Segoe UI',sans-serif; padding:30px; background:#f4f7f6; }
            .card { max-width:900px; margin:auto; background:white; padding:25px; border-radius:10px; box-shadow:0 4px 6px rgba(0,0,0,0.1); }
            h1 { text-align:center; color:#2c3e50; border-bottom:2px solid #3498db; padding-bottom:10px; }
            h2 { padding:8px 15px; border-radius:5px; color:white; margin-top:25px; font-size:1.2em; }
            .bg-sudeste { background:#c0392b; } .bg-sul { background:#2980b9; } .bg-nordeste { background:#e67e22; } .bg-norte { background:#27ae60; } .bg-centroeste { background:#8e44ad; } .bg-nacional { background:#2c3e50; }
            .item { display:flex; align-items:center; padding:12px; border-bottom:1px solid #eee; font-size:14px; }
            .item:hover { background:#f1f1f1; }
            .vagas { font-weight:bold; color:#2980b9; width:100px; flex-shrink:0; }
            .novidade-sec { border:2px solid #27ae60; padding:15px; border-radius:8px; background:#f9fff9; }
            .novo-badge { background:#27ae60; color:white; padding:2px 6px; border-radius:4px; font-size:10px; margin-right:10px; }
            .timestamp { text-align:right; font-size:12px; color:#7f8c8d; margin-top:20px; border-top:1px dashed #ccc; padding-top:10px; }
            .destaque-vagas { background-color:#f1f9ff; border-left:4px solid #2980b9; }
            .uf-header { background:#ecf0f1; padding:4px 12px; font-weight:bold; font-size:12px; color:#555; border-left:3px solid #bbb; margin-top:6px; }
            .uf-count { background:#95a5a6; color:white; padding:1px 6px; border-radius:10px; font-size:10px; margin-left:6px; font-weight:normal; }
        </style></head>
        <body><div class='card'>
            <h1>&#x1F4CA; Monitor de Concursos P\u00fablicos</h1>
            <p style='text-align:center;color:#555;margin-bottom:20px;'>Ordenado por <strong>maior n\u00famero de vagas</strong> em cada categoria</p>
    `;

    htmlRelatorio += gerarSecaoNovidades();

    let secaoN = 2;
    ordemCategorias.forEach(catKey => {
        const itensCategoria = listaRelatorio.filter(c => c.categoria === catKey);
        const catInfo = categorias[catKey];
        htmlRelatorio += `<h2 class='${catInfo.cor}'>${secaoN++}. ${catInfo.titulo}</h2>`;
        if (itensCategoria.length > 0) {
            const ufsNaCat = [...new Set(itensCategoria.map(c => c.uf || ''))].sort();
            ufsNaCat.forEach(uf => {
                const itensDaUf = itensCategoria.filter(c => (c.uf || '') === uf);
                if (uf) {
                    htmlRelatorio += `<div class='uf-header'>${uf} <span class='uf-count'>${itensDaUf.length}</span></div>`;
                }
                itensDaUf.forEach(c => {
                    const grande = c.numVagas > 100 ? '<span style="margin-left:10px;background:#2980b9;color:white;padding:2px 8px;border-radius:12px;font-size:10px;font-weight:bold;">GRANDE</span>' : '';
                    htmlRelatorio += `<div class='item ${c.numVagas > 100 ? 'destaque-vagas' : ''}'>
                        <span class='vagas'>${c.numVagas || 'C.R.'} vagas</span>
                        <span style='flex:1;'>${c.nome}</span>
                        ${grande}
                    </div>`;
                });
            });
        } else {
            htmlRelatorio += "<div class='item' style='color:#999;'>Nenhum concurso encontrado</div>";
        }
    });

    const rotulosCat = { 'Sudeste': 'Sudeste', 'Sul': 'Sul', 'Nordeste': 'Nordeste', 'Norte': 'Norte', 'Centro-Oeste': 'C-O', 'Nacional': 'Nacional' };
    const resumoSpans = ordemCategorias.map(k =>
        `<span style='margin-right:15px;'>${rotulosCat[k]}: ${listaRelatorio.filter(c => c.categoria === k).length}</span>`
    ).join('');
    htmlRelatorio += `
        <div class='timestamp'>
            <strong>Resumo:</strong>
            ${resumoSpans}<br>
            <span style='color:#7f8c8d;'>Gerado em: ${new Date().toLocaleString('pt-BR')} &bull; ${listaRelatorio.length}/${listaAtual.length} concursos</span>
        </div></div></body></html>
    `;

    // Codificar HTML em Base64 para evitar problemas de escaping no EvaluateJavaScriptAsync
    window._monitorHtmlB64 = btoa(unescape(encodeURIComponent(htmlRelatorio)));
    return JSON.stringify({
        novidades: novidadesRelatorio.length,
        total: listaRelatorio.length
    });
})();
""");
    }

    private async void OnCopiarLogClicked(object sender, EventArgs e)
    {
        if (LogLabel?.Text is string log && !string.IsNullOrWhiteSpace(log))
        {
            await Clipboard.SetTextAsync(log);
            Log("📋 Log copiado para a área de transferência.");
        }
    }

    private void SetStatus(string texto)
    {
        MainThread.BeginInvokeOnMainThread(() => {
            if (LblStatus != null)
                LblStatus.Text = texto;
        });
    }

    private void Log(string mensagem)
    {
        MainThread.BeginInvokeOnMainThread(async () =>
        {
            if (LogLabel != null && LogScrollView != null)
            {
                LogLabel.Text += $"[{DateTime.Now:HH:mm:ss}] {mensagem}\n";

                await Task.Delay(50);
                await LogScrollView.ScrollToAsync(0, LogLabel.Height, true);
            }
        });
    }
}

internal sealed class ResultadoScript
{
    [JsonPropertyName("html")]
    public string Html { get; set; } = "";

    [JsonPropertyName("novidades")]
    public int Novidades { get; set; }

    [JsonPropertyName("total")]
    public int Total { get; set; }
}

internal sealed class SelectEstadosPage : ContentPage
{
    private static readonly (string uf, string nome, string regiao)[] Todos =
    [
        ("SP","São Paulo",      "Sudeste"),  ("MG","Minas Gerais",  "Sudeste"),
        ("RJ","Rio de Janeiro", "Sudeste"),  ("ES","Esp. Santo",    "Sudeste"),
        ("PR","Paraná",         "Sul"),      ("RS","R.G.Sul",       "Sul"),
        ("SC","Sta Catarina",   "Sul"),
        ("BA","Bahia",         "Nordeste"), ("CE","Ceará",         "Nordeste"),
        ("PE","Pernambuco",    "Nordeste"), ("RN","R.G.Norte",     "Nordeste"),
        ("AL","Alagoas",       "Nordeste"), ("SE","Sergipe",       "Nordeste"),
        ("PB","Paraíba",       "Nordeste"), ("MA","Maranhão",      "Nordeste"),
        ("PI","Piauí",         "Nordeste"),
        ("AM","Amazonas",      "Norte"),    ("PA","Pará",          "Norte"),
        ("TO","Tocantins",     "Norte"),    ("RO","Rondônia",      "Norte"),
        ("RR","Roraima",       "Norte"),    ("AC","Acre",          "Norte"),
        ("AP","Amapá",         "Norte"),
        ("GO","Goiás",         "Centro-Oeste"), ("DF","D.Federal",  "Centro-Oeste"),
        ("MS","M.G.Sul",       "Centro-Oeste"), ("MT","M.Grosso",   "Centro-Oeste"),
        ("Nacional","Nacional","Nacional")
    ];

    private static readonly (string nome, string cor)[] Regioes =
    [
        ("Sudeste",      "#c0392b"),
        ("Sul",          "#2980b9"),
        ("Nordeste",     "#e67e22"),
        ("Norte",        "#27ae60"),
        ("Centro-Oeste", "#8e44ad"),
        ("Nacional",     "#2c3e50")
    ];

    private readonly HashSet<string> _selecionados;
    private readonly Action _onAplicar;
    private readonly Dictionary<string, CheckBox> _cbs = new();

    public SelectEstadosPage(HashSet<string> selecionados, Action onAplicar)
    {
        _selecionados = selecionados;
        _onAplicar = onAplicar;
        Title = "Selecionar Estados";
        BackgroundColor = Color.FromArgb("#f4f4f4");
        Content = BuildContent();
    }

    private View BuildContent()
    {
        var btnTodos   = MkBtn("✅ Todos",           "#27ae60");
        var btnNenhum  = MkBtn("❌ Nenhum",          "#c0392b");
        var btnAplicar = MkBtn("✔ Aplicar Filtro",  "#2980b9", 14);

        btnTodos.Clicked  += (_, _) => { foreach (var cb in _cbs.Values) cb.IsChecked = true; };
        btnNenhum.Clicked += (_, _) => { foreach (var cb in _cbs.Values) cb.IsChecked = false; };
        btnAplicar.Clicked += async (_, _) =>
        {
            _selecionados.Clear();
            foreach (var entry in Todos)
                if (_cbs.TryGetValue(entry.uf, out var cb) && cb.IsChecked)
                    _selecionados.Add(entry.uf);
            _onAplicar();
            await Navigation.PopModalAsync();
        };

        var topBar = new Grid { ColumnSpacing = 8, Margin = new Thickness(8, 8, 8, 4) };
        topBar.ColumnDefinitions.Add(new ColumnDefinition { Width = GridLength.Star });
        topBar.ColumnDefinitions.Add(new ColumnDefinition { Width = GridLength.Star });
        topBar.Add(btnTodos,  0, 0);
        topBar.Add(btnNenhum, 1, 0);

        var vstack = new VerticalStackLayout { Spacing = 0 };
        foreach (var (regiaoNome, cor) in Regioes)
        {
            vstack.Add(new Label
            {
                Text = regiaoNome,
                BackgroundColor = Color.FromArgb(cor),
                TextColor = Colors.White,
                FontAttributes = FontAttributes.Bold,
                FontSize = 13,
                Padding = new Thickness(10, 5)
            });
            var flex = new FlexLayout
            {
                Wrap = Microsoft.Maui.Layouts.FlexWrap.Wrap,
                JustifyContent = Microsoft.Maui.Layouts.FlexJustify.Start,
                Padding = new Thickness(4, 2),
                BackgroundColor = Colors.White
            };
            foreach (var entry in Todos.Where(t => t.regiao == regiaoNome))
            {
                var cb = new CheckBox { IsChecked = _selecionados.Contains(entry.uf), Color = Color.FromArgb(cor) };
                _cbs[entry.uf] = cb;
                var item = new VerticalStackLayout { Spacing = 0, Padding = new Thickness(4, 4), WidthRequest = 82 };
                var row = new HorizontalStackLayout { Spacing = 2 };
                row.Add(cb);
                row.Add(new Label { Text = entry.uf, FontAttributes = FontAttributes.Bold, FontSize = 12, VerticalOptions = LayoutOptions.Center });
                item.Add(row);
                item.Add(new Label { Text = entry.nome, FontSize = 9, TextColor = Color.FromArgb("#666"), Margin = new Thickness(2, 0, 0, 0) });
                flex.Add(item);
            }
            vstack.Add(flex);
        }

        var scroll = new ScrollView { Content = vstack };
        var root = new Grid();
        root.RowDefinitions.Add(new RowDefinition { Height = GridLength.Auto });
        root.RowDefinitions.Add(new RowDefinition { Height = GridLength.Star });
        root.RowDefinitions.Add(new RowDefinition { Height = GridLength.Auto });
        root.Add(topBar);
        root.Add(scroll);
        root.Add(btnAplicar);
        Grid.SetRow(scroll, 1);
        Grid.SetRow(btnAplicar, 2);
        return root;
    }

    private static Button MkBtn(string text, string color, double fontSize = 12) =>
        new Button
        {
            Text = text,
            BackgroundColor = Color.FromArgb(color),
            TextColor = Colors.White,
            CornerRadius = 6,
            FontSize = fontSize,
            HeightRequest = 38
        };
}
