namespace araclazim
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity;
    using System.Linq;

    public class araclazim : DbContext
    {
        // Your context has been configured to use a 'araclazim' connection string from your application's 
        // configuration file (App.config or Web.config). By default, this connection string targets the 
        // 'araclazim.araclazim' database on your LocalDb instance. 
        // 
        // If you wish to target a different database and/or database provider, modify the 'araclazim' 
        // connection string in the application configuration file.
        public araclazim()
            : base("name=araclazim")
        {
        }

        // Add a DbSet for each entity type that you want to include in your model. For more information 
        // on configuring and using a Code First model, see http://go.microsoft.com/fwlink/?LinkId=390109.

        // public virtual DbSet<MyEntity> MyEntities { get; set; }
        public virtual DbSet<Musteri> Musteri { get; set; }
        public virtual DbSet<Admin> Admin { get; set; }
        public virtual DbSet<EhliyetBilgileri> EhliyetBilgileri { get; set; }
        public virtual DbSet<NufusBilgileri> NufusBilgileri { get; set; }
        public virtual DbSet<Araclar> Araclar { get; set; }
        public virtual DbSet<Fatura> Fatura { get; set; }
        public virtual DbSet<GecikmeCezalari> GecikmeCezalari { get; set; }
        public virtual DbSet<GelenAraclar> GelenAraclar { get; set; }
        public virtual DbSet<Marka> Marka { get; set; }
        public virtual DbSet<Model> Model { get; set; }
        public virtual DbSet<RezervasyonIstekleri> RezervasyonIstekleri { get; set; }
        public virtual DbSet<Servis> Servis { get; set; }
    }

    //public class MyEntity
    //{
    //    public int Id { get; set; }
    //    public string Name { get; set; }
    //}

    public class Musteri
    {
        
        [Key]
        public int Id { get; set; }//müşteri id -PK
        public string ad { get; set; }
        public string soyad { get; set; }
        public string telefon { get; set; }
        public string adres { get; set; }
        public string eMail { get; set; }
        public string kullaniciAdi { get; set; }
        public string sifre { get; set; }
        public EhliyetBilgileri ehliyetId { get; set; } //FK OLDU BU ŞU AN
        public NufusBilgileri musteriNufusBilgisiId { get; set; }
        public int toplamKiraladigiArac { get; set; }
    }

    public class Admin
    {
        [Key]
        public int Id { get; set; }
        public string kullaniciAdi { get; set; }
        public string sifre { get; set; }
    }

    public class EhliyetBilgileri
    {
        [Key]
        public int Id { get; set; }
        public int ehliyetNo { get; set; }
        public string il { get; set; }
        public int belgeNo { get; set; }
        public string kullanilanCihaz { get; set; }
        public string ehliyetSinifi { get; set; }


    }

    public class NufusBilgileri
    {
        [Key]
        public int Id { get; set; }
        public int tcNo { get; set; }
        public string babaAdi { get; set; }
        public string anaAdi { get; set; }
        public string dogumYeri { get; set; }
        //[Required, Column(TypeName = "Date"), DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        //public DateTime dogumTarihi { get; set; }
        public string dogumTarihi { get; set; }
        public string medeniHal { get; set; }
        public string il { get; set; }

    }

    public class RezervasyonIstekleri
    {
        [Key]
        public int Id { get; set; }
        public Musteri musteriId { get; set; }
        public Araclar aracId { get; set; }



        public string istekTarihi { get; set; }

        public string planlananAlimTarihi { get; set; }

        public string planlananTeslimTarihi { get; set; }

        public int ucret { get; set; }

        public string onayDurumu { get; set; }



    }

    public class Araclar
    {

        [Key]
        public int Id { get; set; }
        public Model modelId { get; set; }
        //[Required, Column(TypeName = "Date"), DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        //public DateTime yil { get; set; }
        public string yil { get; set; }
        public string plaka { get; set; }
        public string kasaTipi { get; set; }
        public string renk { get; set; }
        public string silindirHacmi { get; set; }
        public string yakitTipi { get; set; }
        public int gunlukUcret { get; set; }
        public int toplamKiralanmaSayisi { get; set; }



    }
    public class Fatura
    {
        [Key]
        public int Id { get; set; }
        public int ucret { get; set; }
    }

    public class Model
    {
        [Key]
        public int Id { get; set; }
        public string model { get; set; }
        public Marka markaId { get; set; }
        public ICollection<Araclar> Arac { get; set; }

    }

    public class Marka
    {
        [Key]
        public int Id { get; set; }
        public string marka { get; set; }
    }

    public class GecikmeCezalari
    {
        [Key]
        public int Id { get; set; }
        public GelenAraclar teslimId { get; set; }
        public int gecikmeGunu { get; set; }
        public int ucret { get; set; }
    }

    public class GelenAraclar
    {
        [Key]
        public int Id { get; set; }
        public RezervasyonIstekleri rezIstekId { get; set; }

        
        public string aracTeslimTarih { get; set; }

        public int hasarUcreti { get; set; }

        public Fatura faturaId { get; set; }


    }

    public class Servis
    {
        [Key]
        public int Id { get; set; }
        public Araclar aracId { get; set; }

        [Required, Column(TypeName = "Date"), DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime verilisGunu { get; set; }

        public int hasarUcreti { get; set; }

        public int ucret { get; set; }


    }






}