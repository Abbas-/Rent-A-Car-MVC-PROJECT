using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace araclazim
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
          name: "hatali",
          url: "hatali",
          defaults: new { controller = "Home", action = "Login2", id = UrlParameter.Optional }
          );


            routes.MapRoute(
            name: "istekler",
            url: "istekler",
            defaults: new { controller = "Admin", action = "istekler", id = UrlParameter.Optional }
            );

            routes.MapRoute(
             name: "aracEkle",
             url: "aracEkle",
             defaults: new { controller = "Admin", action = "aracEkle", id = UrlParameter.Optional }
         );

            routes.MapRoute(
             name: "aracSil",
             url: "aracSil",
             defaults: new { controller = "Admin", action = "aracSil", id = UrlParameter.Optional }
         );

            routes.MapRoute(
             name: "aracBilgileriniDuzenle",
             url: "aracBilgileriniDuzenle",
             defaults: new { controller = "Admin", action = "aracBilgileriniDuzenle", id = UrlParameter.Optional }
         );

            routes.MapRoute(
             name: "adminEkle",
             url: "adminEkle",
             defaults: new { controller = "Admin", action = "adminEkle", id = UrlParameter.Optional }
         );

            routes.MapRoute(
            name: "Login",
            url: "Login",
            defaults: new { controller = "Home", action = "Login", id = UrlParameter.Optional }
        );

            routes.MapRoute(
               name: "admin",
               url: "Admin",
               defaults: new { controller = "Home", action = "AdminPaneliGiris", id = UrlParameter.Optional }
           );

            routes.MapRoute(
              name: "adminPaneli",
              url: "AdminPaneli",
              defaults: new { controller = "Home", action = "AdminPaneli", id = UrlParameter.Optional }
          );

            routes.MapRoute(
              name: "araclar",
              url: "Araçlar",
              defaults: new { controller = "Home", action = "Araclar", id = UrlParameter.Optional }
          );

            routes.MapRoute(
             name: "hakkimizda",
             url: "Hakkımızda",
             defaults: new { controller = "Home", action = "Hakkimizda", id = UrlParameter.Optional }
         );

            routes.MapRoute(
             name: "iletisim",
             url: "iletişim",
             defaults: new { controller = "Home", action = "Iletisim", id = UrlParameter.Optional }
         );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
