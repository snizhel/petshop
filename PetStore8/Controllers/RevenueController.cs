using PetStore8.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PetStore8.Controllers
{
    [Authorize(Roles="Admin,Manager")]
    public class RevenueController : Controller
    {
        private PetStore8Entities db = new PetStore8Entities();
        // GET: Revenue
        public ActionResult Index()
        {
            return View();
        }

        // POST: Revenue
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(RevenueViewModel model)
        {
            ViewBag.OrderList = db.Orders.Where(o => o.Date >= model.FromDate && o.Date <= model.ToDate);
            return View();
        }

        public ActionResult Details(int id)
        {
            Order order = db.Orders.Find(id);
            return View(order);
        }
    }
}