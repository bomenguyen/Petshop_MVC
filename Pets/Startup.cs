using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Pets.Startup))]
namespace Pets
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
