using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace araclazim.Controllers
{
    public class MusteriController : Controller
    {
        static string gizliKulAd;
        // GET: Musteri
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult isteklerim()
        {
            using (araclazim db = new araclazim())
            {
                string kulAd = (string)HttpRuntime.Cache["kulAd"].ToString();
              

                return View(Tuple.Create<List<RezervasyonIstekleri>, List<Araclar>, List<Musteri>>(db.RezervasyonIstekleri.Where(mus => mus.musteriId.kullaniciAdi == kulAd).ToList(), db.Araclar.ToList(), db.Musteri.ToList()));
            }
        }

        public ActionResult bilgilerimiDuzenle(string kulAd1, string sifre)
        {
            gizliKulAd = kulAd1;

            using (araclazim db = new araclazim())
            {

                return View(Tuple.Create<List<Musteri>, List<NufusBilgileri>, List<EhliyetBilgileri>>(db.Musteri.Where(klnc => klnc.kullaniciAdi == kulAd1 && klnc.sifre == sifre).ToList(), db.NufusBilgileri.ToList(), db.EhliyetBilgileri.ToList()));
            }
        }

        public ActionResult bilgilerimiDuzenleControl(string ad, string soyad, string tel, string adres, string email, string kulAd, string sifre)
        {
            Musteri stud;
            using (var ctx = new araclazim())
            {
                stud = ctx.Musteri.Where(s => s.kullaniciAdi == gizliKulAd).FirstOrDefault<Musteri>();
            }

            //2. change student name in disconnected mode (out of ctx scope)
            if (stud != null)
            {
                stud.ad = ad;
                stud.soyad = soyad;
                stud.telefon = tel;
                stud.adres = adres;
                stud.eMail = email;
                stud.kullaniciAdi = kulAd;
                stud.sifre = sifre;

            }

            //save modified entity using new Context
            using (var dbCtx = new araclazim())
            {
                //3. Mark entity as modified
                dbCtx.Entry(stud).State = System.Data.Entity.EntityState.Modified;

                //4. call SaveChanges
                dbCtx.SaveChanges();
            }

            //using (araclazim db = new araclazim())
            //{
            //    List< Musteri> m = db.Musteri.Where(a => a.kullaniciAdi == gizliKulAd).ToList();
            //    m[0].soyad = soyad;
            //    db.SaveChanges();

            //    foreach (var item in db.Musteri)
            //    {

            //        if (item.kullaniciAdi== gizliKulAd)
            //        {
            //            item.ad = ad;
            //            item.soyad = soyad;
            //            item.telefon = tel;
            //            item.adres = adres;
            //            item.eMail = email;
            //            item.kullaniciAdi = kulAd;
            //            item.sifre = sifre;
            //            break;
            //        }



            //    }

            //    var guncel1 = db.Musteri.Where(mus => mus.kullaniciAdi == gizliKulAd).ToList();//yine kullanıcı adına baktık.Artık nüfus id kontrol et
            //    foreach (var item1 in db.NufusBilgileri)
            //    {
            //        if (item1.Id==((Musteri)guncel1[0]).musteriNufusBilgisiId.Id)
            //        {
            //            item1.tcNo = tc;
            //            item1.babaAdi = babaAdi;
            //            item1.anaAdi = anaAdi;
            //            item1.dogumYeri = dogumYeri;
            //            item1.dogumTarihi = dogumTarihi;
            //            item1.medeniHal = medeniHal;
            //            item1.il = il;
            //            break;
            //        }





            //    }
            //    foreach (var item2 in db.EhliyetBilgileri)
            //    {
            //        if (item2.Id==((Musteri)guncel1[0]).ehliyetId.Id)
            //        {
            //            item2.ehliyetNo = ehliyetNo;
            //            item2.belgeNo = belgeNo;
            //            item2.ehliyetSinifi = ehliyetSinifi;
            //            item2.il = il2;
            //            item2.kullanilanCihaz = kulCihaz;
            //            break;
            //        }

            //    }
            //    db.SaveChanges();
            //}

            return RedirectToAction("bilgilerimiDuzenle");
        }



    }
}