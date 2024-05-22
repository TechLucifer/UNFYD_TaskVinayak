using System.Web;
using System.Web.Mvc;

namespace UNFYD_TaskVinayak
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
