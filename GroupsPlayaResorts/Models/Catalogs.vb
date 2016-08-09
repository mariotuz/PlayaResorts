Imports System.ComponentModel
Imports System.ComponentModel.DataAnnotations
Imports System.Globalization
Imports System.Web

Public Class CatalogChannel
    Private ChannelNameValue As String
    Private EditChannelNameValue As String
    Private EditChannelIDValue As String
    Private ListChannel As List(Of CatalogChannelList)


    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
  <Display(Name:="Channel Name")> _
    Public Property ChannelName() As String
        Get
            Return ChannelNameValue
        End Get
        Set(ByVal value As String)
            ChannelNameValue = value
        End Set
    End Property

    <Display(Name:="Channel Name")> _
    Public Property EditChannelName() As String
        Get
            Return EditChannelNameValue
        End Get
        Set(ByVal value As String)
            EditChannelNameValue = value
        End Set
    End Property

    <Display(Name:="Id Channel")> _
    Public Property EditChannelID() As String
        Get
            Return EditChannelIDValue
        End Get
        Set(ByVal value As String)
            EditChannelIDValue = value
        End Set
    End Property

    Public Property ListChannelin() As List(Of CatalogChannelList)
        Get
            Return ListChannel
        End Get
        Set(ByVal value As List(Of CatalogChannelList))
            ListChannel = value
        End Set
    End Property


End Class

Public Class CatalogCompanies
    Private ListCompanies As List(Of CatalogCompanyList)
    Private ListCountry As List(Of SelectListItem)
    Private ListState As List(Of SelectListItem)
    Private CompanieNameValue As String
    Private CompanieKeyValue As String
    Private EditCompanieValue As String
    Private EditComapnieKeyValue As String
    Private EditCompanieidValue As String
    Private EditCompanieCountryValue As String
    Private EditCompanieStateValue As String
    Private EditCompanieIATAValue As String
    Private EditCompanieZIPValue As String
    Private CityValue As String
    Private AddressValue As String

    Public Property City() As String
        Get
            Return CityValue
        End Get
        Set(ByVal value As String)
            CityValue = value
        End Set
    End Property

    Public Property Address() As String
        Get
            Return AddressValue
        End Get
        Set(ByVal value As String)
            AddressValue = value
        End Set
    End Property

    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
   <Display(Name:="Company Name")> _
    Public Property CompanieName() As String
        Get
            Return CompanieNameValue
        End Get
        Set(ByVal value As String)
            CompanieNameValue = value
        End Set
    End Property

    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
    <Display(Name:="Key Company")> _
    Public Property CompanieKey() As String
        Get
            Return CompanieKeyValue
        End Get
        Set(ByVal value As String)
            CompanieKeyValue = value
        End Set
    End Property

    <Display(Name:="Company Name")> _
    Public Property EditCompanie() As String
        Get
            Return EditCompanieValue
        End Get
        Set(ByVal value As String)
            EditCompanieValue = value
        End Set
    End Property


    <Display(Name:="Key Company")> _
    Public Property EditComapnieKey() As String
        Get
            Return EditComapnieKeyValue
        End Get
        Set(ByVal value As String)
            EditComapnieKeyValue = value
        End Set
    End Property

    <Display(Name:="Id Company")> _
    Public Property EditCompanieid() As String
        Get
            Return EditCompanieidValue
        End Get
        Set(ByVal value As String)
            EditCompanieidValue = value
        End Set
    End Property

    Public Property EditCompanieIATA() As String
        Get
            Return EditCompanieIATAValue
        End Get
        Set(ByVal value As String)
            EditCompanieIATAValue = value
        End Set
    End Property

    Public Property EditCompanieZIP() As String
        Get
            Return EditCompanieZIPValue
        End Get
        Set(ByVal value As String)
            EditCompanieZIPValue = value
        End Set
    End Property

    Public Property EditCompanieCountry() As String
        Get
            Return EditCompanieCountryValue
        End Get
        Set(ByVal value As String)
            EditCompanieCountryValue = value
        End Set
    End Property

    Public Property EditCompanieState() As String
        Get
            Return EditCompanieStateValue
        End Get
        Set(ByVal value As String)
            EditCompanieStateValue = value
        End Set
    End Property


    Public Property ListCompaniesin() As List(Of CatalogCompanyList)
        Get
            Return ListCompanies
        End Get
        Set(ByVal value As List(Of CatalogCompanyList))
            ListCompanies = value
        End Set
    End Property


    Public Property ListCountryin() As List(Of SelectListItem)
        Get
            Return ListCountry
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListCountry = value
        End Set
    End Property

    Public Property ListStatein() As List(Of SelectListItem)
        Get
            Return ListState
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListState = value
        End Set
    End Property


End Class

Public Class CatalogAgencyType
    Private AgencyTypeNameValue As String
    Private EditAgencyTypeNameValue As String
    Private EditAgencyTypeIDValue As String
    Private ListAgencyType As List(Of CatalogAgencyTypeList)


    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
  <Display(Name:="Agency Type Name")> _
    Public Property AgencyTypeName() As String
        Get
            Return AgencyTypeNameValue
        End Get
        Set(ByVal value As String)
            AgencyTypeNameValue = value
        End Set
    End Property

    <Display(Name:="Agency Type Name")> _
    Public Property EditAgencyTypeName() As String
        Get
            Return EditAgencyTypeNameValue
        End Get
        Set(ByVal value As String)
            EditAgencyTypeNameValue = value
        End Set
    End Property

    <Display(Name:="Id Group Type")> _
    Public Property EditAgencyTypeID() As String
        Get
            Return EditAgencyTypeIDValue
        End Get
        Set(ByVal value As String)
            EditAgencyTypeIDValue = value
        End Set
    End Property

    Public Property ListAgencyTypein() As List(Of CatalogAgencyTypeList)
        Get
            Return ListAgencyType
        End Get
        Set(ByVal value As List(Of CatalogAgencyTypeList))
            ListAgencyType = value
        End Set
    End Property


End Class

Public Class CatalogGroupType
    Private GroupTypeNameValue As String
    Private EditGroupTypeNameValue As String
    Private EditGroupTypeIDValue As String
    Private EditGroupSpecialValue As String
    Private EditGroupSpecialMICEValue As String
    Private ListGroupType As List(Of CatalogGroupTypeList)


    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
  <Display(Name:="Group Type Name")> _
    Public Property GroupTypeName() As String
        Get
            Return GroupTypeNameValue
        End Get
        Set(ByVal value As String)
            GroupTypeNameValue = value
        End Set
    End Property

    <Display(Name:="Group Type Name")> _
    Public Property EditGroupTypeName() As String
        Get
            Return EditGroupTypeNameValue
        End Get
        Set(ByVal value As String)
            EditGroupTypeNameValue = value
        End Set
    End Property

    <Display(Name:="Id Group Type")> _
    Public Property EditGroupTypeID() As String
        Get
            Return EditGroupTypeIDValue
        End Get
        Set(ByVal value As String)
            EditGroupTypeIDValue = value
        End Set
    End Property

    <Display(Name:="Special Concessions Social Groups")> _
    Public Property EditGroupSpecial() As String
        Get
            Return EditGroupSpecialValue
        End Get
        Set(ByVal value As String)
            EditGroupSpecialValue = value
        End Set
    End Property

    <Display(Name:="Special Concessions MICE Groups")> _
    Public Property EditGroupSpecialMICE() As String
        Get
            Return EditGroupSpecialMICEValue
        End Get
        Set(ByVal value As String)
            EditGroupSpecialMICEValue = value
        End Set
    End Property

    Public Property ListGroupTypein() As List(Of CatalogGroupTypeList)
        Get
            Return ListGroupType
        End Get
        Set(ByVal value As List(Of CatalogGroupTypeList))
            ListGroupType = value
        End Set
    End Property


End Class

Public Class CatalogMarket
    Private ListMarket As List(Of CatalogMarketList)
    Private MarketNameValue As String
    Private MarketKeyValue As String
    Private EditMarketValue As String
    Private EditMarketKeyValue As String
    Private EditMarketidValue As String

    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
   <Display(Name:="Market Name")> _
    Public Property MarketName() As String
        Get
            Return MarketNameValue
        End Get
        Set(ByVal value As String)
            MarketNameValue = value
        End Set
    End Property

    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
    <Display(Name:="Key Market")> _
    Public Property MarketKey() As String
        Get
            Return MarketKeyValue
        End Get
        Set(ByVal value As String)
            MarketKeyValue = value
        End Set
    End Property

    <Display(Name:="Market Name")> _
    Public Property EditMarket() As String
        Get
            Return EditMarketValue
        End Get
        Set(ByVal value As String)
            EditMarketValue = value
        End Set
    End Property


    <Display(Name:="Key Market")> _
    Public Property EditMarketKey() As String
        Get
            Return EditMarketKeyValue
        End Get
        Set(ByVal value As String)
            EditMarketKeyValue = value
        End Set
    End Property

    <Display(Name:="Id Market")> _
    Public Property EditMarketid() As String
        Get
            Return EditMarketidValue
        End Get
        Set(ByVal value As String)
            EditMarketidValue = value
        End Set
    End Property


    Public Property ListMarketin() As List(Of CatalogMarketList)
        Get
            Return ListMarket
        End Get
        Set(ByVal value As List(Of CatalogMarketList))
            ListMarket = value
        End Set
    End Property


End Class

Public Class CatalogDetail
    Private ListUnitMeasure As List(Of CatalogUnitMeasureList)
    Private UnitMeasureValue As String
    Private UnitKeyValue As String
    Private EditUnitMeasureValue As String
    Private EditUnitKeyValue As String
    Private EditUnitIDValue As String

    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
   <Display(Name:="Unit Measure")> _
    Public Property UnitMeasure() As String
        Get
            Return UnitMeasureValue
        End Get
        Set(ByVal value As String)
            UnitMeasureValue = value
        End Set
    End Property

    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
    <Display(Name:="Unit Key")> _
    Public Property UnitKey() As String
        Get
            Return UnitKeyValue
        End Get
        Set(ByVal value As String)
            UnitKeyValue = value
        End Set
    End Property


    <Display(Name:="Unit Measure")> _
    Public Property EditUnitMeasure() As String
        Get
            Return EditUnitMeasureValue
        End Get
        Set(ByVal value As String)
            EditUnitMeasureValue = value
        End Set
    End Property


    <Display(Name:="Unit Key")> _
    Public Property EditUnitKey() As String
        Get
            Return EditUnitKeyValue
        End Get
        Set(ByVal value As String)
            EditUnitKeyValue = value
        End Set
    End Property

    <Display(Name:="Unit Id")> _
    Public Property EditUnitID() As String
        Get
            Return EditUnitIDValue
        End Get
        Set(ByVal value As String)
            EditUnitIDValue = value
        End Set
    End Property

    Public Property ListUnitMeasurein() As List(Of CatalogUnitMeasureList)
        Get
            Return ListUnitMeasure
        End Get
        Set(ByVal value As List(Of CatalogUnitMeasureList))
            ListUnitMeasure = value
        End Set
    End Property

End Class

Public Class CatalogDistributionGroup
    Private ListDistributionGroups As List(Of CatalogDistributionGroupList)
    Private ListaEmailGroups As List(Of SelectListItem)
    Private DistributionGroupNameValue As String
    Private EditDistributionGroupNameValue As String
    Private EditDistributionPropertyValue As String
    Private EditDistributionGroupIDValue As String

    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
   <Display(Name:="Distribution Group Name")> _
    Public Property DistributionGroupName() As String
        Get
            Return DistributionGroupNameValue
        End Get
        Set(ByVal value As String)
            DistributionGroupNameValue = value
        End Set
    End Property


    <Display(Name:="Distribution Group Name")> _
    Public Property EditDistributionGroupName() As String
        Get
            Return EditDistributionGroupNameValue
        End Get
        Set(ByVal value As String)
            EditDistributionGroupNameValue = value
        End Set
    End Property


    <Display(Name:="Property")> _
    Public Property EditDistributionProperty() As String
        Get
            Return EditDistributionPropertyValue
        End Get
        Set(ByVal value As String)
            EditDistributionPropertyValue = value
        End Set
    End Property

    <Display(Name:="Distribution Group Id")> _
    Public Property EditDistributionGroupID() As String
        Get
            Return EditDistributionGroupIDValue
        End Get
        Set(ByVal value As String)
            EditDistributionGroupIDValue = value
        End Set
    End Property

    Public Property ListDistributionGroupsin() As List(Of CatalogDistributionGroupList)
        Get
            Return ListDistributionGroups
        End Get
        Set(ByVal value As List(Of CatalogDistributionGroupList))
            ListDistributionGroups = value
        End Set
    End Property


    Public Property ListaEmailGroupsin() As List(Of SelectListItem)
        Get
            Return ListaEmailGroups
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListaEmailGroups = value
        End Set
    End Property

End Class

Public Class CatalogSupplier
    Private ListSupplier As List(Of CatalogSupplierList)
    Private ListCountry As List(Of SelectListItem)
    Private ListState As List(Of SelectListItem)
    Private SupplierNameValue As String
    Private SupplierRFCValue As String
    Private SupplierEmailValue As String
    Private SupplierPhone1Value As String
    Private SupplierPhone2Value As String
    Private SupplierCityValue As String

    Private EditSupplierIDValue As String
    Private EditSupplierNameValue As String
    Private EditSupplierRFCValue As String
    Private EditSupplierEmailValue As String
    Private EditSupplierPhone1Value As String
    Private EditSupplierPhone2Value As String
    Private EditSupplierCityValue As String
    Private EditSupplierCountryValue As String
    Private EditSupplierStateValue As String
    Private EditSupplierAddressValue As String

    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
   <Display(Name:="Supplier Name")> _
    Public Property SupplierName() As String
        Get
            Return SupplierNameValue
        End Get
        Set(ByVal value As String)
            SupplierNameValue = value
        End Set
    End Property

    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
  <Display(Name:="RFC Supplier")> _
    Public Property SupplierRFC() As String
        Get
            Return SupplierRFCValue
        End Get
        Set(ByVal value As String)
            SupplierRFCValue = value
        End Set
    End Property
    
    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
 <Display(Name:="Email")> _
    Public Property SupplierEmail() As String
        Get
            Return SupplierEmailValue
        End Get
        Set(ByVal value As String)
            SupplierEmailValue = value
        End Set
    End Property

    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
 <Display(Name:="Telephone 1")> _
    Public Property SupplierPhone1() As String
        Get
            Return SupplierPhone1Value
        End Get
        Set(ByVal value As String)
            SupplierPhone1Value = value
        End Set
    End Property

    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
 <Display(Name:="Telephone 2")> _
    Public Property SupplierPhone2() As String
        Get
            Return SupplierPhone2Value
        End Get
        Set(ByVal value As String)
            SupplierPhone2Value = value
        End Set
    End Property


    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
<Display(Name:="City")> _
    Public Property SupplierCity() As String
        Get
            Return SupplierCityValue
        End Get
        Set(ByVal value As String)
            SupplierCityValue = value
        End Set
    End Property


    Public Property EditSupplierID() As String
        Get
            Return EditSupplierIDValue
        End Get
        Set(ByVal value As String)
            EditSupplierIDValue = value
        End Set
    End Property


    Public Property EditSupplierName() As String
        Get
            Return EditSupplierNameValue
        End Get
        Set(ByVal value As String)
            EditSupplierNameValue = value
        End Set
    End Property

   
    Public Property EditSupplierRFC() As String
        Get
            Return EditSupplierRFCValue
        End Get
        Set(ByVal value As String)
            EditSupplierRFCValue = value
        End Set
    End Property

    
    Public Property EditSupplierEmail() As String
        Get
            Return EditSupplierEmailValue
        End Get
        Set(ByVal value As String)
            EditSupplierEmailValue = value
        End Set
    End Property

  
    Public Property EditSupplierPhone1() As String
        Get
            Return EditSupplierPhone1Value
        End Get
        Set(ByVal value As String)
            EditSupplierPhone1Value = value
        End Set
    End Property

   
    Public Property EditSupplierPhone2() As String
        Get
            Return EditSupplierPhone2Value
        End Get
        Set(ByVal value As String)
            EditSupplierPhone2Value = value
        End Set
    End Property


    Public Property EditSupplierCity() As String
        Get
            Return EditSupplierCityValue
        End Get
        Set(ByVal value As String)
            EditSupplierCityValue = value
        End Set
    End Property

    Public Property EditSupplierCountry() As String
        Get
            Return EditSupplierCountryValue
        End Get
        Set(ByVal value As String)
            EditSupplierCountryValue = value
        End Set
    End Property

    Public Property EditSupplierState() As String
        Get
            Return EditSupplierStateValue
        End Get
        Set(ByVal value As String)
            EditSupplierStateValue = value
        End Set
    End Property

    Public Property EditSupplierAddress() As String
        Get
            Return EditSupplierAddressValue
        End Get
        Set(ByVal value As String)
            EditSupplierAddressValue = value
        End Set
    End Property

 
    Public Property ListSupplierin() As List(Of CatalogSupplierList)
        Get
            Return ListSupplier
        End Get
        Set(ByVal value As List(Of CatalogSupplierList))
            ListSupplier = value
        End Set
    End Property


    Public Property ListCountryin() As List(Of SelectListItem)
        Get
            Return ListCountry
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListCountry = value
        End Set
    End Property

    Public Property ListStatein() As List(Of SelectListItem)
        Get
            Return ListState
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListState = value
        End Set
    End Property

End Class

Public Class CataloPromo

    Private PromoDiscountValue As String
    Private ListPromo As List(Of CatalogPromoList)
    Private ListRoomType As List(Of SelectListItem)


    Public Property ListPromoin() As List(Of CatalogPromoList)
        Get
            Return ListPromo
        End Get
        Set(ByVal value As List(Of CatalogPromoList))
            ListPromo = value
        End Set
    End Property


    Public Property ListRoomTypein() As List(Of SelectListItem)
        Get
            Return ListRoomType
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListRoomType = value
        End Set
    End Property


    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
    <Display(Name:="Discount")> _
    Public Property PromoDiscount() As String
        Get
            Return PromoDiscountValue
        End Get
        Set(ByVal value As String)
            PromoDiscountValue = value
        End Set
    End Property

  

End Class

Public Class CatalogProfile

    Private ProfileNameValue As String
    Private ListProfile As List(Of CatalogProfileList)


    Public Property ListProfilein() As List(Of CatalogProfileList)
        Get
            Return ListProfile
        End Get
        Set(ByVal value As List(Of CatalogProfileList))
            ListProfile = value
        End Set
    End Property


    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
    <Display(Name:="Profile Name")> _
    Public Property ProfileName() As String
        Get
            Return ProfileNameValue
        End Get
        Set(ByVal value As String)
            ProfileNameValue = value
        End Set
    End Property



End Class

Public Class CataloUsers

    Private UserNameValue As String
    Private UserLastnameValue As String
    Private UserEmailValue As String
    Private UserNumberEmployeValue As String
    Private UserLoginValue As String
    Private UserPasswordValue As String
    Private UserConfirmPasswordValue As String
    Private UserMaxDiscountValue As String
    Private ListProfile As List(Of SelectListItem)
    Private ListChannel As List(Of SelectListItem)
    Private ListBoss As List(Of SelectListItem)
    Private ListUsers As List(Of CatalogUsersList)


    Public Property ListUsersin() As List(Of CatalogUsersList)
        Get
            Return ListUsers
        End Get
        Set(ByVal value As List(Of CatalogUsersList))
            ListUsers = value
        End Set
    End Property

    Public Property ListProfilein() As List(Of SelectListItem)
        Get
            Return ListProfile
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListProfile = value
        End Set
    End Property

    Public Property ListBossin() As List(Of SelectListItem)
        Get
            Return ListBoss
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListBoss = value
        End Set
    End Property

    Public Property ListChannelin() As List(Of SelectListItem)
        Get
            Return ListChannel
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListChannel = value
        End Set
    End Property


    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
    <Display(Name:="User Name")> _
    Public Property UserName() As String
        Get
            Return UserNameValue
        End Get
        Set(ByVal value As String)
            UserNameValue = value
        End Set
    End Property

    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
    <Display(Name:="User Last Name")> _
    Public Property UserLastname() As String
        Get
            Return UserLastnameValue
        End Get
        Set(ByVal value As String)
            UserLastnameValue = value
        End Set
    End Property


    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
    <Display(Name:="E-mail")> _
    Public Property UserEmail() As String
        Get
            Return UserEmailValue
        End Get
        Set(ByVal value As String)
            UserEmailValue = value
        End Set
    End Property


    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
   <Display(Name:="Employee Number")> _
    Public Property UserNumberEmploye() As String
        Get
            Return UserNumberEmployeValue
        End Get
        Set(ByVal value As String)
            UserNumberEmployeValue = value
        End Set
    End Property

    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
  <Display(Name:="User Login")> _
    Public Property UserLogin() As String
        Get
            Return UserLoginValue
        End Get
        Set(ByVal value As String)
            UserLoginValue = value
        End Set
    End Property


    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
    <RegularExpression("^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$", ErrorMessage:="*The password must lead characters (uppercase and lowercase), numbers and length of 8-15 characters ")> _
  <Display(Name:="Password")> _
    Public Property UserPassword() As String
        Get
            Return UserPasswordValue
        End Get
        Set(ByVal value As String)
            UserPasswordValue = value
        End Set
    End Property


    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
  <Display(Name:="Confirm Password")> _
   <System.Web.Mvc.Compare("UserPassword", ErrorMessage:="*The password and confirmation password do not match")> _
    Public Property UserConfirmPassword() As String
        Get
            Return UserConfirmPasswordValue
        End Get
        Set(ByVal value As String)
            UserConfirmPasswordValue = value
        End Set
    End Property

    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
   <Display(Name:="Max Discount Rates")> _
    Public Property UserMaxDiscount() As String
        Get
            Return UserMaxDiscountValue
        End Get
        Set(ByVal value As String)
            UserMaxDiscountValue = value
        End Set
    End Property

End Class

Public Class CatalogContacts
    Private ListContacts As List(Of CatalogContactList)
    Private ListCountry As List(Of SelectListItem)
    Private ListState As List(Of SelectListItem)
    Private ContactNameValue As String
    Private ContactEmailValue As String
    Private ContactPhoneValue As String
    Private ContactWhosaleCompanyValue As String
    Private CountryValue As String
    Private StateValue As String
    Private PostalCodeValue As String
    Private CityValue As String
    Private AddressValue As String

    Private EditContactNameValue As String
    Private EditContactEmailValue As String
    Private EditContactPhoneUnoValue As String
    Private EditContactPhoneDosValue As String
    Private EditContactTypeValue As String
    Private EditContactWhosaleCompanyValue As String
    Private EditContactidValue As String

    Public Property PostalCode() As String
        Get
            Return PostalCodeValue
        End Get
        Set(ByVal value As String)
            PostalCodeValue = value
        End Set
    End Property

    Public Property Country() As String
        Get
            Return CountryValue
        End Get
        Set(ByVal value As String)
            CountryValue = value
        End Set
    End Property

    Public Property State() As String
        Get
            Return StateValue
        End Get
        Set(ByVal value As String)
            StateValue = value
        End Set
    End Property

    Public Property ListCountryin() As List(Of SelectListItem)
        Get
            Return ListCountry
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListCountry = value
        End Set
    End Property

    Public Property ListStatein() As List(Of SelectListItem)
        Get
            Return ListState
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListState = value
        End Set
    End Property

    Public Property City() As String
        Get
            Return CityValue
        End Get
        Set(ByVal value As String)
            CityValue = value
        End Set
    End Property

    Public Property Address() As String
        Get
            Return AddressValue
        End Get
        Set(ByVal value As String)
            AddressValue = value
        End Set
    End Property

    Public Property ListContactsin() As List(Of CatalogContactList)
        Get
            Return ListContacts
        End Get
        Set(ByVal value As List(Of CatalogContactList))
            ListContacts = value
        End Set
    End Property

    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
   <Display(Name:="Contact Name")> _
    Public Property ContactName() As String
        Get
            Return ContactNameValue
        End Get
        Set(ByVal value As String)
            ContactNameValue = value
        End Set
    End Property

    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
    <Display(Name:="E-mail")> _
    Public Property ContactEmail() As String
        Get
            Return ContactEmailValue
        End Get
        Set(ByVal value As String)
            ContactEmailValue = value
        End Set
    End Property

    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
   <Display(Name:="Telephone 1")> _
    Public Property ContactPhone() As String
        Get
            Return ContactPhoneValue
        End Get
        Set(ByVal value As String)
            ContactPhoneValue = value
        End Set
    End Property


    <Required(ErrorMessage:=" <div class=""col-xs-12 col-sm-6 col-md-4 col-lg-4 alert alert-warning alert-dismissible fade in""   id=""AlertError"" role=""alert""><button type=""button"" class=""close"" data-dismiss=""alert"" aria-label=""Close""><span aria-hidden=""true"">&times;</span></button><strong>Warning! *{0}</strong> is required.</div> ")> _
   <Display(Name:="Whosale / Company")> _
    Public Property ContactWhosaleCompany() As String
        Get
            Return ContactWhosaleCompanyValue
        End Get
        Set(ByVal value As String)
            ContactWhosaleCompanyValue = value
        End Set
    End Property



    <Display(Name:="Contact Name")> _
    Public Property EditContactName() As String
        Get
            Return EditContactNameValue
        End Get
        Set(ByVal value As String)
            EditContactNameValue = value
        End Set
    End Property


    <Display(Name:="E-mail")> _
    Public Property EditContactEmail() As String
        Get
            Return EditContactEmailValue
        End Get
        Set(ByVal value As String)
            EditContactEmailValue = value
        End Set
    End Property


    <Display(Name:="Telephone 1")> _
    Public Property EditContactPhoneUno() As String
        Get
            Return EditContactPhoneUnoValue
        End Get
        Set(ByVal value As String)
            EditContactPhoneUnoValue = value
        End Set
    End Property

    <Display(Name:="Telephone 2")> _
    Public Property EditContactPhoneDos() As String
        Get
            Return EditContactPhoneDosValue
        End Get
        Set(ByVal value As String)
            EditContactPhoneDosValue = value
        End Set
    End Property

    <Display(Name:="Contact type")> _
    Public Property EditContactType() As String
        Get
            Return EditContactTypeValue
        End Get
        Set(ByVal value As String)
            EditContactTypeValue = value
        End Set
    End Property


    <Display(Name:="Whosale / Company")> _
    Public Property EditContactWhosaleCompany() As String
        Get
            Return EditContactWhosaleCompanyValue
        End Get
        Set(ByVal value As String)
            EditContactWhosaleCompanyValue = value
        End Set
    End Property

    <Display(Name:="Id Contact")> _
    Public Property EditContactid() As String
        Get
            Return EditContactidValue
        End Get
        Set(ByVal value As String)
            EditContactidValue = value
        End Set
    End Property

End Class

Public Class CatalogChannelList

    Public Id_ChannelValue As String
    Public Channel_NameValue As String


    Public Property Id_Channel() As String
        Get
            Return Id_ChannelValue
        End Get
        Set(ByVal value As String)
            Id_ChannelValue = value
        End Set
    End Property

    Public Property Channel_Name() As String
        Get
            Return Channel_NameValue
        End Get
        Set(ByVal value As String)
            Channel_NameValue = value
        End Set
    End Property



End Class

Public Class CatalogUnitMeasureList

    Public Id_UnitValue As String
    Public Unit_NameValue As String
    Public Unit_KeyValue As String

    Public Property Id_Unit() As String
        Get
            Return Id_UnitValue
        End Get
        Set(ByVal value As String)
            Id_UnitValue = value
        End Set
    End Property

    Public Property Unit_Name() As String
        Get
            Return Unit_NameValue
        End Get
        Set(ByVal value As String)
            Unit_NameValue = value
        End Set
    End Property

    Public Property Unit_Key() As String
        Get
            Return Unit_KeyValue
        End Get
        Set(ByVal value As String)
            Unit_KeyValue = value
        End Set
    End Property


End Class

Public Class CatalogMarketList

    Public Id_MarketValue As String
    Public Market_NameValue As String
    Public Market_KeyValue As String

    Public Property Id_Market() As String
        Get
            Return Id_MarketValue
        End Get
        Set(ByVal value As String)
            Id_MarketValue = value
        End Set
    End Property

    Public Property Market_Name() As String
        Get
            Return Market_NameValue
        End Get
        Set(ByVal value As String)
            Market_NameValue = value
        End Set
    End Property

    Public Property Market_Key() As String
        Get
            Return Market_KeyValue
        End Get
        Set(ByVal value As String)
            Market_KeyValue = value
        End Set
    End Property


End Class

Public Class CatalogGroupTypeList

    Public Id_GroupTypeValue As String
    Public GroupType_NameValue As String


    Public Property Id_GroupType() As String
        Get
            Return Id_GroupTypeValue
        End Get
        Set(ByVal value As String)
            Id_GroupTypeValue = value
        End Set
    End Property

    Public Property GroupType_Name() As String
        Get
            Return GroupType_NameValue
        End Get
        Set(ByVal value As String)
            GroupType_NameValue = value
        End Set
    End Property



End Class

Public Class CatalogAgencyTypeList

    Public Id_AgencyTypeValue As String
    Public AgencyType_NameValue As String


    Public Property Id_AgencyType() As String
        Get
            Return Id_AgencyTypeValue
        End Get
        Set(ByVal value As String)
            Id_AgencyTypeValue = value
        End Set
    End Property

    Public Property AgencyType_Name() As String
        Get
            Return AgencyType_NameValue
        End Get
        Set(ByVal value As String)
            AgencyType_NameValue = value
        End Set
    End Property



End Class

Public Class CatalogCompanyList

    Public Id_CompanyValue As String
    Public Company_NameValue As String
    Public Company_KeyValue As String

    Public Property Id_Company() As String
        Get
            Return Id_CompanyValue
        End Get
        Set(ByVal value As String)
            Id_CompanyValue = value
        End Set
    End Property

    Public Property Company_Name() As String
        Get
            Return Company_NameValue
        End Get
        Set(ByVal value As String)
            Company_NameValue = value
        End Set
    End Property

    Public Property Company_Key() As String
        Get
            Return Company_KeyValue
        End Get
        Set(ByVal value As String)
            Company_KeyValue = value
        End Set
    End Property


End Class

Public Class CatalogDistributionGroupList

    Public Id_DistributionGroupValue As String
    Public DistributionGroup_NameValue As String
    Public DistributionGroup_PropertyValue As String

    Public Property Id_DistributionGroup() As String
        Get
            Return Id_DistributionGroupValue
        End Get
        Set(ByVal value As String)
            Id_DistributionGroupValue = value
        End Set
    End Property

    Public Property DistributionGroup_Name() As String
        Get
            Return DistributionGroup_NameValue
        End Get
        Set(ByVal value As String)
            DistributionGroup_NameValue = value
        End Set
    End Property

    Public Property DistributionGroup_Property() As String
        Get
            Return DistributionGroup_PropertyValue
        End Get
        Set(ByVal value As String)
            DistributionGroup_PropertyValue = value
        End Set
    End Property


End Class

Public Class CatalogSupplierList

    Public Id_SupplierValue As String
    Public Supplier_NameValue As String
    Public Supplier_RFCValue As String
    Public Supplier_EmailValue As String
    Public Supplier_Phone1Value As String
    Public Supplier_Phone2Value As String

    Public Property Id_Supplier() As String
        Get
            Return Id_SupplierValue
        End Get
        Set(ByVal value As String)
            Id_SupplierValue = value
        End Set
    End Property

    Public Property Supplier_Name() As String
        Get
            Return Supplier_NameValue
        End Get
        Set(ByVal value As String)
            Supplier_NameValue = value
        End Set
    End Property

    Public Property Supplier_RFC() As String
        Get
            Return Supplier_RFCValue
        End Get
        Set(ByVal value As String)
            Supplier_RFCValue = value
        End Set
    End Property

    Public Property Supplier_Email() As String
        Get
            Return Supplier_EmailValue
        End Get
        Set(ByVal value As String)
            Supplier_EmailValue = value
        End Set
    End Property

    Public Property Supplier_Phone1() As String
        Get
            Return Supplier_Phone1Value
        End Get
        Set(ByVal value As String)
            Supplier_Phone1Value = value
        End Set
    End Property

    Public Property Supplier_Phone2() As String
        Get
            Return Supplier_Phone2Value
        End Get
        Set(ByVal value As String)
            Supplier_Phone2Value = value
        End Set
    End Property


End Class

Public Class CatalogPromoList

    Public CveHotelValue As String
    Public RoomTypeValue As String
    Public RateNameValue As String
    Public AnoValue As String
    Public DiscountValue As String
    Public InitialDateValue As String
    Public EndDateValue As String
    Public BookingInitialDateValue As String
    Public BookingEndDateValue As String
    Public ActiveDateValue As String


    Public Property ActiveDate() As String
        Get
            Return ActiveDateValue
        End Get
        Set(ByVal value As String)
            ActiveDateValue = value
        End Set
    End Property

    Public Property BookingEndDate() As String
        Get
            Return BookingEndDateValue
        End Get
        Set(ByVal value As String)
            BookingEndDateValue = value
        End Set
    End Property

    Public Property BookingInitialDate() As String
        Get
            Return BookingInitialDateValue
        End Get
        Set(ByVal value As String)
            BookingInitialDateValue = value
        End Set
    End Property

    Public Property EndDate() As String
        Get
            Return EndDateValue
        End Get
        Set(ByVal value As String)
            EndDateValue = value
        End Set
    End Property

    Public Property InitialDate() As String
        Get
            Return InitialDateValue
        End Get
        Set(ByVal value As String)
            InitialDateValue = value
        End Set
    End Property

    Public Property Discount() As String
        Get
            Return DiscountValue
        End Get
        Set(ByVal value As String)
            DiscountValue = value
        End Set
    End Property

    Public Property Ano() As String
        Get
            Return AnoValue
        End Get
        Set(ByVal value As String)
            AnoValue = value
        End Set
    End Property

    Public Property RateName() As String
        Get
            Return RateNameValue
        End Get
        Set(ByVal value As String)
            RateNameValue = value
        End Set
    End Property

    Public Property RoomType() As String
        Get
            Return RoomTypeValue
        End Get
        Set(ByVal value As String)
            RoomTypeValue = value
        End Set
    End Property

    Public Property CveHotel() As String
        Get
            Return CveHotelValue
        End Get
        Set(ByVal value As String)
            CveHotelValue = value
        End Set
    End Property



End Class

Public Class CatalogUsersList

    Public Id_UserValue As String
    Public User_NameValue As String
    Public User_LoginValue As String
    Public User_ProfileValue As String


    Public Property Id_User() As String
        Get
            Return Id_UserValue
        End Get
        Set(ByVal value As String)
            Id_UserValue = value
        End Set
    End Property

    Public Property User_Name() As String
        Get
            Return User_NameValue
        End Get
        Set(ByVal value As String)
            User_NameValue = value
        End Set
    End Property

    Public Property User_Login() As String
        Get
            Return User_LoginValue
        End Get
        Set(ByVal value As String)
            User_LoginValue = value
        End Set
    End Property

    Public Property User_Profile() As String
        Get
            Return User_ProfileValue
        End Get
        Set(ByVal value As String)
            User_ProfileValue = value
        End Set
    End Property


End Class

Public Class CatalogProfileList

    Public Id_ProfileValue As String
    Public Profile_NameValue As String


    Public Property Id_Profile() As String
        Get
            Return Id_ProfileValue
        End Get
        Set(ByVal value As String)
            Id_ProfileValue = value
        End Set
    End Property

    Public Property Profile_Name() As String
        Get
            Return Profile_NameValue
        End Get
        Set(ByVal value As String)
            Profile_NameValue = value
        End Set
    End Property


End Class

Public Class CatalogContactList

    Public Id_ContactValue As String
    Public Contact_NameValue As String
    Public Contact_EmailValue As String
    Public Contact_PhoneValue As String
    Public Contact_TypeValue As String
    Public Contact_CompanyWhosaleValue As String

    Private CountryValue As String
    Private StateValue As String
    Private PostalCodeValue As String
    Private CityValue As String
    Private AddressValue As String

    Public Property PostalCode() As String
        Get
            Return PostalCodeValue
        End Get
        Set(ByVal value As String)
            PostalCodeValue = value
        End Set
    End Property

    Public Property Country() As String
        Get
            Return CountryValue
        End Get
        Set(ByVal value As String)
            CountryValue = value
        End Set
    End Property

    Public Property State() As String
        Get
            Return StateValue
        End Get
        Set(ByVal value As String)
            StateValue = value
        End Set
    End Property

    Public Property City() As String
        Get
            Return CityValue
        End Get
        Set(ByVal value As String)
            CityValue = value
        End Set
    End Property

    Public Property Address() As String
        Get
            Return AddressValue
        End Get
        Set(ByVal value As String)
            AddressValue = value
        End Set
    End Property


    Public Property Id_Contact() As String
        Get
            Return Id_ContactValue
        End Get
        Set(ByVal value As String)
            Id_ContactValue = value
        End Set
    End Property

    Public Property Contact_Name() As String
        Get
            Return Contact_NameValue
        End Get
        Set(ByVal value As String)
            Contact_NameValue = value
        End Set
    End Property

    Public Property Contact_Email() As String
        Get
            Return Contact_EmailValue
        End Get
        Set(ByVal value As String)
            Contact_EmailValue = value
        End Set
    End Property

    Public Property Contact_Phone() As String
        Get
            Return Contact_PhoneValue
        End Get
        Set(ByVal value As String)
            Contact_PhoneValue = value
        End Set
    End Property


    Public Property Contact_Type() As String
        Get
            Return Contact_TypeValue
        End Get
        Set(ByVal value As String)
            Contact_TypeValue = value
        End Set
    End Property


    Public Property Contact_CompanyWhosale() As String
        Get
            Return Contact_CompanyWhosaleValue
        End Get
        Set(ByVal value As String)
            Contact_CompanyWhosaleValue = value
        End Set
    End Property


End Class

Public Class Login

    Private UserNameValue As String
    Private UserPasswordValue As String


    <Required(ErrorMessage:="*{0} is required")> _
    <Display(Name:="User Name")> _
    Public Property UserName() As String
        Get
            Return UserNameValue
        End Get
        Set(ByVal value As String)
            UserNameValue = value
        End Set
    End Property

    <Required(ErrorMessage:="*{0} is required")> _
     <DataType(DataType.Password)> _
    <Display(Name:="Password")> _
    Public Property UserPassword() As String
        Get
            Return UserPasswordValue
        End Get
        Set(ByVal value As String)
            UserPasswordValue = value
        End Set
    End Property

End Class