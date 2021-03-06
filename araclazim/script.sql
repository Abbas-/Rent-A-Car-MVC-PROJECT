USE [master]
GO
/****** Object:  Database [araclazim]    Script Date: 12.01.2017 15:46:06 ******/
CREATE DATABASE [araclazim]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'araclazim', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\araclazim.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'araclazim_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\araclazim_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [araclazim] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [araclazim].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [araclazim] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [araclazim] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [araclazim] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [araclazim] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [araclazim] SET ARITHABORT OFF 
GO
ALTER DATABASE [araclazim] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [araclazim] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [araclazim] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [araclazim] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [araclazim] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [araclazim] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [araclazim] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [araclazim] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [araclazim] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [araclazim] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [araclazim] SET  ENABLE_BROKER 
GO
ALTER DATABASE [araclazim] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [araclazim] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [araclazim] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [araclazim] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [araclazim] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [araclazim] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [araclazim] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [araclazim] SET RECOVERY FULL 
GO
ALTER DATABASE [araclazim] SET  MULTI_USER 
GO
ALTER DATABASE [araclazim] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [araclazim] SET DB_CHAINING OFF 
GO
ALTER DATABASE [araclazim] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [araclazim] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'araclazim', N'ON'
GO
USE [araclazim]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12.01.2017 15:46:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 12.01.2017 15:46:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[kullaniciAdi] [nvarchar](max) NULL,
	[sifre] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Admins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Araclars]    Script Date: 12.01.2017 15:46:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Araclars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[yil] [nvarchar](max) NULL,
	[plaka] [nvarchar](max) NULL,
	[kasaTipi] [nvarchar](max) NULL,
	[renk] [nvarchar](max) NULL,
	[silindirHacmi] [nvarchar](max) NULL,
	[yakitTipi] [nvarchar](max) NULL,
	[gunlukUcret] [int] NOT NULL,
	[toplamKiralanmaSayisi] [int] NOT NULL,
	[modelId_Id] [int] NULL,
 CONSTRAINT [PK_dbo.Araclars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EhliyetBilgileris]    Script Date: 12.01.2017 15:46:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EhliyetBilgileris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ehliyetNo] [int] NOT NULL,
	[il] [nvarchar](max) NULL,
	[belgeNo] [int] NOT NULL,
	[kullanilanCihaz] [nvarchar](max) NULL,
	[ehliyetSinifi] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.EhliyetBilgileris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Faturas]    Script Date: 12.01.2017 15:46:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faturas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ucret] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Faturas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GecikmeCezalaris]    Script Date: 12.01.2017 15:46:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GecikmeCezalaris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[gecikmeGunu] [int] NOT NULL,
	[ucret] [int] NOT NULL,
	[teslimId_Id] [int] NULL,
 CONSTRAINT [PK_dbo.GecikmeCezalaris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GelenAraclars]    Script Date: 12.01.2017 15:46:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GelenAraclars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[aracTeslimTarih] [date] NOT NULL,
	[hasarUcreti] [int] NOT NULL,
	[faturaId_Id] [int] NULL,
	[rezIstekId_Id] [int] NULL,
 CONSTRAINT [PK_dbo.GelenAraclars] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Markas]    Script Date: 12.01.2017 15:46:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Markas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[marka] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Markas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Models]    Script Date: 12.01.2017 15:46:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Models](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[model] [nvarchar](max) NULL,
	[markaId_Id] [int] NULL,
 CONSTRAINT [PK_dbo.Models] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Musteris]    Script Date: 12.01.2017 15:46:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](max) NULL,
	[soyad] [nvarchar](max) NULL,
	[telefon] [nvarchar](max) NULL,
	[adres] [nvarchar](max) NULL,
	[eMail] [nvarchar](max) NULL,
	[kullaniciAdi] [nvarchar](max) NULL,
	[sifre] [nvarchar](max) NULL,
	[toplamKiraladigiArac] [int] NOT NULL,
	[ehliyetId_Id] [int] NULL,
	[musteriNufusBilgisiId_Id] [int] NULL,
 CONSTRAINT [PK_dbo.Musteris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NufusBilgileris]    Script Date: 12.01.2017 15:46:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NufusBilgileris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[tcNo] [int] NOT NULL,
	[babaAdi] [nvarchar](max) NULL,
	[anaAdi] [nvarchar](max) NULL,
	[dogumYeri] [nvarchar](max) NULL,
	[dogumTarihi] [nvarchar](max) NULL,
	[medeniHal] [nvarchar](max) NULL,
	[il] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.NufusBilgileris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RezervasyonIstekleris]    Script Date: 12.01.2017 15:46:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RezervasyonIstekleris](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[istekTarihi] [nvarchar](max) NULL,
	[planlananAlimTarihi] [nvarchar](max) NULL,
	[planlananTeslimTarihi] [nvarchar](max) NULL,
	[ucret] [int] NOT NULL,
	[onayDurumu] [nvarchar](max) NULL,
	[aracId_Id] [int] NULL,
	[musteriId_Id] [int] NULL,
 CONSTRAINT [PK_dbo.RezervasyonIstekleris] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Servis]    Script Date: 12.01.2017 15:46:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servis](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[verilisGunu] [date] NOT NULL,
	[hasarUcreti] [int] NOT NULL,
	[ucret] [int] NOT NULL,
	[aracId_Id] [int] NULL,
 CONSTRAINT [PK_dbo.Servis] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201701050744530_InitialCreate', N'araclazim.araclazim', 0x1F8B0800000000000400ED5D596F1CB9117E0F90FF3098A764E1D5C8DE978D20ED422B1F2BEC4A363CF2227912A869CE88501F933E048D83FCB23CE427E52F847D17AFE6D1C78C0CC136E069163F9255C5A38A47FDEF3FFF3DFDF929F0678F384E48149ECD5F1F1DCF67385C451E093767F32C5D7FFFE3FCE79FFEFCA7D3775EF034FBA3A6FB21A7A339C3E46C7E9FA6DB93C52259DDE30025470159C55112ADD3A355142C90172DDE1C1FFF6DF1FAF502538839C59ACD4E3F67614A025CFCA03F2FA27085B76986FCABC8C37E527DA729CB0275768D029C6CD10A9FCD518C563EFA4A82F9ECDC2788566089FDF57C86C2304A514AAB77F225C1CB348EC2CD724B3F20FF66B7C5946E8DFC0457D53E69C94D5B70FC266FC1A2CD5843ADB2248D024BC0D73F542C59F0D99D183B6F584699F68E3237DDE5AD2E1877363FF7024271F9924E2EFC38A7024C3D2A485FCD9A0FAF1AA153DDC8FFBC9A5D647E9AC5F82CC4591A23FFD5EC5376E793D56F7877133DE0F02CCC7C1FD687D688A6311FE8A74F71B4C571BAFB8CD7552D2FBDF96CC1E65BF0199B6C204FD984CB30FDE1CD7C764D0B47773E6EC40D9ABB4CA3187FC0218E518ABD4F284D711CE618B86098503A57D6430E1D921539F7485D2AD533DA53E6B32BF4F43B0E37E9FDD99CFE773E7B4F9EB0577FA96AF285E6A5EA7D364FE30CEB0A4BC83AC6039772BA6835A35B5F0AE9C7861A5312BFE88CACAC1DF1475795AD8F1ED0E8A53CA004DD90EDF89A1FE3F06182EEE593D023F1AF68158CDFA41D7A20E924CCDB64A19F3D7C59C538D5297937501A51B50A7E23B4B3A230404BB42309B184BC468F645374230E3CC867F9BC1B7EC67E919EDC936D39911F152B80DB7C50A1EC88A3E0739417D07EBDBD41F1A6685D24242DA32C5EB90E7A058ED9905790BE0C78B2B282928B43ABB952954A4571D1A35A59247A54AB98B13EA3F80175EA7343C157A54A50D4A64E9555C85CB1731043C5CE495F145BAAD82517F7B3207B77EF931D4E7F21FE86F8382666D2E473BD085656162EB9741DF59B302758E8DD617F83FBD6B3B262E8BF0B728FBE8E5EE98ABD4B1292F5D0EB1FE3FEF31E51D5361C034BDA97BE222B2BB35D581A4BE8035E9187005FE0AF74C1693AC071995E64262B6B5332E9431666FD460E6BE1772D99529CF82450AC9938B9DEB6C4EDF2494523ACA49484BD16551FB08F432B3F09CCF1A2A9B2B2729EDC14D2A1A221F775C16F29D80D09B0B5C2DEA304C5852D3C98E5BA2E2607A5DAB612BE6D29A1CE4A08240A2BA3B2B54962FCF53249F183495D21ADA2B62D49777D015DAFFEF5197FC5F1234A765158E099AF7A65395FFA9BAC2C92B3A7E86AE33BA6B674C149FFA2F0BCEEDE1396090695F14B75992639882844BBB7599C05D9849E94BC8728060B5997BAADE9DB01A3834C1834BA68ADDD2F7454A0D96D2A0FB268EADF509A35A125EFE7B329610CBD3625F1CB20272B0B79A3F7F824DA4D504A4AA7D975BE3D3C7239C88B7132BE5BE00A4DE03179F65BB6DD1B331ED990D2C33DCCEAB6F2D5A83CD9E530730BA880379B4F143DDA0285E3387F9DADB3A4706A26AA31BF2E4B9143ACB69450D9043975AF01BFC5325FE9B2795E867F697759F57598DEA13B34C5F04117AA5314E3459B2CF847A163539434D1A23BC0541FC8AF68FC2965F059CB788858D2D52649CC868692F665489095F54895DF27097488EEC1C534A673B5C3942B154362BC3109C2CCC7A6DACC74E74912AD48510D78D0A2DC9967DBF32EF466EA6DFAB2CF355BEAB4DF51FD255BAAB1B4D4B3F9F1D1D16B814352C4E600498BD8387259CCEFF82682C698B4B1DEF5EFAE94700440D3D2EFB4CDE48F0D40C4721B5BC73B8BA6CABD9EAA0A6A5CA06D455907BB3907BABDA7A0807A4F70405674F94954F535729AB4B596FB45CDD963E277D1778C5E5C12ED08A536AB8D0AA0D1B5ABC4A297284D11802B9EB9188107720345576F8DB532086FBA6D1C50066FB98CDD9F5AD79D958E4BFC7823F72AD115A897CC702331D8D3311A2A651B3C038FC692BD214B19F4648F6257595D79DD16336410777EC186479A0D6A4339F4620EBB2E545555B1486CEB57DB28E6AD97AF2C079D82CA85E94514A68850A3012C92AB8B448245F525C195519554261B5FFD1C718953F6824DBB02AEEB5E7E171ACFE5AE5B28E6AF533408D53A51C85F7DD7E52ED78462EEF2BB26B7384F0A40228906B35E9B0948758226BFD01B052081428B083B9E040E266BB0E4239D802927D3C9B29E574469D6291A047E3E178078020D5E3D2408387502971F74624EC1ABD3DC80403CEBCDBB273A6DCAA6AA4D0F5A18E5AF4729905F25FB05DB1CE3A63607C655AD95DA9606D6A5439B79731242488708FB462B8ECE888D37B0362DEC4DD092AE1E6C61600244C55865CF9CCEED779145C656A8B51D0A1A673238591B9EE3F42771DB4AD2A7BA6D5243AB14760CF9686B68860220EDDCE9CE11C5EE989A3B06D6AA83BDEAC8B56E0315806AE6AB81FA23385162D8251586AC8B293B78C7146D57BD94FA0EFBF014A266E05719B756E66DEFC15F62CF5A0AC28965AAB3D1329E9958BC76362FC3B5CE35B49D916B280D078E715B1E229B3A6C5F03EB17545CBEA23530777B4D7CF5CE4B63E03669A78BF2FD8CEAC3E942F1D0C6E915DA6E49B8010F6F545F66CBF2D58D8BEF97F6EF520425C66295489EA7686ADB94944631DA602E95164D6BFA9EC449FA16A5E80EE5FB60175E2090B5E6BCC21CA9CB8116BB28A7DA46A9A9F3FF73FE822369DE9667EF6933021CA6458B3014AD3CDF2C7FE624EF15923DD18BC8CF8250B5AFDA959B3DFA0471D81473C4EA7C1384AA3E8918A70B8E193CA71702AB3975E7E56626D5AAF338CA559EDB44B2AA9CE3C8B6785502662F3E98E7AF5E8C8008D5270BFD6ADE836074ABF96A8E543EF80051CA2F369AC9BCE6C06A289364C1E3F6CD0686D3ED67732CE6550688C62498E3291E6780C80A9283E9A9A5EFC1AD9F4AF31AF45245BE71FA68F510020408E4FE96FDC9A070DE38CA4096D74406F27C23C9A0F44E31329039ACF62803C1BC7713870EC640327A88718404EEDF4310F0D91C8B9F17EDA6C5E67E3D84683E5A2FBDDA2BF692D5579B68CDA9FA2ABD845B75D2C1A877E50375536A7966035556651C478133715ECF5433FA9EC4C05BEA6EF2D0A01808468B308E84982BF0CCFA0B267C6312073E145771AB218C64DD957D1C410B37C8219490688ECB1CF385984CC2C1085FEA7A745302132803653083194729986BCECCEA00265859CFE25566CE9616091CF0D96BCBD21258927146301506BCA50C81E0F783E912F59E85A3B523CF6D62EFA8728E340072B99155EEEA222BE33F293F59F826EA6BAA8C37A2FE68D392E21A2ADB98E293C582B9BC64CA2C94CB4FCFC58F6AE2016A6F81AA1C402DC5C1F4476E53D6AD5B768318F44E1DC0389DB4BC93C8086B656761367712194BB5FE68D1C94211A6FE668E02AE144220F0D9124B36E53109162EA0F66220E3066A3F0FED5DD85387AAF61EDD3A923CB3410752651CA7E33037F7200C9330FEB2FE39D885EC76B1C4F97EDBBE1C2075B057E9865B5DF91637C70DF1C0A5C8042325A99E8BBE95294BCE86A660AB3A557BEF8E75B2AECB45147AA438707F99E4173B9B4B9D662DE5F7FF1D65DE1C2B558BBD2131DA3E51F2983B34EA2AFA0A6530D173C7610F4BFACAC6F696BEE27CADCEED03486DDC3B12EE779E9A75944203338076749E133E282DE968756F35E93C696CEA1E6A32B8388124A2313839EC28A00A6400F531383D7D504AA46C79FF79463C6EDDE151816486AE13D9D0AE3A48EDC8F31667887947755CFCA014A2ABC983E984E2C079977E28B2F4D795CEE3E3AEAB1529E6803AD47990FEA0F4C99415E34C59E030BEF1AC05F28C39710927EBFBE9DA88D39770CDE010156C82E532BC97A05D3043E22197CCE25D03476900A0A197CDE21D8B83D298CE960FA032AA7B1906472900B5E59109A94CBAAF5A380AA58119446DBA6F991C94DE7434BCB7D6707753D4BE59A551A5F4FBF23C97DE3CD9BBE124BD537350E2EF612A0937737892C6095C7D697E373773AA5B31FAB8B8C2359992643EA38D7F245E7E4566B9A3C35F7094131C2DFFE95FF80487694B708542B2C6495ABEFE377F73FCFA0D1763F770E2DD2E92C4637C91AAA0B7ACC42678BF90E42CD5BE50E816B48979C7387C44F1EA1EC57F09D0D35F21A2F55BC51648D62164BF0DFE8330AEBDD8CE846AED85C48763ED050643AEF6542B4958D55E8842E8D45E6892F0A885BE0C191CD50510EEFB0014E15DA2CBD0C34F67F37F15D94E66977FBF6D73BE9A7D8CE9287E323B9EFD7BA04E2CD9F179B65D98094CDA4B89E0368DA5B09A9C63084BBC59F37C8505836D8E313D755F7679B67C136259BA0C4603CD755CB44A979A286255F6AA96341EE5182A26BB84F26C152BB39B329DC33E7E1BDC92845C74517F4BA64BD629D07361375581AC23CC556A4FE8B395B970BBA42CCBA3E843BC2AEF227EE6A4809DF8415673F1CB0C0BC6E56A570726F3084AA8DFD579B6CA2889ECD7D76E5545EF1B065716A1AF1772EFB1538CC1D7AB3EC08B68D70B9A8C7DFA21BB596669B480BC63982DB29DFB67DBF1DA3870FDFC2830A25C2F242E6A5C3F1D8691E1FA2DC261F4B77E7EB043F18C767B89F8486D2E23127B44C7AE13C3BC030C2492631D4E838A8033C200D375C7E7D98E3330AC998B2E7141CDFA0D0BE160504270B2FE6803AE29842063BDD09C0640DB6061DF86B64B2276EDD3AEEABDB69C7231387C5CAEDEB1B89A272E018E716C11AAA838CEF508F9175198A43122E2DDA94F310957648B7CA6DE1C95A1F6E72C6CF0F894B7788BC35CADB9A69914D57DADA941E6BAA2AEFDC3072983BE789B18622E9A3394BC15AF930D2E6F73C5EABEC93481B4EDE2B4D58FD7038199064C6370D8B77C019A5D4421272D50BE1F35B81A689ECA11CBD35C5D9A401D5C62D5590CDC1AB5903F8E0D60DD227239A9898DDC7AEA89E16B3A62B99D07EEA6982A8C63F689F10A8054ED63EAB19348FDF03C9C464C43DC39E986C1BB8AC3CF29CAC766C4A274379526540DBB50867C50062051DB80827B5611ED23247B55109B2B49FB9A75F4111D2DA4FA8C261E1B39EE6BE2D15D339A7AE16A10D67210111FF0B2D65996532F72B5578D26511EEBA09F0E92D56A0B17288581B50C1CEAA433D6B2EBAD2BBAA762C52235178C265016B320A8C3594175BC1800641A40F5D02D1DE58B52FBB66DB81B39551DC42033BCCCAA0B5715BD26E06B79F7E66CEEDDE5BB34A56BB64812C35D0AC8FA60B052F432518FAF09152BC32E2F1FE991BBC3C84A91F3243DB253885959793C95BE686D245A5931659A1EDC214CADAC388EC8A45C8B60B6F2125B0A7D71BDE2DDCA8A97511AE8A73E34AE5447CB443DBE75E05C59692C8DBE506D745D5921FB88BC6B197996D3CE838DB10BC73C75445C17761C52145D7614EC886EDBB194563D84D0BFD993C4C7B55048036B54F7B8C8002A3E74D85BD5246C14A556EECD913CE0335CC3478F6E2B1FEF0D42CE4EC88C0943D55A34E4203AC8A8B1670769D45E06D3D1E3CB3A34A3DB99D2F1584A7F760C163CD675FE6017781D61668789102BBE37416DED8CE60ECAD343D4D04FC8A685C8DFD008F18AB1B21B9ACB701DD5F63E57A39A843B19758553E45113FC3C4EC91AAD529ABCC24942C2CD7CF607F2B37C1E0AEEB077197ECCD26D96D226E3E0CEDF4166E44E83AEF28B30B86C9D4F3F6EF35FC9104DA0D524F9E9B48FE12F19F1BDA6DEEF25D7E41410B937A23A3E97CB32CD8FD16D760DD275141A0255EC6B9C283738D8FA142CF9182ED12376A9DB9704FF8E3768B5AB9F0D5183E805C1B2FDF42D419B18054985D1E6A73FA90E7BC1D34FFF0728767E04B4BC0000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[Admins] ON 

INSERT [dbo].[Admins] ([Id], [kullaniciAdi], [sifre]) VALUES (1, N'admin', N'123')
SET IDENTITY_INSERT [dbo].[Admins] OFF
SET IDENTITY_INSERT [dbo].[Araclars] ON 

INSERT [dbo].[Araclars] ([Id], [yil], [plaka], [kasaTipi], [renk], [silindirHacmi], [yakitTipi], [gunlukUcret], [toplamKiralanmaSayisi], [modelId_Id]) VALUES (4, N'2017', N'20dada', N'şkn', N'nlnln', N'2', N'fafa', 250, 0, 1)
SET IDENTITY_INSERT [dbo].[Araclars] OFF
SET IDENTITY_INSERT [dbo].[EhliyetBilgileris] ON 

INSERT [dbo].[EhliyetBilgileris] ([Id], [ehliyetNo], [il], [belgeNo], [kullanilanCihaz], [ehliyetSinifi]) VALUES (1, 1, N'LKNL', 2, N'NKLN', N'B')
SET IDENTITY_INSERT [dbo].[EhliyetBilgileris] OFF
SET IDENTITY_INSERT [dbo].[Markas] ON 

INSERT [dbo].[Markas] ([Id], [marka]) VALUES (1, N'Audi')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (2, N'BMW')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (3, N'Chevrolet')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (4, N'Citroen')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (5, N'Fiat')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (6, N'Ford')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (7, N'Honda')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (8, N'Hyundai')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (9, N'Kia')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (10, N'Mazda')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (11, N'Mercedes')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (12, N'Mitsubishi')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (13, N'Nissan')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (14, N'Opel')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (15, N'Peugeot')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (16, N'Renault')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (17, N'Seat')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (18, N'Skoda')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (19, N'Subaru')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (20, N'Tata')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (21, N'Tofaş')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (22, N'Toyota')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (23, N'Wolkswagen')
INSERT [dbo].[Markas] ([Id], [marka]) VALUES (24, N'Volvo')
SET IDENTITY_INSERT [dbo].[Markas] OFF
SET IDENTITY_INSERT [dbo].[Models] ON 

INSERT [dbo].[Models] ([Id], [model], [markaId_Id]) VALUES (1, N'faf', 1)
INSERT [dbo].[Models] ([Id], [model], [markaId_Id]) VALUES (2, N'faaf', 2)
SET IDENTITY_INSERT [dbo].[Models] OFF
SET IDENTITY_INSERT [dbo].[Musteris] ON 

INSERT [dbo].[Musteris] ([Id], [ad], [soyad], [telefon], [adres], [eMail], [kullaniciAdi], [sifre], [toplamKiraladigiArac], [ehliyetId_Id], [musteriNufusBilgisiId_Id]) VALUES (1, NULL, NULL, NULL, NULL, NULL, N'tahir', N'123', 0, NULL, NULL)
INSERT [dbo].[Musteris] ([Id], [ad], [soyad], [telefon], [adres], [eMail], [kullaniciAdi], [sifre], [toplamKiraladigiArac], [ehliyetId_Id], [musteriNufusBilgisiId_Id]) VALUES (2, NULL, NULL, NULL, NULL, NULL, N'abbas', N'123', 0, NULL, NULL)
INSERT [dbo].[Musteris] ([Id], [ad], [soyad], [telefon], [adres], [eMail], [kullaniciAdi], [sifre], [toplamKiraladigiArac], [ehliyetId_Id], [musteriNufusBilgisiId_Id]) VALUES (3, N'DADA', N'FASFA', N'221', N'AFFA', N'FADFAS', N'AKİN', N'FAFA', 0, 1, 1)
SET IDENTITY_INSERT [dbo].[Musteris] OFF
SET IDENTITY_INSERT [dbo].[NufusBilgileris] ON 

INSERT [dbo].[NufusBilgileris] ([Id], [tcNo], [babaAdi], [anaAdi], [dogumYeri], [dogumTarihi], [medeniHal], [il]) VALUES (1, 13221, N'JHJLH', N'LHLK', N'KLLKJ', N'2017', N'KJJ', N'NLLN')
SET IDENTITY_INSERT [dbo].[NufusBilgileris] OFF
SET IDENTITY_INSERT [dbo].[RezervasyonIstekleris] ON 

INSERT [dbo].[RezervasyonIstekleris] ([Id], [istekTarihi], [planlananAlimTarihi], [planlananTeslimTarihi], [ucret], [onayDurumu], [aracId_Id], [musteriId_Id]) VALUES (5, N'2017', N'2017', N'2017', 250, N'EVET', 4, 3)
SET IDENTITY_INSERT [dbo].[RezervasyonIstekleris] OFF
/****** Object:  Index [IX_modelId_Id]    Script Date: 12.01.2017 15:46:07 ******/
CREATE NONCLUSTERED INDEX [IX_modelId_Id] ON [dbo].[Araclars]
(
	[modelId_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_teslimId_Id]    Script Date: 12.01.2017 15:46:07 ******/
CREATE NONCLUSTERED INDEX [IX_teslimId_Id] ON [dbo].[GecikmeCezalaris]
(
	[teslimId_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_faturaId_Id]    Script Date: 12.01.2017 15:46:07 ******/
CREATE NONCLUSTERED INDEX [IX_faturaId_Id] ON [dbo].[GelenAraclars]
(
	[faturaId_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_rezIstekId_Id]    Script Date: 12.01.2017 15:46:07 ******/
CREATE NONCLUSTERED INDEX [IX_rezIstekId_Id] ON [dbo].[GelenAraclars]
(
	[rezIstekId_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_markaId_Id]    Script Date: 12.01.2017 15:46:07 ******/
CREATE NONCLUSTERED INDEX [IX_markaId_Id] ON [dbo].[Models]
(
	[markaId_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ehliyetId_Id]    Script Date: 12.01.2017 15:46:07 ******/
CREATE NONCLUSTERED INDEX [IX_ehliyetId_Id] ON [dbo].[Musteris]
(
	[ehliyetId_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_musteriNufusBilgisiId_Id]    Script Date: 12.01.2017 15:46:07 ******/
CREATE NONCLUSTERED INDEX [IX_musteriNufusBilgisiId_Id] ON [dbo].[Musteris]
(
	[musteriNufusBilgisiId_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_aracId_Id]    Script Date: 12.01.2017 15:46:07 ******/
CREATE NONCLUSTERED INDEX [IX_aracId_Id] ON [dbo].[RezervasyonIstekleris]
(
	[aracId_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_musteriId_Id]    Script Date: 12.01.2017 15:46:07 ******/
CREATE NONCLUSTERED INDEX [IX_musteriId_Id] ON [dbo].[RezervasyonIstekleris]
(
	[musteriId_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_aracId_Id]    Script Date: 12.01.2017 15:46:07 ******/
CREATE NONCLUSTERED INDEX [IX_aracId_Id] ON [dbo].[Servis]
(
	[aracId_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Araclars]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Araclars_dbo.Models_modelId_Id] FOREIGN KEY([modelId_Id])
REFERENCES [dbo].[Models] ([Id])
GO
ALTER TABLE [dbo].[Araclars] CHECK CONSTRAINT [FK_dbo.Araclars_dbo.Models_modelId_Id]
GO
ALTER TABLE [dbo].[GecikmeCezalaris]  WITH CHECK ADD  CONSTRAINT [FK_dbo.GecikmeCezalaris_dbo.GelenAraclars_teslimId_Id] FOREIGN KEY([teslimId_Id])
REFERENCES [dbo].[GelenAraclars] ([Id])
GO
ALTER TABLE [dbo].[GecikmeCezalaris] CHECK CONSTRAINT [FK_dbo.GecikmeCezalaris_dbo.GelenAraclars_teslimId_Id]
GO
ALTER TABLE [dbo].[GelenAraclars]  WITH CHECK ADD  CONSTRAINT [FK_dbo.GelenAraclars_dbo.Faturas_faturaId_Id] FOREIGN KEY([faturaId_Id])
REFERENCES [dbo].[Faturas] ([Id])
GO
ALTER TABLE [dbo].[GelenAraclars] CHECK CONSTRAINT [FK_dbo.GelenAraclars_dbo.Faturas_faturaId_Id]
GO
ALTER TABLE [dbo].[GelenAraclars]  WITH CHECK ADD  CONSTRAINT [FK_dbo.GelenAraclars_dbo.RezervasyonIstekleris_rezIstekId_Id] FOREIGN KEY([rezIstekId_Id])
REFERENCES [dbo].[RezervasyonIstekleris] ([Id])
GO
ALTER TABLE [dbo].[GelenAraclars] CHECK CONSTRAINT [FK_dbo.GelenAraclars_dbo.RezervasyonIstekleris_rezIstekId_Id]
GO
ALTER TABLE [dbo].[Models]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Models_dbo.Markas_markaId_Id] FOREIGN KEY([markaId_Id])
REFERENCES [dbo].[Markas] ([Id])
GO
ALTER TABLE [dbo].[Models] CHECK CONSTRAINT [FK_dbo.Models_dbo.Markas_markaId_Id]
GO
ALTER TABLE [dbo].[Musteris]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Musteris_dbo.EhliyetBilgileris_ehliyetId_Id] FOREIGN KEY([ehliyetId_Id])
REFERENCES [dbo].[EhliyetBilgileris] ([Id])
GO
ALTER TABLE [dbo].[Musteris] CHECK CONSTRAINT [FK_dbo.Musteris_dbo.EhliyetBilgileris_ehliyetId_Id]
GO
ALTER TABLE [dbo].[Musteris]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Musteris_dbo.NufusBilgileris_musteriNufusBilgisiId_Id] FOREIGN KEY([musteriNufusBilgisiId_Id])
REFERENCES [dbo].[NufusBilgileris] ([Id])
GO
ALTER TABLE [dbo].[Musteris] CHECK CONSTRAINT [FK_dbo.Musteris_dbo.NufusBilgileris_musteriNufusBilgisiId_Id]
GO
ALTER TABLE [dbo].[RezervasyonIstekleris]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RezervasyonIstekleris_dbo.Araclars_aracId_Id] FOREIGN KEY([aracId_Id])
REFERENCES [dbo].[Araclars] ([Id])
GO
ALTER TABLE [dbo].[RezervasyonIstekleris] CHECK CONSTRAINT [FK_dbo.RezervasyonIstekleris_dbo.Araclars_aracId_Id]
GO
ALTER TABLE [dbo].[RezervasyonIstekleris]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RezervasyonIstekleris_dbo.Musteris_musteriId_Id] FOREIGN KEY([musteriId_Id])
REFERENCES [dbo].[Musteris] ([Id])
GO
ALTER TABLE [dbo].[RezervasyonIstekleris] CHECK CONSTRAINT [FK_dbo.RezervasyonIstekleris_dbo.Musteris_musteriId_Id]
GO
ALTER TABLE [dbo].[Servis]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Servis_dbo.Araclars_aracId_Id] FOREIGN KEY([aracId_Id])
REFERENCES [dbo].[Araclars] ([Id])
GO
ALTER TABLE [dbo].[Servis] CHECK CONSTRAINT [FK_dbo.Servis_dbo.Araclars_aracId_Id]
GO
USE [master]
GO
ALTER DATABASE [araclazim] SET  READ_WRITE 
GO
