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

        let secaoAtual = 'Outros';
        let elementoAnterior = elemento.previousElementSibling;

        while (elementoAnterior) {
            if (elementoAnterior.classList.contains('ua')) {
                const ufDiv = elementoAnterior.querySelector('.uf');
                if (ufDiv) {
                    const nomeSecao = ufDiv.innerText.trim().toUpperCase();
                    if (nomeSecao === 'NACIONAL') {
                        secaoAtual = 'Nacionais';
                    } else if (nomeSecao === 'MINAS GERAIS') {
                        secaoAtual = 'Minas Gerais';
                    }
                }
                break;
            } else if (elementoAnterior.tagName === 'H2') {
                const tituloSecao = elementoAnterior.innerText.trim().toUpperCase();
                if (tituloSecao.includes('NACIONAL')) {
                    secaoAtual = 'Nacionais';
                } else if (tituloSecao.includes('MINAS GERAIS')) {
                    secaoAtual = 'Minas Gerais';
                }
                break;
            }
            elementoAnterior = elementoAnterior.previousElementSibling;
        }

        let categoria = secaoAtual;
        if (/São João del[- ]?Rei|SJDR/i.test(nome)) {
            categoria = 'SJDR';
        }
        listaAtual.push({ nome, numVagas, categoria, id: `${nome}-${numVagas}` });
    });

    listaAtual.sort((a, b) => b.numVagas - a.numVagas);
    const dadosSalvos = JSON.parse(localStorage.getItem(STORAGE_KEY) || "[]");
    const idsSalvos = dadosSalvos.map(d => d.id);
    const novidades = listaAtual.filter(c => !idsSalvos.includes(c.id));
    localStorage.setItem(STORAGE_KEY, JSON.stringify(listaAtual));

    const gerarSecaoNovidades = () => {
        if (novidades.length > 0) {
            return `
                <div class="novidade-sec" style="margin-top:0;margin-bottom:30px;">
                    <h2 style="background:#27ae60;margin-top:0;">🆕 1. Novidades Encontradas (${novidades.length})</h2>
                    ${novidades.map(n => `
                        <div class="item"><span class="novo-badge">NOVO</span><span class="vagas">${n.numVagas || 'C.R.'} vagas</span><span><strong>[${n.categoria}]</strong> ${n.nome}</span></div>
                    `).join('')}
                </div>
            `;
        } else {
            return `
                <div class="novidade-sec" style="background:#f0f0f0;border-color:#95a5a6;margin-top:0;margin-bottom:30px;">
                    <h2 style="background:#7f8c8d;margin-top:0;">📋 1. Histórico Atualizado</h2>
                    <div style="padding:20px;text-align:center;color:#555;">
                        <p style="font-size:16px;margin-bottom:10px;">✅ Nenhuma novidade encontrada nesta verificação.</p>
                        <p style="font-size:14px;">Total de concursos monitorados: <strong>${listaAtual.length}</strong></p>
                        <p style="font-size:12px;color:#888;">Última atualização: ${new Date().toLocaleString('pt-BR')}</p>
                    </div>
                </div>
            `;
        }
    };

    const ordemCategorias = ['SJDR', 'Minas Gerais', 'Nacionais', 'Outros'];
    const categorias = {
        'SJDR': { titulo: '🏘️ 2. São João del-Rei', cor: 'bg-sjdr' },
        'Minas Gerais': { titulo: '🔺 3. Minas Gerais', cor: 'bg-mg' },
        'Nacionais': { titulo: '🇧🇷 4. Concursos Nacionais', cor: 'bg-nacional' },
        'Outros': { titulo: '📍 5. Outros Estados', cor: 'bg-outros' }
    };

    let htmlRelatorio = `
        <html><head><title>Relatório de Concursos</title><meta charset="UTF-8">
        <style>
            body { font-family:'Segoe UI',sans-serif; padding:30px; background:#f4f7f6; }
            .card { max-width:900px; margin:auto; background:white; padding:25px; border-radius:10px; box-shadow:0 4px 6px rgba(0,0,0,0.1); }
            h1 { text-align:center; color:#2c3e50; border-bottom:2px solid #3498db; padding-bottom:10px; }
            h2 { padding:8px 15px; border-radius:5px; color:white; margin-top:25px; font-size:1.2em; }
            .bg-outros { background:#95a5a6; } .bg-nacional { background:#2980b9; } .bg-mg { background:#e67e22; } .bg-sjdr { background:#8e44ad; }
            .item { display:flex; align-items:center; padding:12px; border-bottom:1px solid #eee; font-size:14px; }
            .item:hover { background:#f1f1f1; }
            .vagas { font-weight:bold; color:#2980b9; width:100px; flex-shrink:0; }
            .novidade-sec { border:2px solid #27ae60; padding:15px; border-radius:8px; background:#f9fff9; }
            .novo-badge { background:#27ae60; color:white; padding:2px 6px; border-radius:4px; font-size:10px; margin-right:10px; }
            .timestamp { text-align:right; font-size:12px; color:#7f8c8d; margin-top:20px; border-top:1px dashed #ccc; padding-top:10px; }
            .destaque-vagas { background-color:#f1f9ff; border-left:4px solid #2980b9; }
        </style></head>
        <body><div class="card">
            <h1>📊 Monitor de Concursos Públicos</h1>
            <p style="text-align:center;color:#555;margin-bottom:20px;">Ordenado por <strong>maior número de vagas</strong> em cada categoria</p>
    `;

    htmlRelatorio += gerarSecaoNovidades();

    ordemCategorias.forEach(catKey => {
        const itensCategoria = listaAtual.filter(c => c.categoria === catKey);
        const catInfo = categorias[catKey];
        htmlRelatorio += `<h2 class="${catInfo.cor}">${catInfo.titulo}</h2>`;
        if (itensCategoria.length > 0) {
            itensCategoria.forEach(c => {
                htmlRelatorio += `<div class="item ${c.numVagas > 100 ? 'destaque-vagas' : ''}">
                    <span class="vagas">${c.numVagas || 'C.R.'} vagas</span>
                    <span style="flex:1;">${c.nome}</span>
                    ${c.numVagas > 100 ? '<span style="margin-left:10px;background:#2980b9;color:white;padding:2px 8px;border-radius:12px;font-size:10px;font-weight:bold;">GRANDE</span>' : ''}
                </div>`;
            });
        } else {
            htmlRelatorio += '<div class="item" style="color:#999;">Nenhum concurso encontrado</div>';
        }
    });

    htmlRelatorio += `
        <div class="timestamp">
            <strong>Resumo:</strong>
            <span style="margin-right:15px;">📍 SJDR: ${listaAtual.filter(c => c.categoria === 'SJDR').length}</span>
            <span style="margin-right:15px;">🔺 MG: ${listaAtual.filter(c => c.categoria === 'Minas Gerais').length}</span>
            <span style="margin-right:15px;">🇧🇷 Nacional: ${listaAtual.filter(c => c.categoria === 'Nacionais').length}</span>
            <span>📍 Outros: ${listaAtual.filter(c => c.categoria === 'Outros').length}</span><br>
            <span style="color:#7f8c8d;">Gerado em: ${new Date().toLocaleString('pt-BR')} • Total: ${listaAtual.length} concursos</span>
        </div></div></body></html>
    `;

    return JSON.stringify({
        html: htmlRelatorio,
        novidades: novidades.length,
        total: listaAtual.length
    });
})();
