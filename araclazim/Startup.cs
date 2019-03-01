using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(araclazim.Startup))]
namespace araclazim
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
