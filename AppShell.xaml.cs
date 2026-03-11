namespace Concurso
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();
            Routing.RegisterRoute(nameof(ReportPage), typeof(ReportPage));
        }
    }
}
