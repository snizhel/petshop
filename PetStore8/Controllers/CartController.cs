using PetStore8.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;

namespace PetStore8.Controllers
{
    public class CartController : Controller
    {
        private PetStore8Entities db = new PetStore8Entities();
        // GET: Cart
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AddToCart(int id)
        {
            Product product = db.Products.Find(id);
            Item item = new Item
            {
                Id = product.Id,                
                Category = product.Category.Name,
                Description = product.Description,
                Discount = product.Discount,
                Price = product.Price,
                Quantity = 1
            };

            Cart cart = Cart.getInstance();
            cart.Add(item);
            return Json(new
            {
                status = "OK",
                total_amount = cart.TotalAmount.ToString("C2")
            }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Delete(int id)
        {
            Thread.Sleep(3000);
            Cart.getInstance().Remove(id);
            return Json(new
            {
                status = "OK",
                total_amount = Cart.getInstance().TotalAmount.ToString("C2")
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Update(int id, int quantity)
        {
            Thread.Sleep(3000);
            Cart cart = Cart.getInstance();
            cart.Update(id, quantity);
            return Json(new
            {
                status = "OK",
                amount = cart.List[id].Amount.ToString("C2"),
                total_amount = cart.TotalAmount.ToString("C2")
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Empty()
        {
            Thread.Sleep(3000);
            Cart cart = Cart.getInstance();
            cart.Empty();
            return Json(new
            {
                status = "OK",                
                total_amount = cart.TotalAmount.ToString("C2")
            }, JsonRequestBehavior.AllowGet);
        }
    }
}