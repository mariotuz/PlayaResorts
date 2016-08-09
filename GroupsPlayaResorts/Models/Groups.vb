Imports System.ComponentModel
Imports System.ComponentModel.DataAnnotations
Imports System.Globalization
Imports System.Web


Public Class GroupsList
    Private ListGroupData As List(Of GroupsListData)

    Private ListGroupCordinator As List(Of SelectListItem)
    Private ListaGroupMarket As List(Of SelectListItem)
    Private ListaGroupType As List(Of SelectListItem)
    Private ListaAgencyType As List(Of SelectListItem)
    Private ListHotelPermissions As List(Of SelectListItem)


    Public TotalRevenueValue As Double


    Public Property TotalRevenue() As Double
        Get
            Return TotalRevenueValue
        End Get
        Set(ByVal value As Double)
            TotalRevenueValue = value
        End Set
    End Property

    Public Property ListGroupDatain() As List(Of GroupsListData)
        Get
            Return ListGroupData
        End Get
        Set(ByVal value As List(Of GroupsListData))
            ListGroupData = value
        End Set
    End Property

    Public Property ListGroupCordinatorin() As List(Of SelectListItem)
        Get
            Return ListGroupCordinator
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListGroupCordinator = value
        End Set
    End Property
    Public Property ListHotelPermissionsin() As List(Of SelectListItem)
        Get
            Return ListHotelPermissions
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListHotelPermissions = value
        End Set
    End Property

    Public Property ListaGroupMarketin() As List(Of SelectListItem)
        Get
            Return ListaGroupMarket
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListaGroupMarket = value
        End Set
    End Property

    Public Property ListaGroupTypein() As List(Of SelectListItem)
        Get
            Return ListaGroupType
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListaGroupType = value
        End Set
    End Property

    Public Property ListaAgencyTypein() As List(Of SelectListItem)
        Get
            Return ListaAgencyType
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListaAgencyType = value
        End Set
    End Property

End Class


Public Class GroupsListData
    Public Colum1Value As String
    Public Colum2Value As String
    Public Colum3Value As String
    Public Colum4Value As String
    Public Colum5Value As String
    Public Colum6Value As String
    Public Colum7Value As String
    Public Colum8Value As String
    Public Colum9Value As String
    Public Colum10Value As String
    Public Colum11Value As String
    Public Colum12Value As String
    Public Colum13Value As String
    Public Colum14Value As String
    Public Colum15Value As String
    Public Colum16Value As String
    Public Colum17Value As String
    Public Colum18Value As String
    Public Colum19Value As String
    Public Colum20Value As String
    Public Colum21Value As String
    Public Colum22Value As String
    Public Colum23Value As String


    Public Property Colum1() As String

        Get
            Return Colum1Value
        End Get
        Set(ByVal value As String)
            Colum1Value = value
        End Set
    End Property

    Public Property Colum2() As String

        Get
            Return Colum2Value
        End Get
        Set(ByVal value As String)
            Colum2Value = value
        End Set
    End Property

    Public Property Colum3() As String

        Get
            Return Colum3Value
        End Get
        Set(ByVal value As String)
            Colum3Value = value
        End Set
    End Property


    Public Property Colum4() As String

        Get
            Return Colum4Value
        End Get
        Set(ByVal value As String)
            Colum4Value = value
        End Set
    End Property


    Public Property Colum5() As String

        Get
            Return Colum5Value
        End Get
        Set(ByVal value As String)
            Colum5Value = value
        End Set
    End Property


    Public Property Colum6() As String

        Get
            Return Colum6Value
        End Get
        Set(ByVal value As String)
            Colum6Value = value
        End Set
    End Property

    Public Property Colum7() As String

        Get
            Return Colum7Value
        End Get
        Set(ByVal value As String)
            Colum7Value = value
        End Set
    End Property


    Public Property Colum8() As String

        Get
            Return Colum8Value
        End Get
        Set(ByVal value As String)
            Colum8Value = value
        End Set
    End Property


    Public Property Colum9() As String

        Get
            Return Colum9Value
        End Get
        Set(ByVal value As String)
            Colum9Value = value
        End Set
    End Property


    Public Property Colum10() As String

        Get
            Return Colum10Value
        End Get
        Set(ByVal value As String)
            Colum10Value = value
        End Set
    End Property


    Public Property Colum11() As String

        Get
            Return Colum11Value
        End Get
        Set(ByVal value As String)
            Colum11Value = value
        End Set
    End Property


    Public Property Colum12() As String

        Get
            Return Colum12Value
        End Get
        Set(ByVal value As String)
            Colum12Value = value
        End Set
    End Property


    Public Property Colum13() As String

        Get
            Return Colum13Value
        End Get
        Set(ByVal value As String)
            Colum13Value = value
        End Set
    End Property

    Public Property Colum14() As String

        Get
            Return Colum14Value
        End Get
        Set(ByVal value As String)
            Colum14Value = value
        End Set
    End Property

    Public Property Colum15() As String

        Get
            Return Colum15Value
        End Get
        Set(ByVal value As String)
            Colum15Value = value
        End Set
    End Property


    Public Property Colum16() As String

        Get
            Return Colum16Value
        End Get
        Set(ByVal value As String)
            Colum16Value = value
        End Set
    End Property

    Public Property Colum17() As String

        Get
            Return Colum17Value
        End Get
        Set(ByVal value As String)
            Colum17Value = value
        End Set
    End Property


    Public Property Colum18() As String

        Get
            Return Colum18Value
        End Get
        Set(ByVal value As String)
            Colum18Value = value
        End Set
    End Property


    Public Property Colum19() As String

        Get
            Return Colum19Value
        End Get
        Set(ByVal value As String)
            Colum19Value = value
        End Set
    End Property


    Public Property Colum20() As String

        Get
            Return Colum20Value
        End Get
        Set(ByVal value As String)
            Colum20Value = value
        End Set
    End Property

    Public Property Colum21() As String

        Get
            Return Colum21Value
        End Get
        Set(ByVal value As String)
            Colum21Value = value
        End Set
    End Property

    Public Property Colum22() As String

        Get
            Return Colum22Value
        End Get
        Set(ByVal value As String)
            Colum22Value = value
        End Set
    End Property

    Public Property Colum23() As String

        Get
            Return Colum23Value
        End Get
        Set(ByVal value As String)
            Colum23Value = value
        End Set
    End Property


End Class


Public Class GroupsDetail
    Private ListGroupRates As List(Of GroupsRatesList)
    Private ListGroupRatesSave As List(Of GroupsRatesList)
    Private ListGroupDocuments As List(Of GroupsDocList)
    Private ListGroupBreakdown As List(Of GroupsBreakList)
    Private ListGroupBreakdownGroupBy As List(Of GroupsBreakList)
    Private ListGroupLogBook As List(Of GroupsLogBookList)
    Private ListGroupPayments As List(Of GroupsPaymentsList)
    Private ListGroupEvents As List(Of GroupsEventsList)

    Private ListaSalons As List(Of SelectListItem)
    Private ListaAvailability As List(Of SelectListItem)
    Private ListaGroupType As List(Of SelectListItem)
    Private ListaGroupMarket As List(Of SelectListItem)
    Private ListaAgencyType As List(Of SelectListItem)
    Private ListaSchemePayments As List(Of SelectListItem)
    Private ListaSuite As List(Of SelectListItem)
    Private ListaBreakdownPax As List(Of SelectListItem)

    Private ListGroupCordinator As List(Of SelectListItem)
    Private ListHotelPermissions As List(Of SelectListItem)
    Private ListOnsiteCordinator As List(Of SelectListItem)
    Private ListEventCordinator As List(Of SelectListItem)
    Private ListEventSeller As List(Of SelectListItem)
    Private ListCountry As List(Of SelectListItem)
    Private ListState As List(Of SelectListItem)

    Private RevenueFinalValue As Double
    Private AccionValue As Integer
    Public GroupIdValue As Double
    Public GroupIdLabelValue As String
    Public GroupTypeRateValue As String

    Public GroupHotelNewValue As String
    Public GroupCheckExistValue As String

    Public GroupStatusPaymentValue As String
    Public GroupStatusBookValue As String
    Public GroupStatusHotelValue As String

    Public GroupNumPeriodsValue As Integer
    Public GroupNumTypeRoomsValue As Integer

    Public GroupAvailabilitySuiteNameValue As String

    'EDIT SECCION DE GENERAL VIEW
    Public EditGroupData1Value As String
    Public EditGroupData2Value As String
    Public EditGroupData3Value As String
    Public EditGroupData4Value As String
    Public EditGroupData5Value As String
    Public EditGroupData6Value As String
    Public EditGroupData7Value As String
    Public EditGroupData8Value As String
    Public EditGroupData9Value As String
    Public EditGroupData10Value As String
    Public EditGroupData11Value As String
    Public EditGroupData12Value As String
    Public EditGroupData13Value As String
    Public EditGroupData14Value As String
    Public EditGroupData15Value As String
    Public EditGroupData16Value As String
    Public EditGroupData17Value As String
    Public EditGroupData18Value As String
    Public EditGroupData19Value As String
    Public EditGroupData20Value As String
    Public EditGroupData34Value As String
    Public EditGroupData35Value As String
    Public EditGroupData51Value As String


    'EDIT SECCION BREAKDOWN

    Public EditGroupData21Value As String
    Public EditGroupData22Value As String
    Public EditGroupData23Value As String
    Public EditGroupData24Value As String
    Public EditGroupData25Value As String
    Public EditGroupData26Value As String
    Public EditGroupData27Value As String
    Public EditGroupData28Value As String
    Public EditGroupData29Value As String
    Public EditGroupData30Value As String
    Public EditGroupData31Value As String
    Public EditGroupData32Value As String
    Public EditGroupData33Value As String
    Public EditGroupData36Value As String

    'EDIT SECCION BREAKDOWN TOTALES
    Public TotalAdultsValue As Integer
    Public TotalTeensValue As Integer
    Public TotalChildrensValue As Integer
    Public TotalInfantsValue As Integer
    Public TotalTentativeRoomsValue As Integer
    Public TotalNumRoomsValue As Integer
    Public TotalDeployRoomsValue As Integer
    Public TotalDepositValue As Double
    Public TotalBalanceValue As Double
    Public TotalRevenueValue As Double
    Public GroupByValue As Integer


    'REQUEST COMPANY
    Public EditGroupData37Value As String
    Public EditGroupData38Value As String
    Public EditGroupData39Value As String
    Public EditGroupData40Value As String
    Public EditGroupData41Value As String
    Public EditGroupData42Value As String
    Public EditGroupData49Value As String

    'REQUEST CONTACT
    Public EditGroupData43Value As String
    Public EditGroupData44Value As String
    Public EditGroupData45Value As String
    Public EditGroupData46Value As String
    Public EditGroupData47Value As String
    Public EditGroupData48Value As String

    'DOCUMENTS ADDITIONAL CONCESSIONS
    Public EditGroupData50Value As String


    Public Property GroupBy() As Integer
        Get
            Return GroupByValue
        End Get
        Set(ByVal value As Integer)
            GroupByValue = value
        End Set
    End Property


    Public Property GroupAvailabilitySuiteName() As String
        Get
            Return GroupAvailabilitySuiteNameValue
        End Get
        Set(ByVal value As String)
            GroupAvailabilitySuiteNameValue = value
        End Set
    End Property


    Public Property GroupStatusPayment() As String
        Get
            Return GroupStatusPaymentValue
        End Get
        Set(ByVal value As String)
            GroupStatusPaymentValue = value
        End Set
    End Property

    Public Property GroupStatusBook() As String
        Get
            Return GroupStatusBookValue
        End Get
        Set(ByVal value As String)
            GroupStatusBookValue = value
        End Set
    End Property

    Public Property GroupStatusHotel() As String
        Get
            Return GroupStatusHotelValue
        End Get
        Set(ByVal value As String)
            GroupStatusHotelValue = value
        End Set
    End Property


    Public Property TotalDeployRooms() As Integer
        Get
            Return TotalDeployRoomsValue
        End Get
        Set(ByVal value As Integer)
            TotalDeployRoomsValue = value
        End Set
    End Property

    Public Property TotalNumRooms() As Integer
        Get
            Return TotalNumRoomsValue
        End Get
        Set(ByVal value As Integer)
            TotalNumRoomsValue = value
        End Set
    End Property

    Public Property TotalRevenue() As Double
        Get
            Return TotalRevenueValue
        End Get
        Set(ByVal value As Double)
            TotalRevenueValue = value
        End Set
    End Property

    Public Property TotalBalance() As Double
        Get
            Return TotalBalanceValue
        End Get
        Set(ByVal value As Double)
            TotalBalanceValue = value
        End Set
    End Property

    Public Property TotalDeposit() As Double
        Get
            Return TotalDepositValue
        End Get
        Set(ByVal value As Double)
            TotalDepositValue = value
        End Set
    End Property


    Public Property TotalTentativeRooms() As Integer
        Get
            Return TotalTentativeRoomsValue
        End Get
        Set(ByVal value As Integer)
            TotalTentativeRoomsValue = value
        End Set
    End Property

    Public Property TotalInfants() As Integer
        Get
            Return TotalInfantsValue
        End Get
        Set(ByVal value As Integer)
            TotalInfantsValue = value
        End Set
    End Property

    Public Property TotalChildrens() As Integer
        Get
            Return TotalChildrensValue
        End Get
        Set(ByVal value As Integer)
            TotalChildrensValue = value
        End Set
    End Property

    Public Property TotalTeens() As Integer
        Get
            Return TotalTeensValue
        End Get
        Set(ByVal value As Integer)
            TotalTeensValue = value
        End Set
    End Property

    Public Property TotalAdults() As Integer
        Get
            Return TotalAdultsValue
        End Get
        Set(ByVal value As Integer)
            TotalAdultsValue = value
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

    Public Property ListGroupCordinatorin() As List(Of SelectListItem)
        Get
            Return ListGroupCordinator
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListGroupCordinator = value
        End Set
    End Property
    Public Property ListHotelPermissionsin() As List(Of SelectListItem)
        Get
            Return ListHotelPermissions
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListHotelPermissions = value
        End Set
    End Property

    Public Property ListOnsiteCordinatorin() As List(Of SelectListItem)
        Get
            Return ListOnsiteCordinator
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListOnsiteCordinator = value
        End Set
    End Property

    Public Property ListEventCordinatorin() As List(Of SelectListItem)
        Get
            Return ListEventCordinator
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListEventCordinator = value
        End Set
    End Property

    Public Property ListEventSellerin() As List(Of SelectListItem)
        Get
            Return ListEventSeller
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListEventSeller = value
        End Set
    End Property

    Public Property ListaSuitein() As List(Of SelectListItem)
        Get
            Return ListaSuite
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListaSuite = value
        End Set
    End Property

    Public Property ListaSalonsxin() As List(Of SelectListItem)
        Get
            Return ListaSalons
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListaSalons = value
        End Set
    End Property


    Public Property ListaBreakdownPaxin() As List(Of SelectListItem)
        Get
            Return ListaBreakdownPax
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListaBreakdownPax = value
        End Set
    End Property

    Public Property ListaSchemePaymentsin() As List(Of SelectListItem)
        Get
            Return ListaSchemePayments
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListaSchemePayments = value
        End Set
    End Property


    Public Property ListGroupEventsin() As List(Of GroupsEventsList)
        Get
            Return ListGroupEvents
        End Get
        Set(ByVal value As List(Of GroupsEventsList))
            ListGroupEvents = value
        End Set
    End Property

    Public Property ListGroupPaymentsin() As List(Of GroupsPaymentsList)
        Get
            Return ListGroupPayments
        End Get
        Set(ByVal value As List(Of GroupsPaymentsList))
            ListGroupPayments = value
        End Set
    End Property


    Public Property ListGroupLogBookin() As List(Of GroupsLogBookList)
        Get
            Return ListGroupLogBook
        End Get
        Set(ByVal value As List(Of GroupsLogBookList))
            ListGroupLogBook = value
        End Set
    End Property


    Public Property ListGroupBreakdownGroupByin() As List(Of GroupsBreakList)
        Get
            Return ListGroupBreakdownGroupBy
        End Get
        Set(ByVal value As List(Of GroupsBreakList))
            ListGroupBreakdownGroupBy = value
        End Set
    End Property

    Public Property ListGroupBreakdownin() As List(Of GroupsBreakList)
        Get
            Return ListGroupBreakdown
        End Get
        Set(ByVal value As List(Of GroupsBreakList))
            ListGroupBreakdown = value
        End Set
    End Property

    Public Property ListGroupDocumentsin() As List(Of GroupsDocList)
        Get
            Return ListGroupDocuments
        End Get
        Set(ByVal value As List(Of GroupsDocList))
            ListGroupDocuments = value
        End Set
    End Property

    Public Property ListaAgencyTypein() As List(Of SelectListItem)
        Get
            Return ListaAgencyType
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListaAgencyType = value
        End Set
    End Property

    Public Property ListaGroupMarketin() As List(Of SelectListItem)
        Get
            Return ListaGroupMarket
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListaGroupMarket = value
        End Set
    End Property

    Public Property ListaGroupTypein() As List(Of SelectListItem)
        Get
            Return ListaGroupType
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListaGroupType = value
        End Set
    End Property

    Public Property ListaAvailabilityin() As List(Of SelectListItem)
        Get
            Return ListaAvailability
        End Get
        Set(ByVal value As List(Of SelectListItem))
            ListaAvailability = value
        End Set
    End Property

    Public Property EditGroupData51() As String
        Get
            Return EditGroupData51Value
        End Get
        Set(ByVal value As String)
            EditGroupData51Value = value
        End Set
    End Property

    Public Property EditGroupData50() As String
        Get
            Return EditGroupData50Value
        End Get
        Set(ByVal value As String)
            EditGroupData50Value = value
        End Set
    End Property


    Public Property EditGroupData49() As String
        Get
            Return EditGroupData49Value
        End Get
        Set(ByVal value As String)
            EditGroupData49Value = value
        End Set
    End Property


    Public Property EditGroupData48() As String
        Get
            Return EditGroupData48Value
        End Get
        Set(ByVal value As String)
            EditGroupData48Value = value
        End Set
    End Property


    Public Property EditGroupData47() As String
        Get
            Return EditGroupData47Value
        End Get
        Set(ByVal value As String)
            EditGroupData47Value = value
        End Set
    End Property


    Public Property EditGroupData46() As String
        Get
            Return EditGroupData46Value
        End Get
        Set(ByVal value As String)
            EditGroupData46Value = value
        End Set
    End Property

    Public Property EditGroupData45() As String
        Get
            Return EditGroupData45Value
        End Get
        Set(ByVal value As String)
            EditGroupData45Value = value
        End Set
    End Property


    Public Property EditGroupData44() As String
        Get
            Return EditGroupData44Value
        End Get
        Set(ByVal value As String)
            EditGroupData44Value = value
        End Set
    End Property


    Public Property EditGroupData43() As String
        Get
            Return EditGroupData43Value
        End Get
        Set(ByVal value As String)
            EditGroupData43Value = value
        End Set
    End Property

    Public Property EditGroupData42() As String
        Get
            Return EditGroupData42Value
        End Get
        Set(ByVal value As String)
            EditGroupData42Value = value
        End Set
    End Property


    Public Property EditGroupData41() As String
        Get
            Return EditGroupData41Value
        End Get
        Set(ByVal value As String)
            EditGroupData41Value = value
        End Set
    End Property


    Public Property EditGroupData40() As String
        Get
            Return EditGroupData40Value
        End Get
        Set(ByVal value As String)
            EditGroupData40Value = value
        End Set
    End Property


    Public Property EditGroupData39() As String
        Get
            Return EditGroupData39Value
        End Get
        Set(ByVal value As String)
            EditGroupData39Value = value
        End Set
    End Property


    Public Property EditGroupData38() As String
        Get
            Return EditGroupData38Value
        End Get
        Set(ByVal value As String)
            EditGroupData38Value = value
        End Set
    End Property

    Public Property EditGroupData37() As String
        Get
            Return EditGroupData37Value
        End Get
        Set(ByVal value As String)
            EditGroupData37Value = value
        End Set
    End Property


    Public Property EditGroupData36() As String
        Get
            Return EditGroupData36Value
        End Get
        Set(ByVal value As String)
            EditGroupData36Value = value
        End Set
    End Property

    Public Property EditGroupData35() As String
        Get
            Return EditGroupData35Value
        End Get
        Set(ByVal value As String)
            EditGroupData35Value = value
        End Set
    End Property

    Public Property EditGroupData34() As String
        Get
            Return EditGroupData34Value
        End Get
        Set(ByVal value As String)
            EditGroupData34Value = value
        End Set
    End Property

    Public Property EditGroupData33() As String
        Get
            Return EditGroupData33Value
        End Get
        Set(ByVal value As String)
            EditGroupData33Value = value
        End Set
    End Property

    Public Property EditGroupData32() As String
        Get
            Return EditGroupData32Value
        End Get
        Set(ByVal value As String)
            EditGroupData32Value = value
        End Set
    End Property

    Public Property EditGroupData31() As String
        Get
            Return EditGroupData31Value
        End Get
        Set(ByVal value As String)
            EditGroupData31Value = value
        End Set
    End Property


    Public Property EditGroupData30() As String
        Get
            Return EditGroupData30Value
        End Get
        Set(ByVal value As String)
            EditGroupData30Value = value
        End Set
    End Property


    Public Property EditGroupData29() As String
        Get
            Return EditGroupData29Value
        End Get
        Set(ByVal value As String)
            EditGroupData29Value = value
        End Set
    End Property


    Public Property EditGroupData28() As String
        Get
            Return EditGroupData28Value
        End Get
        Set(ByVal value As String)
            EditGroupData28Value = value
        End Set
    End Property

    Public Property EditGroupData27() As String
        Get
            Return EditGroupData27Value
        End Get
        Set(ByVal value As String)
            EditGroupData27Value = value
        End Set
    End Property

    Public Property EditGroupData26() As String
        Get
            Return EditGroupData26Value
        End Get
        Set(ByVal value As String)
            EditGroupData26Value = value
        End Set
    End Property

    Public Property EditGroupData25() As String
        Get
            Return EditGroupData25Value
        End Get
        Set(ByVal value As String)
            EditGroupData25Value = value
        End Set
    End Property

    Public Property EditGroupData24() As String
        Get
            Return EditGroupData24Value
        End Get
        Set(ByVal value As String)
            EditGroupData24Value = value
        End Set
    End Property

    Public Property EditGroupData23() As String
        Get
            Return EditGroupData23Value
        End Get
        Set(ByVal value As String)
            EditGroupData23Value = value
        End Set
    End Property

    Public Property EditGroupData22() As String
        Get
            Return EditGroupData22Value
        End Get
        Set(ByVal value As String)
            EditGroupData22Value = value
        End Set
    End Property

    Public Property EditGroupData21() As String
        Get
            Return EditGroupData21Value
        End Get
        Set(ByVal value As String)
            EditGroupData21Value = value
        End Set
    End Property

    Public Property EditGroupData20() As String
        Get
            Return EditGroupData20Value
        End Get
        Set(ByVal value As String)
            EditGroupData20Value = value
        End Set
    End Property

    Public Property EditGroupData19() As String
        Get
            Return EditGroupData19Value
        End Get
        Set(ByVal value As String)
            EditGroupData19Value = value
        End Set
    End Property


    Public Property EditGroupData18() As String
        Get
            Return EditGroupData18Value
        End Get
        Set(ByVal value As String)
            EditGroupData18Value = value
        End Set
    End Property


    Public Property EditGroupData17() As String
        Get
            Return EditGroupData17Value
        End Get
        Set(ByVal value As String)
            EditGroupData17Value = value
        End Set
    End Property

    Public Property EditGroupData16() As String
        Get
            Return EditGroupData16Value
        End Get
        Set(ByVal value As String)
            EditGroupData16Value = value
        End Set
    End Property
    Public Property EditGroupData15() As String
        Get
            Return EditGroupData15Value
        End Get
        Set(ByVal value As String)
            EditGroupData15Value = value
        End Set
    End Property

    Public Property EditGroupData14() As String
        Get
            Return EditGroupData14Value
        End Get
        Set(ByVal value As String)
            EditGroupData14Value = value
        End Set
    End Property

    Public Property EditGroupData13() As String
        Get
            Return EditGroupData13Value
        End Get
        Set(ByVal value As String)
            EditGroupData13Value = value
        End Set
    End Property

    Public Property EditGroupData12() As String
        Get
            Return EditGroupData12Value
        End Get
        Set(ByVal value As String)
            EditGroupData12Value = value
        End Set
    End Property


    Public Property EditGroupData11() As String
        Get
            Return EditGroupData11Value
        End Get
        Set(ByVal value As String)
            EditGroupData11Value = value
        End Set
    End Property

    Public Property EditGroupData10() As String
        Get
            Return EditGroupData10Value
        End Get
        Set(ByVal value As String)
            EditGroupData10Value = value
        End Set
    End Property

    Public Property EditGroupData9() As String
        Get
            Return EditGroupData9Value
        End Get
        Set(ByVal value As String)
            EditGroupData9Value = value
        End Set
    End Property

    Public Property EditGroupData8() As String
        Get
            Return EditGroupData8Value
        End Get
        Set(ByVal value As String)
            EditGroupData8Value = value
        End Set
    End Property

    Public Property EditGroupData7() As String
        Get
            Return EditGroupData7Value
        End Get
        Set(ByVal value As String)
            EditGroupData7Value = value
        End Set
    End Property

    Public Property EditGroupData6() As String
        Get
            Return EditGroupData6Value
        End Get
        Set(ByVal value As String)
            EditGroupData6Value = value
        End Set
    End Property

    Public Property EditGroupData5() As String
        Get
            Return EditGroupData5Value
        End Get
        Set(ByVal value As String)
            EditGroupData5Value = value
        End Set
    End Property

    Public Property EditGroupData4() As String
        Get
            Return EditGroupData4Value
        End Get
        Set(ByVal value As String)
            EditGroupData4Value = value
        End Set
    End Property

    Public Property EditGroupData3() As String
        Get
            Return EditGroupData3Value
        End Get
        Set(ByVal value As String)
            EditGroupData3Value = value
        End Set
    End Property

    Public Property EditGroupData2() As String
        Get
            Return EditGroupData2Value
        End Get
        Set(ByVal value As String)
            EditGroupData2Value = value
        End Set
    End Property

    Public Property EditGroupData1() As String
        Get
            Return EditGroupData1Value
        End Get
        Set(ByVal value As String)
            EditGroupData1Value = value
        End Set
    End Property


    Public Property RevenueFinal() As Double
        Get
            Return RevenueFinalValue
        End Get
        Set(ByVal value As Double)
            RevenueFinalValue = value
        End Set
    End Property

    Public Property Accion() As Integer
        Get
            Return AccionValue
        End Get
        Set(ByVal value As Integer)
            AccionValue = value
        End Set
    End Property

    Public Property GroupId() As Double
        Get
            Return GroupIdValue
        End Get
        Set(ByVal value As Double)
            GroupIdValue = value
        End Set
    End Property

    Public Property GroupIdLabel() As String
        Get
            Return GroupIdLabelValue
        End Get
        Set(ByVal value As String)
            GroupIdLabelValue = value
        End Set
    End Property


    Public Property GroupHotelNew() As String
        Get
            Return GroupHotelNewValue
        End Get
        Set(ByVal value As String)
            GroupHotelNewValue = value
        End Set
    End Property

    Public Property GroupCheckExist() As String
        Get
            Return GroupCheckExistValue
        End Get
        Set(ByVal value As String)
            GroupCheckExistValue = value
        End Set
    End Property



    Public Property GroupTypeRate() As String
        Get
            Return GroupTypeRateValue
        End Get
        Set(ByVal value As String)
            GroupTypeRateValue = value
        End Set
    End Property

    Public Property GroupNumPeriods() As Integer
        Get
            Return GroupNumPeriodsValue
        End Get
        Set(ByVal value As Integer)
            GroupNumPeriodsValue = value
        End Set
    End Property

    Public Property GroupNumTypeRooms() As Integer
        Get
            Return GroupNumTypeRoomsValue
        End Get
        Set(ByVal value As Integer)
            GroupNumTypeRoomsValue = value
        End Set
    End Property

   

    Public Property ListGroupRatesin() As List(Of GroupsRatesList)
        Get
            Return ListGroupRates
        End Get
        Set(ByVal value As List(Of GroupsRatesList))
            ListGroupRates = value
        End Set
    End Property


    Public Property ListGroupRatesSavein() As List(Of GroupsRatesList)
        Get
            Return ListGroupRatesSave
        End Get
        Set(ByVal value As List(Of GroupsRatesList))
            ListGroupRatesSave = value
        End Set
    End Property




End Class


Public Class GroupsRatesList

    Public SuiteNameValue As String
    Public SuiteCodeValue As String
    Public RateSingleValue As Double
    Public RateDoubleValue As Double
    Public RateTripleandFourValue As Double
    Public RateFiveandSixValue As Double
    Public RateTeensValue As Double
    Public RateChildrensValue As Double
    Public AvailabilityValue As String
    Public RatePaxValue As String
    Public RateRevenueValue As Double

    Public RateRevenueRoomNigthValue As Double
    Public RateRevenuePerRoomValue As Double

    Public RateCveValue As String
    Public RateRackValue As Double
    Public RateMICEValue As Double

    Public InitDateRateValue As String
    Public EndDateRateValue As String
    Public DiscountRateValue As Decimal
    Public CommissionRateValue As Decimal

    Public NochesGValue As String
    Public NinosGxAduValue As String
    Public NinosGMaxValue As String
    Public Alias_PromoValue As String
    Public Description_PromoValue As String
    Private FormatoValue As String
    Private TipValue As String

    Public Property Formato() As String
        Get
            Return FormatoValue
        End Get
        Set(ByVal value As String)
            FormatoValue = value
        End Set
    End Property
    Public Property Tip() As String
        Get
            Return TipValue
        End Get
        Set(ByVal value As String)
            TipValue = value
        End Set
    End Property

    Public Property Description_Promo() As String
        Get
            Return Description_PromoValue
        End Get
        Set(ByVal value As String)
            Description_PromoValue = value
        End Set
    End Property

    Public Property Alias_Promo() As String
        Get
            Return Alias_PromoValue
        End Get
        Set(ByVal value As String)
            Alias_PromoValue = value
        End Set
    End Property

    Public Property NinosGMax() As String
        Get
            Return NinosGMaxValue
        End Get
        Set(ByVal value As String)
            NinosGMaxValue = value
        End Set
    End Property

    Public Property NinosGxAdu() As String
        Get
            Return NinosGxAduValue
        End Get
        Set(ByVal value As String)
            NinosGxAduValue = value
        End Set
    End Property

    Public Property NochesG() As String
        Get
            Return NochesGValue
        End Get
        Set(ByVal value As String)
            NochesGValue = value
        End Set
    End Property

    Public Property RateCve() As String
        Get
            Return RateCveValue
        End Get
        Set(ByVal value As String)
            RateCveValue = value
        End Set
    End Property

    Public Property RateRack() As Double
        Get
            Return RateRackValue
        End Get
        Set(ByVal value As Double)
            RateRackValue = value
        End Set
    End Property

    Public Property RateMICE() As Double
        Get
            Return RateMICEValue
        End Get
        Set(ByVal value As Double)
            RateMICEValue = value
        End Set
    End Property

    Public Property DiscountRate() As Decimal
        Get
            Return DiscountRateValue
        End Get
        Set(ByVal value As Decimal)
            DiscountRateValue = value
        End Set
    End Property

    Public Property CommissionRate() As Decimal
        Get
            Return CommissionRateValue
        End Get
        Set(ByVal value As Decimal)
            CommissionRateValue = value
        End Set
    End Property

    Public Property RateRevenue() As Double
        Get
            Return RateRevenueValue
        End Get
        Set(ByVal value As Double)
            RateRevenueValue = value
        End Set
    End Property

    Public Property RateRevenueRoomNigth() As Double
        Get
            Return RateRevenueRoomNigthValue
        End Get
        Set(ByVal value As Double)
            RateRevenueRoomNigthValue = value
        End Set
    End Property

    Public Property RateRevenuePerRoom() As Double
        Get
            Return RateRevenuePerRoomValue
        End Get
        Set(ByVal value As Double)
            RateRevenuePerRoomValue = value
        End Set
    End Property

    Public Property RatePax() As String
        Get
            Return RatePaxValue
        End Get
        Set(ByVal value As String)
            RatePaxValue = value
        End Set
    End Property


    Public Property RateChildrens() As Double
        Get
            Return RateChildrensValue
        End Get
        Set(ByVal value As Double)
            RateChildrensValue = value
        End Set
    End Property

    Public Property RateTeens() As Double
        Get
            Return RateTeensValue
        End Get
        Set(ByVal value As Double)
            RateTeensValue = value
        End Set
    End Property


    Public Property RateTripleandFour() As Double
        Get
            Return RateTripleandFourValue
        End Get
        Set(ByVal value As Double)
            RateTripleandFourValue = value
        End Set
    End Property

    Public Property RateFiveandSix() As Double
        Get
            Return RateFiveandSixValue
        End Get
        Set(ByVal value As Double)
            RateFiveandSixValue = value
        End Set
    End Property

    Public Property RateDouble() As Double
        Get
            Return RateDoubleValue
        End Get
        Set(ByVal value As Double)
            RateDoubleValue = value
        End Set
    End Property

    Public Property RateSingle() As Double
        Get
            Return RateSingleValue
        End Get
        Set(ByVal value As Double)
            RateSingleValue = value
        End Set
    End Property


    Public Property SuiteName() As String
        Get
            Return SuiteNameValue
        End Get
        Set(ByVal value As String)
            SuiteNameValue = value
        End Set
    End Property


    Public Property SuiteCode() As String
        Get
            Return SuiteCodeValue
        End Get
        Set(ByVal value As String)
            SuiteCodeValue = value
        End Set
    End Property


    Public Property Availability() As String
        Get
            Return AvailabilityValue
        End Get
        Set(ByVal value As String)
            AvailabilityValue = value
        End Set
    End Property

    Public Property EndDateRate() As String
        Get
            Return EndDateRateValue
        End Get
        Set(ByVal value As String)
            EndDateRateValue = value
        End Set
    End Property

    Public Property InitDateRate() As String
        Get
            Return InitDateRateValue
        End Get
        Set(ByVal value As String)
            InitDateRateValue = value
        End Set
    End Property



End Class


Public Class GroupsReportDataList

    Public WholesaleValue As String
    Public ContactValue As String
    Public GroupNameValue As String
    Public NumberRoomsValue As Integer
    Public ArrivalDateValue As Date
    Public DepartureDateValue As Date
    Public GroupCordinatorValue As String
    Public Special_NotesValue As String
    Public Contact_EmailValue As String
    Public PhonesValue As String
    Public DateDepositValue As Date
    Public ComplementaryRoomValue As String
    Public HotelNameValue As String
    Public User_EmailValue As String
    Public HotelLogoValue As String
    Public GroupTypeValue As String


    Public Cve_HotelValue As String
    Public Beneficiary_BankValue As String
    Public ABA_RoutingValue As String
    Public ABA_WireTransfersValue As String
    Public SWIFT_CODEValue As String
    Public Bank_AddressValue As String
    Public Beneficiary_NameValue As String
    Public MemoValue As String
    Public Beneficiary_AccountValue As String
    Public Hotel_AddressValue As String

    Public IdGroupCodeValue As String
    Public QuotedDateValue As Date
    Public VersionDocValue As String
    Public AgencyTypeTextValue As String
    Public DateMICEPaymentsValue As Integer
    Public Additional_SCValue As String
    Public IncludeEventsValue As Integer
    Public RevenueGeneralValue As Double

    Public Property RevenueGeneral() As Double
        Get
            Return RevenueGeneralValue
        End Get
        Set(ByVal value As Double)
            RevenueGeneralValue = value
        End Set
    End Property

    Public Property IncludeEvents() As Integer
        Get
            Return IncludeEventsValue
        End Get
        Set(ByVal value As Integer)
            IncludeEventsValue = value
        End Set
    End Property

    Public Property Additional_SC() As String
        Get
            Return Additional_SCValue
        End Get
        Set(ByVal value As String)
            Additional_SCValue = value
        End Set
    End Property


    Public Property DateMICEPayments() As Integer
        Get
            Return DateMICEPaymentsValue
        End Get
        Set(ByVal value As Integer)
            DateMICEPaymentsValue = value
        End Set
    End Property

    Public Property AgencyTypeText() As String
        Get
            Return AgencyTypeTextValue
        End Get
        Set(ByVal value As String)
            AgencyTypeTextValue = value
        End Set
    End Property


    Public Property VersionDoc() As String
        Get
            Return VersionDocValue
        End Get
        Set(ByVal value As String)
            VersionDocValue = value
        End Set
    End Property

    Public Property QuotedDate() As Date
        Get
            Return QuotedDateValue
        End Get
        Set(ByVal value As Date)
            QuotedDateValue = value
        End Set
    End Property

    Public Property IdGroupCode() As String
        Get
            Return IdGroupCodeValue
        End Get
        Set(ByVal value As String)
            IdGroupCodeValue = value
        End Set
    End Property

    Public Property Hotel_Address() As String
        Get
            Return Hotel_AddressValue
        End Get
        Set(ByVal value As String)
            Hotel_AddressValue = value
        End Set
    End Property


    Public Property Beneficiary_Account() As String
        Get
            Return Beneficiary_AccountValue
        End Get
        Set(ByVal value As String)
            Beneficiary_AccountValue = value
        End Set
    End Property

    Public Property Memo() As String
        Get
            Return MemoValue
        End Get
        Set(ByVal value As String)
            MemoValue = value
        End Set
    End Property

    Public Property Beneficiary_Name() As String
        Get
            Return Beneficiary_NameValue
        End Get
        Set(ByVal value As String)
            Beneficiary_NameValue = value
        End Set
    End Property

    Public Property Bank_Address() As String
        Get
            Return Bank_AddressValue
        End Get
        Set(ByVal value As String)
            Bank_AddressValue = value
        End Set
    End Property

    Public Property SWIFT_CODE() As String
        Get
            Return SWIFT_CODEValue
        End Get
        Set(ByVal value As String)
            SWIFT_CODEValue = value
        End Set
    End Property

    Public Property ABA_WireTransfers() As String
        Get
            Return ABA_WireTransfersValue
        End Get
        Set(ByVal value As String)
            ABA_WireTransfersValue = value
        End Set
    End Property

    Public Property ABA_Routing() As String
        Get
            Return ABA_RoutingValue
        End Get
        Set(ByVal value As String)
            ABA_RoutingValue = value
        End Set
    End Property


    Public Property Beneficiary_Bank() As String
        Get
            Return Beneficiary_BankValue
        End Get
        Set(ByVal value As String)
            Beneficiary_BankValue = value
        End Set
    End Property

    Public Property Cve_Hotel() As String
        Get
            Return Cve_HotelValue
        End Get
        Set(ByVal value As String)
            Cve_HotelValue = value
        End Set
    End Property



    Public Property GroupType() As String
        Get
            Return GroupTypeValue
        End Get
        Set(ByVal value As String)
            GroupTypeValue = value
        End Set
    End Property

    Public Property HotelName() As String
        Get
            Return HotelNameValue
        End Get
        Set(ByVal value As String)
            HotelNameValue = value
        End Set
    End Property

    Public Property User_Email() As String
        Get
            Return User_EmailValue
        End Get
        Set(ByVal value As String)
            User_EmailValue = value
        End Set
    End Property

    Public Property HotelLogo() As String
        Get
            Return HotelLogoValue
        End Get
        Set(ByVal value As String)
            HotelLogoValue = value
        End Set
    End Property

    Public Property ComplementaryRoom() As String
        Get
            Return ComplementaryRoomValue
        End Get
        Set(ByVal value As String)
            ComplementaryRoomValue = value
        End Set
    End Property

    Public Property DateDeposit() As Date
        Get
            Return DateDepositValue
        End Get
        Set(ByVal value As Date)
            DateDepositValue = value
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

    Public Property Phones() As String
        Get
            Return PhonesValue
        End Get
        Set(ByVal value As String)
            PhonesValue = value
        End Set
    End Property

    Public Property Special_Notes() As String
        Get
            Return Special_NotesValue
        End Get
        Set(ByVal value As String)
            Special_NotesValue = value
        End Set
    End Property

    Public Property ArrivalDate() As Date
        Get
            Return ArrivalDateValue
        End Get
        Set(ByVal value As Date)
            ArrivalDateValue = value
        End Set
    End Property

    Public Property DepartureDate() As Date
        Get
            Return DepartureDateValue
        End Get
        Set(ByVal value As Date)
            DepartureDateValue = value
        End Set
    End Property

    Public Property NumberRooms() As String
        Get
            Return NumberRoomsValue
        End Get
        Set(ByVal value As String)
            NumberRoomsValue = value
        End Set
    End Property

    Public Property Wholesale() As String
        Get
            Return WholesaleValue
        End Get
        Set(ByVal value As String)
            WholesaleValue = value
        End Set
    End Property

    Public Property Contact() As String
        Get
            Return ContactValue
        End Get
        Set(ByVal value As String)
            ContactValue = value
        End Set
    End Property

    Public Property GroupName() As String
        Get
            Return GroupNameValue
        End Get
        Set(ByVal value As String)
            GroupNameValue = value
        End Set
    End Property

    Public Property GroupCordinator() As String
        Get
            Return GroupCordinatorValue
        End Get
        Set(ByVal value As String)
            GroupCordinatorValue = value
        End Set
    End Property


End Class


Public Class GroupsDocList

    Public TypeDocumentValue As Integer
    Public ActionsValue As Integer
    Public UserValue As String
    Public URLvalue As String
    Public DateRegistervalue As String
 

    Public Property TypeDocument() As Integer
        Get
            Return TypeDocumentValue
        End Get
        Set(ByVal value As Integer)
            TypeDocumentValue = value
        End Set
    End Property


    Public Property Actions() As Integer
        Get
            Return ActionsValue
        End Get
        Set(ByVal value As Integer)
            ActionsValue = value
        End Set
    End Property

    Public Property User() As String
        Get
            Return UserValue
        End Get
        Set(ByVal value As String)
            UserValue = value
        End Set
    End Property

    Public Property URL() As String
        Get
            Return URLvalue
        End Get
        Set(ByVal value As String)
            URLvalue = value
        End Set
    End Property

    Public Property DateRegister() As String
        Get
            Return DateRegistervalue
        End Get
        Set(ByVal value As String)
            DateRegistervalue = value
        End Set
    End Property



End Class


Public Class GroupsReportRoomRatesList

    Public Init_DateValue As Date
    Public End_Datevalue As Date
    Public Nomb_TC_ActValue As String
    Public Rate_1Value As Double
    Public Rate_2Value As Double
    Public Rate_ExtraValue As Double
    Public Rate_TValue As Double
    Public Rate_CValue As Double
    Public Code_RoomValue As String
    Public Description_PromoValue As String
    Public AvailabilityValue As String
    Public FormatoValue As String


    Public Property Availability() As String
        Get
            Return AvailabilityValue
        End Get
        Set(ByVal value As String)
            AvailabilityValue = value
        End Set
    End Property

    Public Property Description_Promo() As String
        Get
            Return Description_PromoValue
        End Get
        Set(ByVal value As String)
            Description_PromoValue = value
        End Set
    End Property

    Public Property Code_Room() As String
        Get
            Return Code_RoomValue
        End Get
        Set(ByVal value As String)
            Code_RoomValue = value
        End Set
    End Property

    Public Property Rate_C() As Double
        Get
            Return Rate_CValue
        End Get
        Set(ByVal value As Double)
            Rate_CValue = value
        End Set
    End Property

    Public Property Rate_T() As Double
        Get
            Return Rate_TValue
        End Get
        Set(ByVal value As Double)
            Rate_TValue = value
        End Set
    End Property


    Public Property Rate_Extra() As Double
        Get
            Return Rate_ExtraValue
        End Get
        Set(ByVal value As Double)
            Rate_ExtraValue = value
        End Set
    End Property

    Public Property Rate_2() As Double
        Get
            Return Rate_2Value
        End Get
        Set(ByVal value As Double)
            Rate_2Value = value
        End Set
    End Property


    Public Property Rate_1() As Double
        Get
            Return Rate_1Value
        End Get
        Set(ByVal value As Double)
            Rate_1Value = value
        End Set
    End Property
    Public Property R_Show() As String
        Get
            Return FormatoValue
        End Get
        Set(ByVal value As String)
            FormatoValue = value
        End Set
    End Property


    Public Property Nomb_TC_Act() As String
        Get
            Return Nomb_TC_ActValue
        End Get
        Set(ByVal value As String)
            Nomb_TC_ActValue = value
        End Set
    End Property

    Public Property End_Date() As Date
        Get
            Return End_Datevalue
        End Get
        Set(ByVal value As Date)
            End_Datevalue = value
        End Set
    End Property

    Public Property Init_Date() As Date
        Get
            Return Init_DateValue
        End Get
        Set(ByVal value As Date)
            Init_DateValue = value
        End Set
    End Property

   


End Class


Public Class GroupsReportRoomNightsEstimatedList

    Public ArrivalDatePeriodValue As Date
    Public DepartureDatePeriodValue As Date
    Public Name_RoomValue As String
    Public Code_RoomValue As String
    Public NumberRoomsValue As Integer
    Public DepartureDateFinalValue As Date

    Public Property DepartureDateFinal() As Date
        Get
            Return DepartureDateFinalValue
        End Get
        Set(ByVal value As Date)
            DepartureDateFinalValue = value
        End Set
    End Property

    Public Property ArrivalDatePeriod() As Date
        Get
            Return ArrivalDatePeriodValue
        End Get
        Set(ByVal value As Date)
            ArrivalDatePeriodValue = value
        End Set
    End Property

    Public Property DepartureDatePeriod() As Date
        Get
            Return DepartureDatePeriodValue
        End Get
        Set(ByVal value As Date)
            DepartureDatePeriodValue = value
        End Set
    End Property

    Public Property Name_Room() As String
        Get
            Return Name_RoomValue
        End Get
        Set(ByVal value As String)
            Name_RoomValue = value
        End Set
    End Property

    Public Property Code_Room() As String
        Get
            Return Code_RoomValue
        End Get
        Set(ByVal value As String)
            Code_RoomValue = value
        End Set
    End Property

    Public Property NumberRooms() As Integer
        Get
            Return NumberRoomsValue
        End Get
        Set(ByVal value As Integer)
            NumberRoomsValue = value
        End Set
    End Property

End Class

Public Class GroupsReportRoomingList


    Public Id_BreakDownValue As Integer
    Public Code_RoomValue As String
    Public GuestNameValue As String
    Public GuestLastNameValue As String
    Public AdultsValue As Integer
    Public TeensValue As Integer
    Public ChildsValue As Integer
    Public InfantsValue As Integer
    Public CheckinValue As Date
    Public CheckoutValue As Date
    Public RevenueValue As Double
    Public Special_NotesValue As String
    Public FolioPMSValue As String
    Public PaxName1Value As String
    Public PaxLastname1Value As String
    Public PaxName2Value As String
    Public PaxLastname2Value As String
    Public PaxName3Value As String
    Public PaxLastname3Value As String
    Public PaxName4Value As String
    Public PaxLastname4Value As String
    Public NightsValue As Integer
    Public RateValue As Double
    Public DateNightValue As Date
    Public FlagValue As Integer
    Public NumberNigthsValue As Integer
    Public FormatoValue As String


    Public Property NumberNigths() As Integer
        Get
            Return NumberNigthsValue
        End Get
        Set(ByVal value As Integer)
            NumberNigthsValue = value
        End Set
    End Property

    Public Property Flag() As Integer
        Get
            Return FlagValue
        End Get
        Set(ByVal value As Integer)
            FlagValue = value
        End Set
    End Property


    Public Property DateNight() As Date
        Get
            Return DateNightValue
        End Get
        Set(ByVal value As Date)
            DateNightValue = value
        End Set
    End Property

    Public Property Rate() As Double
        Get
            Return RateValue
        End Get
        Set(ByVal value As Double)
            RateValue = value
        End Set
    End Property


    Public Property Nights() As Integer
        Get
            Return NightsValue
        End Get
        Set(ByVal value As Integer)
            NightsValue = value
        End Set
    End Property

    Public Property PaxLastname1() As String
        Get
            Return PaxLastname1Value
        End Get
        Set(ByVal value As String)
            PaxLastname1Value = value
        End Set
    End Property

    Public Property PaxName1() As String
        Get
            Return PaxName1Value
        End Get
        Set(ByVal value As String)
            PaxName1Value = value
        End Set
    End Property

    Public Property PaxLastname2() As String
        Get
            Return PaxLastname2Value
        End Get
        Set(ByVal value As String)
            PaxLastname2Value = value
        End Set
    End Property

    Public Property PaxName2() As String
        Get
            Return PaxName2Value
        End Get
        Set(ByVal value As String)
            PaxName2Value = value
        End Set
    End Property

    Public Property PaxLastname3() As String
        Get
            Return PaxLastname3Value
        End Get
        Set(ByVal value As String)
            PaxLastname3Value = value
        End Set
    End Property

    Public Property PaxName3() As String
        Get
            Return PaxName3Value
        End Get
        Set(ByVal value As String)
            PaxName3Value = value
        End Set
    End Property


    Public Property PaxLastname4() As String
        Get
            Return PaxLastname4Value
        End Get
        Set(ByVal value As String)
            PaxLastname4Value = value
        End Set
    End Property

    Public Property PaxName4() As String
        Get
            Return PaxName4Value
        End Get
        Set(ByVal value As String)
            PaxName4Value = value
        End Set
    End Property


    Public Property FolioPMS() As String
        Get
            Return FolioPMSValue
        End Get
        Set(ByVal value As String)
            FolioPMSValue = value
        End Set
    End Property

    Public Property Special_Notes() As String
        Get
            Return Special_NotesValue
        End Get
        Set(ByVal value As String)
            Special_NotesValue = value
        End Set
    End Property


    Public Property Revenue() As Double
        Get
            Return RevenueValue
        End Get
        Set(ByVal value As Double)
            RevenueValue = value
        End Set
    End Property

    Public Property Checkout() As Date
        Get
            Return CheckoutValue
        End Get
        Set(ByVal value As Date)
            CheckoutValue = value
        End Set
    End Property

    Public Property Checkin() As Date
        Get
            Return CheckinValue
        End Get
        Set(ByVal value As Date)
            CheckinValue = value
        End Set
    End Property


    Public Property Infants() As Integer
        Get
            Return InfantsValue
        End Get
        Set(ByVal value As Integer)
            InfantsValue = value
        End Set
    End Property

    Public Property Childs() As Integer
        Get
            Return ChildsValue
        End Get
        Set(ByVal value As Integer)
            ChildsValue = value
        End Set
    End Property

    Public Property Teens() As Integer
        Get
            Return TeensValue
        End Get
        Set(ByVal value As Integer)
            TeensValue = value
        End Set
    End Property

    Public Property Adults() As Integer
        Get
            Return AdultsValue
        End Get
        Set(ByVal value As Integer)
            AdultsValue = value
        End Set
    End Property

    Public Property GuestLastName() As String
        Get
            Return GuestLastNameValue
        End Get
        Set(ByVal value As String)
            GuestLastNameValue = value
        End Set
    End Property

    Public Property GuestName() As String
        Get
            Return GuestNameValue
        End Get
        Set(ByVal value As String)
            GuestNameValue = value
        End Set
    End Property

    Public Property Code_Room() As String
        Get
            Return Code_RoomValue
        End Get
        Set(ByVal value As String)
            Code_RoomValue = value
        End Set
    End Property


    Public Property Id_BreakDown() As Integer
        Get
            Return Id_BreakDownValue
        End Get
        Set(ByVal value As Integer)
            Id_BreakDownValue = value
        End Set
    End Property


    Public Property R_Show() As String
        Get
            Return FormatoValue
        End Get
        Set(ByVal value As String)
            FormatoValue = value
        End Set
    End Property
  

End Class


Public Class GroupsReportGCRList

    Public Id_GroupValue As Integer
    Public datelistValue As Date
    Public NumRoomsValue As Integer
    Public GroupNameValue As String
    Public ArrivalDateValue As Date
    Public DepartureDateValue As Date
    Public IdGroupCodeValue As String
    Public RevenueValue As Double
    Public TotalRoomsValue As Integer
    Public ADRValue As Double
    Public Type_DataValue As String
    Public PeriodValue As String


    Public Property Period() As String
        Get
            Return PeriodValue
        End Get
        Set(ByVal value As String)
            PeriodValue = value
        End Set
    End Property

    Public Property Id_Group() As Integer
        Get
            Return Id_GroupValue
        End Get
        Set(ByVal value As Integer)
            Id_GroupValue = value
        End Set
    End Property

    Public Property datelist() As Date
        Get
            Return datelistValue
        End Get
        Set(ByVal value As Date)
            datelistValue = value
        End Set
    End Property

    Public Property NumRooms() As Integer
        Get
            Return NumRoomsValue
        End Get
        Set(ByVal value As Integer)
            NumRoomsValue = value
        End Set
    End Property


    Public Property GroupName() As String
        Get
            Return GroupNameValue
        End Get
        Set(ByVal value As String)
            GroupNameValue = value
        End Set
    End Property

    Public Property ArrivalDate() As Date
        Get
            Return ArrivalDateValue
        End Get
        Set(ByVal value As Date)
            ArrivalDateValue = value
        End Set
    End Property


    Public Property DepartureDate() As Date
        Get
            Return DepartureDateValue
        End Get
        Set(ByVal value As Date)
            DepartureDateValue = value
        End Set
    End Property

    Public Property IdGroupCode() As String
        Get
            Return IdGroupCodeValue
        End Get
        Set(ByVal value As String)
            IdGroupCodeValue = value
        End Set
    End Property

    Public Property Revenue() As Double
        Get
            Return RevenueValue
        End Get
        Set(ByVal value As Double)
            RevenueValue = value
        End Set
    End Property


    Public Property TotalRooms() As Integer
        Get
            Return TotalRoomsValue
        End Get
        Set(ByVal value As Integer)
            TotalRoomsValue = value
        End Set
    End Property

    Public Property ADR() As Double
        Get
            Return ADRValue
        End Get
        Set(ByVal value As Double)
            ADRValue = value
        End Set
    End Property


    Public Property Type_Data() As String
        Get
            Return Type_DataValue
        End Get
        Set(ByVal value As String)
            Type_DataValue = value
        End Set
    End Property




End Class





Public Class GroupsReportRevenueList


    Public Nomb_TC_ActValue As String
    Public Num_RoomsValue As Integer
    Public RevenueValue As Double
    Public PeopleValue As Double
    Public TotalValue As Double
    Public FormatoValue As String


    Public Property Num_Rooms() As Integer
        Get
            Return Num_RoomsValue
        End Get
        Set(ByVal value As Integer)
            Num_RoomsValue = value
        End Set
    End Property

    Public Property Revenue() As Double
        Get
            Return RevenueValue
        End Get
        Set(ByVal value As Double)
            RevenueValue = value
        End Set
    End Property


    Public Property People() As Double
        Get
            Return PeopleValue
        End Get
        Set(ByVal value As Double)
            PeopleValue = value
        End Set
    End Property

    Public Property Total() As Double
        Get
            Return TotalValue
        End Get
        Set(ByVal value As Double)
            TotalValue = value
        End Set
    End Property


    Public Property R_Show() As String
        Get
            Return FormatoValue
        End Get
        Set(ByVal value As String)
            FormatoValue = value
        End Set
    End Property


    Public Property Nomb_TC_Act() As String
        Get
            Return Nomb_TC_ActValue
        End Get
        Set(ByVal value As String)
            Nomb_TC_ActValue = value
        End Set
    End Property






End Class


Public Class GroupsReportRoomNigthsList

    Public Code_RoomValue As String
    Public NumberRoomsValue As Integer
    Public Col1Value As String
    Public Col2Value As String
    Public Col3Value As String
    Public Col4Value As String
    Public Col5Value As String
    Public Col6Value As String
    Public Col7Value As String


    Public Property Code_Room() As String
        Get
            Return Code_RoomValue
        End Get
        Set(ByVal value As String)
            Code_RoomValue = value
        End Set
    End Property

    Public Property NumberRooms() As Integer
        Get
            Return NumberRoomsValue
        End Get
        Set(ByVal value As Integer)
            NumberRoomsValue = value
        End Set
    End Property

    Public Property Col1() As String
        Get
            Return Col1Value
        End Get
        Set(ByVal value As String)
            Col1Value = value
        End Set
    End Property

    Public Property Col2() As String
        Get
            Return Col2Value
        End Get
        Set(ByVal value As String)
            Col2Value = value
        End Set
    End Property

    Public Property Col3() As String
        Get
            Return Col3Value
        End Get
        Set(ByVal value As String)
            Col3Value = value
        End Set
    End Property

    Public Property Col4() As String
        Get
            Return Col4Value
        End Get
        Set(ByVal value As String)
            Col4Value = value
        End Set
    End Property


    Public Property Col5() As String
        Get
            Return Col5Value
        End Get
        Set(ByVal value As String)
            Col5Value = value
        End Set
    End Property


    Public Property Col6() As String
        Get
            Return Col6Value
        End Get
        Set(ByVal value As String)
            Col6Value = value
        End Set
    End Property


    Public Property Col7() As String
        Get
            Return Col7Value
        End Get
        Set(ByVal value As String)
            Col7Value = value
        End Set
    End Property

End Class


Public Class GroupsBreakList

    Public RoomIDValue As String
    Public GuestNameValue As String
    Public RoomCodeValue As String
    Public AdultsValue As Integer
    Public TeensValue As Integer
    Public ChildrensValue As Integer
    Public InfantsValue As Integer
    Public TentativeRoomsValue As Integer
    Public ComplementaryRoomsValue As Integer
    Public CheckinValue As String
    Public CheckoutValue As String
    Public RoomNighsValue As Integer
    Public StatusPaymentValue As Integer
    Public StatusBookingValue As Integer
    Public DepositValue As Double
    Public BalanceValue As Double
    Public RevenueValue As Double




    Public Property Revenue() As Double
        Get
            Return RevenueValue
        End Get
        Set(ByVal value As Double)
            RevenueValue = value
        End Set
    End Property

    Public Property Balance() As Double
        Get
            Return BalanceValue
        End Get
        Set(ByVal value As Double)
            BalanceValue = value
        End Set
    End Property

    Public Property Deposit() As Double
        Get
            Return DepositValue
        End Get
        Set(ByVal value As Double)
            DepositValue = value
        End Set
    End Property

    Public Property StatusBooking() As Integer
        Get
            Return StatusBookingValue
        End Get
        Set(ByVal value As Integer)
            StatusBookingValue = value
        End Set
    End Property

    Public Property StatusPayment() As Integer
        Get
            Return StatusPaymentValue
        End Get
        Set(ByVal value As Integer)
            StatusPaymentValue = value
        End Set
    End Property

    Public Property RoomNighs() As Integer
        Get
            Return RoomNighsValue
        End Get
        Set(ByVal value As Integer)
            RoomNighsValue = value
        End Set
    End Property

    Public Property Checkout() As String
        Get
            Return CheckoutValue
        End Get
        Set(ByVal value As String)
            CheckoutValue = value
        End Set
    End Property

    Public Property Checkin() As String
        Get
            Return CheckinValue
        End Get
        Set(ByVal value As String)
            CheckinValue = value
        End Set
    End Property


    Public Property ComplementaryRooms() As Integer
        Get
            Return ComplementaryRoomsValue
        End Get
        Set(ByVal value As Integer)
            ComplementaryRoomsValue = value
        End Set
    End Property


    Public Property TentativeRooms() As Integer
        Get
            Return TentativeRoomsValue
        End Get
        Set(ByVal value As Integer)
            TentativeRoomsValue = value
        End Set
    End Property

    Public Property Infants() As Integer
        Get
            Return InfantsValue
        End Get
        Set(ByVal value As Integer)
            InfantsValue = value
        End Set
    End Property

    Public Property Childrens() As Integer
        Get
            Return ChildrensValue
        End Get
        Set(ByVal value As Integer)
            ChildrensValue = value
        End Set
    End Property

    Public Property Teens() As Integer
        Get
            Return TeensValue
        End Get
        Set(ByVal value As Integer)
            TeensValue = value
        End Set
    End Property

    Public Property Adults() As Integer
        Get
            Return AdultsValue
        End Get
        Set(ByVal value As Integer)
            AdultsValue = value
        End Set
    End Property

    Public Property RoomCode() As String
        Get
            Return RoomCodeValue
        End Get
        Set(ByVal value As String)
            RoomCodeValue = value
        End Set
    End Property

    Public Property GuestName() As String
        Get
            Return GuestNameValue
        End Get
        Set(ByVal value As String)
            GuestNameValue = value
        End Set
    End Property

    Public Property RoomID() As String
        Get
            Return RoomIDValue
        End Get
        Set(ByVal value As String)
            RoomIDValue = value
        End Set
    End Property

End Class


Public Class GroupsLogBookList

    Public LogBookIDValue As Integer
    Public InputTypeValue As Integer
    Public NotesLogBookValue As String
    Public UserLogBookValue As String
    Public DateLogBookValue As String


    Public Property LogBookID() As Integer
        Get
            Return LogBookIDValue
        End Get
        Set(ByVal value As Integer)
            LogBookIDValue = value
        End Set
    End Property


    Public Property InputType() As Integer
        Get
            Return InputTypeValue
        End Get
        Set(ByVal value As Integer)
            InputTypeValue = value
        End Set
    End Property


    Public Property NotesLogBook() As String
        Get
            Return NotesLogBookValue
        End Get
        Set(ByVal value As String)
            NotesLogBookValue = value
        End Set
    End Property


    Public Property UserLogBook() As String
        Get
            Return UserLogBookValue
        End Get
        Set(ByVal value As String)
            UserLogBookValue = value
        End Set
    End Property


    Public Property DateLogBook() As String
        Get
            Return DateLogBookValue
        End Get
        Set(ByVal value As String)
            DateLogBookValue = value
        End Set
    End Property


End Class


Public Class GroupsPaymentsList

    Public PaymentIDValue As Integer
    Public TypePaymentValue As Integer
    Public TypeCurrencyPaymentValue As Integer
    Public DescriptionPaymentValue As String
    Public AmountPaymentValue As Double
    Public ValidatedPaymentValue As Integer
    Public UserResgisterPaymentValue As String
    Public FolioPaymentValue As String
    Public DateRegisterPaymentValue As String
    Public AppliedPaymentValue As Integer
    Public StatusPaymentValue As Integer
    Public UserValidatedPaymentValue As String
    Public DateValidatedPaymentValue As String

    Public RoomIDValue As Integer
    Public EventIDValue As Integer

    Public Property RoomID() As Integer
        Get
            Return RoomIDValue
        End Get
        Set(ByVal value As Integer)
            RoomIDValue = value
        End Set
    End Property

    Public Property EventID() As Integer
        Get
            Return EventIDValue
        End Get
        Set(ByVal value As Integer)
            EventIDValue = value
        End Set
    End Property

    Public Property DateValidatedPayment() As String
        Get
            Return DateValidatedPaymentValue
        End Get
        Set(ByVal value As String)
            DateValidatedPaymentValue = value
        End Set
    End Property


    Public Property UserValidatedPayment() As String
        Get
            Return UserValidatedPaymentValue
        End Get
        Set(ByVal value As String)
            UserValidatedPaymentValue = value
        End Set
    End Property


    Public Property StatusPayment() As Integer
        Get
            Return StatusPaymentValue
        End Get
        Set(ByVal value As Integer)
            StatusPaymentValue = value
        End Set
    End Property

    Public Property AppliedPayment() As Integer
        Get
            Return AppliedPaymentValue
        End Get
        Set(ByVal value As Integer)
            AppliedPaymentValue = value
        End Set
    End Property


    Public Property DateRegisterPayment() As String
        Get
            Return DateRegisterPaymentValue
        End Get
        Set(ByVal value As String)
            DateRegisterPaymentValue = value
        End Set
    End Property


    Public Property FolioPayment() As String
        Get
            Return FolioPaymentValue
        End Get
        Set(ByVal value As String)
            FolioPaymentValue = value
        End Set
    End Property


    Public Property UserResgisterPayment() As String
        Get
            Return UserResgisterPaymentValue
        End Get
        Set(ByVal value As String)
            UserResgisterPaymentValue = value
        End Set
    End Property

    Public Property PaymentID() As Integer
        Get
            Return PaymentIDValue
        End Get
        Set(ByVal value As Integer)
            PaymentIDValue = value
        End Set
    End Property

    Public Property TypePayment() As Integer
        Get
            Return TypePaymentValue
        End Get
        Set(ByVal value As Integer)
            TypePaymentValue = value
        End Set
    End Property

    Public Property TypeCurrencyPayment() As Integer
        Get
            Return TypeCurrencyPaymentValue
        End Get
        Set(ByVal value As Integer)
            TypeCurrencyPaymentValue = value
        End Set
    End Property


    Public Property DescriptionPayment() As String
        Get
            Return DescriptionPaymentValue
        End Get
        Set(ByVal value As String)
            DescriptionPaymentValue = value
        End Set
    End Property

    Public Property AmountPayment() As Double
        Get
            Return AmountPaymentValue
        End Get
        Set(ByVal value As Double)
            AmountPaymentValue = value
        End Set
    End Property

    Public Property ValidatedPayment() As Integer
        Get
            Return ValidatedPaymentValue
        End Get
        Set(ByVal value As Integer)
            ValidatedPaymentValue = value
        End Set
    End Property


End Class


Public Class GroupsEventsList

    Public EventIDValue As Integer
    Public EventNameValue As String
    Public EventDateValue As String
    Public EventStartTimeValue As String
    Public EventEndTimeValue As String
    Public EventSalonNameValue As String
    Public EventStatusValue As Integer
    Public EventPaxValue As Integer
    Public EventSellerNameValue As String
    Public EventCordinatorNameValue As String
    Public EventDepositsValue As Double
    Public EventBalanceValue As Double
    Public EventRevenueValue As Double
    Public EventUserRegisterValue As String
    Public EventDateRegisterValue As String


    Public Property EventUserRegister() As String
        Get
            Return EventUserRegisterValue
        End Get
        Set(ByVal value As String)
            EventUserRegisterValue = value
        End Set
    End Property

    Public Property EventDateRegister() As String
        Get
            Return EventDateRegisterValue
        End Get
        Set(ByVal value As String)
            EventDateRegisterValue = value
        End Set
    End Property

    Public Property EventRevenue() As Double
        Get
            Return EventRevenueValue
        End Get
        Set(ByVal value As Double)
            EventRevenueValue = value
        End Set
    End Property

    Public Property EventBalance() As Double
        Get
            Return EventBalanceValue
        End Get
        Set(ByVal value As Double)
            EventBalanceValue = value
        End Set
    End Property

    Public Property EventDeposits() As Double
        Get
            Return EventDepositsValue
        End Get
        Set(ByVal value As Double)
            EventDepositsValue = value
        End Set
    End Property

    Public Property EventCordinatorName() As String
        Get
            Return EventCordinatorNameValue
        End Get
        Set(ByVal value As String)
            EventCordinatorNameValue = value
        End Set
    End Property


    Public Property EventSellerName() As String
        Get
            Return EventSellerNameValue
        End Get
        Set(ByVal value As String)
            EventSellerNameValue = value
        End Set
    End Property


    Public Property EventPax() As Integer
        Get
            Return EventPaxValue
        End Get
        Set(ByVal value As Integer)
            EventPaxValue = value
        End Set
    End Property


    Public Property EventStatus() As Integer
        Get
            Return EventStatusValue
        End Get
        Set(ByVal value As Integer)
            EventStatusValue = value
        End Set
    End Property


    Public Property EventSalonName() As String
        Get
            Return EventSalonNameValue
        End Get
        Set(ByVal value As String)
            EventSalonNameValue = value
        End Set
    End Property


    Public Property EventEndTime() As String
        Get
            Return EventEndTimeValue
        End Get
        Set(ByVal value As String)
            EventEndTimeValue = value
        End Set
    End Property

    Public Property EventStartTime() As String
        Get
            Return EventStartTimeValue
        End Get
        Set(ByVal value As String)
            EventStartTimeValue = value
        End Set
    End Property

    Public Property EventDate() As String
        Get
            Return EventDateValue
        End Get
        Set(ByVal value As String)
            EventDateValue = value
        End Set
    End Property


    Public Property EventName() As String
        Get
            Return EventNameValue
        End Get
        Set(ByVal value As String)
            EventNameValue = value
        End Set
    End Property

    Public Property EventID() As Integer
        Get
            Return EventIDValue
        End Get
        Set(ByVal value As Integer)
            EventIDValue = value
        End Set
    End Property





End Class