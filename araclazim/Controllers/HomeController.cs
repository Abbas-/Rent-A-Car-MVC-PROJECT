using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace araclazim.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Araclar(string kulAd, string sifre)
        {
            using (araclazim db = new araclazim())
            {

                return View(Tuple.Create<List<Araclar>, List<Musteri>, List<Model>, List<Marka>>(db.Araclar.ToList(), db.Musteri.Where(klnc => klnc.kullaniciAdi == kulAd && klnc.sifre == sifre).ToList(), db.Model.ToList(), db.Marka.ToList()));
            }

        }

        public ActionResult Hakkimizda()
        {


            return View();
        }

        public ActionResult Iletisim()
        {


            return View();
        }

        public ActionResult AdminPaneliGiris()
        {


            return View();
        }

        public ActionResult Login()
        {

            //DataDoldur();

            return View();
        }


        public void DataDoldur()
        {
            //flag = true;
            using (araclazim dataBase = new araclazim())
            {
                //ram de temizleme yapar using 
              

               

                Admin ad1 = new Admin();
                ad1.kullaniciAdi = "admin";
                ad1.sifre = "123";
                dataBase.Admin.Add(ad1);

                Marka marka1 = new Marka();
                marka1.marka = "Audi";
                Marka marka2 = new Marka();
                marka2.marka = "BMW";
                Marka marka3 = new Marka();
                marka3.marka = "Chevrolet";
                Marka marka4 = new Marka();
                marka4.marka = "Citroen";
                Marka marka5 = new Marka();
                marka5.marka = "Fiat";
                Marka marka6 = new Marka();
                marka6.marka = "Ford";
                Marka marka7 = new Marka();
                marka7.marka = "Honda";
                Marka marka8 = new Marka();
                marka8.marka = "Hyundai";
                Marka marka9 = new Marka();
                marka9.marka = "Kia";
                Marka marka10 = new Marka();
                marka10.marka = "Mazda";
                Marka marka11 = new Marka();
                marka11.marka = "Mercedes";
                Marka marka12 = new Marka();
                marka12.marka = "Mitsubishi";
                Marka marka13 = new Marka();
                marka13.marka = "Nissan";
                Marka marka14 = new Marka();
                marka14.marka = "Opel";
                Marka marka15 = new Marka();
                marka15.marka = "Peugeot";
                Marka marka16 = new Marka();
                marka16.marka = "Renault";
                Marka marka17 = new Marka();
                marka17.marka = "Seat";
                Marka marka18 = new Marka();
                marka18.marka = "Skoda";
                Marka marka19 = new Marka();
                marka19.marka = "Subaru";
                Marka marka20 = new Marka();
                marka20.marka = "Tata";
                Marka marka21 = new Marka();
                marka21.marka = "Tofaş";
                Marka marka22 = new Marka();
                marka22.marka = "Toyota";
                Marka marka23 = new Marka();
                marka23.marka = "Wolkswagen";
                Marka marka24 = new Marka();
                marka24.marka = "Volvo";

                dataBase.Marka.Add(marka1);
                dataBase.Marka.Add(marka2);
                dataBase.Marka.Add(marka3);
                dataBase.Marka.Add(marka4);
                dataBase.Marka.Add(marka5);
                dataBase.Marka.Add(marka6);
                dataBase.Marka.Add(marka7);
                dataBase.Marka.Add(marka8);
                dataBase.Marka.Add(marka9);
                dataBase.Marka.Add(marka10);
                dataBase.Marka.Add(marka11);
                dataBase.Marka.Add(marka12);
                dataBase.Marka.Add(marka13);
                dataBase.Marka.Add(marka14);
                dataBase.Marka.Add(marka15);
                dataBase.Marka.Add(marka16);
                dataBase.Marka.Add(marka17);
                dataBase.Marka.Add(marka18);
                dataBase.Marka.Add(marka19);
                dataBase.Marka.Add(marka20);
                dataBase.Marka.Add(marka21);
                dataBase.Marka.Add(marka22);
                dataBase.Marka.Add(marka23);
                dataBase.Marka.Add(marka24);


                dataBase.SaveChanges();


            }

        }

        public ActionResult LoginControl(string kulAd, string sifre)
        {
            using (araclazim db = new araclazim())
            {
                foreach (Musteri item in db.Musteri)
                {
                    if (kulAd == item.kullaniciAdi && sifre == item.sifre)
                    {
                        HttpRuntime.Cache["kulAd"] = kulAd;

                        return RedirectToAction("isteklerim", "Musteri");
                    }
                        

                }
                return RedirectToAction("Login");
            }
        }


        public ActionResult RegisterControl(string ad, string soyad, string telefon, string adres, string eMail, string kulAd, string sifre, string sifre2, string tc, string babaAdi, string anaAdi, string dogum_yeri, string dogum_tarihi, string medeni_hal, string il, string ehliyet_no, string il_ehliyet, string belge_no, string kullanilan_cihaz, string ehliyet_sinifi)
        {
            using (araclazim db = new araclazim())
            {
                bool flag = false;
                foreach (Musteri item in db.Musteri.ToList())
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
                        Musteri mus1 = new Musteri();//hepsi birer kayıt
                        NufusBilgileri nufus1 = new NufusBilgileri();
                        EhliyetBilgileri ehliyet1 = new EhliyetBilgileri();

                        mus1.ad = ad;
                        mus1.soyad = soyad;
                        mus1.telefon = telefon;
                        mus1.adres = adres;
                        mus1.eMail = eMail;
                        mus1.kullaniciAdi = kulAd;
                        mus1.sifre = sifre;

                        mus1.ehliyetId = ehliyet1;
                        ehliyet1.ehliyetNo = int.Parse(ehliyet_no);
                        ehliyet1.il = il_ehliyet;
                        ehliyet1.belgeNo = int.Parse(belge_no);
                        ehliyet1.kullanilanCihaz = kullanilan_cihaz;
                        ehliyet1.ehliyetSinifi = ehliyet_sinifi;

                        mus1.musteriNufusBilgisiId = nufus1;
                        nufus1.tcNo = int.Parse(tc);
                        nufus1.babaAdi = babaAdi;
                        nufus1.anaAdi = anaAdi;
                        nufus1.dogumYeri = dogum_yeri;
                        nufus1.dogumTarihi = dogum_tarihi;
                        nufus1.medeniHal = medeni_hal;
                        nufus1.il = il;


                        db.NufusBilgileri.Add(nufus1);
                        db.EhliyetBilgileri.Add(ehliyet1);
                        db.Musteri.Add(mus1);//burada oluşturduğumuz kayıtları vtye ekliyoruz
                        db.SaveChanges();
                        return RedirectToAction("Index");

                    }
                    else//mesaj yada uyarı verdir şifreler den
                    {
                        ViewBag.mesaj = "Lütfen Kullanıcı Adı veya Şifrenizi Kontrol Ediniz!";

                    }
                }
                else//kulanıcı adı önceden alınmış
                {
                    ViewBag.mesaj = "Kullanıcı adı önceden alınmış.";

                }

            }
            return RedirectToAction("Login");
        }


        public ActionResult AdminControl(string AdminKadi, string Adminsifre)
        {
            using (araclazim db = new araclazim())
            {
                foreach (Admin item in db.Admin)
                {
                    if (AdminKadi == item.kullaniciAdi && Adminsifre == item.sifre)
                        return RedirectToAction("istekler", "Admin");
                }

                return RedirectToAction("AdminPaneliGiris");
            }
        }

        public ActionResult istekControl(string Arac_Alis_Gun, string Arac_Alis_Ay, string Arac_Alis_Yil, string Arac_Teslim_Gun, string Arac_Teslim_Ay, string Arac_Teslim_Yil, string gunluk_ucret, string arac_id, string kulAd, string sifre)
        {
            using (araclazim db = new araclazim())
            {
                RezervasyonIstekleri yeniRez = new RezervasyonIstekleri();
                yeniRez.planlananAlimTarihi = Arac_Alis_Gun + "." + Arac_Alis_Ay + "." + Arac_Alis_Yil;
                yeniRez.planlananTeslimTarihi = Arac_Teslim_Gun + "." + Arac_Teslim_Ay + "." + Arac_Teslim_Yil;
                int toplamGun = 0;

                if (Int32.Parse(Arac_Alis_Ay) == Int32.Parse(Arac_Teslim_Ay))
                {
                    toplamGun = Int32.Parse(Arac_Teslim_Gun) - Int32.Parse(Arac_Alis_Gun);
                }
                else
                {
                    toplamGun = 31 - (Int32.Parse(Arac_Alis_Gun)) + Int32.Parse(Arac_Teslim_Gun);
                }
                yeniRez.ucret = toplamGun * (Int32.Parse(gunluk_ucret));
                yeniRez.onayDurumu = "OnayBekleniyor";
                yeniRez.istekTarihi = DateTime.Now.ToString();
                foreach (Araclar arac in db.Araclar.ToList())
                {
                    if (arac_id.ToString().Equals(arac.Id.ToString()))//eğer aynı modelden varsa
                    {
                        yeniRez.aracId = arac;
                        break;
                    }
                }

                foreach (Musteri musteri in db.Musteri.ToList())
                {
                    if (musteri.kullaniciAdi.ToString().Equals(kulAd.ToString()) && musteri.sifre.ToString().Equals(sifre.ToString()))
                    {
                        yeniRez.musteriId = musteri;
                        break;
                    }
                }

                db.RezervasyonIstekleri.Add(yeniRez);
                db.SaveChanges();
                return RedirectToAction("Araclar");
            }


        }



    }
}