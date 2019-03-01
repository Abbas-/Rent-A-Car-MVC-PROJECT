using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace araclazim.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult Index()
        {

            return View();
        }

        public ActionResult istekler()
        {
            using (araclazim db = new araclazim())
            {

                return View(Tuple.Create<List<RezervasyonIstekleri>, List<Araclar>, List<Musteri>>(db.RezervasyonIstekleri.ToList(), db.Araclar.ToList(), db.Musteri.ToList()));
            }
        }

        public ActionResult aracEkle()
        {

            return View();
        }

        public ActionResult aracSil()
        {

            return View();
        }

        public ActionResult aracBilgileriniDuzenle(string plaka)
        {
            using (araclazim db = new araclazim())
            {
                return View(Tuple.Create<List<Araclar>, List<Model>, List<Marka>>(db.Araclar.Where(arc => arc.plaka == plaka).ToList(), db.Model.ToList(), db.Marka.ToList()));
            }
        }

        public ActionResult adminEkle()
        {

            return View();
        }

        public ActionResult raporlama()
        {

            return View();
        }

        public ActionResult kiradanGelenAraclar()
        {
            using (araclazim db = new araclazim())
            {
                return View(Tuple.Create<List<RezervasyonIstekleri>, List<GelenAraclar>>(db.RezervasyonIstekleri.ToList(), db.GelenAraclar.ToList()));
            }
           
        }

        public ActionResult fatura()
        {
            string rezId = (string)HttpRuntime.Cache["rezId"].ToString();
            string faturaId= (string)HttpRuntime.Cache["faturaId"].ToString();
            string gelenAracId= (string)HttpRuntime.Cache["gelenAracId"].ToString();
            int rezerve, fatura, arac;
            rezerve = Int32.Parse(rezId);
            fatura = Int32.Parse(faturaId);
            arac = Int32.Parse(gelenAracId);           
            using (araclazim db = new araclazim())
            {
               
               return View(Tuple.Create<List<RezervasyonIstekleri>, List<Fatura>, List<Musteri>, List<GelenAraclar>>(db.RezervasyonIstekleri.Where(rez =>rez.Id== rezerve).ToList(),  db.Fatura.Where(fat => fat.Id == fatura).ToList(), db.Musteri.ToList(), db.GelenAraclar.Where(gelArac => gelArac.Id == arac).ToList()));
            }
        }

        public ActionResult kiradanGelenAraclarControl(string Arac_Alis_Gun, string Arac_Alis_Ay, string Arac_Alis_Yil, string istek_numarasi, string hasarUcreti)
        {
            using (araclazim db = new araclazim())
            {
                int gecikmeUcret=0, gecikmeGunu = 0;
                int temp = 0;
                int kiralamaUcreti = 0;
                string anlasilanGunn, anlasilanAyy, anlasilanYill;
                string anlasilanTarih = "";
                GelenAraclar gelenArac = new GelenAraclar();
                gelenArac.aracTeslimTarih = Arac_Alis_Gun + "." + Arac_Alis_Ay + "." + Arac_Alis_Yil;
               
                gelenArac.hasarUcreti = Int32.Parse(hasarUcreti);
                foreach (RezervasyonIstekleri item in db.RezervasyonIstekleri.ToList())
                {
                    if (item.Id.ToString().Equals(istek_numarasi))
                    {
                        kiralamaUcreti = item.ucret;
                        gelenArac.rezIstekId = item;
                        anlasilanTarih = item.planlananTeslimTarihi;
                        break;
                    }
                }
                HttpRuntime.Cache["rezId"] = istek_numarasi;
                int anlasilanGun=0, anlasilanAy=0, anlasilanYil=0;
                if (!anlasilanTarih.Equals("aaa"))
                {
                    string[] tarih = anlasilanTarih.Split('.');
                    if (anlasilanTarih!="")
                    {
                        anlasilanGunn = tarih[0];
                        anlasilanAyy = tarih[1];
                        anlasilanYill = tarih[2];
                        anlasilanGun = Int32.Parse(anlasilanGunn);
                        anlasilanAy = Int32.Parse(anlasilanAyy);
                        anlasilanYil = Int32.Parse(anlasilanYill);
                    }
                   
                }
              
              
               
                if (anlasilanAy.ToString().Equals(Arac_Alis_Ay))//gelen ay aynı ise
                {
                    if (anlasilanGun - (Int32.Parse(Arac_Alis_Gun)) < 0)//gecikme olmuş
                    {
                        gecikmeGunu = (Int32.Parse(Arac_Alis_Gun)) - anlasilanGun;
                    }
                }
                else
                {

                    while (true)
                    {
                        if (Arac_Alis_Gun.Equals("0"))
                        {
                            //------------AYI 1 AZALTTIM
                            temp = Int32.Parse(Arac_Alis_Ay);
                            if (temp == 1)
                            {
                                temp = 12;
                            }
                            else
                            {
                                temp--;
                            }
                            Arac_Alis_Ay = temp.ToString();
                            //---------------------
                            Arac_Alis_Gun = "31";
                        }
                        if (Arac_Alis_Gun.Equals(anlasilanGun.ToString()) && Arac_Alis_Ay.Equals(anlasilanAy.ToString()))
                        {
                            break;
                        }
                        else
                        {
                            //------------GÜNÜ 1 AZALTTIM
                            temp = Int32.Parse(Arac_Alis_Gun);
                            temp--;
                            Arac_Alis_Gun = temp.ToString();
                            //---------------------
                            gecikmeGunu = gecikmeGunu + 1;
                        }

                    }
                }
                if (gecikmeGunu != 0)
                {
                    GecikmeCezalari gecikmeCezasi = new GecikmeCezalari();
                    gecikmeCezasi.gecikmeGunu = gecikmeGunu;
                    HttpRuntime.Cache["gecikmeId"] = gecikmeCezasi;
                    gecikmeCezasi.ucret = gecikmeGunu * 250;
                    gecikmeCezasi.teslimId = gelenArac;
                    db.GecikmeCezalari.Add(gecikmeCezasi);
                    gecikmeUcret = gecikmeGunu * 250;
                }
                Fatura fatura = new Fatura();
              
                fatura.ucret = gecikmeUcret + kiralamaUcreti + Int32.Parse(hasarUcreti);
                gelenArac.faturaId = fatura;
                db.Fatura.Add(fatura);
                db.GelenAraclar.Add(gelenArac);
               
                db.SaveChanges();
                HttpRuntime.Cache["faturaId"] = fatura.Id;
                HttpRuntime.Cache["gelenAracId"] = gelenArac.Id;


            }
            return RedirectToAction("fatura");
        }

        public ActionResult adminEkleControl(string kulAd, string sifre, string sifre2)
        {

            using (araclazim db = new araclazim())
            {
                bool flag = false;
                foreach (Admin item in db.Admin.ToList())
                {
                    if (kulAd.ToString().Equals(item.kullaniciAdi.ToString()))//Kullanıcı adı eşsiz mi tekrar baktır                        
                    {
                        flag = true;
                        break;
                    }
                }
                if (flag == false)//kayıt için kuladi eşsiz
                {
                    if (sifre == sifre2)
                    {
                        Admin mus3 = new Admin();
                        mus3.kullaniciAdi = kulAd;
                        mus3.sifre = sifre;
                        db.Admin.Add(mus3);
                        db.SaveChanges();
                        return RedirectToAction("adminEkle");

                    }
                    else//mesaj yada uyarı verdir şifreler den
                    {
                        return RedirectToAction("adminEkle");
                    }
                }
                else//kulanıcı adı önceden alınmış
                {


                    return RedirectToAction("adminEkle");
                }

            }
            // return RedirectToAction("Index");

        }

        public ActionResult AracEkleControl(string markalar, string txtModel, string yil, string txtPlaka, string kasa_tipi, string renk, string silindir_hacmi, string txtGunlukUcret, string yakit_tipi)
        {
            using (araclazim db = new araclazim()) //aynı plaka var mı kontrol et !!!!!!!!!!!!!
            {
                Model model1 = new Model();
                Araclar arac1 = new Araclar();

                bool flag = false;
                foreach (Model item in db.Model.ToList())
                {
                    if (txtModel.ToString().Equals(item.model.ToString()))//eğer aynı modelden varsa
                    {
                        arac1.modelId = item;
                        flag = true;
                    }
                }
                if (flag == false)//eğer model yoksa yeni bi model oluştur
                {
                    model1.model = txtModel;
                    arac1.modelId = model1;
                }


                foreach (Marka item in db.Marka.ToList())
                {
                    if (markalar.ToString().Equals(item.marka.ToString()))
                    {
                        model1.markaId = item;
                    }
                }

                arac1.yil = yil;
                arac1.plaka = txtPlaka;
                arac1.kasaTipi = kasa_tipi;
                arac1.renk = renk;
                arac1.silindirHacmi = silindir_hacmi;
                arac1.gunlukUcret = int.Parse(txtGunlukUcret);
                arac1.yakitTipi = yakit_tipi;
                // db.Marka.Add(marka1);
                db.Araclar.Add(arac1);
                db.SaveChanges();
            }
            return RedirectToAction("aracEkle");

        }

        public ActionResult AracSilControl(string txtPlaka) //model ve marka tablosunda kalıyor bilgi
        {
            using (araclazim db = new araclazim())
            {
                Araclar silinecekAracId=null;
                foreach (var item in db.Araclar.ToList())
                {
                    if (item.plaka.Equals(txtPlaka))
                    {
                        silinecekAracId = item;
                    }
                }
                foreach (var item in db.RezervasyonIstekleri.ToList())
                {
                    if (item.aracId==silinecekAracId)
                    {
                        item.aracId = null;
                    }
                }
                var silinecek_gecikmeCeza=db.GecikmeCezalari;
                var silinecekArac = db.Araclar.Where(arc => arc.plaka == txtPlaka).ToList();
                db.Araclar.Remove(db.Araclar.Find(silinecekArac[0].Id));
                db.SaveChanges();
            }
            return RedirectToAction("aracSil");

        }

        public ActionResult aracBilgileriniDuzenleControl(string aracId, string markalar, string GuncelModel, string EskiModel, string yil, string txtPlaka, string kasa_tipi, string renk, string silindir_hacmi, string txtGunlukUcret, string yakit_tipi)
        {
            using (araclazim db = new araclazim()) //ayni plaka var mi kontrol et !!!!!!!!!!!!!
            {
                Model temp = null;
                Marka tempMarka = null;
                bool flag = false;
                if (EskiModel.Equals(GuncelModel))
                { }
                else//model değişmişse
                {
                    foreach (var item in db.Model)
                    {
                        if (GuncelModel.ToString().Equals(item.model.ToString()))//aradığım model tablomda var mı ?
                        {
                            temp = item;
                            flag = true;
                            break;
                        }
                    }
                }

                foreach (var item in db.Marka)
                {
                    if (item.marka.ToString().Equals(markalar.ToString()))
                    {
                        tempMarka = item;
                        break;
                    }
                }

                foreach (var item in db.Araclar)
                {
                    if (item.Id.ToString().Equals(aracId.ToString()))
                    {
                        if (EskiModel.Equals(GuncelModel))
                        {
                        }
                        else//model değişmişse
                        {
                            if (flag == true)//tabloda var
                            {
                                item.modelId = temp;
                            }
                            else//tabloda yok
                            {
                                Model yeniModel = new Model();
                                yeniModel.model = GuncelModel;
                                yeniModel.markaId = tempMarka;
                                item.modelId = yeniModel;
                            }
                        }
                        item.yil = yil;
                        item.plaka = txtPlaka;
                        item.kasaTipi = kasa_tipi;
                        item.renk = renk;
                        item.silindirHacmi = silindir_hacmi;
                        item.gunlukUcret = int.Parse(txtGunlukUcret);
                        item.yakitTipi = yakit_tipi;
                        break;
                    }
                }


                db.SaveChanges();

            }


            return RedirectToAction("aracBilgileriniDuzenle");

        }

        public ActionResult isteklerControlOnay(string istekId)
        {
            using (araclazim db = new araclazim())
            {
                foreach (var istek in db.RezervasyonIstekleri)
                {
                    if (istek.Id.ToString().Equals(istekId.ToString()))
                    {

                        istek.onayDurumu = "Onaylandı";

                    }
                }
                db.SaveChanges();
                return RedirectToAction("istekler");
            }
        }

        public ActionResult isteklerControlRed(string istekId)
        {
            using (araclazim db = new araclazim())
            {
                foreach (var istek in db.RezervasyonIstekleri)
                {
                    if (istek.Id.ToString().Equals(istekId.ToString()))
                    {

                        istek.onayDurumu = "Reddedildi";

                    }
                }
                db.SaveChanges();
                return RedirectToAction("istekler");
            }
        }

        public ActionResult pdfOlusturMusteri()
        {
            using (araclazim db = new araclazim())
            {
                ViewBag.Musteriler = db.Musteri.ToList();
                return View();

            }
        }

        public ActionResult pdfOlusturAraclar()
        {
            using (araclazim db = new araclazim())
            {
                ViewBag.Araclar = db.Araclar.ToList();
                return View();

            }
        }

        public ActionResult pdfOlusturMarkalar()
        {
            using (araclazim db = new araclazim())
            {
                ViewBag.Markalar = db.Marka.ToList();
                return View();

            }
        }

    }
}