using PetStore8.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using System.Linq.Dynamic;//Must install
using PagedList;//Must install
using Microsoft.AspNet.Identity;

namespace PetStore8.Controllers
{
    public class HomeController : Controller
    {
        private PetStore8Entities db = new PetStore8Entities();

        public ActionResult InitDB()
        {
            return View();
        }
        public ActionResult Index(int? page, int? category, string description, double? fromPrice, double? toPrice, string orderby1 = "Id", string asc1 = "asc", string orderby2 = null, string asc2 = "asc")
        {
            var products = db.Products.Include(p => p.Category);

            if (category != null)
            {
                products = products.Where(p => p.CategoryId == category);
            }
            if (!string.IsNullOrEmpty(description))
            {
                products = products.Where(p => p.Description.Contains(description));
            }
            if (fromPrice != null)
            {
                products = products.Where(p => p.Price >= fromPrice);
            }
            if (toPrice != null)
            {
                products = products.Where(p => p.Price <= toPrice);
            }

            List<string> fieldList = new List<string> { "Id", "Description", "Discount", "Price", "Category_Id" };
            ViewBag.orderby1 = new SelectList(fieldList, orderby1);
            ViewBag.orderby2 = new SelectList(fieldList, orderby2);
            ViewBag.asc1 = asc1;
            ViewBag.asc2 = asc2;


            //ViewBag.categoryId = category;
            ViewBag.category = new SelectList(db.Categories, "id", "name", category);
            ViewBag.description = description;
            ViewBag.fromPrice = fromPrice;
            ViewBag.toPrice = toPrice;

            //Sorting
            //Must install: Install-Package System.Linq.Dynamic
            if (string.IsNullOrEmpty(orderby2))
            {
                products = products.OrderBy(string.Format("{0} {1}", orderby1, asc1));
            }
            else
            {
                products = products.OrderBy(string.Format("{0} {1},{2} {3}", orderby1, asc1, orderby2, asc2));
            }


            //install-package PagedList.mvc
            int pageSize = 6;//Kích thước trang
            int pageNumber = page ?? 1;//Tương đương với page==null?1:page;

            return View(products.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult ViewCart()
        {
            return View(Cart.getInstance().List.Values);
        }

        [Authorize(Roles = "Customer")]
        public ActionResult CheckOut()
        {
            Order order = null;

            using (var tran = db.Database.BeginTransaction())
            {
                try
                {
                    string customerUserId = User.Identity.GetUserId();//Lay UserId cua Login User
                    Customer customer = db.Customers.Where(c => c.UserId == customerUserId).First();//Lay customer
                    Employee employee = db.Employees.Find(2);
                    order = new Order
                    {
                        Date = DateTime.Today,
                        Status = "New",
                        Customer = customer,
                        Employee = employee
                    };
                    db.Orders.Add(order);
                    IList<Item> items = Cart.getInstance().List.Values;
                    foreach (var item in items)
                    {
                        Product product = db.Products.Find(item.Id);
                        OrderDetail orderDetail = new OrderDetail
                        {
                            OrderId = order.Id,
                            Product = product,                            
                            Quantity = item.Quantity,
                            Price = item.Price,
                            Discount = item.Discount
                        };
                        db.OrderDetails.Add(orderDetail);
                    }
                    //throw new Exception();
                    db.SaveChanges();
                    //Xoa sach gio hang
                    Cart.getInstance().Empty();
                    //Ket thuc transaction
                    tran.Commit();
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    throw ex;
                }
            }
            return View(order);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}