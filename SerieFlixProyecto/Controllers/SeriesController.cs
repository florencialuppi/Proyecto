using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SerieFlixProyecto.Models;

namespace SerieFlixProyecto.Controllers
{
    public class SeriesController : Controller
    {
        private SerieFlixEntities db = new SerieFlixEntities();

        // GET: Series
        public ActionResult Index()
        {
            var series = db.Series.Include(s => s.Generos).Include(s => s.Idiomas);
            return View(series.ToList());
        }

        // GET: Series/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Series series = db.Series.Find(id);
            if (series == null)
            {
                return HttpNotFound();
            }
            return View(series);
        }

        // GET: Series/Create
        public ActionResult Create()
        {
            ViewBag.Genero = new SelectList(db.Generos, "ID", "Genero");
            ViewBag.Idioma = new SelectList(db.Idiomas, "ID", "Idioma");
            return View();
        }

        // POST: Series/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Titulo,Genero,Idioma")] Series series)
        {
            if (ModelState.IsValid)
            {
                db.Series.Add(series);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Genero = new SelectList(db.Generos, "ID", "Genero", series.Genero);
            ViewBag.Idioma = new SelectList(db.Idiomas, "ID", "Idioma", series.Idioma);
            return View(series);
        }

        // GET: Series/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Series series = db.Series.Find(id);
            if (series == null)
            {
                return HttpNotFound();
            }
            ViewBag.Genero = new SelectList(db.Generos, "ID", "Genero", series.Genero);
            ViewBag.Idioma = new SelectList(db.Idiomas, "ID", "Idioma", series.Idioma);
            return View(series);
        }

        // POST: Series/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Titulo,Genero,Idioma")] Series series)
        {
            if (ModelState.IsValid)
            {
                db.Entry(series).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Genero = new SelectList(db.Generos, "ID", "Genero", series.Genero);
            ViewBag.Idioma = new SelectList(db.Idiomas, "ID", "Idioma", series.Idioma);
            return View(series);
        }

        // GET: Series/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Series series = db.Series.Find(id);
            if (series == null)
            {
                return HttpNotFound();
            }
            return View(series);
        }

        // POST: Series/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Series series = db.Series.Find(id);
            db.Series.Remove(series);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
