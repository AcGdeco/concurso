namespace Concurso;

public partial class ReportPage : ContentPage
{
    public ReportPage(string html, int novidades = 0)
    {
        InitializeComponent();

        ReportWebView.Source = new HtmlWebViewSource { Html = html };

        if (novidades > 0)
            LblNovidadesBadge.Text = $"🆕 {novidades} novidade(s)!";
        else
            LblNovidadesBadge.IsVisible = false;
    }

    private async void OnVoltarClicked(object sender, EventArgs e)
    {
        await Shell.Current.Navigation.PopAsync();
    }
}
