Imports System.Diagnostics.CodeAnalysis
Imports System.Security.Principal
Imports System.Web.Routing
Imports System.Web.Mvc
Imports System.Web
Imports System.Linq
Imports System.Xml.Linq
Imports System.Xml
Imports System
Imports System.Data.SqlClient
Imports System.Web.UI.WebControls
Imports System.Globalization
Imports System.IO
Imports System.Runtime.InteropServices
Imports System.Net
Imports System.ServiceModel
Imports Microsoft.Reporting.WebForms


Namespace GroupsPlayaResorts
    Public Class GroupsController
        'Inherits System.Web.Mvc.Controller
        Inherits ApplicationController
        'Public coonString = ConfigurationManager.ConnectionStrings("RemoteConnectionString").ConnectionString
        'Public conn = New SqlConnection(coonString)


        '
        ' GET: /Groups

        Function Index() As ActionResult
            Return View()
        End Function

        '
        ' GET: /Group/GroupsList
        <Authorize()> _
        Function GroupsList() As ActionResult
            UserPermissions("1,2,3,4")
            'Dim a As String
            Dim model = New GroupsList

            conn.Open()

            Dim QueryDos As String

            '= " select a.*, b.Market_Key , c.Type_Name ,d.Group_Status as PaymentStatus, e.Group_Status as BookStatus, f.Group_Status as HotelStatus,g.User_Name + ' ' + g.Last_Name as CordinatorGroup from groups a left join Cat_Markets b on a.Market=b.Id_Market left join Cat_GroupType c on a.GroupType=c.Id_Type left join (Select  Id_Group, Group_Status from Groups_Status where Type_Status=1 and Status_Data=1 )d on a.Id_Group=d.Id_Group left join (Select  Id_Group, Group_Status from Groups_Status where Type_Status=2 and Status_Data=1 )e on a.Id_Group=e.Id_Group left join (Select  Id_Group, Group_Status from Groups_Status where Type_Status=3 and Status_Data=1 )f on a.Id_Group=f.Id_Group left join Cat_Users g on a.GroupCordinator=g.Id_User where a.status_data=1 order by a.Date_Register desc  "

            QueryDos = "Exec sp_Groups_List 0  , ''  , 'order by  a.Date_Register desc ' "

            Dim CommandUserDos = New SqlCommand(QueryDos, conn)

            'Return Content(QueryDos.ToString)

            Dim Results = CommandUserDos.ExecuteReader()

            Dim GroupList = New List(Of GroupsListData)

            Dim hotel As String = ""

            If Results.HasRows Then

                While Results.Read()

                    Select Case Results("Cve_Hotel")
                        Case "GCR"
                            hotel = "GCCUN"
                        Case "GPR"
                            hotel = "POPDC"
                        Case "RPR"
                            hotel = "ROPDC"
                        Case "TRC"
                            hotel = "HZLCUN"
                        Case "ZLJ"
                            hotel = "HZLJAM"
                        Case "ZVC"
                            hotel = "HZVCUN"
                        Case "ZVJ"
                            hotel = "HZVJAM"
                        Case "ZVL"
                            hotel = "HZLCA"
                        Case "ZVP"
                            hotel = "HZVPV"
                    End Select

                    GroupList.Add(New GroupsListData With {.Colum1 = hotel + "000" + Results("Id_Group").ToString, .Colum20 = Results("GroupName"), .Colum2 = Results("Date_Register"), .Colum3 = Results("Client"), .Colum22 = Results("Wholesale"), .Colum4 = Results("Market_Key"), .Colum5 = Results("Contact"), .Colum6 = Results("CordinatorGroup"), .Colum7 = Results("ArrivalDate"), .Colum8 = Results("DepartureDate"), .Colum9 = Results("Type_Name"), .Colum10 = Results("BookStatus"), .Colum11 = Results("PaymentStatus"), .Colum21 = Results("HotelStatus"), .Colum12 = hotel, .Colum13 = Results("RateProm"), .Colum14 = Results("TypeRate"), .Colum15 = Results("PeakRoom"), .Colum16 = Results("NumberRooms"), .Colum17 = "0.00", .Colum18 = Results("RevenueProm"), .Colum19 = Results("Id_Group"), .Colum23 = Results("CommissionAgent")})
                End While

                Results.Close()
            End If


            QueryDos = "Exec sp_Groups_List_Totals 0  , ''   "
            Dim CommandUserTres = New SqlCommand(QueryDos, conn)

            Dim ResultsDos = CommandUserTres.ExecuteReader()

            If ResultsDos.HasRows Then

                While ResultsDos.Read()

                    model.TotalRevenue = ResultsDos("RevenueProm")

                End While

                ResultsDos.Close()
            End If



            Dim QueryListuno As String = "Select Id_Type,[TYPE_NAME] as Name from Cat_GroupType where Status_Data=1 "
            Dim CommandUserListuno = New SqlCommand(QueryListuno, conn)
            Dim ListGroupType = New List(Of SelectListItem)

            'conn.Open()

            Dim ResultsListuno = CommandUserListuno.ExecuteReader()

            If ResultsListuno.HasRows Then
                While ResultsListuno.Read()
                    ListGroupType.Add(New SelectListItem With {.Text = ResultsListuno("Name"), .Value = ResultsListuno("Id_Type"), .Selected = False})
                End While
            End If
            ResultsListuno.Close()

            'conn.close()


            Dim QueryListDos As String = "Select Id_Market, Market_Name from Cat_Markets where Status_Data=1 order by Market_Name "
            Dim CommandUserListDos = New SqlCommand(QueryListDos, conn)
            Dim ListMarkets = New List(Of SelectListItem)

            'conn.Open()

            Dim ResultsListDos = CommandUserListDos.ExecuteReader()

            If ResultsListDos.HasRows Then
                While ResultsListDos.Read()
                    ListMarkets.Add(New SelectListItem With {.Text = ResultsListDos("Market_Name"), .Value = ResultsListDos("Id_Market"), .Selected = False})
                End While
            End If
            ResultsListDos.Close()

            'conn.close()



            Dim QueryListCuatro As String = "select Id_User , [User_Name] + ' ' + Last_Name as UserName from Cat_Users where Type_User=2 order by [User_Name] "
            Dim CommandUserListCuatro = New SqlCommand(QueryListCuatro, conn)
            Dim ListGroupCordinator = New List(Of SelectListItem)

            'conn.Open()

            Dim ResultsListCuatro = CommandUserListCuatro.ExecuteReader()

            If ResultsListCuatro.HasRows Then
                While ResultsListCuatro.Read()
                    ListGroupCordinator.Add(New SelectListItem With {.Text = ResultsListCuatro("UserName"), .Value = ResultsListCuatro("Id_User"), .Selected = False})
                End While
            End If
            ResultsListCuatro.Close()

            'conn.close()

            Dim QueryListTres As String = "Select Id_Type, [TYPE_NAME] as Name from Cat_AgencyType where Status_Data=1 order by [TYPE_NAME] "
            Dim CommandUserListTres = New SqlCommand(QueryListTres, conn)
            Dim ListAgencyType = New List(Of SelectListItem)

            'conn.Open()

            Dim ResultsListTres = CommandUserListTres.ExecuteReader()

            If ResultsListTres.HasRows Then
                While ResultsListTres.Read()
                    ListAgencyType.Add(New SelectListItem With {.Text = ResultsListTres("Name"), .Value = ResultsListTres("Id_Type"), .Selected = False})
                End While
            End If
            ResultsListTres.Close()

            'conn.close()

            model.ListGroupCordinatorin = ListGroupCordinator
            model.ListaGroupTypein = ListGroupType
            model.ListaGroupMarketin = ListMarkets
            model.ListaAgencyTypein = ListAgencyType
            model.ListGroupDatain = GroupList


            conn.close()
            Return View(model)


        End Function

        '
        ' POST: /Group/GroupsList
        <HttpPost()> _
        Public Function GroupsList(ByVal model As GroupsList, ByVal GroupsListBotons As String) As ActionResult
            UserPermissions("1,2,3,4")
            If GroupsListBotons = "Apply_Filters" Then

                Dim GroupList = New List(Of GroupsListData)

                Dim Filters As String = " "
                Dim Order As String = " "
                Dim i As Integer

                'HOTEL FILTER

                Dim HotelValues() As String = Split(Request("hotelfilter"), ",")
                Dim HotelFilters As String = ""

                If HotelValues.Count <> 0 Then

                    HotelFilters = " and a.Cve_Hotel in( "

                    For i = 0 To HotelValues.Count - 1

                        If HotelValues(i) = "0" Then

                            i = HotelValues.Count
                            HotelFilters = " "
                        Else
                            If i = HotelValues.Count - 1 Then
                                HotelFilters += "  ''" + HotelValues(i) + "''  )  "
                            Else
                                HotelFilters += "  ''" + HotelValues(i) + "'' ,  "
                            End If

                        End If

                    Next

                    Filters = Filters + HotelFilters

                End If


                'Book Status

                Dim BookStatusValues() As String = Split(Request("BookStatusFilter"), ",")
                Dim BookStatusFilters As String = ""

                If BookStatusValues.Count <> 0 Then

                    BookStatusFilters = " and e.Group_Status in( "

                    For i = 0 To BookStatusValues.Count - 1

                        If BookStatusValues(i) = "0" Then

                            i = BookStatusValues.Count
                            BookStatusFilters = " "
                        Else
                            If i = BookStatusValues.Count - 1 Then
                                BookStatusFilters += "  " + BookStatusValues(i) + "  )  "
                            Else
                                BookStatusFilters += "  " + BookStatusValues(i) + " ,  "
                            End If

                        End If

                    Next

                    Filters = Filters + BookStatusFilters

                End If


                'Pay Status

                Dim PayStatusValues() As String = Split(Request("PayStatusFilter"), ",")
                Dim PayStatusFilters As String = ""

                If PayStatusValues.Count <> 0 Then

                    PayStatusFilters = " and d.Group_Status in( "

                    For i = 0 To PayStatusValues.Count - 1

                        If PayStatusValues(i) = "0" Then

                            i = PayStatusValues.Count
                            PayStatusFilters = " "
                        Else
                            If i = PayStatusValues.Count - 1 Then
                                PayStatusFilters += "  " + PayStatusValues(i) + "  )  "
                            Else
                                PayStatusFilters += "  " + PayStatusValues(i) + " ,  "
                            End If

                        End If

                    Next

                    Filters = Filters + PayStatusFilters

                End If


                'Hotel Status

                Dim HotelStatusValues() As String = Split(Request("HotelStatusFilter"), ",")
                Dim HotelStatusFilters As String = ""

                If HotelStatusValues.Count <> 0 Then

                    HotelStatusFilters = " and f.Group_Status in( "

                    For i = 0 To HotelStatusValues.Count - 1

                        If HotelStatusValues(i) = "0" Then

                            i = HotelStatusValues.Count
                            HotelStatusFilters = " "
                        Else
                            If i = HotelStatusValues.Count - 1 Then
                                HotelStatusFilters += "  " + HotelStatusValues(i) + "  )  "
                            Else
                                HotelStatusFilters += "  " + HotelStatusValues(i) + " ,  "
                            End If

                        End If

                    Next

                    Filters = Filters + HotelStatusFilters

                End If



                'Agent

                Dim AgentValues() As String = Split(Request("agentfilter"), ",")
                Dim AgentFilters As String = ""

                If AgentValues.Count <> 0 Then

                    AgentFilters = " and a.GroupCordinator in( "

                    For i = 0 To AgentValues.Count - 1

                        If AgentValues(i) = "0" Then

                            i = AgentValues.Count
                            AgentFilters = " "
                        Else
                            If i = AgentValues.Count - 1 Then
                                AgentFilters += "  " + AgentValues(i) + "  )  "
                            Else
                                AgentFilters += "  " + AgentValues(i) + " ,  "
                            End If

                        End If

                    Next

                    Filters = Filters + AgentFilters

                End If


                'Motive

                Dim MotiveValues() As String = Split(Request("motivefilter"), ",")
                Dim MotiveFilters As String = ""

                If MotiveValues.Count <> 0 Then

                    MotiveFilters = " and a.GroupType in( "

                    For i = 0 To MotiveValues.Count - 1

                        If MotiveValues(i) = "0" Then

                            i = MotiveValues.Count
                            MotiveFilters = " "
                        Else
                            If i = MotiveValues.Count - 1 Then
                                MotiveFilters += "  " + MotiveValues(i) + "  )  "
                            Else
                                MotiveFilters += "  " + MotiveValues(i) + " ,  "
                            End If

                        End If

                    Next

                    Filters = Filters + MotiveFilters

                End If


                'Market

                Dim MarketValues() As String = Split(Request("marketfilter"), ",")
                Dim MarketFilters As String = ""

                If MarketValues.Count <> 0 Then

                    MarketFilters = " and a.Market in( "

                    For i = 0 To MarketValues.Count - 1

                        If MarketValues(i) = "0" Then

                            i = MarketValues.Count
                            MarketFilters = " "
                        Else
                            If i = MarketValues.Count - 1 Then
                                MarketFilters += "  " + MarketValues(i) + "  )  "
                            Else
                                MarketFilters += "  " + MarketValues(i) + " ,  "
                            End If

                        End If

                    Next

                    Filters = Filters + MarketFilters

                End If


                'AgencyType

                Dim AgencyTypeValues() As String = Split(Request("agencytypefilter"), ",")
                Dim AgencyTypeFilters As String = ""

                If AgencyTypeValues.Count <> 0 Then

                    AgencyTypeFilters = " and a.AgencyType in( "

                    For i = 0 To AgencyTypeValues.Count - 1

                        If AgencyTypeValues(i) = "0" Then

                            i = AgencyTypeValues.Count
                            AgencyTypeFilters = " "
                        Else
                            If i = AgencyTypeValues.Count - 1 Then
                                AgencyTypeFilters += "  " + AgencyTypeValues(i) + "  )  "
                            Else
                                AgencyTypeFilters += "  " + AgencyTypeValues(i) + " ,  "
                            End If

                        End If

                    Next

                    Filters = Filters + AgencyTypeFilters

                End If


                Dim DatesFilters As String = ""

                If Request("datetimepickerdate1text") <> "" And Request("datetimepickerdate2text") <> "" And Request("datefilter") <> 0 And Request("datetimepickerdate1text") <> Request("datetimepickerdate2text") Then


                    If Request("datefilter") = 1 Then

                        DatesFilters = " and  (a.ArrivalDate between ''" + Request("datetimepickerdate1text") + "'' and ''" + Request("datetimepickerdate2text") + "''   ) "
                    End If

                    If Request("datefilter") = 2 Then

                        DatesFilters = " and  (a.DepartureDate between ''" + Request("datetimepickerdate1text") + "'' and ''" + Request("datetimepickerdate2text") + "''   ) "

                    End If

                    If Request("datefilter") = 3 Then

                        DatesFilters = " and  (Convert(date ,a.Date_Register)  between ''" + Request("datetimepickerdate1text") + "'' and ''" + Request("datetimepickerdate2text") + "''   ) "

                    End If

                    If Request("datefilter") = 4 Then

                        DatesFilters = " and  (a.ArrivalDate between ''" + Request("datetimepickerdate1text") + "'' and ''" + Request("datetimepickerdate2text") + "''  or a.DepartureDate between ''" + Request("datetimepickerdate1text") + "'' and ''" + Request("datetimepickerdate2text") + "'' ) "

                    End If


                End If


                If Request("datetimepickerdate1text") <> "" And Request("datefilter") <> 0 And Request("datefilter") <> 4 And Request("datetimepickerdate2text") = "" Then


                    If Request("datefilter") = 1 Then

                        DatesFilters = " and a.ArrivalDate=''" + Request("datetimepickerdate1text") + "''     "
                    End If

                    If Request("datefilter") = 2 Then

                        DatesFilters = " and  a.DepartureDate=''" + Request("datetimepickerdate1text") + "''    "

                    End If

                    If Request("datefilter") = 3 Then

                        DatesFilters = " and  Convert(date ,a.Date_Register) =''" + Request("datetimepickerdate1text") + "'' "

                    End If

                    'If Request("datefilter") = 4 Then

                    '    DatesFilters = " and  (a.ArrivalDate between ''" + Request("datetimepickerdate1text") + "'' and ''" + Request("datetimepickerdate2text") + "''  or a.DepartureDate between ''" + Request("datetimepickerdate1text") + "'' and ''" + Request("datetimepickerdate2text") + "'' ) "

                    'End If


                End If





                Filters = Filters + DatesFilters


                'ORDER BY

                Dim OrderByValues() As String = Split(Request("OrderByList"), ",")
                Dim OrderTypeValues() As String = Split(Request("OrderTypeList"), ",")
                Dim OrderByFilters As String = ""



                If OrderByValues.Count <> 0 Then

                    OrderByFilters = "  order by   "

                    For i = 0 To OrderByValues.Count - 1

                        If OrderByValues(i) <> "0" And OrderTypeValues(i) <> "0" Then

                            If i = OrderByValues.Count - 1 Then

                                OrderByFilters += " , " + OrderByValues(i) + "   " + OrderTypeValues(i) + "  "
                            Else
                                OrderByFilters += "  " + OrderByValues(i) + "  " + OrderTypeValues(i) + "    "
                            End If



                        End If
                    Next

                    Order = Order + OrderByFilters

                End If




                Dim Query As String = " Exec sp_Groups_List 0  , '" + Filters + "' , '" + Order + "' "

                Dim CommandUser = New SqlCommand(Query, conn)

                'Return Content(Query.ToString)

                conn.Open()

                Dim Results = CommandUser.ExecuteReader()

                Dim hotel As String = ""

                If Results.HasRows Then

                    While Results.Read()

                        Select Case Results("Cve_Hotel")
                            Case "GCR"
                                hotel = "GCCUN"
                            Case "GPR"
                                hotel = "POPDC"
                            Case "RPR"
                                hotel = "ROPDC"
                            Case "TRC"
                                hotel = "HZLCUN"
                            Case "ZLJ"
                                hotel = "HZLJAM"
                            Case "ZVC"
                                hotel = "HZVCUN"
                            Case "ZVJ"
                                hotel = "HZVJAM"
                            Case "ZVL"
                                hotel = "HZLCA"
                            Case "ZVP"
                                hotel = "HZVPV"
                        End Select

                        GroupList.Add(New GroupsListData With {.Colum1 = hotel + "000" + Results("Id_Group").ToString, .Colum20 = Results("GroupName"), .Colum2 = Results("Date_Register"), .Colum3 = Results("Client"), .Colum22 = Results("Wholesale"), .Colum4 = Results("Market_Key"), .Colum5 = Results("Contact"), .Colum6 = Results("CordinatorGroup"), .Colum7 = Results("ArrivalDate"), .Colum8 = Results("DepartureDate"), .Colum9 = Results("Type_Name"), .Colum10 = Results("BookStatus"), .Colum11 = Results("PaymentStatus"), .Colum21 = Results("HotelStatus"), .Colum12 = hotel, .Colum13 = Results("RateProm"), .Colum14 = Results("TypeRate"), .Colum15 = Results("PeakRoom"), .Colum16 = Results("NumberRooms"), .Colum17 = "0.00", .Colum18 = Results("RevenueProm"), .Colum19 = Results("Id_Group"), .Colum23 = Results("CommissionAgent")})
                    End While


                End If
                Results.Close()


                Dim QueryDos = "Exec sp_Groups_List_Totals 0  , '" + Filters + "'   "
                Dim CommandUserTres = New SqlCommand(QueryDos, conn)

                Dim ResultsDos = CommandUserTres.ExecuteReader()

                If ResultsDos.HasRows Then

                    While ResultsDos.Read()

                        model.TotalRevenue = ResultsDos("RevenueProm")

                    End While


                End If
                ResultsDos.Close()


                conn.close()

                model.ListGroupDatain = GroupList


                Return PartialView("GroupListTable", model)

            End If


            Return View(model)
        End Function


        '
        ' GET: /Group/GroupDetail
        <Authorize()> _
        Function GroupDetail() As ActionResult
            UserPermissions("1,2,3,4")
            Dim model = New GroupsDetail
            Dim UsuariosLis = New List(Of GroupsRatesList)
            Dim ID_GROUP As Integer = 0
            Dim ListAvailability = New List(Of SelectListItem)
            Dim DocumentsLis = New List(Of GroupsDocList)
            Dim ListSchemePayments = New List(Of SelectListItem)
            'Dim ListSuites = New List(Of SuitesList)
            Dim BreakdownList = New List(Of GroupsBreakList)
            Dim BreakdownListGroupBy = New List(Of GroupsBreakList)
            Dim BreakdownVirtual = New List(Of GroupsBreakList)
            Dim ListPax = New List(Of SelectListItem)
            Dim LogBookList = New List(Of GroupsLogBookList)
            Dim PaymentList = New List(Of GroupsPaymentsList)
            Dim ListSalons = New List(Of SelectListItem)
            Dim EventsList = New List(Of GroupsEventsList)

            Dim ListGroupCordinator = New List(Of SelectListItem)
            Dim ListOnsiteCordinator = New List(Of SelectListItem)
            Dim ListEventCordinator = New List(Of SelectListItem)
            Dim ListEventSeller = New List(Of SelectListItem)


            ListAvailability.Add(New SelectListItem With {.Text = "", .Value = "", .Selected = False})

            model.Accion = 0

            model.GroupId = 0

            model.EditGroupData35 = 0

            If Request.QueryString("id") <> "" Then

                ID_GROUP = Request.QueryString("id")


                Dim Query As String
                Dim QueryDos As String
                Dim CommandUser
                Dim CommanRate
                Dim Results
                Dim ResultsDos
                Dim RevenueFinal As Double = 0
                Dim DateInit As Date
                Dim BanderaRevenue As Integer = 0
                Dim i As Integer = 0
                conn.Open()

                Query = "select *from Groups where Status_Data=1 and id_group=" + ID_GROUP.ToString + " "
                CommandUser = New SqlCommand(Query, conn)
                Results = CommandUser.ExecuteReader()
                If Results.HasRows Then
                    While Results.Read()
                        model.EditGroupData1 = Results("Cve_Hotel")
                        model.EditGroupData2 = Results("Wholesale")
                        model.EditGroupData3 = Results("NumberRooms")

                        Dim thisDate1 As Date = Results("ArrivalDate")
                        model.EditGroupData4 = thisDate1.ToString("yyyy-MM-dd")

                        Dim thisDate2 As Date = Results("DepartureDate")
                        model.EditGroupData5 = thisDate2.ToString("yyyy-MM-dd")

                        model.EditGroupData6 = Results("TypeRate")
                        model.EditGroupData7 = Results("Discount")
                        model.EditGroupData8 = Results("GroupName")
                        model.EditGroupData9 = Results("Market")
                        model.EditGroupData10 = Results("GroupType")
                        model.EditGroupData11 = Results("Allotment")
                        model.EditGroupData12 = Results("PeakRoom")
                        model.EditGroupData34 = Results("CommissionAgent")
                        model.EditGroupData13 = Results("AgencyType")
                        model.EditGroupData14 = Results("Company")
                        model.EditGroupData35 = Results("NumberNights")
                        model.EditGroupData15 = Results("Contact")
                        model.EditGroupData16 = Results("GroupCordinator")
                        model.EditGroupData17 = Results("OnsiteCordinator")
                        model.EditGroupData18 = Results("Channel")

                        Dim thisDate3 As Date = Results("TentativeArrivalDate")
                        model.EditGroupData19 = thisDate3.ToString("yyyy-MM-dd")

                        Dim thisDate4 As Date = Results("TentativeDepartureDate")
                        model.EditGroupData20 = thisDate4.ToString("yyyy-MM-dd")

                        model.GroupTypeRate = Results("TypeRate")
                        model.EditGroupData51 = IIf(Results("Package"), 1, 0)

                    End While
                End If
                Results.close()


                conn.close()




                conn.Open()

                QueryDos = "select *from Groups_Rates where Status_Data=1 and id_group=" + ID_GROUP.ToString + " order by Id_GroupRate "
                CommanRate = New SqlCommand(QueryDos, conn)
                ResultsDos = CommanRate.ExecuteReader()
                If ResultsDos.HasRows Then
                    While ResultsDos.Read()

                        If DateInit <> ResultsDos("Init_Date") Or i = 0 Then
                            DateInit = ResultsDos("Init_Date")
                            If i <> 0 Then
                                BanderaRevenue = 1
                            End If
                        End If

                        UsuariosLis.Add(New GroupsRatesList With {.InitDateRate = ResultsDos("Init_Date"), .EndDateRate = ResultsDos("End_Date"), .SuiteName = ResultsDos("Code_Room"), .SuiteCode = ResultsDos("Code_Room"), .RateSingle = ResultsDos("Rate_1"), .RateDouble = ResultsDos("Rate_2"), .RateTripleandFour = ResultsDos("Rate_Extra"), .RateFiveandSix = ResultsDos("Rate_ExtraX"), .RateChildrens = ResultsDos("Rate_C"), .RateTeensValue = ResultsDos("Rate_T"), .Availability = ResultsDos("Status"), .RateRevenue = ResultsDos("Num_Rooms") * Math.Ceiling(ResultsDos("Revenue")), .RatePax = ResultsDos("Num_Rooms"), .CommissionRate = ResultsDos("Commission"), .DiscountRate = ResultsDos("Promo"), .RateRevenuePerRoom = ResultsDos("Revenue"), .RateRevenueRoomNigth = ResultsDos("Rate_2") * 2})


                        If BanderaRevenue = 0 Then
                            RevenueFinal = RevenueFinal + ResultsDos("Num_Rooms") * Math.Ceiling(ResultsDos("Revenue"))
                        End If


                        i = i + 1

                    End While
                End If
                ResultsDos.close()


                conn.close()


                Dim QueryDoc As String = " SELECT *FROM Documents WHERE Id_Group=" + ID_GROUP.ToString + " order by Id_Document desc "
                Dim CommandUserDoc = New SqlCommand(QueryDoc, conn)


                conn.Open()

                Dim ResultsDoc = CommandUserDoc.ExecuteReader()

                If ResultsDoc.HasRows Then
                    While ResultsDoc.Read()
                        DocumentsLis.Add(New GroupsDocList With {.TypeDocument = ResultsDoc("Type_Document"), .Actions = ResultsDoc("Actions"), .User = ResultsDoc("User_Action"), .DateRegister = ResultsDoc("Date_Register"), .URL = ResultsDoc("URL")})
                    End While
                End If
                ResultsDoc.Close()

                conn.close()


                Dim QueryDocSC As String = " select top 1 *from Documents where Id_Group=" + ID_GROUP.ToString + " order by Date_Register desc "
                Dim CommandUserDocSC = New SqlCommand(QueryDocSC, conn)


                conn.Open()

                Dim ResultsDocSC = CommandUserDocSC.ExecuteReader()

                If ResultsDocSC.HasRows Then
                    While ResultsDocSC.Read()
                        model.EditGroupData50 = "" & ResultsDocSC("Additionanl_SC")
                    End While
                End If
                ResultsDocSC.Close()

                conn.close()



                Dim QueryScheme As String = " Select * from Groups_SchemePayments where Id_Group=" + ID_GROUP.ToString + " and Status_Data=1 order by NumberPayment   "
                Dim CommandUserScheme = New SqlCommand(QueryScheme, conn)
                Dim SchemeDate As Date

                conn.Open()

                Dim ResultsScheme = CommandUserScheme.ExecuteReader()

                If ResultsScheme.HasRows Then
                    While ResultsScheme.Read()
                        SchemeDate = ResultsScheme("DatePayment")
                        ListSchemePayments.Add(New SelectListItem With {.Text = SchemeDate.ToString("yyyy-MM-dd"), .Value = ResultsScheme("Amount")})
                    End While
                End If
                ResultsScheme.Close()

                conn.close()


                'Dim QuerySuites As String = " select distinct a.Clave_TC,a.Nomb_TC_Act,a.SuiteOrden from vw_Tipo_Cuarto a left join Groups_Rates b on a.Clave_TC=b.Code_Room where a.Clav_Hotel='" + model.EditGroupData1 + "' and b.Id_Group=" + ID_GROUP.ToString + " order by a.SuiteOrden  "
                'Dim CommandUserSuites = New SqlCommand(QuerySuites, conn)


                'conn.Open()

                'Dim ResultsSuites = CommandUserSuites.ExecuteReader()

                'If ResultsSuites.HasRows Then
                '    While ResultsSuites.Read()

                '        ListSuites.Add(New SuitesList With {.Text = ResultsSuites("Nomb_TC_Act"), .Value = ResultsSuites("Clave_TC")})
                '    End While
                'End If
                'ResultsSuites.Close()
                'conn.close()

                'ByVal model As Object, ByVal DatosObjeto As Object, ByVal IdGroup As String, ByVal GroupBy As String

                'BEGIN: llena el modelo con los datos del break down
                Dim DatosObjeto As New Dictionary(Of String, String)
                DatosObjeto.Add("Id_Group", ID_GROUP.ToString)

                GetDataBreakDown(model, DatosObjeto, ID_GROUP.ToString, 0)
                'END: llena el modelo con los datos del break down

                conn.Open()

                Dim QueryLogBook = "Select *from LogBook where Id_group=" + ID_GROUP.ToString + " and Status_Data=1 order by Date_Register desc "
                Dim CommandLogBook = New SqlCommand(QueryLogBook, conn)

                Dim ResultsLogBook = CommandLogBook.ExecuteReader()

                If ResultsLogBook.HasRows Then
                    While ResultsLogBook.Read()

                        LogBookList.Add(New GroupsLogBookList With {.LogBookID = ResultsLogBook("Id_LoogBook"), .InputType = ResultsLogBook("Input_Type"), .NotesLogBook = ResultsLogBook("Notes"), .UserLogBook = ResultsLogBook("User_LogBook"), .DateLogBook = ResultsLogBook("Date_Register")})

                    End While
                End If
                ResultsLogBook.Close()



                Dim QueryPayments = "Select *from Payments where Id_group=" + ID_GROUP.ToString + " and Status_Data=1 order by Date_Register desc "
                Dim CommandPayment = New SqlCommand(QueryPayments, conn)
                Dim DateValidated As String
                Dim ResultsPayment = CommandPayment.ExecuteReader()

                If ResultsPayment.HasRows Then
                    While ResultsPayment.Read()
                        If IsDBNull(ResultsPayment("Date_Validated")) Then
                            DateValidated = ""
                        Else
                            DateValidated = ResultsPayment("Date_Validated")
                        End If
                        PaymentList.Add(New GroupsPaymentsList With {.RoomID = ResultsPayment("Id_Breakdown"), .EventID = ResultsPayment("Id_Event"), .FolioPayment = ResultsPayment("Folio_Code_PMS"), .DateValidatedPayment = DateValidated, .AppliedPayment = ResultsPayment("AppliedPayment"), .StatusPayment = ResultsPayment("Status_Payment"), .UserValidatedPayment = ResultsPayment("User_Validated"), .DateRegisterPayment = ResultsPayment("Date_Register"), .UserResgisterPayment = ResultsPayment("User_Register"), .ValidatedPayment = ResultsPayment("Status_Validated"), .AmountPayment = ResultsPayment("Quantity"), .DescriptionPayment = ResultsPayment("Special_Notes"), .TypeCurrencyPayment = ResultsPayment("Type_Currency"), .TypePayment = ResultsPayment("Type_Payment"), .PaymentID = ResultsPayment("Id_Payment")})

                    End While
                End If
                ResultsPayment.Close()


                Dim QuerySalon As String = " Select id_Salon , Nombre from vw_Locations where Clav_Hotel='" + model.EditGroupData1 + "' order by Nombre  "
                Dim CommandSalon = New SqlCommand(QuerySalon, conn)

                Dim ResultsSalon = CommandSalon.ExecuteReader()

                If ResultsSalon.HasRows Then
                    While ResultsSalon.Read()

                        ListSalons.Add(New SelectListItem With {.Text = ResultsSalon("Nombre"), .Value = ResultsSalon("id_Salon")})
                    End While
                End If
                ResultsSalon.Close()



                Dim QueryEvetns = "Select *from Events where Id_group=" + ID_GROUP.ToString + " and Status_Data=1 order by Date_Register desc "
                Dim CommandEvents = New SqlCommand(QueryEvetns, conn)

                Dim ResultsEvents = CommandEvents.ExecuteReader()

                If ResultsEvents.HasRows Then
                    While ResultsEvents.Read()

                        EventsList.Add(New GroupsEventsList With {.EventID = ResultsEvents("Id_Event"), .EventName = ResultsEvents("Event_Name"), .EventDate = ResultsEvents("Event_Date"), .EventStartTime = ResultsEvents("Event_StartTime"), .EventEndTime = ResultsEvents("Event_EndTime"), .EventSalonName = ResultsEvents("SalonName"), .EventStatus = ResultsEvents("Status_Event"), .EventPax = ResultsEvents("Num_Pax"), .EventSellerName = ResultsEvents("Event_Seller"), .EventCordinatorName = ResultsEvents("Event_Cordinator"), .EventDeposits = ResultsEvents("Deposits"), .EventBalance = ResultsEvents("Balance"), .EventRevenue = ResultsEvents("Revenue"), .EventUserRegister = ResultsEvents("User_Register"), .EventDateRegister = ResultsEvents("Date_Register")})

                    End While
                End If
                ResultsEvents.Close()


                Dim QueryStatus = "select a.PaymentStatus, B.BookStatus, c.HotelStatus from(select Group_Status as PaymentStatus, Id_Group from Groups_Status where Id_Group=" + ID_GROUP.ToString + " and Type_Status=1 and Status_Data=1)a left join (select Group_Status as BookStatus, Id_Group from Groups_Status where Id_Group=" + ID_GROUP.ToString + " and Type_Status=2 and Status_Data=1)b on a.Id_Group=b.Id_Group left join (select Group_Status as HotelStatus, Id_Group from Groups_Status where Id_Group=" + ID_GROUP.ToString + " and Type_Status=3 and Status_Data=1)c on a.Id_Group=c.Id_Group "
                Dim CommandStatus = New SqlCommand(QueryStatus, conn)

                Dim ResultsStatus = CommandStatus.ExecuteReader()

                If ResultsStatus.HasRows Then
                    While ResultsStatus.Read()

                        model.GroupStatusPayment = ResultsStatus("PaymentStatus")
                        model.GroupStatusBook = ResultsStatus("BookStatus")
                        model.GroupStatusHotel = ResultsStatus("HotelStatus")

                    End While
                End If
                ResultsStatus.Close()


                conn.close()


                model.RevenueFinal = RevenueFinal
                model.GroupId = Request.QueryString("id")
                model.GroupIdLabel = model.EditGroupData1

                Select Case model.EditGroupData1
                    Case "GCR"
                        model.GroupHotelNew = "GCCUN"
                    Case "GPR"
                        model.GroupHotelNew = "POPDC"
                    Case "RPR"
                        model.GroupHotelNew = "ROPDC"
                    Case "TRC"
                        model.GroupHotelNew = "HZLCUN"
                    Case "ZLJ"
                        model.GroupHotelNew = "HZLJAM"
                    Case "ZVC"
                        model.GroupHotelNew = "HZVCUN"
                    Case "ZVJ"
                        model.GroupHotelNew = "HZVJAM"
                    Case "ZVL"
                        model.GroupHotelNew = "HZLCA"
                    Case "ZVP"
                        model.GroupHotelNew = "HZVPV"
                End Select


                model.Accion = 3

            Else

                UsuariosLis.Add(New GroupsRatesList With {.SuiteName = "N/A", .SuiteCode = "N/A", .RateSingle = 0, .RateDouble = 0, .RateTripleandFour = 0, .RateChildrens = 0, .RateTeensValue = 0, .Availability = "Available"})

                model.TotalNumRooms = 0
                model.TotalDeployRooms = 0
                model.TotalTentativeRooms = 0
                model.TotalAdults = 0
                model.TotalTeens = 0
                model.TotalChildrens = 0
                model.TotalInfants = 0
                model.TotalBalance = 0
                model.TotalDeposit = 0
                model.TotalRevenue = 0
                model.GroupBy = 0

            End If

            Dim QueryListuno As String = "Select Id_Type,[TYPE_NAME] as Name from Cat_GroupType where Status_Data=1 "
            Dim CommandUserListuno = New SqlCommand(QueryListuno, conn)
            Dim ListGroupType = New List(Of SelectListItem)

            conn.Open()

            Dim ResultsListuno = CommandUserListuno.ExecuteReader()

            If ResultsListuno.HasRows Then
                While ResultsListuno.Read()
                    ListGroupType.Add(New SelectListItem With {.Text = ResultsListuno("Name"), .Value = ResultsListuno("Id_Type"), .Selected = False})
                End While
            End If
            ResultsListuno.Close()

            conn.close()


            Dim QueryListDos As String = "Select Id_Market, Market_Name from Cat_Markets where Status_Data=1 order by Market_Name "
            Dim CommandUserListDos = New SqlCommand(QueryListDos, conn)
            Dim ListMarkets = New List(Of SelectListItem)

            conn.Open()

            Dim ResultsListDos = CommandUserListDos.ExecuteReader()

            If ResultsListDos.HasRows Then
                While ResultsListDos.Read()
                    ListMarkets.Add(New SelectListItem With {.Text = ResultsListDos("Market_Name"), .Value = ResultsListDos("Id_Market"), .Selected = False})
                End While
            End If
            ResultsListDos.Close()

            conn.close()


            Dim QueryListTres As String = "Select Id_Type, [TYPE_NAME] as Name from Cat_AgencyType where Status_Data=1 order by [TYPE_NAME] "
            Dim CommandUserListTres = New SqlCommand(QueryListTres, conn)
            Dim ListAgencyType = New List(Of SelectListItem)

            conn.Open()

            Dim ResultsListTres = CommandUserListTres.ExecuteReader()

            If ResultsListTres.HasRows Then
                While ResultsListTres.Read()
                    ListAgencyType.Add(New SelectListItem With {.Text = ResultsListTres("Name"), .Value = ResultsListTres("Id_Type"), .Selected = False})
                End While
            End If
            ResultsListTres.Close()

            conn.close()


            Dim QueryListCuatro As String = "select Id_User , [User_Name] + ' ' + Last_Name as UserName from Cat_Users where Type_User=2 order by [User_Name] "
            Dim CommandUserListCuatro = New SqlCommand(QueryListCuatro, conn)

            conn.Open()

            Dim ResultsListCuatro = CommandUserListCuatro.ExecuteReader()

            If ResultsListCuatro.HasRows Then
                While ResultsListCuatro.Read()
                    ListGroupCordinator.Add(New SelectListItem With {.Text = ResultsListCuatro("UserName"), .Value = ResultsListCuatro("Id_User"), .Selected = False})
                End While
            End If
            ResultsListCuatro.Close()

            conn.close()


            Dim QueryListCinco As String = "select Id_User , [User_Name] + ' ' + Last_Name as UserName from Cat_Users where Type_User=3 order by [User_Name] "
            Dim CommandUserListCinco = New SqlCommand(QueryListCinco, conn)

            conn.Open()

            Dim ResultsListCinco = CommandUserListCinco.ExecuteReader()

            If ResultsListCinco.HasRows Then
                While ResultsListCinco.Read()
                    ListOnsiteCordinator.Add(New SelectListItem With {.Text = ResultsListCinco("UserName"), .Value = ResultsListCinco("Id_User"), .Selected = False})
                End While
            End If
            ResultsListCinco.Close()

            conn.close()


            Dim QueryListSeis As String = "select Id_User , [User_Name] + ' ' + Last_Name as UserName from Cat_Users where Type_User=5 order by [User_Name] "
            Dim CommandUserListSeis = New SqlCommand(QueryListSeis, conn)

            conn.Open()

            Dim ResultsListSeis = CommandUserListSeis.ExecuteReader()

            If ResultsListSeis.HasRows Then
                While ResultsListSeis.Read()
                    ListEventCordinator.Add(New SelectListItem With {.Text = ResultsListSeis("UserName"), .Value = ResultsListSeis("Id_User"), .Selected = False})
                End While
            End If
            ResultsListSeis.Close()

            conn.close()


            Dim QueryListSiete As String = "select Id_User , [User_Name] + ' ' + Last_Name as UserName from Cat_Users where Type_User=4 order by [User_Name] "
            Dim CommandUserListSiete = New SqlCommand(QueryListSiete, conn)

            conn.Open()

            Dim ResultsListSiete = CommandUserListSiete.ExecuteReader()

            If ResultsListSiete.HasRows Then
                While ResultsListSiete.Read()
                    ListEventSeller.Add(New SelectListItem With {.Text = ResultsListSiete("UserName"), .Value = ResultsListSiete("Id_User"), .Selected = False})
                End While
            End If
            ResultsListSiete.Close()


            Dim QueryCountry As String = "select distinct ISO_2CAR,ISO_PAIS_ES from ISO_3166 where ISO_PAIS_ES is not null and ISO_2CAR in('MX','US') order by ISO_PAIS_ES  "

            Dim CommandCountry = New SqlCommand(QueryCountry, conn)
            Dim ResultCountry = CommandCountry.ExecuteReader()
            Dim CountryLis = New List(Of SelectListItem)

            If ResultCountry.HasRows Then
                While ResultCountry.Read()

                    CountryLis.Add(New SelectListItem With {.Text = ResultCountry("ISO_PAIS_ES"), .Value = ResultCountry("ISO_2CAR")})

                End While

            End If
            ResultCountry.Close()

            Dim QueryState As String = "select Iso_pais_region,region from ISO_3166 where region<>'' and ISO_2CAR in('MX','US')  order by REGION  "


            Dim CommandState = New SqlCommand(QueryState, conn)
            Dim ResultState = CommandState.ExecuteReader()
            Dim EstadoLis = New List(Of SelectListItem)

            If ResultState.HasRows Then
                While ResultState.Read()

                    EstadoLis.Add(New SelectListItem With {.Text = ResultState("region"), .Value = ResultState("Iso_pais_region")})

                End While

            End If
            ResultState.Close()

            conn.close()

            model.ListCountryin = CountryLis
            model.ListStatein = EstadoLis
            model.ListOnsiteCordinatorin = ListOnsiteCordinator
            model.ListGroupCordinatorin = ListGroupCordinator
            model.ListEventCordinatorin = ListEventCordinator
            model.ListEventSellerin = ListEventSeller


            model.ListGroupEventsin = EventsList
            model.ListaSalonsxin = ListSalons
            model.ListGroupPaymentsin = PaymentList
            model.ListGroupLogBookin = LogBookList
            model.ListaGroupTypein = ListGroupType
            model.ListaGroupMarketin = ListMarkets
            model.ListaAgencyTypein = ListAgencyType
            'model.ListaSuitein = ListSuites
            model.ListaBreakdownPaxin = ListPax
            model.ListaSchemePaymentsin = ListSchemePayments
            model.ListGroupDocumentsin = DocumentsLis
            model.ListaAvailabilityin = ListAvailability
            model.ListGroupRatesin = UsuariosLis

            Return View(model)
        End Function

        '
        ' POST: /Group/GroupDetail
        <HttpPost()> _
        Public Function GroupDetail(ByVal model As GroupsDetail, ByVal GroupDetailBotons As String, Doc_File As HttpPostedFileBase) As ActionResult
            UserPermissions("1,2,3,4")

            If GroupDetailBotons = "ConsultRateForm" Or GroupDetailBotons = "Consult_Revenue" Or GroupDetailBotons = "ConsultRateFormChosen" Or GroupDetailBotons = "ConsultRateFormMICE" Then

                Dim BanderaMICE As Integer = 0


                If (Request("numberpax") > 38 And Request("selectyperatecotizar") <> 5 And GroupDetailBotons = "ConsultRateForm" And Request("selectgrouptype") <> 1) Then
                    BanderaMICE = 1
                End If


                If (Request("numberpax") > 75 And Request("selectyperatecotizar") <> 5 And GroupDetailBotons = "ConsultRateForm" And Request("selectgrouptype") <> 6) Then
                    BanderaMICE = 2
                End If


                If (Request("numberpax") > 40 And GroupDetailBotons = "ConsultRateForm" And Request("selectgrouptype") = 6) Then
                    BanderaMICE = 3
                End If


                If BanderaMICE <> 0 Then

                    Dim UsuariosLis = New List(Of GroupsRatesList)

                    model.ListGroupRatesin = UsuariosLis
                    model.RevenueFinal = 0

                    If BanderaMICE = 1 Then
                        model.Accion = 10
                    End If

                    If BanderaMICE = 2 Then
                        model.Accion = 11
                    End If

                    If BanderaMICE = 3 Then
                        model.Accion = 12
                    End If

                    model.GroupId = Request("grupoidlabeltext")
                    model.GroupTypeRate = Request("selectyperatecotizar")
                    model.EditGroupData7 = 0


                    Return PartialView("RatesConsult", model)


                Else

                    Dim TypeRateValue As String = ""

                    If GroupDetailBotons = "ConsultRateFormMICE" Then
                        TypeRateValue = "5"
                    Else
                        If GroupDetailBotons = "Consult_Revenue" Then
                            TypeRateValue = Request("selectratetype")
                        Else
                            TypeRateValue = Request("selectyperatecotizar")
                        End If
                    End If


                    If TypeRateValue = "1" Then

                        Dim ListaPaxRevenue() As String
                        Dim PercentajeDiscount As Double

                        If GroupDetailBotons = "Consult_Revenue" Then

                            Dim ListaPax As String

                            ListaPax = Request("List_Pax").ToArray()

                            ListaPaxRevenue = Split(ListaPax, ",")


                            Dim AuxDiscount As Double

                            If Not IsNumeric(Request("DiscountRate")) Then

                                PercentajeDiscount = 1
                                model.EditGroupData7 = 0
                            Else

                                AuxDiscount = Request("DiscountRate")
                                PercentajeDiscount = (100 - AuxDiscount) / 100
                                model.EditGroupData7 = AuxDiscount

                            End If


                        End If


                        Dim xml As String

                        Dim WhosaleValue() As String = Split(Request("WhosaleDetail"), ":")

                        If WhosaleValue(0) = "" Then

                            WhosaleValue(0) = "BAR"

                        End If

                        xml = "<?xml version=""1.0"" encoding=""utf-8""?> " & _
                        "<soap:Envelope xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" " & _
                        "xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" " & _
                        "xmlns:soap=""http://schemas.xmlsoap.org/soap/envelope/""><soap:Body>" & _
                        "<WS_Request2 xmlns=""http://tempuri.org/Cotizador/Tarifas"">" & _
                        "<Hotel>" + Request("HotelSelect") + "</Hotel>" & _
                         "<Agencia>" + WhosaleValue(0) + "</Agencia>" & _
                          "<Llegada>" + Request("datetimepicker6text") + "</Llegada>" & _
                           "<Salida>" + Request("datetimepicker7text") + "</Salida>" & _
                           "<SoloDisponibilidad>0</SoloDisponibilidad>" & _
                        " </WS_Request2>" & _
                        "</soap:Body></soap:Envelope>"


                        Dim data As String = xml
                        Dim url As String = "http://1.2.0.39/cotizador/tarifas.asmx"
                        Dim responsestring As String = ""

                        Dim myReq As HttpWebRequest = WebRequest.Create(url)
                        Dim proxy As IWebProxy = CType(myReq.Proxy, IWebProxy)
                        Dim proxyaddress As String
                        Dim myProxy As New WebProxy()
                        Dim encoding As New ASCIIEncoding
                        Dim buffer() As Byte = encoding.GetBytes(xml)
                        Dim response As String

                        myReq.AllowWriteStreamBuffering = False
                        myReq.Method = "POST"
                        myReq.ContentType = "text/xml; charset=UTF-8"
                        myReq.ContentLength = buffer.Length
                        myReq.Headers.Add("SOAPAction", "http://tempuri.org/Cotizador/Tarifas/WS_Request2")
                        'myReq.Credentials = New NetworkCredential("abc", "123")
                        myReq.PreAuthenticate = False
                        proxyaddress = proxy.GetProxy(myReq.RequestUri).ToString

                        Dim newUri As New Uri(proxyaddress)
                        myProxy.Address = newUri
                        myReq.Proxy = myProxy
                        Dim post As Stream = myReq.GetRequestStream

                        post.Write(buffer, 0, buffer.Length)
                        post.Close()

                        Dim myResponse As HttpWebResponse = myReq.GetResponse
                        Dim responsedata As Stream = myResponse.GetResponseStream
                        Dim responsereader As New StreamReader(responsedata)

                        response = responsereader.ReadToEnd

                        Dim Documents As New XmlDocument
                        Documents.LoadXml(response)

                        Dim nodelist As XmlNodeList = Documents.GetElementsByTagName("Tarifa")
                        Dim UsuariosLis = New List(Of GroupsRatesList)
                        Dim RevenueFinal As Double = 0
                        Dim i As Integer = 0
                        Dim NumberPaxAuxDos As String = "0"

                        If GroupDetailBotons = "Consult_Revenue" Then

                            For Each node As XmlElement In nodelist

                                If node.Attributes("Status").Value = "Available" Then

                                    If IsNumeric(ListaPaxRevenue(i)) Then
                                        NumberPaxAuxDos = ListaPaxRevenue(i)
                                        NumberPaxAuxDos.Replace(" ", "")
                                    Else
                                        NumberPaxAuxDos = "0"
                                    End If

                                    UsuariosLis.Add(New GroupsRatesList With {.SuiteName = node.Attributes("Suite").Value, .SuiteCode = node.Attributes("Suite").Value, .RateSingle = node.Attributes("Rate_1").Value, .RateDouble = (node.Attributes("Rate_2").Value * PercentajeDiscount), .RateTripleandFour = node.Attributes("Rate_Extra").Value, .RateChildrens = node.Attributes("Rate_C").Value, .RateTeensValue = node.Attributes("Rate_T").Value, .Availability = node.Attributes("Status").Value, .RateRevenue = NumberPaxAuxDos * (((node.Attributes("Rate_2").Value * PercentajeDiscount) * 2)), .RatePax = NumberPaxAuxDos})

                                    RevenueFinal = RevenueFinal + NumberPaxAuxDos * ((node.Attributes("Rate_2").Value * PercentajeDiscount) * 2)

                                    i = i + 1

                                Else
                                    UsuariosLis.Add(New GroupsRatesList With {.SuiteName = node.Attributes("Suite").Value, .SuiteCode = node.Attributes("Suite").Value, .RateSingle = node.Attributes("Rate_1").Value, .RateDouble = node.Attributes("Rate_2").Value, .RateTripleandFour = node.Attributes("Rate_Extra").Value, .RateChildrens = node.Attributes("Rate_C").Value, .RateTeensValue = node.Attributes("Rate_T").Value, .Availability = node.Attributes("Status").Value, .RateRevenue = 0, .RatePax = 0})

                                End If

                            Next



                        Else

                            For Each node As XmlElement In nodelist

                                If i = 0 And Request("numberpax") <> "" And node.Attributes("Status").Value = "Available" Then

                                    UsuariosLis.Add(New GroupsRatesList With {.SuiteName = node.Attributes("Suite").Value, .SuiteCode = node.Attributes("Suite").Value, .RateSingle = node.Attributes("Rate_1").Value, .RateDouble = node.Attributes("Rate_2").Value, .RateTripleandFour = node.Attributes("Rate_Extra").Value, .RateChildrens = node.Attributes("Rate_C").Value, .RateTeensValue = node.Attributes("Rate_T").Value, .Availability = node.Attributes("Status").Value, .RateRevenue = Request("numberpax") * (node.Attributes("Rate_2").Value * 2), .RatePax = Request("numberpax")})
                                    RevenueFinal = RevenueFinal + Request("numberpax") * (node.Attributes("Rate_2").Value * 2)
                                Else

                                    UsuariosLis.Add(New GroupsRatesList With {.SuiteName = node.Attributes("Suite").Value, .SuiteCode = node.Attributes("Suite").Value, .RateSingle = node.Attributes("Rate_1").Value, .RateDouble = node.Attributes("Rate_2").Value, .RateTripleandFour = node.Attributes("Rate_Extra").Value, .RateChildrens = node.Attributes("Rate_C").Value, .RateTeensValue = node.Attributes("Rate_T").Value, .Availability = node.Attributes("Status").Value, .RateRevenue = 0, .RatePax = 0})
                                    RevenueFinal = RevenueFinal + 0
                                End If


                                If node.Attributes("Status").Value = "Available" Then
                                    i = i + 1
                                End If


                            Next

                        End If


                        model.ListGroupRatesin = UsuariosLis

                        model.RevenueFinal = RevenueFinal
                        model.Accion = 2
                        model.GroupId = Request("grupoidlabeltext")


                        If GroupDetailBotons = "Consult_Revenue" Then

                            model.GroupTypeRate = Request("selectratetype")

                        Else
                            model.GroupTypeRate = TypeRateValue
                            model.EditGroupData7 = 0
                        End If

                        Return PartialView("RatesConsult", model)
                    End If




                    If TypeRateValue = "2" Or TypeRateValue = "3" Then


                        Dim ListaPaxRevenue() As String
                        Dim ListaSuitesPax() As String
                        Dim ListaRate() As String

                        Dim RateDobleBase = 0

                        If GroupDetailBotons = "Consult_Revenue" Then

                            Dim ListaPax As String
                            Dim Listasuites As String

                            ListaPax = Request("List_Pax1").ToArray()

                            ListaPaxRevenue = Split(ListaPax, ",")

                            Listasuites = Request("List_Suites").ToArray()

                            ListaSuitesPax = Split(Listasuites, ",")

                            Dim ListaRateDoble As String

                            If Request("List_DoubleRate") <> "" Then

                                ListaRateDoble = Request("List_DoubleRate").ToArray()

                                ListaRate = Split(ListaRateDoble, ",")

                                RateDobleBase = ListaRate(0)

                            End If

                            Dim PercentajeDiscount As Double
                            Dim AuxDiscount As Double

                            If Not IsNumeric(Request("DiscountRate")) Then

                                PercentajeDiscount = 1
                                model.EditGroupData7 = 0
                            Else

                                AuxDiscount = Request("DiscountRate")
                                PercentajeDiscount = (100 - AuxDiscount) / 100
                                model.EditGroupData7 = AuxDiscount

                            End If



                        End If

                        Dim WhosaleValue() As String = Split(Request("WhosaleDetail"), ":")

                        If WhosaleValue(0) = "" Then

                            WhosaleValue(0) = "BAR"

                        End If


                        Dim UsuariosLis = New List(Of GroupsRatesList)
                        Dim RevenueFinal As Double = 0
                        Dim i As Integer = 0
                        Dim j As Integer = 0
                        Dim QueryDos As String


                        conn.Open()

                        Try


                            QueryDos = " Select a.*, '" + Request("datetimepicker6text") + "' as VigenciaI , '" + Request("datetimepicker7text") + "' as VigenciaF , DATEDIFF(day,'" + Request("datetimepicker6text") + "' , '" + Request("datetimepicker7text") + "') as Nights from vw_Tipo_Cuarto a where a.Clav_Hotel='" + Request("HotelSelect") + "' order by a.SuiteOrden  "
                            Dim CommandUserTres = New SqlCommand(QueryDos, conn)
                            CommandUserTres.CommandTimeout = 0
                            Dim Results = CommandUserTres.ExecuteReader()
                            Dim NumberPax As Integer = 0
                            Dim NumberPaxAux As Integer = 0
                            Dim DateInit As Date
                            Dim NumberPaxAuxDos As String = "0"
                            Dim BanderaRevenue As Integer = 0
                            Dim BanderaPax As Integer = 0
                            Dim AvailabilityAux As String
                            Dim AvailabilityAuxConsultRate(2) As String

                            Dim ListAvailability = New List(Of SelectListItem)

                            If Request("numberpax") <> "" Then
                                NumberPax = Request("numberpax")
                            End If

                            Dim nodelist As XmlNodeList
                            nodelist = GetAvailability()

                            If Results.HasRows Then
                                While Results.Read()

                                    If GroupDetailBotons = "Consult_Revenue" Then

                                        'AvailabilityAux = Availability(Results("Clave_TC"), nodelist)
                                        AvailabilityAux = "Available"

                                        j = 0

                                        While ListaSuitesPax(j) <> Results("Clave_TC") And ListaSuitesPax.Count - 1 > j

                                            j = j + 1
                                        End While

                                        If ListaSuitesPax(j) = Results("Clave_TC") And IsNumeric(ListaPaxRevenue(j)) Then
                                            NumberPaxAuxDos = ListaPaxRevenue(j)
                                            NumberPaxAuxDos.Replace(" ", "")
                                        Else
                                            NumberPaxAuxDos = "0"
                                        End If

                                        If TypeRateValue = "2" Then

                                            If Request("List_DoubleRate") <> "" Then
                                                RateDobleBase = ListaRate(i)
                                            End If

                                            UsuariosLis.Add(New GroupsRatesList With {.InitDateRate = Results("VigenciaI"), .EndDateRate = Results("VigenciaF"), .SuiteName = Results("Clave_TC"), .SuiteCode = Results("Clave_TC"), .RateSingle = RateDobleBase * 1.6, .RateDouble = RateDobleBase, .RateTripleandFour = RateDobleBase * 0.8, .RateFiveandSix = RateDobleBase * 0.8, .RateChildrens = RateDobleBase * 0.4, .RateTeensValue = RateDobleBase * 0.7, .Availability = AvailabilityAux, .RateRevenue = NumberPaxAuxDos * Math.Ceiling((RateDobleBase * 2) * Results("Nights")), .RatePax = NumberPaxAuxDos, .CommissionRate = 0, .DiscountRate = 0, .RateRevenuePerRoom = (RateDobleBase * 2) * Results("Nights"), .RateRevenueRoomNigth = RateDobleBase})

                                            RevenueFinal = RevenueFinal + NumberPaxAuxDos * Math.Ceiling((RateDobleBase * 2) * Results("Nights"))

                                        Else
                                            RateDobleBase = RateDobleBase + Results("ITA")

                                            UsuariosLis.Add(New GroupsRatesList With {.InitDateRate = Results("VigenciaI"), .EndDateRate = Results("VigenciaF"), .SuiteName = Results("Clave_TC"), .SuiteCode = Results("Clave_TC"), .RateSingle = RateDobleBase * 1.6, .RateDouble = RateDobleBase, .RateTripleandFour = RateDobleBase * 0.8, .RateFiveandSix = RateDobleBase * 0.8, .RateChildrens = RateDobleBase * 0.4, .RateTeensValue = RateDobleBase * 0.7, .Availability = AvailabilityAux, .RateRevenue = NumberPaxAuxDos * Math.Ceiling((RateDobleBase * 2) * Results("Nights")), .RatePax = NumberPaxAuxDos, .CommissionRate = 0, .DiscountRate = 0, .RateRevenuePerRoom = (RateDobleBase * 2) * Results("Nights"), .RateRevenueRoomNigth = RateDobleBase})

                                            RevenueFinal = RevenueFinal + NumberPaxAuxDos * Math.Ceiling((RateDobleBase * 2) * Results("Nights"))
                                        End If



                                    Else



                                        AvailabilityAuxConsultRate = AvailabilityConsultRate(Results("Clave_TC"), nodelist)
                                        AvailabilityAuxConsultRate(0) = "Available"



                                        If (DateInit <> Results("VigenciaI") Or i = 0 Or i = 1) And AvailabilityAuxConsultRate(0) = "Available" Then



                                            If DateInit <> Results("VigenciaI") And i = 1 Then

                                                i = 2

                                            End If


                                            If i = 2 Then


                                                NumberPaxAux = 0

                                                For j = 0 To ListAvailability.Count - 1

                                                    If ListAvailability.Item(j).Text = Results("Clave_TC") Then
                                                        NumberPaxAux = ListAvailability.Item(j).Value
                                                    End If
                                                Next



                                            Else

                                                DateInit = Results("VigenciaI")
                                                i = 1

                                                If AvailabilityAuxConsultRate(1) >= NumberPax Then

                                                    NumberPaxAux = NumberPax
                                                    BanderaPax = 1
                                                    NumberPax = 0
                                                    ListAvailability.Add(New SelectListItem With {.Text = Results("Clave_TC"), .Value = NumberPaxAux, .Selected = False})
                                                Else

                                                    If AvailabilityAuxConsultRate(1) > 0 Then

                                                        NumberPax = NumberPax - AvailabilityAuxConsultRate(1)
                                                        NumberPaxAux = AvailabilityAuxConsultRate(1)

                                                        ListAvailability.Add(New SelectListItem With {.Text = Results("Clave_TC"), .Value = NumberPaxAux, .Selected = False})
                                                    Else

                                                        NumberPaxAux = 0

                                                        ListAvailability.Add(New SelectListItem With {.Text = Results("Clave_TC"), .Value = NumberPaxAux, .Selected = False})

                                                    End If


                                                End If


                                            End If


                                        Else
                                            NumberPaxAux = 0
                                            If BanderaPax <> 1 Then
                                                BanderaPax = 0
                                            End If

                                        End If



                                        'If i = 0 And AvailabilityAux = "Available" Then
                                        '    NumberPaxAux = NumberPax
                                        'Else
                                        '    NumberPaxAux = 0
                                        'End If

                                        'UsuariosLis.Add(New GroupsRatesList With {.InitDateRate = Results("VigenciaI"), .EndDateRate = Results("VigenciaF"), .SuiteName = Results("Clave_TC"), .SuiteCode = Results("Clave_TC"), .RateSingle = 0, .RateDouble = 0, .RateTripleandFour = 0, .RateFiveandSix = 0, .RateChildrens = 0, .RateTeensValue = 0, .Availability = AvailabilityAux, .RateRevenue = 0, .RatePax = NumberPaxAux, .CommissionRate = 0, .DiscountRate = 0, .RateRevenuePerRoom = 0, .RateRevenueRoomNigth = 0})

                                        UsuariosLis.Add(New GroupsRatesList With {.InitDateRate = Results("VigenciaI"), .EndDateRate = Results("VigenciaF"), .SuiteName = Results("Clave_TC"), .SuiteCode = Results("Clave_TC"), .RateSingle = 0, .RateDouble = 0, .RateTripleandFour = 0, .RateFiveandSix = 0, .RateChildrens = 0, .RateTeensValue = 0, .Availability = AvailabilityAuxConsultRate(0), .RateRevenue = 0, .RatePax = NumberPaxAux, .CommissionRate = 0, .DiscountRate = 0, .RateRevenuePerRoom = 0, .RateRevenueRoomNigth = 0})

                                    End If

                                    If GroupDetailBotons = "Consult_Revenue" And TypeRateValue = "2" Then

                                        i = i + 1

                                    End If



                                End While
                            End If

                        Catch ex As Exception

                            'Return Content("Error")

                            Return Content(ex.ToString)

                        End Try

                        conn.close()

                        model.ListGroupRatesin = UsuariosLis
                        model.RevenueFinal = RevenueFinal
                        model.Accion = 2
                        model.GroupId = Request("grupoidlabeltext")


                        Select Case Request("HotelSelect")
                            Case "GCR"
                                model.GroupHotelNew = "GCCUN"
                            Case "GPR"
                                model.GroupHotelNew = "POPDC"
                            Case "RPR"
                                model.GroupHotelNew = "ROPDC"
                            Case "TRC"
                                model.GroupHotelNew = "HZLCUN"
                            Case "ZLJ"
                                model.GroupHotelNew = "HZLJAM"
                            Case "ZVC"
                                model.GroupHotelNew = "HZVCUN"
                            Case "ZVJ"
                                model.GroupHotelNew = "HZVJAM"
                            Case "ZVL"
                                model.GroupHotelNew = "HZLCA"
                            Case "ZVP"
                                model.GroupHotelNew = "HZVPV"
                        End Select


                        If GroupDetailBotons = "Consult_Revenue" Then
                            model.GroupTypeRate = Request("selectratetype")
                        Else
                            model.GroupTypeRate = TypeRateValue
                            model.EditGroupData7 = 0
                        End If

                        Return PartialView("RatesConsult", model)

                    End If




                    If TypeRateValue = "4" Or TypeRateValue = "5" Then


                        Dim ListaPaxRevenue() As String
                        Dim ListaSuitesPax() As String

                        If GroupDetailBotons = "Consult_Revenue" Then

                            Dim ListaPax As String
                            Dim Listasuites As String

                            ListaPax = Request("List_Pax1").ToArray()

                            ListaPaxRevenue = Split(ListaPax, ",")

                            Listasuites = Request("List_Suites").ToArray()

                            ListaSuitesPax = Split(Listasuites, ",")

                            Dim PercentajeDiscount As Double
                            Dim AuxDiscount As Double

                            If Not IsNumeric(Request("DiscountRate")) Then

                                PercentajeDiscount = 1
                                model.EditGroupData7 = 0
                            Else

                                AuxDiscount = Request("DiscountRate")
                                PercentajeDiscount = (100 - AuxDiscount) / 100
                                model.EditGroupData7 = AuxDiscount

                            End If


                        End If

                        Dim WhosaleValue() As String = Split(Request("WhosaleDetail"), ":")

                        If WhosaleValue(0) = "" Then

                            WhosaleValue(0) = "BAR"

                        End If


                        Dim UsuariosLis = New List(Of GroupsRatesList)
                        Dim RevenueFinal As Double = 0
                        Dim i As Integer = 0
                        Dim j As Integer = 0
                        Dim QueryDos As String


                        conn.Open()

                        Try

                            If GroupDetailBotons = "Consult_Revenue" Then
                                If TypeRateValue = "4" Then
                                    QueryDos = " Exec sp_Rates_Compensacion '" + Request("datetimepicker6text") + "' , '" + Request("datetimepicker7text") + "', '" + Request("HotelSelect") + "' , '" + WhosaleValue(0) + "', @Package = " + Request("selectquotetype")
                                Else
                                    QueryDos = " Exec sp_Rates_MICE '" + Request("datetimepicker6text") + "' , '" + Request("datetimepicker7text") + "', '" + Request("HotelSelect") + "' , '" + WhosaleValue(0) + "'"
                                End If
                            Else
                                If TypeRateValue = "4" Then
                                    QueryDos = " Exec sp_Rates_Compensacion '" + Request("datetimepicker6text") + "' , '" + Request("datetimepicker7text") + "', '" + Request("HotelSelect") + "' , '" + WhosaleValue(0) + "', @Package = " + Request("selectquotetype")
                                Else
                                    QueryDos = " Exec sp_Rates_MICE '" + Request("datetimepicker6text") + "' , '" + Request("datetimepicker7text") + "', '" + Request("HotelSelect") + "' , '" + WhosaleValue(0) + "'"
                                End If

                            End If


                            Dim CommandUserTres = New SqlCommand(QueryDos, conn)
                            CommandUserTres.CommandTimeout = 0
                            Dim Results = CommandUserTres.ExecuteReader()
                            Dim NumberPax As Integer = 0
                            Dim NumberPaxAux As Integer = 0
                            Dim DateInit As Date
                            Dim NumberPaxAuxDos As String = "0"
                            Dim BanderaRevenue As Integer = 0
                            Dim BanderaPax As Integer = 0
                            Dim AvailabilityAux As String
                            Dim AvailabilityAuxConsultRate(2) As String

                            Dim ListAvailability = New List(Of SelectListItem)


                            If Request("numberpax") <> "" Then
                                NumberPax = Request("numberpax")
                            End If

                            Dim nodelist As XmlNodeList
                            nodelist = GetAvailability()

                            If Results.HasRows Then
                                While Results.Read()

                                    If GroupDetailBotons = "Consult_Revenue" Then

                                        AvailabilityAux = Availability(Results("Clave_TC"), nodelist)
                                        'AvailabilityAux = "Available"

                                        j = 0

                                        While ListaSuitesPax(j) <> Results("Clave_TC") And ListaSuitesPax.Count - 1 > j

                                            j = j + 1
                                        End While

                                        If ListaSuitesPax(j) = Results("Clave_TC") And IsNumeric(ListaPaxRevenue(j)) Then
                                            NumberPaxAuxDos = ListaPaxRevenue(j)
                                            NumberPaxAuxDos.Replace(" ", "")

                                        Else
                                            NumberPaxAuxDos = "0"
                                        End If

                                        If DateInit <> Results("VigenciaI") Or i = 0 Then
                                            DateInit = Results("VigenciaI")
                                            If i <> 0 Then
                                                BanderaRevenue = 1
                                            End If
                                        End If

                                        If TypeRateValue = "4" Then
                                            UsuariosLis.Add(New GroupsRatesList With {.InitDateRate = Results("VigenciaI"), .EndDateRate = Results("VigenciaF"), .SuiteName = Results("Clave_TC"), .SuiteCode = Results("Clave_TC"), .RateSingle = Results("Tar_1"), .RateDouble = Results("Base"), .RateTripleandFour = Results("Extra"), .RateFiveandSix = Results("ExtraX"), .RateChildrens = Results("Tar_N"), .RateTeensValue = Results("Tar_A"), .Availability = AvailabilityAux, .RateRevenue = NumberPaxAuxDos * Math.Ceiling(Results("TotalRevenue")), .RatePax = NumberPaxAuxDos, .CommissionRate = Results("Comision"), .DiscountRate = Results("Descuento"), .RateRevenuePerRoom = Results("TotalRevenue"), .RateRevenueRoomNigth = Results("Tar_2")})
                                        Else
                                            If Results("Rate") = 0 Then
                                                AvailabilityAux = "Close"
                                            End If
                                            UsuariosLis.Add(New GroupsRatesList With {.InitDateRate = Results("VigenciaI"), .EndDateRate = Results("VigenciaF"), .SuiteName = Results("Clave_TC"), .SuiteCode = Results("Clave_TC"), .RateSingle = Results("Tar_1"), .RateDouble = Results("Tar_2"), .RateTripleandFour = Results("Extra"), .RateFiveandSix = Results("ExtraX"), .RateChildrens = Results("Tar_N"), .RateTeensValue = Results("Tar_A"), .Availability = AvailabilityAux, .RateRevenue = NumberPaxAuxDos * Math.Ceiling(Results("TotalRevenue")), .RatePax = NumberPaxAuxDos, .CommissionRate = 0, .DiscountRate = 0, .RateRevenuePerRoom = Results("TotalRevenue"), .RateRevenueRoomNigth = Results("Tar_2")})
                                        End If


                                        If BanderaRevenue = 0 Then
                                            RevenueFinal = RevenueFinal + NumberPaxAuxDos * Math.Ceiling(Results("TotalRevenue"))
                                        End If

                                    Else

                                        'AvailabilityAux = Availability(Results("Clave_TC"), nodelist)
                                        AvailabilityAuxConsultRate = AvailabilityConsultRate(Results("Clave_TC"), nodelist)
                                        'AvailabilityAuxConsultRate(0) = "Available"



                                        If (DateInit <> Results("VigenciaI") Or i = 0 Or i = 1) And AvailabilityAuxConsultRate(0) = "Available" Then



                                            If DateInit <> Results("VigenciaI") And i = 1 Then

                                                i = 2

                                            End If


                                            If i = 2 Then


                                                NumberPaxAux = 0

                                                For j = 0 To ListAvailability.Count - 1

                                                    If ListAvailability.Item(j).Text = Results("Clave_TC") Then
                                                        NumberPaxAux = ListAvailability.Item(j).Value
                                                    End If
                                                Next



                                            Else

                                                DateInit = Results("VigenciaI")
                                                i = 1

                                                If AvailabilityAuxConsultRate(1) >= NumberPax Then

                                                    NumberPaxAux = NumberPax
                                                    BanderaPax = 1
                                                    NumberPax = 0
                                                    ListAvailability.Add(New SelectListItem With {.Text = Results("Clave_TC"), .Value = NumberPaxAux, .Selected = False})
                                                Else

                                                    If AvailabilityAuxConsultRate(1) > 0 Then

                                                        NumberPax = NumberPax - AvailabilityAuxConsultRate(1)
                                                        NumberPaxAux = AvailabilityAuxConsultRate(1)

                                                        ListAvailability.Add(New SelectListItem With {.Text = Results("Clave_TC"), .Value = NumberPaxAux, .Selected = False})
                                                    Else

                                                        NumberPaxAux = 0

                                                        ListAvailability.Add(New SelectListItem With {.Text = Results("Clave_TC"), .Value = NumberPaxAux, .Selected = False})

                                                    End If


                                                End If


                                                If BanderaRevenue = 0 Then
                                                    RevenueFinal = RevenueFinal + (NumberPaxAux * Math.Ceiling(Results("TotalRevenue")))

                                                End If


                                            End If


                                        Else
                                            NumberPaxAux = 0
                                            If BanderaPax <> 1 Then
                                                BanderaPax = 0
                                            End If

                                        End If

                                        If TypeRateValue = "4" Then
                                            UsuariosLis.Add(New GroupsRatesList With {.InitDateRate = Results("VigenciaI"), .EndDateRate = Results("VigenciaF"), .SuiteName = Results("Clave_TC"), .SuiteCode = Results("Clave_TC"), .RateSingle = Results("Tar_1"), .RateDouble = Results("Base"), .RateTripleandFour = Results("Extra"), .RateFiveandSix = Results("ExtraX"), .RateChildrens = Results("Tar_N"), .RateTeensValue = Results("Tar_A"), .Availability = AvailabilityAuxConsultRate(0), .RateRevenue = NumberPaxAux * Math.Ceiling(Results("TotalRevenue")), .RatePax = NumberPaxAux, .CommissionRate = Results("Comision"), .DiscountRate = Results("Descuento"), .RateRevenuePerRoom = Results("TotalRevenue"), .RateRevenueRoomNigth = Results("Tar_2")})
                                        Else
                                            If Results("Rate") = 0 Then
                                                AvailabilityAux = "Close"
                                            End If
                                            UsuariosLis.Add(New GroupsRatesList With {.InitDateRate = Results("VigenciaI"), .EndDateRate = Results("VigenciaF"), .SuiteName = Results("Clave_TC"), .SuiteCode = Results("Clave_TC"), .RateSingle = Results("Tar_1"), .RateDouble = Results("Tar_2"), .RateTripleandFour = Results("Extra"), .RateFiveandSix = Results("ExtraX"), .RateChildrens = Results("Tar_N"), .RateTeensValue = Results("Tar_A"), .Availability = AvailabilityAuxConsultRate(0), .RateRevenue = NumberPaxAux * Math.Ceiling(Results("TotalRevenue")), .RatePax = NumberPaxAux, .CommissionRate = 0, .DiscountRate = 0, .RateRevenuePerRoom = Results("TotalRevenue"), .RateRevenueRoomNigth = Results("Tar_2")})
                                        End If



                                    End If


                                    'i = i + 1

                                End While
                            End If

                        Catch ex As Exception

                            'Return Content("Error")

                            Return Content(ex.ToString)

                        End Try

                        conn.close()

                        model.ListGroupRatesin = UsuariosLis
                        model.RevenueFinal = RevenueFinal
                        model.Accion = 2
                        model.GroupId = Request("grupoidlabeltext")

                        Select Case Request("HotelSelect")
                            Case "GCR"
                                model.GroupHotelNew = "GCCUN"
                            Case "GPR"
                                model.GroupHotelNew = "POPDC"
                            Case "RPR"
                                model.GroupHotelNew = "ROPDC"
                            Case "TRC"
                                model.GroupHotelNew = "HZLCUN"
                            Case "ZLJ"
                                model.GroupHotelNew = "HZLJAM"
                            Case "ZVC"
                                model.GroupHotelNew = "HZVCUN"
                            Case "ZVJ"
                                model.GroupHotelNew = "HZVJAM"
                            Case "ZVL"
                                model.GroupHotelNew = "HZLCA"
                            Case "ZVP"
                                model.GroupHotelNew = "HZVPV"
                        End Select

                        If GroupDetailBotons = "Consult_Revenue" Then
                            model.GroupTypeRate = Request("selectratetype")
                        Else
                            model.GroupTypeRate = TypeRateValue
                            model.EditGroupData7 = 0
                        End If

                        Return PartialView("RatesConsult", model)
                    End If


                End If

            End If




            If GroupDetailBotons = "Save_Group" Or GroupDetailBotons = "Save_Group_Check" Then

                Dim ID_group As Double


                If Request("grupoidlabeltext") = "0" Or Request("grupoidlabeltext") = 0 Or Request("grupoidlabeltext") = "" Then

                    Dim ExistGroupFlag As String = CheckExistGroup()

                    If ExistGroupFlag = "OK" Or GroupDetailBotons = "Save_Group_Check" Then

                        ID_group = Insert_Group_Data()

                        model = Group_Rates(ID_group, 1)
                        model.Accion = 1

                    Else

                        model = Group_Rates(ID_group, 0)
                        model.Accion = 9
                        model.GroupCheckExist = ExistGroupFlag

                    End If

                    'Return Content(Auxiliar.ToString)
                Else

                    ID_group = Update_Group_Data()

                    model = Group_Rates(Request("grupoidlabeltext"), 1)
                    model.Accion = 1



                End If

                model.GroupId = ID_group
                model.GroupIdLabel = Request("HotelSelect")

                Select Case Request("HotelSelect")
                    Case "GCR"
                        model.GroupHotelNew = "GCCUN"
                    Case "GPR"
                        model.GroupHotelNew = "POPDC"
                    Case "RPR"
                        model.GroupHotelNew = "ROPDC"
                    Case "TRC"
                        model.GroupHotelNew = "HZLCUN"
                    Case "ZLJ"
                        model.GroupHotelNew = "HZLJAM"
                    Case "ZVC"
                        model.GroupHotelNew = "HZVCUN"
                    Case "ZVJ"
                        model.GroupHotelNew = "HZVJAM"
                    Case "ZVL"
                        model.GroupHotelNew = "HZLCA"
                    Case "ZVP"
                        model.GroupHotelNew = "HZVPV"
                End Select

                Return View("RatesConsult", model)

            End If

            If GroupDetailBotons = "GenerateFile" Then


                If Request("grupoiddoc") <> "0" Then

                    Dim Reporte_Prueba = New LocalReport()
                    Dim Ubicacion
                    Dim ClavHotel As String
                    Dim AgencyType As Integer
                    Dim Wholesale As String
                    Dim NumRooms As Integer
                    Dim GroupType As String
                    Dim GroupsData = New List(Of GroupsReportDataList)
                    Dim GroupsDataRoomRates = New List(Of GroupsReportRoomRatesList)
                    Dim GroupsDataRoomRevenue = New List(Of GroupsReportRevenueList)
                    Dim GroupDataRoomNights = New List(Of GroupsReportRoomNigthsList)
                    Dim GroupsReportRoomNightsEstimated = New List(Of GroupsReportRoomNightsEstimatedList)

                    Dim GroupsReportRoomingList = New List(Of GroupsReportRoomingList)


                    conn.Open()

                    Try
                        Dim QueryDos = "select *from Groups where Id_Group=" + Request("grupoiddoc") + ""
                        Dim CommandUserUno = New SqlCommand(QueryDos, conn)
                        Dim ResultsUno = CommandUserUno.ExecuteReader()


                        If ResultsUno.HasRows Then
                            While ResultsUno.Read()
                                ClavHotel = ResultsUno("Cve_Hotel")
                                AgencyType = ResultsUno("AgencyType")
                                Wholesale = ResultsUno("Wholesale")
                                NumRooms = ResultsUno("NumberRooms")
                                GroupType = ResultsUno("GroupType")
                            End While
                        End If
                        ResultsUno.Close()


                        Dim QueryTres = "Exec sp_Report_Groups " + Request("grupoiddoc") + " "
                        Dim CommandDos = New SqlCommand(QueryTres, conn)
                        Dim ResultsDos = CommandDos.ExecuteReader()
                        'Dim QueryTres = "Exec sp_Report_Groups_testII " + Request("grupoiddoc") + " "
                        'Dim CommandDos = New SqlCommand(QueryTres, conn)
                        'Dim ResultsDos = CommandDos.ExecuteReader()


                        If ResultsDos.HasRows Then
                            While ResultsDos.Read()
                                'ClavHotel = ResultsDos("Cve_Hotel")
                                'AgencyType = ResultsDos("AgencyType")
                                'Wholesale = ResultsDos("TO")
                                'NumRooms = ResultsDos("NumberRooms")

                                GroupsData.Add(New GroupsReportDataList With {.DateDeposit = ResultsDos("DateDeposit"), .ComplementaryRoom = ResultsDos("ComplementaryRoom"), .Contact_Email = ResultsDos("Contact_Email"), .Phones = ResultsDos("Phones"), .ArrivalDate = ResultsDos("ArrivalDate"), .DepartureDate = ResultsDos("DepartureDate"), .Contact = ResultsDos("Contact"), .GroupCordinator = ResultsDos("GroupCordinator"), .GroupName = ResultsDos("GroupName"), .Wholesale = ResultsDos("Wholesale"), .NumberRooms = ResultsDos("NumberRooms"), .Special_Notes = ResultsDos("Special_Notes"), .HotelLogo = ResultsDos("HotelLogo"), .HotelName = ResultsDos("HotelName"), .User_Email = ResultsDos("User_Email"), .GroupType = ResultsDos("GroupType"), .Cve_Hotel = ResultsDos("Cve_Hotel"), .Beneficiary_Bank = ResultsDos("Beneficiary_Bank"), .ABA_Routing = ResultsDos("ABA_Routing"), .ABA_WireTransfers = ResultsDos("ABA_WireTransfers"), .SWIFT_CODE = ResultsDos("SWIFT_CODE"), .Bank_Address = ResultsDos("Bank_Address"), .Beneficiary_Name = ResultsDos("Beneficiary_Name"), .Memo = ResultsDos("Memo"), .Beneficiary_Account = ResultsDos("Beneficiary_Account"), .Hotel_Address = ResultsDos("Hotel_Address"), .IdGroupCode = ResultsDos("IdGroupCode"), .QuotedDate = ResultsDos("QuotedDate"), .VersionDoc = ResultsDos("VersionDoc"), .AgencyTypeText = ResultsDos("AgencyTypeText"), .DateMICEPayments = ResultsDos("DateMICEPayments"), .Additional_SC = Request("enrollmentconcessions"), .IncludeEvents = Request("selectincludeevents"), .RevenueGeneral = ResultsDos("RevenueGeneral")})

                            End While
                        End If
                        ResultsDos.Close()


                        Dim QueryCuatro = "Exec sp_Report_GroupsRoomRates " + Request("grupoiddoc") + " "
                        Dim CommandTres = New SqlCommand(QueryCuatro, conn)
                        Dim ResultsTres = CommandTres.ExecuteReader()


                        If ResultsTres.HasRows Then
                            While ResultsTres.Read()

                                GroupsDataRoomRates.Add(New GroupsReportRoomRatesList With {.Init_Date = ResultsTres("Init_Date"), .End_Date = ResultsTres("End_Date"), .Nomb_TC_Act = ResultsTres("Nomb_TC_Act"), .Rate_1 = Math.Ceiling(ResultsTres("Rate_1")), .Rate_2 = Math.Ceiling(ResultsTres("Rate_2")), .Rate_Extra = Math.Ceiling(ResultsTres("Rate_Extra")), .Rate_T = Math.Ceiling(ResultsTres("Rate_T")), .Rate_C = Math.Ceiling(ResultsTres("Rate_C")), .Code_Room = ResultsTres("Code_Room"), .Description_Promo = ResultsTres("Description_Promo"), .Availability = ResultsTres("Availability")})

                            End While
                        End If
                        ResultsTres.Close()


                        Dim QueryCinco = "Exec sp_Report_GroupsRevenue " + Request("grupoiddoc") + " "
                        Dim CommandCuatro = New SqlCommand(QueryCinco, conn)
                        Dim Resultscuatro = CommandCuatro.ExecuteReader()


                        If Resultscuatro.HasRows Then
                            While Resultscuatro.Read()

                                GroupsDataRoomRevenue.Add(New GroupsReportRevenueList With {.Nomb_TC_Act = Resultscuatro("Nomb_TC_Act"), .Num_Rooms = Resultscuatro("Num_Rooms"), .Revenue = Math.Ceiling(Resultscuatro("Revenue")), .People = Resultscuatro("People"), .Total = Math.Ceiling(Resultscuatro("Total"))})

                            End While
                        End If
                        Resultscuatro.Close()


                        Dim QuerySeis = "Exec sp_Report_GroupsRoomNights " + Request("grupoiddoc") + " "
                        Dim CommandCinco = New SqlCommand(QuerySeis, conn)
                        Dim Resultscinco = CommandCinco.ExecuteReader()

                        Dim ColAux As Date
                        Dim Col1 As String
                        Dim Col2 As String
                        Dim Col3 As String
                        Dim Col4 As String
                        Dim Col5 As String
                        Dim Col6 As String
                        Dim Col7 As String

                        If Resultscinco.HasRows Then
                            While Resultscinco.Read()
                                If IsDBNull(Resultscinco("Col1")) Then
                                    Col1 = ""
                                Else
                                    ColAux = Resultscinco("Col1")
                                    Col1 = ColAux.ToString("yyyy-MM-dd")
                                End If

                                If IsDBNull(Resultscinco("Col2")) Then
                                    Col2 = ""
                                Else
                                    ColAux = Resultscinco("Col2")
                                    Col2 = ColAux.ToString("yyyy-MM-dd")
                                End If

                                If IsDBNull(Resultscinco("Col3")) Then
                                    Col3 = ""
                                Else
                                    ColAux = Resultscinco("Col3")
                                    Col3 = ColAux.ToString("yyyy-MM-dd")
                                End If


                                If IsDBNull(Resultscinco("Col4")) Then
                                    Col4 = ""
                                Else
                                    ColAux = Resultscinco("Col4")
                                    Col4 = ColAux.ToString("yyyy-MM-dd")
                                End If

                                If IsDBNull(Resultscinco("Col5")) Then
                                    Col5 = ""
                                Else
                                    ColAux = Resultscinco("Col5")
                                    Col5 = ColAux.ToString("yyyy-MM-dd")
                                End If

                                If IsDBNull(Resultscinco("Col6")) Then
                                    Col6 = ""
                                Else
                                    ColAux = Resultscinco("Col6")
                                    Col6 = ColAux.ToString("yyyy-MM-dd")
                                End If

                                If IsDBNull(Resultscinco("Col7")) Then
                                    Col7 = ""
                                Else
                                    ColAux = Resultscinco("Col7")
                                    Col7 = ColAux.ToString("yyyy-MM-dd")
                                End If

                                GroupDataRoomNights.Add(New GroupsReportRoomNigthsList With {.Code_Room = Resultscinco("Code_Room"), .NumberRooms = Resultscinco("NumberRooms"), .Col1 = Col1, .Col2 = Col2, .Col3 = Col3, .Col4 = Col4, .Col5 = Col5, .Col6 = Col6, .Col7 = Col7})


                            End While
                        End If
                        Resultscinco.Close()


                        Dim QuerySiete

                        If Request("selectypedocument") = 3 Or Request("selectypedocument") = 5 Then
                            QuerySiete = "Exec sp_Report_GroupsRoomNights_Estimated_test " + Request("grupoiddoc") + " , 0 "
                        Else
                            QuerySiete = "Exec sp_Report_GroupsRoomNights_Estimated_test " + Request("grupoiddoc") + " , 1 "
                        End If


                        Dim CommandSeis = New SqlCommand(QuerySiete, conn)
                        Dim Resultsseis = CommandSeis.ExecuteReader()

                        If Resultsseis.HasRows Then
                            While Resultsseis.Read()

                                GroupsReportRoomNightsEstimated.Add(New GroupsReportRoomNightsEstimatedList With {.ArrivalDatePeriod = Resultsseis("ArrivalDatePeriod"), .DepartureDatePeriod = Resultsseis("DepartureDatePeriod"), .Name_Room = Resultsseis("Name_Room"), .Code_Room = Resultsseis("Code_Room"), .NumberRooms = Resultsseis("NumberRooms"), .DepartureDateFinal = Resultsseis("DepartureDateFinal")})

                            End While
                        End If
                        Resultsseis.Close()



                        Dim QueryOcho


                        QueryOcho = "Exec sp_Report_GroupsRoomList " + Request("grupoiddoc") + "  "



                        Dim CommandSiete = New SqlCommand(QueryOcho, conn)
                        Dim Resultssiete = CommandSiete.ExecuteReader()

                        If Resultssiete.HasRows Then
                            While Resultssiete.Read()

                                GroupsReportRoomingList.Add(New GroupsReportRoomingList With {.NumberNigths = Resultssiete("NumberNigths"), .DateNight = Resultssiete("DateNight"), .Flag = Resultssiete("Flag"), .PaxName4 = Resultssiete("PaxName4"), .PaxLastname4 = Resultssiete("PaxLastname4"), .PaxName3 = Resultssiete("PaxName3"), .PaxLastname3 = Resultssiete("PaxLastname3"), .PaxName2 = Resultssiete("PaxName2"), .PaxLastname2 = Resultssiete("PaxLastname2"), .PaxName1 = Resultssiete("PaxName1"), .PaxLastname1 = Resultssiete("PaxLastname1"), .Nights = Resultssiete("Nights"), .Rate = Resultssiete("Rate"), .FolioPMS = Resultssiete("FolioPMS"), .Special_Notes = Resultssiete("Special_Notes"), .Revenue = Resultssiete("Revenue"), .Checkout = Resultssiete("Checkout"), .Checkin = Resultssiete("Checkin"), .Infants = Resultssiete("Infants"), .Teens = Resultssiete("Teens"), .Childs = Resultssiete("Childs"), .Adults = Resultssiete("Adults"), .GuestName = Resultssiete("GuestName"), .GuestLastName = Resultssiete("GuestLastName"), .Code_Room = Resultssiete("Code_Room"), .Id_BreakDown = Resultssiete("Id_BreakDown")})

                            End While
                        End If
                        Resultssiete.Close()




                    Catch ex As Exception

                        Return Content(ex.ToString)

                    End Try


                    conn.close()



                    If GroupType <> 4 And GroupType <> 6 Then

                        If Request("selectypedocument") = 2 Then
                            If NumRooms >= 75 Then
                                If AgencyType = 2 Then
                                    Ubicacion = Server.MapPath("~/bin/Content/Reports/EnrollmentFormDirectClientMICEV2.rdlc")
                                Else
                                    Ubicacion = Server.MapPath("~/bin/Content/Reports/EnrollmentFormMICEV2.rdlc")
                                End If
                            ElseIf NumRooms >= 39 Then
                                If AgencyType = 2 Then
                                    Ubicacion = Server.MapPath("~/bin/Content/Reports/EnrollmentFormDirectClient39.rdlc")
                                Else
                                    Select Case Wholesale
                                        Case "LIBGOTRS", "LIBGOGRP", "GOGOW"
                                            '' Mismas politicas 39++ y 39---
                                            Ubicacion = Server.MapPath("~/bin/Content/Reports/EnrollmentFormTOSpecialV2.rdlc")
                                        Case Else
                                            Ubicacion = Server.MapPath("~/bin/Content/Reports/EnrollmentForm39.rdlc")
                                    End Select
                                End If
                            Else

                                If AgencyType = 2 Then
                                    Ubicacion = Server.MapPath("~/bin/Content/Reports/EnrollmentFormDirectClientV2.rdlc")
                                Else

                                    Select Case Wholesale
                                        Case "LIBGOTRS", "LIBGOGRP", "GOGOW"
                                            '' Mismas politicas 39++ y 39---
                                            Ubicacion = Server.MapPath("~/bin/Content/Reports/EnrollmentFormTOSpecialV2.rdlc")
                                        Case "EXGROTVL"
                                            Ubicacion = Server.MapPath("~/bin/Content/Reports/EnrollmentFormTOSpecial2v2.rdlc")
                                        Case Else
                                            Ubicacion = Server.MapPath("~/bin/Content/Reports/EnrollmentFormV2.rdlc")
                                    End Select
                                End If

                            End If

                        End If


                        If Request("selectypedocument") = 3 Then
                            Ubicacion = Server.MapPath("~/bin/Content/Reports/LookRoomEstimate.rdlc")
                        End If


                        If Request("selectypedocument") = 5 Then
                            Ubicacion = Server.MapPath("~/bin/Content/Reports/RoomingList.rdlc")
                        End If



                        If (System.IO.File.Exists(Ubicacion)) Then
                            Reporte_Prueba.ReportPath = Ubicacion

                        Else
                            Return Content(Ubicacion.ToString)
                        End If

                        Dim Datos = New ReportDataSource("DataSet1", GroupsData)
                        Dim DatosDos = New ReportDataSource("DataSet2", GroupsDataRoomRates)
                        Dim DatosTres = New ReportDataSource("DataSet3", GroupsDataRoomRevenue)
                        Dim DatosCuatro = New ReportDataSource("DataSet4", GroupDataRoomNights)
                        Dim DatosCinco = New ReportDataSource("DataSet5", GroupsReportRoomNightsEstimated)
                        Dim DatosSeis = New ReportDataSource("DataSet6", GroupsReportRoomingList)


                        '    Dim thisDate1 As Date = Date.Now
                        '    Dim Parametros1 = New ReportParameter("DATE_INIT", "31/12/" + thisDate1.Year.ToString)
                        '    Dim Parametros2 = New ReportParameter("DATE_END", "31/12/" + CStr(thisDate1.Year + 1))
                        '    Reporte_Prueba.SetParameters(New ReportParameter() {Parametros1, Parametros2})
                        '    AnioReport = CStr(thisDate1.Year + 1)


                        Reporte_Prueba.DataSources.Add(Datos)
                        Reporte_Prueba.DataSources.Add(DatosDos)
                        Reporte_Prueba.DataSources.Add(DatosTres)
                        Reporte_Prueba.DataSources.Add(DatosCuatro)
                        Reporte_Prueba.DataSources.Add(DatosCinco)
                        Reporte_Prueba.DataSources.Add(DatosSeis)


                        Dim rereportType As String

                        Dim mimeType As String = Nothing
                        Dim encoding As String = Nothing
                        Dim fileNameExtension As String = Nothing
                        Dim deviceInfo As String

                        If Request("selectypedocument") = 3 Or Request("selectypedocument") = 5 Then

                            rereportType = "Excel"

                            deviceInfo = _
                                "<DeviceInfo>" & _
                                "  <OutputFormat>Excel</OutputFormat>" & _
                                "</DeviceInfo>"

                        End If


                        If Request("selectypedocument") = 1 Or Request("selectypedocument") = 2 Then

                            rereportType = "Word"

                            deviceInfo = _
                                "<DeviceInfo>" & _
                                "  <OutputFormat>Word</OutputFormat>" & _
                                "</DeviceInfo>"

                        End If



                        Dim warnings As Warning() = Nothing
                        Dim streams As String() = Nothing
                        Dim renderedBytes As Byte() = Nothing

                        renderedBytes = Reporte_Prueba.Render(rereportType, deviceInfo, mimeType, encoding, fileNameExtension, streams, warnings)

                        'Dim fs As New FileStream("c:\outputvb.xls", FileMode.Create)
                        'fs.Write(renderedBytes, 0, renderedBytes.Length)
                        'fs.Close()


                        Dim CommandUser

                        Dim Query As String = "Insert into Documents( Id_Group , Type_Document, Actions, User_Action, Date_Register, URL , Additionanl_SC ) VALUES( @Id_Group , @Type_Document, @Actions, @User_Action, @Date_Register, @URL , @Additionanl_SC )"

                        CommandUser = New SqlCommand(Query, conn)
                        CommandUser.Parameters.AddWithValue("@Id_Group", Request("grupoiddoc"))
                        CommandUser.Parameters.AddWithValue("@Type_Document", Request("selectypedocument"))
                        CommandUser.Parameters.AddWithValue("@Actions", 1)
                        CommandUser.Parameters.AddWithValue("@User_Action", Session("UserName").ToString)
                        CommandUser.Parameters.AddWithValue("@Date_Register", Date.Now())
                        CommandUser.Parameters.AddWithValue("@URL", "")
                        CommandUser.Parameters.AddWithValue("@Additionanl_SC", Request("enrollmentconcessions"))




                        conn.Open()

                        Try
                            CommandUser.ExecuteNonQuery()


                        Catch ex As Exception

                            Return Content("Error")

                        End Try

                        conn.close()



                        If Request("selectypedocument") = 1 Then
                            Return File(renderedBytes, mimeType, "Proposal_" + ClavHotel + "000" + Request("grupoiddoc") + ".doc")
                        End If

                        If Request("selectypedocument") = 2 Then
                            Return File(renderedBytes, mimeType, "EnrollmentForm_" + ClavHotel + "000" + Request("grupoiddoc") + ".doc")
                        End If

                        If Request("selectypedocument") = 3 Then
                            Return File(renderedBytes, mimeType, "LockRoom_" + ClavHotel + "000" + Request("grupoiddoc") + "." + fileNameExtension)
                        End If

                        If Request("selectypedocument") = 5 Then
                            Return File(renderedBytes, mimeType, "RoomingList_" + ClavHotel + "000" + Request("grupoiddoc") + "." + fileNameExtension)
                        End If


                    Else





                    End If



                Else

                    Dim UsuariosLis = New List(Of GroupsRatesList)

                    UsuariosLis.Add(New GroupsRatesList With {.SuiteName = "N/A", .SuiteCode = "N/A", .RateSingle = 0, .RateDouble = 0, .RateTripleandFour = 0, .RateChildrens = 0, .RateTeensValue = 0, .Availability = "Available"})

                    Dim ListAvailability = New List(Of SelectListItem)

                    ListAvailability.Add(New SelectListItem With {.Text = "", .Value = "", .Selected = False})

                    model.ListaAvailabilityin = ListAvailability
                    model.ListGroupRatesin = UsuariosLis
                    'model.RevenueFinal = RevenueFinal
                    model.Accion = 4
                    model.GroupId = Request("grupoiddoc")
                    model.GroupIdLabel = Request("HotelSelect")
                    Select Case Request("HotelSelect")
                        Case "GCR"
                            model.GroupHotelNew = "GCCUN"
                        Case "GPR"
                            model.GroupHotelNew = "POPDC"
                        Case "RPR"
                            model.GroupHotelNew = "ROPDC"
                        Case "TRC"
                            model.GroupHotelNew = "HZLCUN"
                        Case "ZLJ"
                            model.GroupHotelNew = "HZLJAM"
                        Case "ZVC"
                            model.GroupHotelNew = "HZVCUN"
                        Case "ZVJ"
                            model.GroupHotelNew = "HZVJAM"
                        Case "ZVL"
                            model.GroupHotelNew = "HZLCA"
                        Case "ZVP"
                            model.GroupHotelNew = "HZVPV"

                    End Select

                    Return PartialView(model)

                End If


            End If


            If GroupDetailBotons = "Update_Doc" Then

                Dim DocumentsLis = New List(Of GroupsDocList)

                Dim Query As String = " SELECT *FROM Documents WHERE Id_Group=" + Request("grupoiddocupdate") + " order by Id_Document desc "
                Dim CommandUser = New SqlCommand(Query, conn)

                conn.Open()
                Dim Results = CommandUser.ExecuteReader()

                If Results.HasRows Then
                    While Results.Read()
                        DocumentsLis.Add(New GroupsDocList With {.TypeDocument = Results("Type_Document"), .Actions = Results("Actions"), .User = Results("User_Action"), .DateRegister = Results("Date_Register"), .URL = Results("URL")})
                    End While
                End If
                Results.Close()
                conn.close()

                model.ListGroupDocumentsin = DocumentsLis


                Return PartialView("DocTable", model)

            End If



            If GroupDetailBotons = "Upload_File" Then

                Dim fileName As String = ""


                If Not Doc_File Is Nothing Then

                    Dim direccion As String

                    If Doc_File.FileName Is Nothing Then

                    Else
                        fileName = Request("grupoiddocupload").ToString() + "_" + ConsecutiveValue("Id_Document", "Documents").ToString + Path.GetExtension(Doc_File.FileName)
                        direccion = Path.Combine(Server.MapPath("~/Content/uploads_files"), fileName)
                        'Response.Write(Server.MapPath("~/Content/uploads_bills"))
                        Doc_File.SaveAs(direccion)

                    End If

                End If


                Dim CommandUser

                Dim Query As String = "Insert into Documents( Id_Group , Type_Document, Actions, User_Action, Date_Register, URL  ) VALUES( @Id_Group , @Type_Document, @Actions, @User_Action, @Date_Register, @URL )"

                CommandUser = New SqlCommand(Query, conn)
                CommandUser.Parameters.AddWithValue("@Id_Group", Request("grupoiddocupload"))
                CommandUser.Parameters.AddWithValue("@Type_Document", Request("selectypedocumentupload"))
                CommandUser.Parameters.AddWithValue("@Actions", 2)
                CommandUser.Parameters.AddWithValue("@User_Action", Session("UserName").ToString)
                CommandUser.Parameters.AddWithValue("@Date_Register", Date.Now())
                CommandUser.Parameters.AddWithValue("@URL", fileName)



                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()


                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()



                Dim UsuariosLis = New List(Of GroupsRatesList)

                Dim ListAvailability = New List(Of SelectListItem)

                Dim DocumentsLis = New List(Of GroupsDocList)

                Dim QueryDos As String

                Dim CommanRate
                Dim Results
                Dim ResultsDos
                Dim RevenueFinal As Double = 0
                Dim DateInit As Date
                Dim BanderaRevenue As Integer = 0
                Dim i As Integer = 0



                conn.Open()

                QueryDos = "select *from Groups_Rates where Status_Data=1 and id_group=" + Request("grupoiddocupload") + " order by Id_GroupRate "
                CommanRate = New SqlCommand(QueryDos, conn)
                ResultsDos = CommanRate.ExecuteReader()
                If ResultsDos.HasRows Then
                    While ResultsDos.Read()

                        If DateInit <> ResultsDos("Init_Date") Or i = 0 Then
                            DateInit = ResultsDos("Init_Date")
                            If i <> 0 Then
                                BanderaRevenue = 1
                            End If
                        End If

                        UsuariosLis.Add(New GroupsRatesList With {.InitDateRate = ResultsDos("Init_Date"), .EndDateRate = ResultsDos("End_Date"), .SuiteName = ResultsDos("Code_Room"), .SuiteCode = ResultsDos("Code_Room"), .RateSingle = ResultsDos("Rate_1"), .RateDouble = ResultsDos("Rate_2"), .RateTripleandFour = ResultsDos("Rate_Extra"), .RateFiveandSix = ResultsDos("Rate_ExtraX"), .RateChildrens = ResultsDos("Rate_C"), .RateTeensValue = ResultsDos("Rate_T"), .Availability = ResultsDos("Status"), .RateRevenue = ResultsDos("Num_Rooms") * Math.Ceiling(ResultsDos("Revenue")), .RatePax = ResultsDos("Num_Rooms"), .CommissionRate = ResultsDos("Commission"), .DiscountRate = ResultsDos("Promo"), .RateRevenuePerRoom = ResultsDos("Revenue"), .RateRevenueRoomNigth = ResultsDos("Rate_2") * 2})


                        If BanderaRevenue = 0 Then
                            RevenueFinal = RevenueFinal + ResultsDos("Num_Rooms") * Math.Ceiling(ResultsDos("Revenue"))
                        End If


                        i = i + 1

                    End While
                End If
                ResultsDos.close()


                conn.close()


                Dim QueryDoc As String = " SELECT *FROM Documents WHERE Id_Group=" + Request("grupoiddocupload") + " order by Id_Document desc "
                Dim CommandUserDoc = New SqlCommand(QueryDoc, conn)

                conn.Open()
                Dim ResultsDoc = CommandUserDoc.ExecuteReader()

                If ResultsDoc.HasRows Then
                    While ResultsDoc.Read()
                        DocumentsLis.Add(New GroupsDocList With {.TypeDocument = ResultsDoc("Type_Document"), .Actions = ResultsDoc("Actions"), .User = ResultsDoc("User_Action"), .DateRegister = ResultsDoc("Date_Register"), .URL = ResultsDoc("URL")})
                    End While
                End If
                ResultsDoc.Close()
                conn.close()



                Dim QueryListuno As String = "Select Id_Type,[TYPE_NAME] as Name from Cat_GroupType where Status_Data=1 "
                Dim CommandUserListuno = New SqlCommand(QueryListuno, conn)
                Dim ListGroupType = New List(Of SelectListItem)

                conn.Open()

                Dim ResultsListuno = CommandUserListuno.ExecuteReader()

                If ResultsListuno.HasRows Then
                    While ResultsListuno.Read()
                        ListGroupType.Add(New SelectListItem With {.Text = ResultsListuno("Name"), .Value = ResultsListuno("Id_Type"), .Selected = False})
                    End While
                End If
                ResultsListuno.Close()

                conn.close()


                Dim QueryListDos As String = "Select Id_Market, Market_Name from Cat_Markets where Status_Data=1 order by  Market_Name "
                Dim CommandUserListDos = New SqlCommand(QueryListDos, conn)
                Dim ListMarkets = New List(Of SelectListItem)

                conn.Open()

                Dim ResultsListDos = CommandUserListDos.ExecuteReader()

                If ResultsListDos.HasRows Then
                    While ResultsListDos.Read()
                        ListMarkets.Add(New SelectListItem With {.Text = ResultsListDos("Market_Name"), .Value = ResultsListDos("Id_Market"), .Selected = False})
                    End While
                End If
                ResultsListDos.Close()




                conn.close()


                Dim QueryListTres As String = "Select Id_Type, [TYPE_NAME] as Name from Cat_AgencyType where Status_Data=1 order by  [TYPE_NAME]  "
                Dim CommandUserListTres = New SqlCommand(QueryListTres, conn)
                Dim ListAgencyType = New List(Of SelectListItem)

                conn.Open()

                Dim ResultsListTres = CommandUserListTres.ExecuteReader()

                If ResultsListTres.HasRows Then
                    While ResultsListTres.Read()
                        ListAgencyType.Add(New SelectListItem With {.Text = ResultsListTres("Name"), .Value = ResultsListTres("Id_Type"), .Selected = False})
                    End While
                End If
                ResultsListTres.Close()

                conn.close()


                model.ListaGroupTypein = ListGroupType
                model.ListaGroupMarketin = ListMarkets
                model.ListaAgencyTypein = ListAgencyType

                model.ListGroupDocumentsin = DocumentsLis
                model.ListaAvailabilityin = ListAvailability
                model.ListGroupRatesin = UsuariosLis

                'Return View(model)

                'Return PartialView("DocTable", model)

                Return Redirect("GroupDetail?id=" + Request("grupoiddocupload") + "")


            End If


            If GroupDetailBotons = "Consult_Availiability" Then


                Dim xml As String

                Dim WhosaleValue() As String = Split(Request("AgencyAvailability"), ":")

                Dim SuiteRoom As String = Request("SuiteAvailability")

                SuiteRoom = SuiteRoom.Replace("#", "")

                If WhosaleValue(0) = "" Then

                    WhosaleValue(0) = "BAR"

                End If

                Dim departuredate As Date = Request("CheckoutAvailability")

                xml = "<?xml version=""1.0"" encoding=""utf-8""?> " & _
                "<soap:Envelope xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" " & _
                "xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" " & _
                "xmlns:soap=""http://schemas.xmlsoap.org/soap/envelope/""><soap:Body>" & _
                "<WS_Request2 xmlns=""http://tempuri.org/Cotizador/Tarifas"">" & _
                "<Hotel>" + Request("HotelAvailability") + "</Hotel>" & _
                 "<Agencia>" + WhosaleValue(0) + "</Agencia>" & _
                  "<Llegada>" + Request("CheckinAvailability") + "</Llegada>" & _
                   "<Salida>" + DateAdd(DateInterval.Day, -1, departuredate) + "</Salida>" & _
                   "<SoloDisponibilidad>1</SoloDisponibilidad>" & _
                " </WS_Request2>" & _
                "</soap:Body></soap:Envelope>"


                Dim data As String = xml
                Dim url As String = "http://1.2.0.39/cotizador/tarifas.asmx"
                Dim responsestring As String = ""

                Dim myReq As HttpWebRequest = WebRequest.Create(url)
                Dim proxy As IWebProxy = CType(myReq.Proxy, IWebProxy)
                Dim proxyaddress As String
                Dim myProxy As New WebProxy()
                Dim encoding As New ASCIIEncoding
                Dim buffer() As Byte = encoding.GetBytes(xml)
                Dim response As String

                myReq.AllowWriteStreamBuffering = False
                myReq.Method = "POST"
                myReq.ContentType = "text/xml; charset=UTF-8"
                myReq.ContentLength = buffer.Length
                myReq.Headers.Add("SOAPAction", "http://tempuri.org/Cotizador/Tarifas/WS_Request2")
                'myReq.Credentials = New NetworkCredential("abc", "123")
                myReq.PreAuthenticate = False
                proxyaddress = proxy.GetProxy(myReq.RequestUri).ToString

                Dim newUri As New Uri(proxyaddress)
                myProxy.Address = newUri
                myReq.Proxy = myProxy
                Dim post As Stream = myReq.GetRequestStream

                post.Write(buffer, 0, buffer.Length)
                post.Close()

                Dim myResponse As HttpWebResponse = myReq.GetResponse
                Dim responsedata As Stream = myResponse.GetResponseStream
                Dim responsereader As New StreamReader(responsedata)

                response = responsereader.ReadToEnd

                Dim Documents As New XmlDocument
                Documents.LoadXml(response)

                Dim nodelist As XmlNodeList = Documents.GetElementsByTagName("Tarifa")

                Dim nodelistDos As XmlNodeList

                Dim ListAvailability = New List(Of SelectListItem)

                For Each node As XmlElement In nodelist

                    If node.Attributes("Suite").Value = SuiteRoom Then

                        nodelistDos = node.GetElementsByTagName("Date")
                        model.GroupAvailabilitySuiteName = node.Attributes("SuiteName").Value

                        For Each nodedos As XmlElement In nodelistDos

                            ListAvailability.Add(New SelectListItem With {.Text = nodedos.Attributes("Date").Value + "," + nodedos.Attributes("Nivel").Value, .Value = nodedos.Attributes("Disp").Value, .Selected = False})

                        Next

                    End If

                Next

                'ListAvailability.Add(New SelectListItem With {.Text = "2015-11-25", .Value = "20", .Selected = False})
                'ListAvailability.Add(New SelectListItem With {.Text = "2015-11-25", .Value = "20", .Selected = False})
                'ListAvailability.Add(New SelectListItem With {.Text = "2015-11-25", .Value = "20", .Selected = False})

                model.ListaAvailabilityin = ListAvailability

                'model.EditGroupData20 = Request("HotelAvailability") + "/" + WhosaleValue(0) + "/" + Request("CheckinAvailability") + "/" + Request("CheckoutAvailability") + "/" + SuiteRoom

                Return PartialView("AvailabilityModal", model)

            End If


            If GroupDetailBotons = "Request_Company_Value" Then

                conn.Open()

                Try

                    Dim QueryDos As String = "Select *from Cat_Companies where Status_Data=1 and Company_Name='" + Request("CompanyRequestValue") + "'  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()

                    model.EditGroupData39Value = 0

                    If Results.HasRows Then
                        While Results.Read()

                            model.EditGroupData37Value = Results("Company_Key")
                            model.EditGroupData38Value = Results("Company_Name")
                            model.EditGroupData39Value = Results("Id_Company")
                            model.EditGroupData40Value = Results("Company_IATA")
                            model.EditGroupData41Value = Results("Company_ZIP")
                            model.EditGroupData42Value = Results("Company_Country")
                            model.EditGroupData49Value = Results("Company_State")

                        End While
                    Else
                        model.EditGroupData38Value = Request("CompanyRequestValue")
                    End If
                    Results.Close()


                    Dim QueryCountry As String = "select distinct ISO_2CAR,ISO_PAIS_ES from ISO_3166 where ISO_PAIS_ES is not null and ISO_2CAR in('MX','US') order by ISO_PAIS_ES  "

                    Dim CommandCountry = New SqlCommand(QueryCountry, conn)
                    Dim ResultCountry = CommandCountry.ExecuteReader()
                    Dim CountryLis = New List(Of SelectListItem)

                    If ResultCountry.HasRows Then
                        While ResultCountry.Read()

                            CountryLis.Add(New SelectListItem With {.Text = ResultCountry("ISO_PAIS_ES"), .Value = ResultCountry("ISO_2CAR")})

                        End While

                    End If
                    ResultCountry.Close()

                    Dim QueryState As String = "select Iso_pais_region,region from ISO_3166 where region<>'' and ISO_2CAR in('MX','US')  order by REGION  "


                    Dim CommandState = New SqlCommand(QueryState, conn)
                    Dim ResultState = CommandState.ExecuteReader()
                    Dim EstadoLis = New List(Of SelectListItem)

                    If ResultState.HasRows Then
                        While ResultState.Read()

                            EstadoLis.Add(New SelectListItem With {.Text = ResultState("region"), .Value = ResultState("Iso_pais_region")})

                        End While

                    End If
                    ResultState.Close()

                    model.ListCountryin = CountryLis
                    model.ListStatein = EstadoLis

                    conn.close()
                    Return PartialView("RequestCompanyModal", model)

                Catch ex As Exception

                    conn.close()
                    'Return Content("Error")
                    Return Content(ex.ToString)

                End Try

            End If


            If GroupDetailBotons = "Save_Company" Then


                Dim CommandUser
                Dim Query As String

                If Request("EditCompanyID") <> 0 Then
                    Query = "Update Cat_Companies set Company_Name=@Company_Name, Company_Key=@Company_Key , Company_IATA=@Company_IATA , Company_ZIP=@Company_ZIP , Company_Country=@Company_Country, Company_State=@Company_State  where Id_Company=" + Request("EditCompanyID") + " "
                Else
                    Query = "Insert into Cat_Companies( Company_Name, Company_Key, Company_IATA , Company_ZIP , Company_Country , Company_State , Status_Data ) VALUES( @Company_Name, @Company_Key , @Company_IATA , @Company_ZIP , @Company_Country , @Company_State ,@Status_Data )"
                End If


                CommandUser = New SqlCommand(Query, conn)
                'CommandUser.Parameters.AddWithValue("@Id_Company", ConsecutiveValue("Id_Company", "Cat_Companies"))
                CommandUser.Parameters.AddWithValue("@Company_Name", Request("modalcompanyname"))
                CommandUser.Parameters.AddWithValue("@Company_Key", Request("modalcompanykey"))
                CommandUser.Parameters.AddWithValue("@Company_IATA", Request("EditCompanieIATA"))
                CommandUser.Parameters.AddWithValue("@Company_ZIP", Request("EditCompanieZipCode"))
                CommandUser.Parameters.AddWithValue("@Company_Country", Request("editcompanycountry"))
                CommandUser.Parameters.AddWithValue("@Company_State", Request("editcompanystate"))
                CommandUser.Parameters.AddWithValue("@Status_Data", 1)


                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim ListAvailability = New List(Of SelectListItem)

                    ListAvailability.Add(New SelectListItem With {.Text = " ", .Value = " ", .Selected = False})

                    model.ListaAvailabilityin = ListAvailability

                    conn.close()
                    Return PartialView("AvailabilityModal", model)

                Catch ex As Exception

                    conn.close()
                    Return Content("Error")

                End Try


            End If


            If GroupDetailBotons = "Request_Contact_Value" Then

                conn.Open()

                Try

                    Dim QueryDos As String = "Select top 1 *from Cat_Contacts where Status_Data=1 and Contact_Name='" + Request("ContactRequestValue") + "'  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()

                    model.EditGroupData48Value = 0

                    If Results.HasRows Then
                        While Results.Read()

                            model.EditGroupData43Value = Results("Contact_Name")
                            model.EditGroupData44Value = Results("Contact_Email")
                            model.EditGroupData45Value = Results("Phone_Uno")
                            model.EditGroupData46Value = Results("Phone_Dos")
                            model.EditGroupData47Value = Results("Contact_Type")
                            model.EditGroupData48Value = Results("Id_Contact")

                        End While
                    Else
                        model.EditGroupData43Value = Request("ContactRequestValue")
                    End If
                    Results.Close()

                    conn.close()
                    Return PartialView("RequestContactModal", model)

                Catch ex As Exception

                    conn.close()
                    'Return Content("Error")
                    Return Content(ex.ToString)

                End Try

            End If


            If GroupDetailBotons = "Save_Contact" Then


                Dim CommandUser

                Dim Query As String


                If Request("EditContactID") <> 0 Then
                    Query = "Update Cat_Contacts set Contact_Name=@Contact_Name, Contact_Email=@Contact_Email ,Phone_Uno=@Phone_Uno ,Phone_Dos=@Phone_Dos ,Contact_Type=@Contact_Type , Contact_Agency=@Contact_Agency , Contact_Company=@Contact_Company where Id_Contact=" + Request("EditContactID") + " "
                Else
                    Query = "Insert into Cat_Contacts( Contact_Name, Contact_Email, Phone_Uno, Phone_Dos , Contact_Type, Contact_Agency, Contact_Company , Status_Data ) VALUES( @Contact_Name, @Contact_Email, @Phone_Uno, @Phone_Dos , @Contact_Type, @Contact_Agency, @Contact_Company , @Status_Data )"
                End If


                CommandUser = New SqlCommand(Query, conn)
                'CommandUser.Parameters.AddWithValue("@Id_Contact", ConsecutiveValue("Id_Contact", "Cat_Contacts"))
                CommandUser.Parameters.AddWithValue("@Contact_Name", Request("modalcontactname"))
                CommandUser.Parameters.AddWithValue("@Contact_Email", Request("modalemail"))
                CommandUser.Parameters.AddWithValue("@Phone_Uno", Request("modaltelephone1"))
                CommandUser.Parameters.AddWithValue("@Phone_Dos", Request("modaltelephone2"))
                CommandUser.Parameters.AddWithValue("@Contact_Type", Request("modalcontactype"))

                If Request("modalcontactype") = 1 Then
                    Dim WhosaleValue() As String = Split(Request("WholesaleContactmodal"), ":")
                    CommandUser.Parameters.AddWithValue("@Contact_Agency", WhosaleValue(0))
                    CommandUser.Parameters.AddWithValue("@Contact_Company", 0)

                Else

                    'Dim CompanyValue() As String = Split(Request("CompanyContactmodal"), ":")
                    CommandUser.Parameters.AddWithValue("@Contact_Agency", "")
                    CommandUser.Parameters.AddWithValue("@Contact_Company", FindCompany(Request("CompanyContactmodal")))
                End If


                CommandUser.Parameters.AddWithValue("@Status_Data", 1)


                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim ListAvailability = New List(Of SelectListItem)

                    ListAvailability.Add(New SelectListItem With {.Text = " ", .Value = " ", .Selected = False})

                    model.ListaAvailabilityin = ListAvailability

                    conn.close()
                    Return PartialView("AvailabilityModal", model)

                Catch ex As Exception

                    conn.close()
                    Return Content("Error")

                End Try


            End If



            If GroupDetailBotons = "Save_Scheme" Then

                If Request("grupoidlabeltext") = "0" Or Request("grupoidlabeltext") = 0 Or Request("grupoidlabeltext") = "" Then

                    Return Content("Error")

                Else
                    Dim CommandScheme
                    Dim CommandSchemedos
                    Dim Query As String


                    Query = "Update Groups_SchemePayments set Status_Data=0 where  Id_Group=" + Request("grupoidlabeltext") + ""
                    CommandSchemedos = New SqlCommand(Query, conn)
                    conn.Open()

                    Try
                        CommandSchemedos.ExecuteNonQuery()

                    Catch ex As Exception

                        conn.close()

                        Return Content(ex.ToString)

                    End Try

                    conn.close()


                    'Dim Amounts() As String = Split(Request("SchemeAmount"), ",")

                    Dim i As Integer = 0

                    Query = "Insert into Groups_SchemePayments(  Id_Group , NumberPayment , DatePayment , Amount, Status_Data, Date_Register   ) VALUES "



                    If Request("datetimepickerScheme1text") <> "" Then

                        If Request("datetimepickerScheme2text") <> "" Then
                            Query += " ( " + Request("grupoidlabeltext") + " , 1 , '" + Request("datetimepickerScheme1text") + "' , " + Replace(Request("SchemeAmount1"), ",", "") + " , 1 , getdate()  ), "
                        Else
                            Query += " ( " + Request("grupoidlabeltext") + " , 1 , '" + Request("datetimepickerScheme1text") + "' , " + Replace(Request("SchemeAmount1"), ",", "") + " , 1 , getdate()  ) "
                        End If

                    End If

                    If Request("datetimepickerScheme2text") <> "" Then

                        If Request("datetimepickerScheme3text") <> "" Then
                            Query += " ( " + Request("grupoidlabeltext") + " , 2 , '" + Request("datetimepickerScheme2text") + "' , " + Replace(Request("SchemeAmount2"), ",", "") + " , 1 , getdate()  ) ,"
                        Else
                            Query += " ( " + Request("grupoidlabeltext") + " , 2 , '" + Request("datetimepickerScheme2text") + "' , " + Replace(Request("SchemeAmount2"), ",", "") + " , 1 , getdate()  ) "
                        End If

                    End If

                    If Request("datetimepickerScheme3text") <> "" Then


                        If Request("datetimepickerScheme4text") <> "" Then
                            Query += " ( " + Request("grupoidlabeltext") + " , 3 , '" + Request("datetimepickerScheme3text") + "' , " + Replace(Request("SchemeAmount3"), ",", "") + " , 1 , getdate()  ), "
                        Else
                            Query += " ( " + Request("grupoidlabeltext") + " , 3 , '" + Request("datetimepickerScheme3text") + "' , " + Replace(Request("SchemeAmount3"), ",", "") + " , 1 , getdate()  ) "
                        End If



                    End If

                    If Request("datetimepickerScheme4text") <> "" Then

                        If Request("datetimepickerScheme5text") <> "" Then
                            Query += " ( " + Request("grupoidlabeltext") + " , 4 , '" + Request("datetimepickerScheme4text") + "' , " + Replace(Request("SchemeAmount4"), ",", "") + " , 1 , getdate()  ), "
                        Else
                            Query += " ( " + Request("grupoidlabeltext") + " , 4 , '" + Request("datetimepickerScheme4text") + "' , " + Replace(Request("SchemeAmount4"), ",", "") + " , 1 , getdate()  ) "
                        End If

                    End If

                    If Request("datetimepickerScheme5text") <> "" Then

                        Query += " ( " + Request("grupoidlabeltext") + " , 5 , '" + Request("datetimepickerScheme5text") + "' , " + Replace(Request("SchemeAmount5"), ",", "") + " , 1 , getdate()  ) "

                    End If



                    CommandScheme = New SqlCommand(Query, conn)


                    conn.Open()

                    Try
                        CommandScheme.ExecuteNonQuery()


                        'Return Content(Query.ToString)

                        conn.close()

                        Dim QueryDos
                        Dim CommanRate
                        Dim ResultsDos
                        Dim DateInit
                        Dim BanderaRevenue
                        Dim RevenueFinal
                        Dim UsuariosLis = New List(Of GroupsRatesList)

                        conn.Open()

                        QueryDos = "select *from Groups_Rates where Status_Data=1 and id_group=" + Request("grupoidlabeltext") + " order by Id_GroupRate "
                        CommanRate = New SqlCommand(QueryDos, conn)
                        ResultsDos = CommanRate.ExecuteReader()
                        If ResultsDos.HasRows Then
                            While ResultsDos.Read()

                                If DateInit <> ResultsDos("Init_Date") Or i = 0 Then
                                    DateInit = ResultsDos("Init_Date")
                                    If i <> 0 Then
                                        BanderaRevenue = 1
                                    End If
                                End If

                                UsuariosLis.Add(New GroupsRatesList With {.InitDateRate = ResultsDos("Init_Date"), .EndDateRate = ResultsDos("End_Date"), .SuiteName = ResultsDos("Code_Room"), .SuiteCode = ResultsDos("Code_Room"), .RateSingle = ResultsDos("Rate_1"), .RateDouble = ResultsDos("Rate_2"), .RateTripleandFour = ResultsDos("Rate_Extra"), .RateFiveandSix = ResultsDos("Rate_ExtraX"), .RateChildrens = ResultsDos("Rate_C"), .RateTeensValue = ResultsDos("Rate_T"), .Availability = ResultsDos("Status"), .RateRevenue = ResultsDos("Num_Rooms") * Math.Ceiling(ResultsDos("Revenue")), .RatePax = ResultsDos("Num_Rooms"), .CommissionRate = ResultsDos("Commission"), .DiscountRate = ResultsDos("Promo"), .RateRevenuePerRoom = ResultsDos("Revenue"), .RateRevenueRoomNigth = ResultsDos("Rate_2") * 2})


                                If BanderaRevenue = 0 Then
                                    RevenueFinal = RevenueFinal + ResultsDos("Num_Rooms") * Math.Ceiling(ResultsDos("Revenue"))
                                End If


                                i = i + 1

                            End While
                        End If
                        ResultsDos.close()




                        model.RevenueFinal = RevenueFinal
                        model.ListGroupRatesin = UsuariosLis
                        model.Accion = 5
                        model.GroupId = Request("grupoidlabeltext")
                        model.GroupIdLabel = Request("HotelSelect")
                        Select Case Request("HotelSelect")
                            Case "GCR"
                                model.GroupHotelNew = "GCCUN"
                            Case "GPR"
                                model.GroupHotelNew = "POPDC"
                            Case "RPR"
                                model.GroupHotelNew = "ROPDC"
                            Case "TRC"
                                model.GroupHotelNew = "HZLCUN"
                            Case "ZLJ"
                                model.GroupHotelNew = "HZLJAM"
                            Case "ZVC"
                                model.GroupHotelNew = "HZVCUN"
                            Case "ZVJ"
                                model.GroupHotelNew = "HZVJAM"
                            Case "ZVL"
                                model.GroupHotelNew = "HZLCA"
                            Case "ZVP"
                                model.GroupHotelNew = "HZVPV"

                        End Select
                        model.GroupTypeRate = Request("selectratetype")

                        conn.close()

                        Return View("RatesConsult", model)

                    Catch ex As Exception

                        conn.close()

                        Return Content(ex.ToString)

                    End Try


                End If


            End If


            If GroupDetailBotons = "GroupBy_Breakdown" Then

                'BEGIN: Preparación y llamada a base de datos que ejecuta un procedimiento
                Try
                    'BEGIN: llena el modelo con los datos del break down
                    Dim DatosObjeto As New Dictionary(Of String, String)
                    DatosObjeto.Add("Id_Group", Request("grupoidbreakdowngroupby").ToString)
                    DatosObjeto.Add("Group_By", Request("selectgroupbytext").ToString)



                    GetDataBreakDown(model, DatosObjeto, Request("grupoidbreakdowngroupby").ToString, Request("selectgroupbytext").ToString)
                    'END: llena el modelo con los datos del break down

                    Return View("BreakDownConsultDos", model)

                Catch ex As Exception

                    conn.close()

                    Return Content("Error")

                End Try


            End If


            If GroupDetailBotons = "Deploy_Breakdown" Then
                If Request("grupoidbreakdown") <> "0" Then
                    Try
                        'BEGIN: llena el modelo con los datos del break down
                        GetDataBreakDown(model, Request, Request("grupoidbreakdown").ToString, Request("selectgroupby").ToString, "InsertBreak")
                        'END: llena el modelo con los datos del break down

                        Return View("BreakDownConsultDos", model)

                    Catch ex As Exception

                        conn.close()

                        Return Content(ex.ToString)

                    End Try


                Else
                    Return Content("Error")
                End If


            End If




            If GroupDetailBotons = "Edit_Breakdown" Then

                If Request("BreakDownRadio") <> "" Then


                    conn.Open()

                    Try

                        Dim ID_GROUP As Integer = 0
                        Dim QueryTres As String = "select *from BreakDown where  Status_Data=1 and Id_BreakDown=" + Request("BreakDownRadio") + "  "
                        Dim CommandUserDos = New SqlCommand(QueryTres, conn)
                        Dim Results = CommandUserDos.ExecuteReader()

                        'Return Content(QueryTres)
                        model.EditGroupData22 = Request("BreakDownRadio")

                        If Results.HasRows Then
                            While Results.Read()
                                model.EditGroupData21 = Results("GuestName")
                                model.EditGroupData36 = Results("GuestLastName")
                                model.EditGroupData23 = Results("Code_Room")
                                model.EditGroupData24 = Results("TentativeRoom")
                                model.EditGroupData25 = Results("Adults")
                                model.EditGroupData26 = Results("Teens")
                                model.EditGroupData27 = Results("Childs")
                                model.EditGroupData28 = Results("Infants")
                                Dim thisDate1 As Date = Results("Checkin")
                                model.EditGroupData29 = thisDate1.ToString("yyyy-MM-dd")
                                Dim thisDate2 As Date = Results("Checkout")
                                model.EditGroupData30 = thisDate2.ToString("yyyy-MM-dd")
                                model.EditGroupData31 = Results("FolioPMS")
                                model.EditGroupData32 = Results("Special_Notes")
                                model.EditGroupData33 = Results("ComplementaryRoom")
                                ID_GROUP = Results("Id_Group")
                            End While
                        End If
                        Results.Close()

                        Dim BreakdownList = New List(Of GroupsBreakList)

                        Dim QueryDos = "Select COUNT(*) NumGroup , a.Code_Room , a.Checkin , a.Checkout from BreakDown a where a.Id_Group=" + ID_GROUP.ToString + " and a.status_data=1 group by Code_Room , Checkin , Checkout order by Checkin, Code_Room "
                        Dim CommandBreak = New SqlCommand(QueryDos, conn)

                        Dim ResultsBreak = CommandBreak.ExecuteReader()

                        If ResultsBreak.HasRows Then
                            While ResultsBreak.Read()

                                BreakdownList.Add(New GroupsBreakList With {.RoomID = ResultsBreak("NumGroup"), .RoomCode = ResultsBreak("Code_Room"), .Checkin = ResultsBreak("Checkin"), .Checkout = ResultsBreak("Checkout")})

                            End While
                        End If
                        ResultsBreak.Close()


                        Dim BreakdownListGroupBy = New List(Of GroupsBreakList)
                        Dim QueryBreakGroupBy = "Select a.*, DATEDIFF(day,a.Checkin,a.Checkout) as Nights from BreakDown a where a.Id_Group=" + ID_GROUP.ToString + " and a.status_data=1  order by Checkin , Code_Room "
                        Dim CommandBreakGroupBy = New SqlCommand(QueryBreakGroupBy, conn)


                        Dim ResultsBreakGroupBy = CommandBreakGroupBy.ExecuteReader()

                        If ResultsBreakGroupBy.HasRows Then
                            While ResultsBreakGroupBy.Read()


                                BreakdownListGroupBy.Add(New GroupsBreakList With {.RoomID = ResultsBreakGroupBy("Id_BreakDown"), .GuestName = ResultsBreakGroupBy("GuestName") + " " + ResultsBreakGroupBy("GuestLastname"), .RoomCode = ResultsBreakGroupBy("Code_Room"), .Adults = ResultsBreakGroupBy("Adults"), .Teens = ResultsBreakGroupBy("Teens"), .Childrens = ResultsBreakGroupBy("Childs"), .Infants = ResultsBreakGroupBy("Infants"), .Checkin = ResultsBreakGroupBy("Checkin"), .Checkout = ResultsBreakGroupBy("Checkout"), .RoomNighs = ResultsBreakGroupBy("Nights"), .StatusPayment = ResultsBreakGroupBy("Status_P"), .StatusBooking = ResultsBreakGroupBy("Status_B"), .Deposit = 0, .Balance = 0, .Revenue = ResultsBreakGroupBy("Revenue"), .TentativeRooms = ResultsBreakGroupBy("TentativeRoom"), .ComplementaryRooms = ResultsBreakGroupBy("ComplementaryRoom")})


                            End While
                        End If
                        ResultsBreakGroupBy.Close()

                        Dim QueryBreakTotals = "Select a.NumberRooms,COUNT(*)as TotalBreakdown,SUM(b.TentativeRoom) as TotalTentativeRooms ,SUM(b.Adults) as TotalAdults,SUM(b.Teens) as TotalTeens , SUM(b.Childs) as TotalChilds, SUM(b.Infants) as TotalInfants ,SUM(b.Revenue) as TotalRevenue from Groups a left join BreakDown b on a.Id_Group=b.Id_Group where a.Id_Group=" + ID_GROUP.ToString + " and b.Status_B<>3 Group By a.NumberRooms"
                        Dim CommandBreakTotals = New SqlCommand(QueryBreakTotals, conn)

                        Dim ResultsBreakTotal = CommandBreakTotals.ExecuteReader()

                        If ResultsBreakTotal.HasRows Then
                            While ResultsBreakTotal.Read()

                                model.TotalNumRooms = ResultsBreakTotal("NumberRooms")
                                model.TotalDeployRooms = ResultsBreakTotal("TotalBreakdown")
                                model.TotalTentativeRooms = ResultsBreakTotal("TotalTentativeRooms")
                                model.TotalAdults = ResultsBreakTotal("TotalAdults")
                                model.TotalTeens = ResultsBreakTotal("TotalTeens")
                                model.TotalChildrens = ResultsBreakTotal("TotalChilds")
                                model.TotalInfants = ResultsBreakTotal("TotalInfants")
                                model.TotalBalance = 0
                                model.TotalDeposit = 0
                                model.TotalRevenue = ResultsBreakTotal("TotalRevenue")

                            End While
                        End If
                        ResultsBreakTotal.Close()


                        Dim QuerySuites As String = " select distinct a.Clave_TC,a.Nomb_TC_Act,a.SuiteOrden from vw_Tipo_Cuarto a left join Groups_Rates b on a.Clave_TC=b.Code_Room where a.Clav_Hotel='" + Request("editbreakdownhotel") + "' and b.Id_Group=" + ID_GROUP.ToString + " order by a.SuiteOrden  "
                        Dim CommandUserSuites = New SqlCommand(QuerySuites, conn)
                        Dim ListSuites = New List(Of SuitesList)

                        Dim ResultsSuites = CommandUserSuites.ExecuteReader()

                        If ResultsSuites.HasRows Then
                            While ResultsSuites.Read()

                                ListSuites.Add(New SuitesList With {.Text = ResultsSuites("Nomb_TC_Act"), .Value = ResultsSuites("Clave_TC")})
                            End While
                        End If
                        ResultsSuites.Close()


                        Dim QueryPax As String = " select *from BreakDown_Guests where Status_Data=1 and Id_BreakDown=" + Request("BreakDownRadio") + "  "
                        Dim CommandPax = New SqlCommand(QueryPax, conn)
                        Dim ListPax = New List(Of SelectListItem)

                        Dim ResultsPax = CommandPax.ExecuteReader()

                        If ResultsPax.HasRows Then
                            While ResultsPax.Read()

                                ListPax.Add(New SelectListItem With {.Text = ResultsPax("GuestName"), .Value = ResultsPax("GuestLastname")})
                            End While
                        End If
                        ResultsPax.Close()

                        model.ListaBreakdownPaxin = ListPax
                        model.ListGroupBreakdownin = BreakdownList
                        model.ListGroupBreakdownGroupByin = BreakdownListGroupBy
                        model.ListaSuitein = ListSuites
                        model.GroupBy = Request("selectgroupby")

                        conn.close()
                        Return View("EditBreakDownConsult", model)

                    Catch ex As Exception
                        conn.close()
                        Return Content(ex.ToString)

                    End Try

                Else

                    Return Content("Error")

                End If


            End If


            If GroupDetailBotons = "EditDeploy_Breakdown" Then


                Dim CommandUser

                Dim Query As String = " Update BreakDown Set Code_Room=@Code_Room , GuestName=@GuestName , GuestLastName=@GuestLastName , TentativeRoom=@TentativeRoom , ComplementaryRoom=@ComplementaryRoom , Adults=@Adults , Teens=@Teens , Childs=@Childs , Infants=@Infants , Checkin=@Checkin , Checkout=@Checkout , Revenue=@Revenue , Special_Notes=@Special_Notes , FolioPMS=@FolioPMS where Id_BreakDown=@Id_BreakDown "

                CommandUser = New SqlCommand(Query, conn)
                CommandUser.Parameters.AddWithValue("@Id_BreakDown", Request("editbreakdownid"))
                CommandUser.Parameters.AddWithValue("@Code_Room", Request("editselectypesuitebreak"))
                CommandUser.Parameters.AddWithValue("@GuestName", Request("editbreakname"))
                CommandUser.Parameters.AddWithValue("@GuestLastName", Request("editbreaklastname"))
                CommandUser.Parameters.AddWithValue("@TentativeRoom", Request("editbreaknumroomtentative"))
                CommandUser.Parameters.AddWithValue("@ComplementaryRoom", Request("editbreakcomplementaryrooms"))
                CommandUser.Parameters.AddWithValue("@Adults", Request("editbreakadults"))
                CommandUser.Parameters.AddWithValue("@Teens", Request("editbreakteens"))
                CommandUser.Parameters.AddWithValue("@Childs", Request("editbreakchilds"))
                CommandUser.Parameters.AddWithValue("@Infants", Request("editbreakinfants"))
                CommandUser.Parameters.AddWithValue("@Checkin", Request("editdatetimepickerdate1text"))
                CommandUser.Parameters.AddWithValue("@Checkout", Request("editdatetimepickerdate2text"))

                If Request("editbreakcomplementaryrooms") = 1 Then
                    CommandUser.Parameters.AddWithValue("@Revenue", 0)
                Else
                    CommandUser.Parameters.AddWithValue("@Revenue", GetRate(Request("grupoidbreakdown"), Request("editdatetimepickerdate1text"), Request("editdatetimepickerdate2text"), Request("editselectypesuitebreak"), Request("editbreakadults"), Request("editbreakteens"), Request("editbreakchilds")))
                End If

                CommandUser.Parameters.AddWithValue("@Special_Notes", Request("editgroupspecialnotesbreak"))
                CommandUser.Parameters.AddWithValue("@FolioPMS", Request("editbreakfolio"))


                Dim CommandPaxList
                Dim QueryTres As String

                QueryTres = "Update BreakDown_Guests set Status_Data=0 where  Id_BreakDown=" + Request("editbreakdownid") + ""
                CommandPaxList = New SqlCommand(QueryTres, conn)


                Dim QueryCuatro As String = "Insert into BreakDown_Guests(Id_BreakDown , Id_Group, GuestName, GuestLastname, Status_Data, Date_Register  ) VALUES  "
                Dim PaxList() As String = Split(Request("editPaxList"), ",")
                Dim PaxLastnameList() As String = Split(Request("editPaxListLastName"), ",")
                Dim CommandPax

                If PaxList(0) <> "" Then

                    For j = 0 To PaxList.Count - 1

                        If j = PaxList.Count - 1 Then
                            QueryCuatro += " (  " + Request("editbreakdownid") + " , " + Request("grupoidbreakdown") + " ,  '" + PaxList(j) + "' , '" + PaxLastnameList(j) + "' , 1 , getdate() )  "
                        Else
                            QueryCuatro += " (  " + Request("editbreakdownid") + " , " + Request("grupoidbreakdown") + " ,  '" + PaxList(j) + "' , '" + PaxLastnameList(j) + "' , 1 , getdate() ) ,"
                        End If

                    Next

                End If



                Try

                    conn.Open()

                    CommandUser.ExecuteNonQuery()

                    CommandPaxList.ExecuteNonQuery()


                    If PaxList(0) <> "" Then

                        CommandPax = New SqlCommand(QueryCuatro, conn)
                        CommandPax.ExecuteNonQuery()

                    End If

                    conn.close()
                    
                    Dim DatosObjeto As New Dictionary(Of String, String)
                    DatosObjeto.Add("Id_Group", Request("grupoidbreakdown").ToString)
                    DatosObjeto.Add("Group_By", Request("groupbytextedit").ToString)

                    'BEGIN: llena el modelo con los datos del break down
                    GetDataBreakDown(model, DatosObjeto, Request("grupoidbreakdown").ToString, Request("groupbytextedit").ToString)
                    'END: llena el modelo con los datos del break down

                    Return View("BreakDownConsultDos", model)

                Catch ex As Exception
                    conn.close()
                    'Return Content("Error")
                    Return Content(ex.ToString)
                End Try
            End If

            If GroupDetailBotons = "DeleteDeploy_Breakdown" Then

                Dim CommandDelete
                Dim Query As String


                Query = "Update BreakDown set Status_P=4 , Status_B=3 , CancelNotes='" + Request("cancelspecialnotesbreak") + "' , CancelType=" + Request("canceltypebreak") + " where  Id_BreakDown=" + Request("CancelbreakdownID") + ""
                CommandDelete = New SqlCommand(Query, conn)


                Dim CommandUser

                Dim QueryLogBook As String = "Insert into LogBook(Id_Group, Input_Type, Notes, User_LogBook, Status_Data, Date_Register ) VALUES( @Id_Group, @Input_Type, @Notes, @User_LogBook, @Status_Data, @Date_Register )"

                CommandUser = New SqlCommand(QueryLogBook, conn)
                CommandUser.Parameters.AddWithValue("@Id_Group", Request("grupoidbreakdown"))
                CommandUser.Parameters.AddWithValue("@Input_Type", 3)
                CommandUser.Parameters.AddWithValue("@Notes", "CHANGE STATUS TO CANCELED ROOM ID: 000" + Request("CancelbreakdownID") + " , CANCEL TYPE:    , NOTES: " + Request("cancelspecialnotesbreak"))
                CommandUser.Parameters.AddWithValue("@User_LogBook", Session("UserName").ToString)
                CommandUser.Parameters.AddWithValue("@Status_Data", 1)
                CommandUser.Parameters.AddWithValue("@Date_Register", Date.Now())



                conn.Open()
                Try

                    CommandDelete.ExecuteNonQuery()

                    CommandUser.ExecuteNonQuery()

                    Dim BreakdownList = New List(Of GroupsBreakList)
                    Dim QueryDos = "Select COUNT(*) NumGroup , a.Code_Room , a.Checkin , a.Checkout from BreakDown a where a.Id_Group=" + Request("grupoidbreakdown") + " and a.status_data=1 group by Code_Room , Checkin , Checkout order by Checkin, Code_Room "
                    Dim CommandBreak = New SqlCommand(QueryDos, conn)

                    Dim ResultsBreak = CommandBreak.ExecuteReader()

                    If ResultsBreak.HasRows Then
                        While ResultsBreak.Read()

                            BreakdownList.Add(New GroupsBreakList With {.RoomID = ResultsBreak("NumGroup"), .RoomCode = ResultsBreak("Code_Room"), .Checkin = ResultsBreak("Checkin"), .Checkout = ResultsBreak("Checkout")})

                        End While
                    End If
                    ResultsBreak.Close()


                    Dim BreakdownListGroupBy = New List(Of GroupsBreakList)
                    Dim QueryBreakGroupBy = "Select a.*, DATEDIFF(day,a.Checkin,a.Checkout) as Nights from BreakDown a where a.Id_Group=" + Request("grupoidbreakdown") + " and a.status_data=1  order by Checkin , Code_Room "
                    Dim CommandBreakGroupBy = New SqlCommand(QueryBreakGroupBy, conn)


                    Dim ResultsBreakGroupBy = CommandBreakGroupBy.ExecuteReader()

                    If ResultsBreakGroupBy.HasRows Then
                        While ResultsBreakGroupBy.Read()


                            BreakdownListGroupBy.Add(New GroupsBreakList With {.RoomID = ResultsBreakGroupBy("Id_BreakDown"), .GuestName = ResultsBreakGroupBy("GuestName") + " " + ResultsBreakGroupBy("GuestLastname"), .RoomCode = ResultsBreakGroupBy("Code_Room"), .Adults = ResultsBreakGroupBy("Adults"), .Teens = ResultsBreakGroupBy("Teens"), .Childrens = ResultsBreakGroupBy("Childs"), .Infants = ResultsBreakGroupBy("Infants"), .Checkin = ResultsBreakGroupBy("Checkin"), .Checkout = ResultsBreakGroupBy("Checkout"), .RoomNighs = ResultsBreakGroupBy("Nights"), .StatusPayment = ResultsBreakGroupBy("Status_P"), .StatusBooking = ResultsBreakGroupBy("Status_B"), .Deposit = 0, .Balance = 0, .Revenue = ResultsBreakGroupBy("Revenue"), .TentativeRooms = ResultsBreakGroupBy("TentativeRoom"), .ComplementaryRooms = ResultsBreakGroupBy("ComplementaryRoom")})


                        End While
                    End If
                    ResultsBreakGroupBy.Close()


                    Dim QueryBreakTotals = "Select a.NumberRooms,COUNT(*) as TotalBreakdown,SUM(b.TentativeRoom) as TotalTentativeRooms ,SUM(b.Adults) as TotalAdults,SUM(b.Teens) as TotalTeens , SUM(b.Childs) as TotalChilds, SUM(b.Infants) as TotalInfants ,SUM(b.Revenue) as TotalRevenue from Groups a left join BreakDown b on a.Id_Group=b.Id_Group where a.Id_Group=" + Request("grupoidbreakdown") + " and b.Status_B<>3 Group By a.NumberRooms"
                    Dim CommandBreakTotals = New SqlCommand(QueryBreakTotals, conn)

                    Dim ResultsBreakTotal = CommandBreakTotals.ExecuteReader()

                    If ResultsBreakTotal.HasRows Then
                        While ResultsBreakTotal.Read()

                            model.TotalNumRooms = ResultsBreakTotal("NumberRooms")
                            model.TotalDeployRooms = ResultsBreakTotal("TotalBreakdown")
                            model.TotalTentativeRooms = ResultsBreakTotal("TotalTentativeRooms")
                            model.TotalAdults = ResultsBreakTotal("TotalAdults")
                            model.TotalTeens = ResultsBreakTotal("TotalTeens")
                            model.TotalChildrens = ResultsBreakTotal("TotalChilds")
                            model.TotalInfants = ResultsBreakTotal("TotalInfants")
                            model.TotalBalance = 0
                            model.TotalDeposit = 0
                            model.TotalRevenue = ResultsBreakTotal("TotalRevenue")

                        End While
                    End If
                    ResultsBreakTotal.Close()

                    model.ListGroupBreakdownin = BreakdownList
                    model.ListGroupBreakdownGroupByin = BreakdownListGroupBy
                    model.GroupBy = Request("selectgroupby")

                    conn.close()
                    Return View("BreakDownConsultDos", model)

                Catch ex As Exception
                    conn.close()
                    'Return Content("Error")
                    Return Content(ex.ToString)
                End Try



            End If


            If GroupDetailBotons = "LogBook_NewNote" Then

                If Request("grupoidlogbook") <> "0" Then


                    Dim CommandUser

                    Dim Query As String = "Insert into LogBook(Id_Group, Input_Type, Notes, User_LogBook, Status_Data, Date_Register ) VALUES( @Id_Group, @Input_Type, @Notes, @User_LogBook, @Status_Data, @Date_Register )"

                    CommandUser = New SqlCommand(Query, conn)
                    CommandUser.Parameters.AddWithValue("@Id_Group", Request("grupoidlogbook"))
                    CommandUser.Parameters.AddWithValue("@Input_Type", Request("inputypelogbook"))
                    CommandUser.Parameters.AddWithValue("@Notes", Request("logbooknotes"))
                    CommandUser.Parameters.AddWithValue("@User_LogBook", Session("UserName").ToString)
                    CommandUser.Parameters.AddWithValue("@Status_Data", 1)
                    CommandUser.Parameters.AddWithValue("@Date_Register", Date.Now())


                    conn.Open()

                    Try
                        CommandUser.ExecuteNonQuery()

                        Dim LogBookList = New List(Of GroupsLogBookList)
                        Dim QueryLogBook = "Select *from LogBook where Id_group=" + Request("grupoidlogbook") + " and Status_Data=1 order by Date_Register desc "
                        Dim CommandLogBook = New SqlCommand(QueryLogBook, conn)

                        Dim ResultsLogBook = CommandLogBook.ExecuteReader()

                        If ResultsLogBook.HasRows Then
                            While ResultsLogBook.Read()

                                LogBookList.Add(New GroupsLogBookList With {.LogBookID = ResultsLogBook("Id_LoogBook"), .InputType = ResultsLogBook("Input_Type"), .NotesLogBook = ResultsLogBook("Notes"), .UserLogBook = ResultsLogBook("User_LogBook"), .DateLogBook = ResultsLogBook("Date_Register")})

                            End While
                        End If
                        ResultsLogBook.Close()

                        model.ListGroupLogBookin = LogBookList
                        model.Accion = 6

                        conn.close()
                        Return PartialView("LogBookConsult", model)

                    Catch ex As Exception

                        conn.close()
                        Return Content("Error")

                    End Try

                Else

                    Return Content("Error")
                End If


            End If


            If GroupDetailBotons = "Update_LogBook" Then

                'If Request("grupoidlogbook") <> "0" Then

                conn.Open()

                Try

                    Dim LogBookList = New List(Of GroupsLogBookList)
                    Dim QueryLogBook = "Select *from LogBook where Id_group=" + Request("grupoidlogbook") + " and Status_Data=1 order by Date_Register desc "
                    Dim CommandLogBook = New SqlCommand(QueryLogBook, conn)

                    Dim ResultsLogBook = CommandLogBook.ExecuteReader()

                    If ResultsLogBook.HasRows Then
                        While ResultsLogBook.Read()

                            LogBookList.Add(New GroupsLogBookList With {.LogBookID = ResultsLogBook("Id_LoogBook"), .InputType = ResultsLogBook("Input_Type"), .NotesLogBook = ResultsLogBook("Notes"), .UserLogBook = ResultsLogBook("User_LogBook"), .DateLogBook = ResultsLogBook("Date_Register")})

                        End While
                    End If
                    ResultsLogBook.Close()

                    model.ListGroupLogBookin = LogBookList
                    'model.Accion = 6

                    conn.close()
                    Return PartialView("LogBookConsult", model)

                Catch ex As Exception

                    conn.close()
                    Return Content("Error")

                End Try

                'Else

                '    Return Content("Error")

                'End If

            End If



            If GroupDetailBotons = "Add_Payment" Then

                If Request("grupoidpayments") <> "0" Then


                    Dim CommandUser

                    Dim Query As String = "Insert into Payments( Id_Group , AppliedPayment , Id_Breakdown , Id_Event , Type_Payment , Type_Currency , Quantity , Folio_Code_PMS , Distribution_Group , Special_Notes , Status_Payment , Cancelled_Type , User_Validated , Status_Validated  , Cancelled_Notes , User_Register , Status_Data , Date_Register ) VALUES( @Id_Group , @AppliedPayment , @Id_Breakdown , @Id_Event , @Type_Payment , @Type_Currency , @Quantity , @Folio_Code_PMS , @Distribution_Group , @Special_Notes , @Status_Payment , @Cancelled_Type , @User_Validated , @Status_Validated , @Cancelled_Notes , @User_Register , @Status_Data , @Date_Register )"

                    CommandUser = New SqlCommand(Query, conn)
                    CommandUser.Parameters.AddWithValue("@Id_Group", Request("grupoidpayments"))

                    CommandUser.Parameters.AddWithValue("@AppliedPayment", Request("paymentappliedto"))

                    Select Case Request("paymentappliedto")
                        Case 1
                            CommandUser.Parameters.AddWithValue("@Id_Breakdown", 0)
                            CommandUser.Parameters.AddWithValue("@Id_Event", 0)
                        Case 2
                            CommandUser.Parameters.AddWithValue("@Id_Breakdown", Request("paymentroom"))
                            CommandUser.Parameters.AddWithValue("@Id_Event", 0)
                        Case 3
                            CommandUser.Parameters.AddWithValue("@Id_Breakdown", 0)
                            CommandUser.Parameters.AddWithValue("@Id_Event", Request("paymentroom"))
                    End Select


                    CommandUser.Parameters.AddWithValue("@Type_Payment", Request("typepayment"))
                    CommandUser.Parameters.AddWithValue("@Type_Currency", Request("paymentcurrency"))
                    CommandUser.Parameters.AddWithValue("@Quantity", Request("paymentquantity"))
                    CommandUser.Parameters.AddWithValue("@Folio_Code_PMS", Request("paymentsfolio"))
                    CommandUser.Parameters.AddWithValue("@Distribution_Group", Request("paymentgroupdistribution"))
                    CommandUser.Parameters.AddWithValue("@Special_Notes", Request("paymentnotes"))
                    CommandUser.Parameters.AddWithValue("@Status_Payment", 1)
                    CommandUser.Parameters.AddWithValue("@Cancelled_Type", 0)
                    CommandUser.Parameters.AddWithValue("@Cancelled_Notes", "")
                    CommandUser.Parameters.AddWithValue("@User_Validated", "")
                    CommandUser.Parameters.AddWithValue("@Status_Validated", 0)
                    CommandUser.Parameters.AddWithValue("@User_Register", Session("UserName").ToString)
                    CommandUser.Parameters.AddWithValue("@Status_Data", 1)
                    CommandUser.Parameters.AddWithValue("@Date_Register", Date.Now())


                    conn.Open()

                    Try
                        CommandUser.ExecuteNonQuery()

                        Dim PaymentList = New List(Of GroupsPaymentsList)
                        Dim QueryPayments = "Select *from Payments where Id_group=" + Request("grupoidpayments") + " and Status_Data=1 order by Date_Register desc "
                        Dim CommandPayment = New SqlCommand(QueryPayments, conn)
                        Dim DateValidated As String
                        Dim ResultsPayment = CommandPayment.ExecuteReader()

                        If ResultsPayment.HasRows Then
                            While ResultsPayment.Read()
                                If IsDBNull(ResultsPayment("Date_Validated")) Then
                                    DateValidated = ""
                                Else
                                    DateValidated = ResultsPayment("Date_Validated")
                                End If
                                PaymentList.Add(New GroupsPaymentsList With {.RoomID = ResultsPayment("Id_Breakdown"), .EventID = ResultsPayment("Id_Event"), .FolioPayment = ResultsPayment("Folio_Code_PMS"), .DateValidatedPayment = DateValidated, .AppliedPayment = ResultsPayment("AppliedPayment"), .StatusPayment = ResultsPayment("Status_Payment"), .UserValidatedPayment = ResultsPayment("User_Validated"), .DateRegisterPayment = ResultsPayment("Date_Register"), .UserResgisterPayment = ResultsPayment("User_Register"), .ValidatedPayment = ResultsPayment("Status_Validated"), .AmountPayment = ResultsPayment("Quantity"), .DescriptionPayment = ResultsPayment("Special_Notes"), .TypeCurrencyPayment = ResultsPayment("Type_Currency"), .TypePayment = ResultsPayment("Type_Payment"), .PaymentID = ResultsPayment("Id_Payment")})

                            End While
                        End If
                        ResultsPayment.Close()

                        model.ListGroupPaymentsin = PaymentList
                        model.Accion = 7

                        conn.close()
                        Return PartialView("PaymentConsult", model)

                    Catch ex As Exception

                        conn.close()
                        'Return Content("Error")
                        Return Content(ex.ToString)

                    End Try

                Else

                    Return Content("Error")
                End If

            End If



            If GroupDetailBotons = "Validate_Payment" Or GroupDetailBotons = "Delete_Payment" Then

                If Request("grupoidpayments") <> "0" Then

                    Dim CommandDelete
                    Dim Query As String

                    If GroupDetailBotons = "Delete_Payment" Then
                        Query = "Update Payments set Status_Payment=2 , Cancelled_Notes='" + Request("cancelspecialnotesbreak") + "' , Cancelled_Type=" + Request("canceltypebreak") + " where  Id_Payment=" + Request("CancelPaymentID") + ""
                    End If

                    If GroupDetailBotons = "Validate_Payment" Then
                        Query = "Update Payments set Status_Validated=1 , User_Validated='" + Session("UserName").ToString + "' , Date_Validated=getdate() where  Id_Payment=" + Request("ValidatePaymentID") + ""
                    End If


                    CommandDelete = New SqlCommand(Query, conn)


                    Dim CommandUser

                    Dim QueryLogBook As String = "Insert into LogBook(Id_Group, Input_Type, Notes, User_LogBook, Status_Data, Date_Register ) VALUES( @Id_Group, @Input_Type, @Notes, @User_LogBook, @Status_Data, @Date_Register )"

                    CommandUser = New SqlCommand(QueryLogBook, conn)
                    CommandUser.Parameters.AddWithValue("@Id_Group", Request("grupoidpayments"))
                    CommandUser.Parameters.AddWithValue("@Input_Type", 2)

                    If GroupDetailBotons = "Delete_Payment" Then
                        CommandUser.Parameters.AddWithValue("@Notes", "CHANGE STATUS TO CANCELED PAYMENT ID: 000" + Request("CancelPaymentID") + " , CANCEL TYPE:    , NOTES: " + Request("cancelspecialnotesbreak"))
                    End If

                    If GroupDetailBotons = "Validate_Payment" Then
                        CommandUser.Parameters.AddWithValue("@Notes", "VALIDATION OF PAYMENT ID: 000" + Request("ValidatePaymentID") + " , NOTES: " + Request("cancelspecialnotesbreak"))
                    End If


                    CommandUser.Parameters.AddWithValue("@User_LogBook", Session("UserName").ToString)
                    CommandUser.Parameters.AddWithValue("@Status_Data", 1)
                    CommandUser.Parameters.AddWithValue("@Date_Register", Date.Now())



                    conn.Open()
                    Try

                        CommandDelete.ExecuteNonQuery()

                        CommandUser.ExecuteNonQuery()

                        Dim PaymentList = New List(Of GroupsPaymentsList)
                        Dim QueryPayments = "Select *from Payments where Id_group=" + Request("grupoidpayments") + " and Status_Data=1 order by Date_Register desc "
                        Dim CommandPayment = New SqlCommand(QueryPayments, conn)
                        Dim DateValidated As String
                        Dim ResultsPayment = CommandPayment.ExecuteReader()

                        If ResultsPayment.HasRows Then
                            While ResultsPayment.Read()
                                If IsDBNull(ResultsPayment("Date_Validated")) Then
                                    DateValidated = ""
                                Else
                                    DateValidated = ResultsPayment("Date_Validated")
                                End If
                                PaymentList.Add(New GroupsPaymentsList With {.RoomID = ResultsPayment("Id_Breakdown"), .EventID = ResultsPayment("Id_Event"), .FolioPayment = ResultsPayment("Folio_Code_PMS"), .DateValidatedPayment = DateValidated, .AppliedPayment = ResultsPayment("AppliedPayment"), .StatusPayment = ResultsPayment("Status_Payment"), .UserValidatedPayment = ResultsPayment("User_Validated"), .DateRegisterPayment = ResultsPayment("Date_Register"), .UserResgisterPayment = ResultsPayment("User_Register"), .ValidatedPayment = ResultsPayment("Status_Validated"), .AmountPayment = ResultsPayment("Quantity"), .DescriptionPayment = ResultsPayment("Special_Notes"), .TypeCurrencyPayment = ResultsPayment("Type_Currency"), .TypePayment = ResultsPayment("Type_Payment"), .PaymentID = ResultsPayment("Id_Payment")})

                            End While
                        End If
                        ResultsPayment.Close()

                        model.ListGroupPaymentsin = PaymentList
                        'model.Accion = 7

                        conn.close()
                        Return PartialView("PaymentConsult", model)


                    Catch ex As Exception


                        conn.close()
                        'Return Content("Error")
                        Return Content(ex.ToString)

                    End Try


                Else

                    Return Content("Error")
                End If

            End If



            If GroupDetailBotons = "Add_Event" Then

                If Request("grupoidevents") <> "0" Then


                    Dim CommandUser

                    Dim Query As String = "Insert into Events(Id_Group , Event_Name , Num_Pax , Id_Salon , SalonName , Event_Seller , Event_Cordinator, Event_Date, Event_StartTime, Event_EndTime, Event_Coments, Status_Event , Deposits, Balance , Revenue , Status_Data , User_Register , Date_Register  )  VALUES (@Id_Group , @Event_Name , @Num_Pax , @Id_Salon , @SalonName , @Event_Seller , @Event_Cordinator, @Event_Date, @Event_StartTime, @Event_EndTime, @Event_Coments, @Status_Event , @Deposits, @Balance , @Revenue , @Status_Data , @User_Register , @Date_Register) "

                    CommandUser = New SqlCommand(Query, conn)
                    CommandUser.Parameters.AddWithValue("@Id_Group", Request("grupoidevents"))
                    CommandUser.Parameters.AddWithValue("@Event_Name", Request("eventname"))
                    CommandUser.Parameters.AddWithValue("@Num_Pax", Request("eventpax"))

                    If Request("grupohotelevents") = "GCR" Or Request("grupohotelevents") = "RPR" Or Request("grupohotelevents") = "GPR" Or Request("grupohotelevents") = "TRC" Then
                        Dim Salon() As String = Split(Request("eventsalon"), ",")
                        CommandUser.Parameters.AddWithValue("@Id_Salon", Salon(0))

                        CommandUser.Parameters.AddWithValue("@SalonName", Salon(1))
                    Else
                        CommandUser.Parameters.AddWithValue("@Id_Salon", 0)

                        CommandUser.Parameters.AddWithValue("@SalonName", Request("eventsalontext"))
                    End If


                    CommandUser.Parameters.AddWithValue("@Event_Seller", Request("eventseller"))
                    CommandUser.Parameters.AddWithValue("@Event_Cordinator", Request("eventcoordinator"))
                    CommandUser.Parameters.AddWithValue("@Event_Date", Request("datetimepicker15text"))
                    CommandUser.Parameters.AddWithValue("@Event_StartTime", Request("datetimepicker16text"))
                    CommandUser.Parameters.AddWithValue("@Event_EndTime", Request("datetimepicker17text"))
                    CommandUser.Parameters.AddWithValue("@Event_Coments", Request("eventcoment"))
                    CommandUser.Parameters.AddWithValue("@Status_Event", 1)
                    CommandUser.Parameters.AddWithValue("@Deposits", 0)
                    CommandUser.Parameters.AddWithValue("@Balance", 0)
                    CommandUser.Parameters.AddWithValue("@Revenue", 0)
                    CommandUser.Parameters.AddWithValue("@User_Register", Session("UserName").ToString)
                    CommandUser.Parameters.AddWithValue("@Status_Data", 1)
                    CommandUser.Parameters.AddWithValue("@Date_Register", Date.Now())


                    conn.Open()

                    Try
                        CommandUser.ExecuteNonQuery()

                        Dim EventsList = New List(Of GroupsEventsList)
                        Dim QueryEvetns = "Select *from Events where Id_group=" + Request("grupoidevents") + " and Status_Data=1 order by Date_Register desc "
                        Dim CommandEvents = New SqlCommand(QueryEvetns, conn)

                        Dim ResultsEvents = CommandEvents.ExecuteReader()

                        If ResultsEvents.HasRows Then
                            While ResultsEvents.Read()

                                EventsList.Add(New GroupsEventsList With {.EventID = ResultsEvents("Id_Event"), .EventName = ResultsEvents("Event_Name"), .EventDate = ResultsEvents("Event_Date"), .EventStartTime = ResultsEvents("Event_StartTime"), .EventEndTime = ResultsEvents("Event_EndTime"), .EventSalonName = ResultsEvents("SalonName"), .EventStatus = ResultsEvents("Status_Event"), .EventPax = ResultsEvents("Num_Pax"), .EventSellerName = ResultsEvents("Event_Seller"), .EventCordinatorName = ResultsEvents("Event_Cordinator"), .EventDeposits = ResultsEvents("Deposits"), .EventBalance = ResultsEvents("Balance"), .EventRevenue = ResultsEvents("Revenue"), .EventUserRegister = ResultsEvents("User_Register"), .EventDateRegister = ResultsEvents("Date_Register")})

                            End While
                        End If
                        ResultsEvents.Close()


                        model.ListGroupEventsin = EventsList


                        model.Accion = 8

                        conn.close()
                        Return PartialView("EventsConsult", model)

                    Catch ex As Exception

                        conn.close()
                        'Return Content("Error")
                        Return Content(ex.ToString)

                    End Try

                Else

                    Return Content("Error")
                End If

            End If



            If GroupDetailBotons = "Delete_Event" Then


                If Request("grupoidevents") <> "0" Then


                    Dim CommandDelete
                    Dim Query As String


                    Query = "Update Events set  Status_Event=2  where  Id_Event=" + Request("CancelEventID") + ""
                    CommandDelete = New SqlCommand(Query, conn)


                    Dim CommandUser

                    Dim QueryLogBook As String = "Insert into LogBook(Id_Group, Input_Type, Notes, User_LogBook, Status_Data, Date_Register ) VALUES( @Id_Group, @Input_Type, @Notes, @User_LogBook, @Status_Data, @Date_Register )"

                    CommandUser = New SqlCommand(QueryLogBook, conn)
                    CommandUser.Parameters.AddWithValue("@Id_Group", Request("grupoidevents"))
                    CommandUser.Parameters.AddWithValue("@Input_Type", 4)
                    CommandUser.Parameters.AddWithValue("@Notes", "CHANGE STATUS TO CANCELED EVENT ID: 000" + Request("CancelEventID") + " , CANCEL TYPE:    , NOTES: " + Request("cancelspecialnotesbreak"))
                    CommandUser.Parameters.AddWithValue("@User_LogBook", Session("UserName").ToString)
                    CommandUser.Parameters.AddWithValue("@Status_Data", 1)
                    CommandUser.Parameters.AddWithValue("@Date_Register", Date.Now())



                    conn.Open()
                    Try

                        CommandDelete.ExecuteNonQuery()

                        CommandUser.ExecuteNonQuery()

                        Dim EventsList = New List(Of GroupsEventsList)
                        Dim QueryEvetns = "Select *from Events where Id_group=" + Request("grupoidevents") + " and Status_Data=1 order by Date_Register desc "
                        Dim CommandEvents = New SqlCommand(QueryEvetns, conn)

                        Dim ResultsEvents = CommandEvents.ExecuteReader()

                        If ResultsEvents.HasRows Then
                            While ResultsEvents.Read()

                                EventsList.Add(New GroupsEventsList With {.EventID = ResultsEvents("Id_Event"), .EventName = ResultsEvents("Event_Name"), .EventDate = ResultsEvents("Event_Date"), .EventStartTime = ResultsEvents("Event_StartTime"), .EventEndTime = ResultsEvents("Event_EndTime"), .EventSalonName = ResultsEvents("SalonName"), .EventStatus = ResultsEvents("Status_Event"), .EventPax = ResultsEvents("Num_Pax"), .EventSellerName = ResultsEvents("Event_Seller"), .EventCordinatorName = ResultsEvents("Event_Cordinator"), .EventDeposits = ResultsEvents("Deposits"), .EventBalance = ResultsEvents("Balance"), .EventRevenue = ResultsEvents("Revenue"), .EventUserRegister = ResultsEvents("User_Register"), .EventDateRegister = ResultsEvents("Date_Register")})

                            End While
                        End If
                        ResultsEvents.Close()


                        model.ListGroupEventsin = EventsList

                        'model.Accion = 8

                        conn.close()
                        Return PartialView("EventsConsult", model)

                    Catch ex As Exception

                        conn.close()
                        'Return Content("Error")
                        Return Content(ex.ToString)

                    End Try

                Else

                    Return Content("Error")
                End If

            End If


            If GroupDetailBotons = "Payment_Status_Cancelled" Or GroupDetailBotons = "Payment_Status_Changed" Then


                If Request("grupoidstatus") <> "0" Then


                    Dim CommandDelete
                    Dim Query As String


                    Query = "Update Groups_Status set  Status_Data=0  where Type_Status=1 and Status_Data=1 and Id_Group=" + Request("grupoidstatus") + ""
                    CommandDelete = New SqlCommand(Query, conn)


                    Dim CommandUser
                    Dim CommandStatusPayment
                    Dim StatusText As String = ""

                    Dim QueryLogBook As String = "INSERT INTO LogBook(Id_Group, Input_Type, Notes, User_LogBook, Status_Data, Date_Register ) VALUES( @Id_Group, @Input_Type, @Notes, @User_LogBook, @Status_Data, @Date_Register )"
                    CommandUser = New SqlCommand(QueryLogBook, conn)
                    CommandUser.Parameters.AddWithValue("@Id_Group", Request("grupoidstatus"))
                    CommandUser.Parameters.AddWithValue("@Input_Type", 1)

                    If GroupDetailBotons = "Payment_Status_Cancelled" Then
                        CommandUser.Parameters.AddWithValue("@Notes", "CHANGE GROUP PAYMENT STATUS TO CANCELLED  , CANCEL TYPE:    , NOTES: " + Request("paymentcancelspecialnotesbreak"))
                    Else
                        Select Case Request("selectstatuspayment")
                            Case 1
                                StatusText = "UNPAID"

                            Case 2
                                StatusText = "PARTIAL"

                            Case 3
                                StatusText = "CANCELED"

                            Case 4
                                StatusText = "OVER PAID"

                            Case 5
                                StatusText = "CONCILIATE"

                            Case 6
                                StatusText = "PAID"

                        End Select
                        CommandUser.Parameters.AddWithValue("@Notes", "CHANGE GROUP PAYMENT STATUS TO " + StatusText + " , NOTES: " + Request("paymentchangespecialnotesbreak"))
                    End If

                    CommandUser.Parameters.AddWithValue("@User_LogBook", Session("UserName").ToString)
                    CommandUser.Parameters.AddWithValue("@Status_Data", 1)
                    CommandUser.Parameters.AddWithValue("@Date_Register", Date.Now())


                    Dim Query2 As String = "INSERT INTO Groups_Status(Id_Group, Type_Status, Group_Status, Notes, Cancelled_Type , Date_Register , Status_Data ) VALUES (@Id_Group , @Type_Status , @Group_Status , @Notes , @Cancelled_Type , @Date_Register , @Status_Data ) "
                    CommandStatusPayment = New SqlCommand(Query2, conn)
                    CommandStatusPayment.Parameters.AddWithValue("@Id_Group", Request("grupoidstatus"))
                    CommandStatusPayment.Parameters.AddWithValue("@Type_Status", 1)
                    CommandStatusPayment.Parameters.AddWithValue("@Group_Status", Request("selectstatuspayment"))


                    If GroupDetailBotons = "Payment_Status_Cancelled" Then
                        CommandStatusPayment.Parameters.AddWithValue("@Cancelled_Type", 0)
                        CommandStatusPayment.Parameters.AddWithValue("@Notes", Request("paymentcancelspecialnotesbreak"))
                    Else
                        CommandStatusPayment.Parameters.AddWithValue("@Cancelled_Type", 0)
                        CommandStatusPayment.Parameters.AddWithValue("@Notes", Request("paymentchangespecialnotesbreak"))
                    End If

                    CommandStatusPayment.Parameters.AddWithValue("@Status_Data", 1)
                    CommandStatusPayment.Parameters.AddWithValue("@Date_Register", Date.Now)


                    conn.Open()
                    Try

                        CommandDelete.ExecuteNonQuery()
                        CommandStatusPayment.ExecuteNonQuery()
                        CommandUser.ExecuteNonQuery()

                        'Dim EventsList = New List(Of GroupsEventsList)
                        Dim QueryStatus = "select a.PaymentStatus, B.BookStatus, c.HotelStatus from(select Group_Status as PaymentStatus, Id_Group from Groups_Status where Id_Group=" + Request("grupoidstatus") + " and Type_Status=1 and Status_Data=1)a left join (select Group_Status as BookStatus, Id_Group from Groups_Status where Id_Group=" + Request("grupoidstatus") + " and Type_Status=2 and Status_Data=1)b on a.Id_Group=b.Id_Group left join (select Group_Status as HotelStatus, Id_Group from Groups_Status where Id_Group=" + Request("grupoidstatus") + " and Type_Status=3 and Status_Data=1)c on a.Id_Group=c.Id_Group "
                        Dim CommandStatus = New SqlCommand(QueryStatus, conn)

                        Dim ResultsStatus = CommandStatus.ExecuteReader()

                        If ResultsStatus.HasRows Then
                            While ResultsStatus.Read()

                                model.GroupStatusPayment = ResultsStatus("PaymentStatus")
                                model.GroupStatusBook = ResultsStatus("BookStatus")
                                model.GroupStatusHotel = ResultsStatus("HotelStatus")

                            End While
                        End If
                        ResultsStatus.Close()

                        'model.ListGroupEventsin = EventsList

                        'model.Accion = 8

                        conn.close()
                        Return PartialView("StatusConsult", model)

                    Catch ex As Exception

                        conn.close()
                        Return Content("Error")
                        'Return Content(ex.ToString)

                    End Try

                Else

                    Return Content("Error")
                End If

            End If



            If GroupDetailBotons = "Book_Status_Cancelled" Or GroupDetailBotons = "Book_Status_Changed" Then


                If Request("grupoidstatus") <> "0" Then


                    Dim CommandDelete
                    Dim Query As String


                    Query = "Update Groups_Status set  Status_Data=0  where Type_Status=2 and Status_Data=1 and Id_Group=" + Request("grupoidstatus") + ""
                    CommandDelete = New SqlCommand(Query, conn)


                    Dim CommandUser
                    Dim CommandStatusPayment
                    Dim StatusText As String = ""

                    Dim QueryLogBook As String = "INSERT INTO LogBook(Id_Group, Input_Type, Notes, User_LogBook, Status_Data, Date_Register ) VALUES( @Id_Group, @Input_Type, @Notes, @User_LogBook, @Status_Data, @Date_Register )"
                    CommandUser = New SqlCommand(QueryLogBook, conn)
                    CommandUser.Parameters.AddWithValue("@Id_Group", Request("grupoidstatus"))
                    CommandUser.Parameters.AddWithValue("@Input_Type", 1)

                    If GroupDetailBotons = "Book_Status_Cancelled" Then
                        CommandUser.Parameters.AddWithValue("@Notes", "CHANGE GROUP BOOK STATUS TO CANCELLED  , CANCEL TYPE:    , NOTES: " + Request("bookcancelspecialnotesbreak"))
                    Else
                        Select Case Request("selectstatusbook")
                            Case 1
                                StatusText = "PROSPECT"

                            Case 2
                                StatusText = "TENTATIVE"

                            Case 3
                                StatusText = "CANCELED"

                            Case 4
                                StatusText = "TURNED DOWN"

                            Case 5
                                StatusText = "LOST"

                            Case 6
                                StatusText = "DEFINITIVE"

                            Case 7
                                StatusText = "EXPIRED"

                        End Select
                        CommandUser.Parameters.AddWithValue("@Notes", "CHANGE GROUP BOOK STATUS TO " + StatusText + " , NOTES: " + Request("bookchangespecialnotesbreak"))
                    End If

                    CommandUser.Parameters.AddWithValue("@User_LogBook", Session("UserName").ToString)
                    CommandUser.Parameters.AddWithValue("@Status_Data", 1)
                    CommandUser.Parameters.AddWithValue("@Date_Register", Date.Now())


                    Dim Query2 As String = "INSERT INTO Groups_Status(Id_Group, Type_Status, Group_Status, Notes, Cancelled_Type , Date_Register , Status_Data ) VALUES (@Id_Group , @Type_Status , @Group_Status , @Notes , @Cancelled_Type , @Date_Register , @Status_Data ) "
                    CommandStatusPayment = New SqlCommand(Query2, conn)
                    CommandStatusPayment.Parameters.AddWithValue("@Id_Group", Request("grupoidstatus"))
                    CommandStatusPayment.Parameters.AddWithValue("@Type_Status", 2)
                    CommandStatusPayment.Parameters.AddWithValue("@Group_Status", Request("selectstatusbook"))


                    If GroupDetailBotons = "Book_Status_Cancelled" Then
                        CommandStatusPayment.Parameters.AddWithValue("@Cancelled_Type", 0)
                        CommandStatusPayment.Parameters.AddWithValue("@Notes", Request("bookcancelspecialnotesbreak"))
                    Else
                        CommandStatusPayment.Parameters.AddWithValue("@Cancelled_Type", 0)
                        CommandStatusPayment.Parameters.AddWithValue("@Notes", Request("bookchangespecialnotesbreak"))
                    End If

                    CommandStatusPayment.Parameters.AddWithValue("@Status_Data", 1)
                    CommandStatusPayment.Parameters.AddWithValue("@Date_Register", Date.Now)


                    conn.Open()
                    Try

                        CommandDelete.ExecuteNonQuery()
                        CommandStatusPayment.ExecuteNonQuery()
                        CommandUser.ExecuteNonQuery()

                        'Dim EventsList = New List(Of GroupsEventsList)
                        Dim QueryStatus = "select a.PaymentStatus, B.BookStatus, c.HotelStatus from(select Group_Status as PaymentStatus, Id_Group from Groups_Status where Id_Group=" + Request("grupoidstatus") + " and Type_Status=1 and Status_Data=1)a left join (select Group_Status as BookStatus, Id_Group from Groups_Status where Id_Group=" + Request("grupoidstatus") + " and Type_Status=2 and Status_Data=1)b on a.Id_Group=b.Id_Group left join (select Group_Status as HotelStatus, Id_Group from Groups_Status where Id_Group=" + Request("grupoidstatus") + " and Type_Status=3 and Status_Data=1)c on a.Id_Group=c.Id_Group "
                        Dim CommandStatus = New SqlCommand(QueryStatus, conn)

                        Dim ResultsStatus = CommandStatus.ExecuteReader()

                        If ResultsStatus.HasRows Then
                            While ResultsStatus.Read()

                                model.GroupStatusPayment = ResultsStatus("PaymentStatus")
                                model.GroupStatusBook = ResultsStatus("BookStatus")
                                model.GroupStatusHotel = ResultsStatus("HotelStatus")

                            End While
                        End If
                        ResultsStatus.Close()

                        'model.ListGroupEventsin = EventsList

                        'model.Accion = 8

                        conn.close()
                        Return PartialView("StatusConsult", model)

                    Catch ex As Exception

                        conn.close()
                        Return Content("Error")
                        'Return Content(ex.ToString)

                    End Try

                Else

                    Return Content("Error")
                End If

            End If


            If GroupDetailBotons = "Hotel_Status_Cancelled" Or GroupDetailBotons = "Hotel_Status_Changed" Then


                If Request("grupoidstatus") <> "0" Then


                    Dim CommandDelete
                    Dim Query As String


                    Query = "Update Groups_Status set  Status_Data=0  where Type_Status=3 and Status_Data=1 and Id_Group=" + Request("grupoidstatus") + ""
                    CommandDelete = New SqlCommand(Query, conn)


                    Dim CommandUser
                    Dim CommandStatusPayment
                    Dim StatusText As String = ""

                    Dim QueryLogBook As String = "INSERT INTO LogBook(Id_Group, Input_Type, Notes, User_LogBook, Status_Data, Date_Register ) VALUES( @Id_Group, @Input_Type, @Notes, @User_LogBook, @Status_Data, @Date_Register )"
                    CommandUser = New SqlCommand(QueryLogBook, conn)
                    CommandUser.Parameters.AddWithValue("@Id_Group", Request("grupoidstatus"))
                    CommandUser.Parameters.AddWithValue("@Input_Type", 1)

                    If GroupDetailBotons = "Hotel_Status_Cancelled" Then
                        CommandUser.Parameters.AddWithValue("@Notes", "CHANGE GROUP HOTEL STATUS TO CANCELLED  , CANCEL TYPE:    , NOTES: " + Request("hotelcancelspecialnotesbreak"))
                    Else
                        Select Case Request("selectstatushotel")
                            Case 1
                                StatusText = "NO CONFIRM"

                            Case 2
                                StatusText = "SEND"

                            Case 3
                                StatusText = "CANCELED"

                            Case 4
                                StatusText = "CONFIRMED"


                        End Select
                        CommandUser.Parameters.AddWithValue("@Notes", "CHANGE GROUP HOTEL STATUS TO " + StatusText + " , NOTES: " + Request("hotelchangespecialnotesbreak"))
                    End If

                    CommandUser.Parameters.AddWithValue("@User_LogBook", Session("UserName").ToString)
                    CommandUser.Parameters.AddWithValue("@Status_Data", 1)
                    CommandUser.Parameters.AddWithValue("@Date_Register", Date.Now())


                    Dim Query2 As String = "INSERT INTO Groups_Status(Id_Group, Type_Status, Group_Status, Notes, Cancelled_Type , Date_Register , Status_Data ) VALUES (@Id_Group , @Type_Status , @Group_Status , @Notes , @Cancelled_Type , @Date_Register , @Status_Data ) "
                    CommandStatusPayment = New SqlCommand(Query2, conn)
                    CommandStatusPayment.Parameters.AddWithValue("@Id_Group", Request("grupoidstatus"))
                    CommandStatusPayment.Parameters.AddWithValue("@Type_Status", 3)
                    CommandStatusPayment.Parameters.AddWithValue("@Group_Status", Request("selectstatushotel"))


                    If GroupDetailBotons = "Hotel_Status_Cancelled" Then
                        CommandStatusPayment.Parameters.AddWithValue("@Cancelled_Type", 0)
                        CommandStatusPayment.Parameters.AddWithValue("@Notes", Request("hotelcancelspecialnotesbreak"))
                    Else
                        CommandStatusPayment.Parameters.AddWithValue("@Cancelled_Type", 0)
                        CommandStatusPayment.Parameters.AddWithValue("@Notes", Request("hotelchangespecialnotesbreak"))
                    End If

                    CommandStatusPayment.Parameters.AddWithValue("@Status_Data", 1)
                    CommandStatusPayment.Parameters.AddWithValue("@Date_Register", Date.Now)


                    conn.Open()
                    Try

                        CommandDelete.ExecuteNonQuery()
                        CommandStatusPayment.ExecuteNonQuery()
                        CommandUser.ExecuteNonQuery()

                        'Dim EventsList = New List(Of GroupsEventsList)
                        Dim QueryStatus = "select a.PaymentStatus, B.BookStatus, c.HotelStatus from(select Group_Status as PaymentStatus, Id_Group from Groups_Status where Id_Group=" + Request("grupoidstatus") + " and Type_Status=1 and Status_Data=1)a left join (select Group_Status as BookStatus, Id_Group from Groups_Status where Id_Group=" + Request("grupoidstatus") + " and Type_Status=2 and Status_Data=1)b on a.Id_Group=b.Id_Group left join (select Group_Status as HotelStatus, Id_Group from Groups_Status where Id_Group=" + Request("grupoidstatus") + " and Type_Status=3 and Status_Data=1)c on a.Id_Group=c.Id_Group "
                        Dim CommandStatus = New SqlCommand(QueryStatus, conn)

                        Dim ResultsStatus = CommandStatus.ExecuteReader()

                        If ResultsStatus.HasRows Then
                            While ResultsStatus.Read()

                                model.GroupStatusPayment = ResultsStatus("PaymentStatus")
                                model.GroupStatusBook = ResultsStatus("BookStatus")
                                model.GroupStatusHotel = ResultsStatus("HotelStatus")

                            End While
                        End If
                        ResultsStatus.Close()

                        'model.ListGroupEventsin = EventsList

                        'model.Accion = 8

                        conn.close()
                        Return PartialView("StatusConsult", model)

                    Catch ex As Exception

                        conn.close()
                        Return Content("Error")
                        'Return Content(ex.ToString)

                    End Try

                Else

                    Return Content("Error")
                End If

            End If

        End Function

        '
        ' GET: /Group/GroupsBreak
        Function GroupsBreak() As ActionResult
            Return View()
        End Function


        '
        ' GET: /Groups/Dashboard

        Function Dashboard() As ActionResult
            UserPermissions("1,2,3,4")
            Return View()
        End Function



        Function WhosaleList(ByVal search As String) As JsonResult

            ' Dim data = New String() {"ActionScript", "AppleScript", "Asp", "BASIC", "C", "C++", "Clojure", "COBOL", "ColdFusion","Erlang","Fortran","Groovy","Haskell","instinctcoder.com", "Java", "JavaScript","Lisp","Perl", "PHP", "Python", "edgar","Ruby","Scala", "Scheme"}

            conn.Open()
            Dim Query As String
            Dim CommandUser
            Dim Resultados
            Dim Activo = New List(Of String)

            Query = "Select  (Clav_Ag + ': ' + Nombre_Ag) as  Clav_Ag from vw_Agencies  where (Clav_Ag like '%" + search + "%' or  Nombre_Ag like '%" + search + "%')   order by Clav_Ag "
            CommandUser = New SqlCommand(Query, conn)
            Resultados = CommandUser.ExecuteReader()

            If Resultados.HasRows Then
                While Resultados.Read()
                    Activo.Add(Resultados("Clav_Ag"))
                End While
                Resultados.Close()
            End If

            conn.close()
            Dim result
            'Dim result_dos
            'result = Activo.Where(Function(x) x.ToLower().StartsWith(search.ToLower())).ToList()
            'result_dos = Activo.Where(Function(x) x.ToLower().EndsWith(search.ToLower())).ToList()
            'result = Enumerable.Concat(result, result_dos)

            result = Activo.ToList()

            Return Json(result, JsonRequestBehavior.AllowGet)
        End Function


        Function Contacts(ByVal search As String) As JsonResult

            ' Dim data = New String() {"ActionScript", "AppleScript", "Asp", "BASIC", "C", "C++", "Clojure", "COBOL", "ColdFusion","Erlang","Fortran","Groovy","Haskell","instinctcoder.com", "Java", "JavaScript","Lisp","Perl", "PHP", "Python", "edgar","Ruby","Scala", "Scheme"}

            conn.Open()
            Dim Query As String
            Dim CommandUser
            Dim Resultados
            Dim Activo = New List(Of String)

            Query = "select Contact_Name from Cat_Contacts where Status_Data=1 and Contact_Name  like '%" + search + "%'  order by Contact_Name "
            CommandUser = New SqlCommand(Query, conn)
            Resultados = CommandUser.ExecuteReader()

            If Resultados.HasRows Then
                While Resultados.Read()
                    Activo.Add(Resultados("Contact_Name"))
                End While
                Resultados.Close()
            End If

            conn.close()
            Dim result
            'Dim result_dos
            'result = Activo.Where(Function(x) x.ToLower().StartsWith(search.ToLower())).ToList()
            'result_dos = Activo.Where(Function(x) x.ToLower().EndsWith(search.ToLower())).ToList()
            'result = Enumerable.Concat(result, result_dos)

            result = Activo.ToList()

            Return Json(result, JsonRequestBehavior.AllowGet)
        End Function


        Function Companies(ByVal search As String) As JsonResult

            ' Dim data = New String() {"ActionScript", "AppleScript", "Asp", "BASIC", "C", "C++", "Clojure", "COBOL", "ColdFusion","Erlang","Fortran","Groovy","Haskell","instinctcoder.com", "Java", "JavaScript","Lisp","Perl", "PHP", "Python", "edgar","Ruby","Scala", "Scheme"}

            conn.Open()
            Dim Query As String
            Dim CommandUser
            Dim Resultados
            Dim Activo = New List(Of String)

            Query = "Select  Company_Name as  Clav_Ag from Cat_Companies  where Status_Data=1 and Company_Name like '%" + search + "%'  order by Clav_Ag "
            CommandUser = New SqlCommand(Query, conn)
            Resultados = CommandUser.ExecuteReader()

            If Resultados.HasRows Then
                While Resultados.Read()
                    Activo.Add(Resultados("Clav_Ag"))
                End While
                Resultados.Close()
            End If

            conn.close()
            Dim result
            'Dim result_dos
            'result = Activo.Where(Function(x) x.ToLower().StartsWith(search.ToLower())).ToList()
            'result_dos = Activo.Where(Function(x) x.ToLower().EndsWith(search.ToLower())).ToList()
            'result = Enumerable.Concat(result, result_dos)

            result = Activo.ToList()

            Return Json(result, JsonRequestBehavior.AllowGet)
        End Function


        Function WhosaleListCompany(ByVal search As String) As JsonResult

            ' Dim data = New String() {"ActionScript", "AppleScript", "Asp", "BASIC", "C", "C++", "Clojure", "COBOL", "ColdFusion","Erlang","Fortran","Groovy","Haskell","instinctcoder.com", "Java", "JavaScript","Lisp","Perl", "PHP", "Python", "edgar","Ruby","Scala", "Scheme"}

            conn.Open()
            Dim Query As String
            Dim CommandUser
            Dim Resultados
            Dim Activo = New List(Of String)

            Query = "Select  (Clav_Ag + ': ' + Nombre_Ag) as  Clav_Ag from vw_Agencies  where (Clav_Ag like '%" + search + "%' or  Nombre_Ag like '%" + search + "%')   UNION  Select  (Company_Name) as  Clav_Ag from Cat_Companies  where Status_Data=1 and Company_Name like '%" + search + "%'  order by Clav_Ag  "
            CommandUser = New SqlCommand(Query, conn)
            Resultados = CommandUser.ExecuteReader()

            If Resultados.HasRows Then
                While Resultados.Read()
                    Activo.Add(Resultados("Clav_Ag"))
                End While
                Resultados.Close()
            End If

            conn.close()
            Dim result
            'Dim result_dos
            'result = Activo.Where(Function(x) x.ToLower().StartsWith(search.ToLower())).ToList()
            'result_dos = Activo.Where(Function(x) x.ToLower().EndsWith(search.ToLower())).ToList()
            'result = Enumerable.Concat(result, result_dos)

            result = Activo.ToList()

            Return Json(result, JsonRequestBehavior.AllowGet)
        End Function


        Function ConsecutiveValue(ByVal Table As String, ByVal CveTable As String)

            Dim Query As String = "Select ISNULL(MAX(" + Table + "),0)+1 as Consecutivo from " + CveTable + ""
            Dim CommandUser = New SqlCommand(Query, conn)
            Dim Consecutivo As Double

            conn.Open()
            Dim Results = CommandUser.ExecuteReader()

            If Results.HasRows Then
                Results.Read()
                Consecutivo = Results("Consecutivo")
            End If
            conn.close()

            Return Consecutivo
        End Function


        Function FindCompany(ByVal Company As String)

            Dim Query As String = " SELECT *FROM Cat_Companies WHERE Status_Data=1 and Company_Name='" + Company + "'  "
            Dim CommandUser = New SqlCommand(Query, conn)
            Dim Consecutivo As Double

            conn.Open()
            Dim Results = CommandUser.ExecuteReader()

            If Results.HasRows Then
                Results.Read()
                Consecutivo = Results("Id_Company")
            End If
            conn.close()

            Return Consecutivo
        End Function


        Function Insert_Group_Data()


            Dim CommandData
            Dim CommandStatusPayment
            Dim CommandStatusBook
            Dim CommandStatusHotel
            Dim ListaPaxRevenue() As String
            Dim ListaPax As String
            Dim ipax As Integer
            Dim NumPax As Integer = 0

            ListaPax = Request("List_Pax1").ToArray()

            ListaPaxRevenue = Split(ListaPax, ",")

            For ipax = 0 To ListaPaxRevenue.Count - 1

                NumPax = NumPax + ListaPaxRevenue(ipax)

            Next

            Dim ID_group As Double

            Dim Query As String = "Insert into Groups( Id_Group, Cve_Hotel, Status_Data, Wholesale , NumberRooms, ArrivalDate , DepartureDate, Discount, GroupName, Market, GroupType, AgencyType, Company, GroupCordinator, OnsiteCordinator, Channel, TentativeArrivalDate, TentativeDepartureDate, Contact, TypeRate, Allotment, ComplementaryRoom , Date_Register , NumberNights , Commission , Promo, Special_Notes , CommissionAgent , PeakRoom, Package ) VALUES(@Id_Group, @Cve_Hotel, @Status_Data, @Wholesale, @NumberRooms, @ArrivalDate, @DepartureDate, @Discount, @GroupName, @Market, @GroupType, @AgencyType, @Company, @GroupCordinator,  @OnsiteCordinator, @Channel, @TentativeArrivalDate, @TentativeDepartureDate, @Contact, @TypeRate,  @Allotment, @ComplementaryRoom , @Date_Register , @NumberNights, @Commission, @Promo, @Special_Notes , @CommissionAgent , @PeakRoom, @Package)"

            Dim WhosaleValue() As String = Split(Request("WhosaleDetail"), ":")

            CommandData = New SqlCommand(Query, conn)
            ID_group = ConsecutiveValue("Id_Group", "Groups")
            CommandData.Parameters.AddWithValue("@Id_Group", ID_group)
            CommandData.Parameters.AddWithValue("@Cve_Hotel", Request("HotelSelect"))
            CommandData.Parameters.AddWithValue("@Wholesale", WhosaleValue(0))
            CommandData.Parameters.AddWithValue("@NumberRooms", NumPax)
            CommandData.Parameters.AddWithValue("@ArrivalDate", Request("datetimepicker6text"))
            CommandData.Parameters.AddWithValue("@DepartureDate", Request("datetimepicker7text"))
            CommandData.Parameters.AddWithValue("@Package", Request("selectquotetype"))

            If Request("NumberNights") <> "" Then
                CommandData.Parameters.AddWithValue("@NumberNights", Request("NumberNights"))
            Else
                CommandData.Parameters.AddWithValue("@NumberNights", 0)
            End If

            If Request("DiscountRate") <> "" Then
                CommandData.Parameters.AddWithValue("@Discount", Request("DiscountRate"))
            Else
                CommandData.Parameters.AddWithValue("@Discount", 0)
            End If

            If Request("ComissionDiscount") <> "" Then
                CommandData.Parameters.AddWithValue("@Commission", Request("ComissionDiscount"))
            Else
                CommandData.Parameters.AddWithValue("@Commission", 0)
            End If

            If Request("CurrentPromo") <> "" Then
                CommandData.Parameters.AddWithValue("@Promo", Request("CurrentPromo"))
            Else
                CommandData.Parameters.AddWithValue("@Promo", 0)
            End If

            CommandData.Parameters.AddWithValue("@GroupName", Request("groupname"))
            CommandData.Parameters.AddWithValue("@Market", Request("selectmarket"))
            CommandData.Parameters.AddWithValue("@GroupType", Request("selectgrouptype"))
            CommandData.Parameters.AddWithValue("@AgencyType", Request("selectagencytype"))
            CommandData.Parameters.AddWithValue("@Company", Request("selectcompany"))
            CommandData.Parameters.AddWithValue("@Contact", Request("selectcontact"))
            CommandData.Parameters.AddWithValue("@GroupCordinator", Request("selectgroupcordinator"))
            CommandData.Parameters.AddWithValue("@OnsiteCordinator", Request("selectonsitecordinator"))
            CommandData.Parameters.AddWithValue("@Channel", "")
            CommandData.Parameters.AddWithValue("@TentativeArrivalDate", Request("datetimepicker9text"))
            CommandData.Parameters.AddWithValue("@TentativeDepartureDate", Request("datetimepicker8text"))
            CommandData.Parameters.AddWithValue("@TypeRate", Request("selectratetype"))
            CommandData.Parameters.AddWithValue("@Allotment", Request("selectallotment"))
            CommandData.Parameters.AddWithValue("@ComplementaryRoom", 0)

            If Request("peakroom") <> "" Then
                CommandData.Parameters.AddWithValue("@PeakRoom", Request("peakroom"))
            Else
                CommandData.Parameters.AddWithValue("@PeakRoom", 0)
            End If

            CommandData.Parameters.AddWithValue("@Special_Notes", Request("groupspecialnotes"))

            CommandData.Parameters.AddWithValue("@Date_Register", Date.Now)
            CommandData.Parameters.AddWithValue("@Status_Data", 1)

            CommandData.Parameters.AddWithValue("@CommissionAgent", Request("ComissionAgency"))

            'Payment Status

            Dim Query2 As String = "INSERT INTO Groups_Status(Id_Group, Type_Status, Group_Status, Notes, Cancelled_Type , Date_Register , Status_Data ) VALUES (@Id_Group , @Type_Status , @Group_Status , @Notes , @Cancelled_Type , @Date_Register , @Status_Data ) "
            CommandStatusPayment = New SqlCommand(Query2, conn)
            CommandStatusPayment.Parameters.AddWithValue("@Id_Group", ID_group)
            CommandStatusPayment.Parameters.AddWithValue("@Type_Status", 1)
            CommandStatusPayment.Parameters.AddWithValue("@Group_Status", 1)
            CommandStatusPayment.Parameters.AddWithValue("@Notes", "")
            CommandStatusPayment.Parameters.AddWithValue("@Cancelled_Type", 0)
            CommandStatusPayment.Parameters.AddWithValue("@Status_Data", 1)
            CommandStatusPayment.Parameters.AddWithValue("@Date_Register", Date.Now)


            'Book Status

            Dim Query3 As String = "INSERT INTO Groups_Status(Id_Group, Type_Status, Group_Status, Notes, Cancelled_Type , Date_Register , Status_Data ) VALUES (@Id_Group , @Type_Status , @Group_Status , @Notes , @Cancelled_Type , @Date_Register , @Status_Data) "
            CommandStatusBook = New SqlCommand(Query3, conn)
            CommandStatusBook.Parameters.AddWithValue("@Id_Group", ID_group)
            CommandStatusBook.Parameters.AddWithValue("@Type_Status", 2)
            CommandStatusBook.Parameters.AddWithValue("@Group_Status", 1)
            CommandStatusBook.Parameters.AddWithValue("@Notes", "")
            CommandStatusBook.Parameters.AddWithValue("@Cancelled_Type", 0)
            CommandStatusBook.Parameters.AddWithValue("@Status_Data", 1)
            CommandStatusBook.Parameters.AddWithValue("@Date_Register", Date.Now)


            'Hotel Status

            Dim Query4 As String = "INSERT INTO Groups_Status(Id_Group, Type_Status, Group_Status, Notes, Cancelled_Type , Date_Register, Status_Data ) VALUES (@Id_Group , @Type_Status , @Group_Status , @Notes , @Cancelled_Type , @Date_Register , @Status_Data) "
            CommandStatusHotel = New SqlCommand(Query4, conn)
            CommandStatusHotel.Parameters.AddWithValue("@Id_Group", ID_group)
            CommandStatusHotel.Parameters.AddWithValue("@Type_Status", 3)
            CommandStatusHotel.Parameters.AddWithValue("@Group_Status", 1)
            CommandStatusHotel.Parameters.AddWithValue("@Notes", "")
            CommandStatusHotel.Parameters.AddWithValue("@Cancelled_Type", 0)
            CommandStatusHotel.Parameters.AddWithValue("@Status_Data", 1)
            CommandStatusHotel.Parameters.AddWithValue("@Date_Register", Date.Now)

            conn.Open()


            Try
                CommandData.ExecuteNonQuery()
                CommandStatusPayment.ExecuteNonQuery()
                CommandStatusBook.ExecuteNonQuery()
                CommandStatusHotel.ExecuteNonQuery()


                conn.close()

                Return ID_group

            Catch ex As Exception

                conn.close()
                Return Content(ex.ToString)

            End Try


            conn.close()


        End Function


        Function Update_Group_Data()

            Dim CommandUser
            Dim ID_group As Double

            Dim Query As String = " Update Groups Set Cve_Hotel=@Cve_Hotel , Wholesale=@Wholesale , NumberRooms=@NumberRooms , ArrivalDate=@ArrivalDate , DepartureDate=@DepartureDate , Discount=@Discount , GroupName=@GroupName , Market=@Market , GroupType=@GroupType , AgencyType=@AgencyType , Company=@Company , Contact=@Contact , GroupCordinator=@GroupCordinator , OnsiteCordinator=@OnsiteCordinator , Channel=@Channel , TentativeArrivalDate=@TentativeArrivalDate , TentativeDepartureDate=@TentativeDepartureDate , TypeRate=@TypeRate , Allotment=@Allotment, ComplementaryRoom=@ComplementaryRoom , NumberNights=@NumberNights, Commission=@Commission , Promo=@Promo , Special_Notes=@Special_Notes , CommissionAgent=@CommissionAgent , PeakRoom=@PeakRoom   , Package=@Package     where Id_Group= @Id_Group "


            Dim WhosaleValue() As String = Split(Request("WhosaleDetail"), ":")
            CommandUser = New SqlCommand(Query, conn)
            ID_group = Request("grupoidlabeltext")
            CommandUser.Parameters.AddWithValue("@Id_Group", ID_group)
            CommandUser.Parameters.AddWithValue("@Cve_Hotel", Request("HotelSelect"))
            CommandUser.Parameters.AddWithValue("@Wholesale", WhosaleValue(0))
            CommandUser.Parameters.AddWithValue("@NumberRooms", Request("numberpax"))
            CommandUser.Parameters.AddWithValue("@ArrivalDate", Request("datetimepicker6text"))
            CommandUser.Parameters.AddWithValue("@DepartureDate", Request("datetimepicker7text"))
            CommandUser.Parameters.AddWithValue("@Package", Request("selectquotetype"))

            If Request("NumberNights") <> "" Then
                CommandUser.Parameters.AddWithValue("@NumberNights", Request("NumberNights"))
            Else
                CommandUser.Parameters.AddWithValue("@NumberNights", 0)
            End If

            If Request("DiscountRate") <> "" Then
                CommandUser.Parameters.AddWithValue("@Discount", Request("DiscountRate"))
            Else
                CommandUser.Parameters.AddWithValue("@Discount", 0)
            End If

            If Request("ComissionDiscount") <> "" Then
                CommandUser.Parameters.AddWithValue("@Commission", Request("ComissionDiscount"))
            Else
                CommandUser.Parameters.AddWithValue("@Commission", 0)
            End If

            If Request("CurrentPromo") <> "" Then
                CommandUser.Parameters.AddWithValue("@Promo", Request("CurrentPromo"))
            Else
                CommandUser.Parameters.AddWithValue("@Promo", 0)
            End If


            CommandUser.Parameters.AddWithValue("@GroupName", Request("groupname"))
            CommandUser.Parameters.AddWithValue("@Market", Request("selectmarket"))
            CommandUser.Parameters.AddWithValue("@GroupType", Request("selectgrouptype"))
            CommandUser.Parameters.AddWithValue("@AgencyType", Request("selectagencytype"))
            CommandUser.Parameters.AddWithValue("@Company", Request("selectcompany"))
            CommandUser.Parameters.AddWithValue("@Contact", Request("selectcontact"))
            CommandUser.Parameters.AddWithValue("@GroupCordinator", Request("selectgroupcordinator"))
            CommandUser.Parameters.AddWithValue("@OnsiteCordinator", Request("selectonsitecordinator"))
            CommandUser.Parameters.AddWithValue("@Channel", "")
            CommandUser.Parameters.AddWithValue("@TentativeArrivalDate", Request("datetimepicker9text"))
            CommandUser.Parameters.AddWithValue("@TentativeDepartureDate", Request("datetimepicker8text"))
            CommandUser.Parameters.AddWithValue("@TypeRate", Request("selectratetype"))
            CommandUser.Parameters.AddWithValue("@Allotment", Request("selectallotment"))
            CommandUser.Parameters.AddWithValue("@Special_Notes", Request("groupspecialnotes"))
            CommandUser.Parameters.AddWithValue("@ComplementaryRoom", 0)

            CommandUser.Parameters.AddWithValue("@CommissionAgent", Request("ComissionAgency"))

            If Request("peakroom") <> "" Then
                CommandUser.Parameters.AddWithValue("@PeakRoom", Request("peakroom"))
            Else
                CommandUser.Parameters.AddWithValue("@PeakRoom", 0)
            End If


            Dim QueryDos As String = " Update Groups_Rates set Status_Data=0 where Id_Group=" + ID_group.ToString + " and Status_Data=1 "
            Dim CommandUserDos = New SqlCommand(QueryDos, conn)


            conn.Open()


            Try
                CommandUser.ExecuteNonQuery()

                CommandUserDos.ExecuteNonQuery()

                conn.close()
                Return ID_group

            Catch ex As Exception

                conn.close()
                Return Content(ex.ToString)

            End Try





        End Function


        Function Group_Rates(ByVal id_group As Double, ByVal Accion As Integer)

            Dim z As Integer
            Dim CommandRates
            Dim model = New GroupsDetail
            Dim UsuariosLis = New List(Of GroupsRatesList)
            Dim WhosaleValue() As String

            'Select Case Request("selectratetype")

            '    Case 1
            '        'Tarifario

            '    Case 2
            '        'Tarifario Manual

            '    Case 3
            '        'Tarifario Semiautomatico

            '    Case 4
            '        'Modelo de Compensacion

            '    Case 5
            '        'MICE

            'End Select

            If Request("selectratetype") = 2 Or Request("selectratetype") = 3 Then

                Dim ListaPaxRevenue() As String
                Dim ListaSuitesPax() As String
                Dim ListaRate() As String

                Dim RateDobleBase = 0

                Dim ListaPax As String
                Dim Listasuites As String

                ListaPax = Request("List_Pax1").ToArray()

                ListaPaxRevenue = Split(ListaPax, ",")

                Listasuites = Request("List_Suites").ToArray()

                ListaSuitesPax = Split(Listasuites, ",")

                Dim ListaRateDoble As String

                If Request("List_DoubleRate") <> "" Then

                    ListaRateDoble = Request("List_DoubleRate").ToArray()

                    ListaRate = Split(ListaRateDoble, ",")

                    RateDobleBase = ListaRate(0)

                End If

                Dim PercentajeDiscount As Double
                Dim AuxDiscount As Double

                If Not IsNumeric(Request("DiscountRate")) Then

                    PercentajeDiscount = 1
                    model.EditGroupData7 = 0
                Else

                    AuxDiscount = Request("DiscountRate")
                    PercentajeDiscount = (100 - AuxDiscount) / 100
                    model.EditGroupData7 = AuxDiscount

                End If


                WhosaleValue = Split(Request("WhosaleDetail"), ":")

                If WhosaleValue(0) = "" Then

                    WhosaleValue(0) = "BAR"

                End If


                Dim RevenueFinal As Double = 0
                Dim i As Integer = 0
                Dim j As Integer = 0
                Dim QueryDos As String


                conn.Open()

                Try


                    QueryDos = " Select a.*, '" + Request("datetimepicker6text") + "' as VigenciaI , '" + Request("datetimepicker7text") + "' as VigenciaF , DATEDIFF(day,'" + Request("datetimepicker6text") + "' , '" + Request("datetimepicker7text") + "') as Nights from vw_Tipo_Cuarto a where a.Clav_Hotel='" + Request("HotelSelect") + "' order by a.SuiteOrden  "
                    Dim CommandUserTres = New SqlCommand(QueryDos, conn)
                    CommandUserTres.CommandTimeout = 0
                    Dim Results = CommandUserTres.ExecuteReader()
                    Dim NumberPax As Integer = 0
                    Dim NumberPaxAux As Integer = 0
                    Dim DateInit As Date
                    Dim NumberPaxAuxDos As String = "0"
                    Dim BanderaRevenue As Integer = 0
                    Dim BanderaPax As Integer = 0
                    Dim AvailabilityAux As String

                    Dim Date1 As Date
                    Dim Date2 As Date

                    If Request("numberpax") <> "" Then
                        NumberPax = Request("numberpax")
                    End If

                    Dim nodelist As XmlNodeList
                    nodelist = GetAvailability()

                    If Results.HasRows Then
                        While Results.Read()

                            'AvailabilityAux = Availability(Results("Clave_TC"), nodelist)
                            AvailabilityAux = "Available"

                            j = 0

                            While ListaSuitesPax(j) <> Results("Clave_TC") And ListaSuitesPax.Count - 1 > j

                                j = j + 1
                            End While

                            If ListaSuitesPax(j) = Results("Clave_TC") And IsNumeric(ListaPaxRevenue(j)) Then
                                NumberPaxAuxDos = ListaPaxRevenue(j)
                                NumberPaxAuxDos.Replace(" ", "")
                            Else
                                NumberPaxAuxDos = "0"
                            End If

                            Date1 = Results("VigenciaI")
                            Date2 = Results("VigenciaF")

                            If Request("selectratetype") = 2 Then

                                If Request("List_DoubleRate") <> "" Then
                                    RateDobleBase = ListaRate(i)
                                End If

                                UsuariosLis.Add(New GroupsRatesList With {.InitDateRate = Date1.ToString("yyyy-MM-dd"), .EndDateRate = Date2.ToString("yyyy-MM-dd"), .SuiteName = Results("Clave_TC"), .SuiteCode = Results("Clave_TC"), .RateSingle = RateDobleBase * 1.6, .RateDouble = RateDobleBase, .RateTripleandFour = RateDobleBase * 0.8, .RateFiveandSix = RateDobleBase * 0.8, .RateChildrens = RateDobleBase * 0.4, .RateTeensValue = RateDobleBase * 0.7, .Availability = AvailabilityAux, .RateRevenue = NumberPaxAuxDos * Math.Ceiling((RateDobleBase * 2) * Results("Nights")), .RatePax = NumberPaxAuxDos, .CommissionRate = 0, .DiscountRate = 0, .RateRevenuePerRoom = (RateDobleBase * 2) * Results("Nights"), .RateRevenueRoomNigth = RateDobleBase, .RateCve = "MANUAL", .RateRack = 0, .RateMICE = 0, .NochesG = "0", .NinosGxAdu = "0", .NinosGMax = "0", .Alias_Promo = "", .Description_Promo = ""})

                                RevenueFinal = RevenueFinal + NumberPaxAuxDos * Math.Ceiling((RateDobleBase * 2) * Results("Nights"))

                            Else
                                RateDobleBase = RateDobleBase + Results("ITA")

                                UsuariosLis.Add(New GroupsRatesList With {.InitDateRate = Date1.ToString("yyyy-MM-dd"), .EndDateRate = Date2.ToString("yyyy-MM-dd"), .SuiteName = Results("Clave_TC"), .SuiteCode = Results("Clave_TC"), .RateSingle = RateDobleBase * 1.6, .RateDouble = RateDobleBase, .RateTripleandFour = RateDobleBase * 0.8, .RateFiveandSix = RateDobleBase * 0.8, .RateChildrens = RateDobleBase * 0.4, .RateTeensValue = RateDobleBase * 0.7, .Availability = AvailabilityAux, .RateRevenue = NumberPaxAuxDos * Math.Ceiling((RateDobleBase * 2) * Results("Nights")), .RatePax = NumberPaxAuxDos, .CommissionRate = 0, .DiscountRate = 0, .RateRevenuePerRoom = (RateDobleBase * 2) * Results("Nights"), .RateRevenueRoomNigth = RateDobleBase, .RateCve = "SEMIAUTO", .RateRack = 0, .RateMICE = 0, .NochesG = "0", .NinosGxAdu = "0", .NinosGMax = "0", .Alias_Promo = "", .Description_Promo = ""})

                                RevenueFinal = RevenueFinal + NumberPaxAuxDos * Math.Ceiling((RateDobleBase * 2) * Results("Nights"))
                            End If

                            i = i + 1

                        End While
                    End If

                Catch ex As Exception

                    'Return Content("Error")

                    Return ex.ToString

                End Try

                conn.close()

                model.ListGroupRatesin = UsuariosLis
                model.RevenueFinal = RevenueFinal
                'model.Accion = 2
                model.GroupId = Request("grupoidlabeltext")
                model.GroupTypeRate = Request("selectratetype")



            End If


            If Request("selectratetype") = 4 Or Request("selectratetype") = 5 Then

                Dim ListaPaxRevenue() As String
                Dim ListaSuitesPax() As String

                Dim ListaPax As String
                Dim Listasuites As String

                ListaPax = Request("List_Pax1").ToArray()

                ListaPaxRevenue = Split(ListaPax, ",")

                Listasuites = Request("List_Suites").ToArray()

                ListaSuitesPax = Split(Listasuites, ",")

                Dim PercentajeDiscount As Double
                Dim AuxDiscount As Double

                If Not IsNumeric(Request("DiscountRate")) Then

                    PercentajeDiscount = 1
                    model.EditGroupData7 = 0
                Else

                    AuxDiscount = Request("DiscountRate")
                    PercentajeDiscount = (100 - AuxDiscount) / 100
                    model.EditGroupData7 = AuxDiscount

                End If


                WhosaleValue = Split(Request("WhosaleDetail"), ":")

                If WhosaleValue(0) = "" Then

                    WhosaleValue(0) = "BAR"

                End If

                Dim RevenueFinal As Double = 0
                Dim i As Integer = 0
                Dim j As Integer = 0
                Dim QueryDos As String
                Dim PromoDescriptionMice As String = ""

                conn.Open()

                Try

                    If Request("selectratetype") = 4 Then
                        QueryDos = " Exec sp_Rates_Compensacion '" + Request("datetimepicker6text") + "' , '" + Request("datetimepicker7text") + "', '" + Request("HotelSelect") + "' , '" + WhosaleValue(0) + "', @Package = " + Request("selectquotetype")
                    Else
                        QueryDos = " Exec sp_Rates_MICE '" + Request("datetimepicker6text") + "' , '" + Request("datetimepicker7text") + "', '" + Request("HotelSelect") + "' , '" + WhosaleValue(0) + "'"


                        'Tour Operator
                        If Request("selectagencytype") = 4 Then
                            PromoDescriptionMice = "15% off"
                        End If

                        'Tour Agency
                        If Request("selectagencytype") = 5 Then
                            PromoDescriptionMice = "Comisionable 10% "
                        End If

                    End If

                    Dim CommandUserTres = New SqlCommand(QueryDos, conn)
                    CommandUserTres.CommandTimeout = 0
                    Dim Results = CommandUserTres.ExecuteReader()
                    Dim NumberPax As Integer = 0
                    Dim NumberPaxAux As Integer = 0
                    Dim DateInit As Date
                    Dim NumberPaxAuxDos As String = "0"
                    Dim BanderaRevenue As Integer = 0
                    Dim BanderaPax As Integer = 0

                    Dim Date1 As Date
                    Dim Date2 As Date

                    Dim AvailabilityAux As String = ""

                    If Request("numberpax") <> "" Then
                        NumberPax = Request("numberpax")
                    End If

                    Dim nodelist As XmlNodeList
                    nodelist = GetAvailability()





                    If Results.HasRows Then
                        While Results.Read()

                            AvailabilityAux = Availability(Results("Clave_TC"), nodelist)
                            'AvailabilityAux = "Available"

                            j = 0

                            While ListaSuitesPax(j) <> Results("Clave_TC") And ListaSuitesPax.Count - 1 > j

                                j = j + 1
                            End While

                            If ListaSuitesPax(j) = Results("Clave_TC") And IsNumeric(ListaPaxRevenue(j)) Then
                                NumberPaxAuxDos = ListaPaxRevenue(j)
                                NumberPaxAuxDos.Replace(" ", "")
                            Else
                                NumberPaxAuxDos = "0"
                            End If

                            If DateInit <> Results("VigenciaI") Or i = 0 Then
                                DateInit = Results("VigenciaI")
                                If i <> 0 Then
                                    BanderaRevenue = 1
                                End If
                            End If

                            Date1 = Results("VigenciaI")
                            Date2 = Results("VigenciaF")

                            If Request("selectratetype") = 4 Then
                                UsuariosLis.Add(New GroupsRatesList With {.InitDateRate = Date1.ToString("yyyy-MM-dd"), .EndDateRate = Date2.ToString("yyyy-MM-dd"), .SuiteName = Results("Clave_TC"), .SuiteCode = Results("Clave_TC"), .RateSingle = Results("Tar_1"), .RateDouble = Results("Base"), .RateTripleandFour = Results("Extra"), .RateFiveandSix = Results("ExtraX"), .RateChildrens = Results("Tar_N"), .RateTeensValue = Results("Tar_A"), .Availability = AvailabilityAux, .RateRevenue = NumberPaxAuxDos * Math.Ceiling(Results("TotalRevenue")), .RatePax = NumberPaxAuxDos, .CommissionRate = Results("Comision"), .DiscountRate = Results("Descuento"), .RateRevenuePerRoom = Results("TotalRevenue"), .RateRevenueRoomNigth = Results("Tar_2"), .RateCve = Results("Clav_Rate"), .RateRack = Results("Rack"), .RateMICE = 0, .NochesG = Results("NochesG"), .NinosGxAdu = Results("NinosGxAdu"), .NinosGMax = Results("NinosGMax"), .Alias_Promo = Results("AliasPromo"), .Description_Promo = Results("Descripcion")})
                            Else
                                If Results("Rate") = 0 Then
                                    AvailabilityAux = "Close"
                                End If

                                UsuariosLis.Add(New GroupsRatesList With {.InitDateRate = Date1.ToString("yyyy-MM-dd"), .EndDateRate = Date2.ToString("yyyy-MM-dd"), .SuiteName = Results("Clave_TC"), .SuiteCode = Results("Clave_TC"), .RateSingle = Results("Tar_1"), .RateDouble = Results("Tar_2"), .RateTripleandFour = Results("Extra"), .RateFiveandSix = Results("ExtraX"), .RateChildrens = Results("Tar_N"), .RateTeensValue = Results("Tar_A"), .Availability = AvailabilityAux, .RateRevenue = NumberPaxAuxDos * Math.Ceiling(Results("TotalRevenue")), .RatePax = NumberPaxAuxDos, .CommissionRate = 0, .DiscountRate = 0, .RateRevenuePerRoom = Results("TotalRevenue"), .RateRevenueRoomNigth = Results("Tar_2"), .RateCve = "MICE", .RateRack = 0, .RateMICE = Results("Rate"), .NochesG = "0", .NinosGxAdu = "0", .NinosGMax = "0", .Alias_Promo = "", .Description_Promo = PromoDescriptionMice})
                            End If



                            If BanderaRevenue = 0 Then
                                RevenueFinal = RevenueFinal + NumberPaxAuxDos * Math.Ceiling(Results("TotalRevenue"))
                            End If


                            i = i + 1

                        End While
                    End If

                Catch ex As Exception

                    'Return Content("Error")

                    Return ex.ToString

                End Try

                conn.close()

                model.ListGroupRatesin = UsuariosLis
                model.RevenueFinal = RevenueFinal
                'model.Accion = 2
                model.GroupId = Request("grupoidlabeltext")
                model.GroupTypeRate = Request("selectratetype")

            End If


            If Accion = 1 Then

                Dim Query As String = "Insert into Groups_Rates(Id_Group, Cve_Hotel , Code_Room , Cve_Rate , Cve_Ag , Cve_Cp , TypeRate , Rate_Rack , Rate_MICE , Discount, Commission, Promo, Init_Date, End_Date, Num_Rooms, Rate_1,  Rate_2 , Rate_3, Rate_4, Rate_5, Rate_6, Rate_T, Rate_C, Rate_Extra, Rate_ExtraX, Status, Revenue, Status_Data, Date_Register , NochesG , NinosGxAdu , NinosGMax , Alias_Promo , Description_Promo ) VALUES "


                For z = 0 To UsuariosLis.Count - 1

                    If z + 1 = UsuariosLis.Count Then
                        Query += " (" + id_group.ToString + " ,  '" + Request("HotelSelect") + "' ,  '" + UsuariosLis.Item(z).SuiteCode.ToString + "' , '" + UsuariosLis.Item(z).RateCve.ToString + "' , '" + WhosaleValue(0) + "' ,  0 , " + Request("selectratetype") + " , " + UsuariosLis.Item(z).RateRack.ToString + " , " + UsuariosLis.Item(z).RateMICE.ToString + " , " + Request("DiscountRate") + " , " + UsuariosLis.Item(z).CommissionRate.ToString + " , " + UsuariosLis.Item(z).DiscountRate.ToString + " , '" + UsuariosLis.Item(z).InitDateRate.ToString + "' ,  '" + UsuariosLis.Item(z).EndDateRate.ToString + "' , " + UsuariosLis.Item(z).RatePax.ToString + " , " + UsuariosLis.Item(z).RateSingle.ToString + " , " + UsuariosLis.Item(z).RateDouble.ToString + " , 0 , 0 , 0 , 0 , " + UsuariosLis.Item(z).RateTeens.ToString + " , " + UsuariosLis.Item(z).RateChildrens.ToString + " , " + UsuariosLis.Item(z).RateTripleandFour.ToString + " , " + UsuariosLis.Item(z).RateFiveandSix.ToString + " , '" + UsuariosLis.Item(z).Availability.ToString + "' , " + UsuariosLis.Item(z).RateRevenuePerRoom.ToString + " , 1 , getdate() , " + UsuariosLis.Item(z).NochesG.ToString + " , " + UsuariosLis.Item(z).NinosGxAdu.ToString + " , " + UsuariosLis.Item(z).NinosGMax.ToString + ", '" + UsuariosLis.Item(z).Alias_Promo.ToString + "' , '" + UsuariosLis.Item(z).Description_Promo.ToString + "' ) "
                    Else
                        Query += " (" + id_group.ToString + " ,  '" + Request("HotelSelect") + "' ,  '" + UsuariosLis.Item(z).SuiteCode.ToString + "' , '" + UsuariosLis.Item(z).RateCve.ToString + "' , '" + WhosaleValue(0) + "' ,  0 , " + Request("selectratetype") + " , " + UsuariosLis.Item(z).RateRack.ToString + " , " + UsuariosLis.Item(z).RateMICE.ToString + " , " + Request("DiscountRate") + " , " + UsuariosLis.Item(z).CommissionRate.ToString + " , " + UsuariosLis.Item(z).DiscountRate.ToString + " , '" + UsuariosLis.Item(z).InitDateRate.ToString + "' ,  '" + UsuariosLis.Item(z).EndDateRate.ToString + "' , " + UsuariosLis.Item(z).RatePax.ToString + " , " + UsuariosLis.Item(z).RateSingle.ToString + " , " + UsuariosLis.Item(z).RateDouble.ToString + " , 0 , 0 , 0 , 0 , " + UsuariosLis.Item(z).RateTeens.ToString + " , " + UsuariosLis.Item(z).RateChildrens.ToString + " , " + UsuariosLis.Item(z).RateTripleandFour.ToString + " , " + UsuariosLis.Item(z).RateFiveandSix.ToString + " , '" + UsuariosLis.Item(z).Availability.ToString + "' , " + UsuariosLis.Item(z).RateRevenuePerRoom.ToString + " , 1 , getdate() , " + UsuariosLis.Item(z).NochesG.ToString + " , " + UsuariosLis.Item(z).NinosGxAdu.ToString + " , " + UsuariosLis.Item(z).NinosGMax.ToString + ", '" + UsuariosLis.Item(z).Alias_Promo.ToString + "' , '" + UsuariosLis.Item(z).Description_Promo.ToString + "' ) ,"
                    End If

                Next

                CommandRates = New SqlCommand(Query, conn)

                conn.Open()
            End If



            Try

                If Accion = 1 Then
                    CommandRates.ExecuteNonQuery()

                    conn.close()
                End If


                Return model

            Catch ex As Exception

                conn.close()

                Return ex.ToString

            End Try


        End Function


        Function Availability(ByVal SuiteRoom As String, ByVal nodelist As XmlNodeList)

            Dim StatusAvailability As String = ""

            For Each node As XmlElement In nodelist

                If node.Attributes("Suite").Value = SuiteRoom Then

                    StatusAvailability = node.Attributes("Status").Value

                End If

            Next

            'model.EditGroupData20 = Request("HotelAvailability") + "/" + WhosaleValue(0) + "/" + Request("CheckinAvailability") + "/" + Request("CheckoutAvailability") + "/" + SuiteRoom

            Return StatusAvailability


        End Function


        Function AvailabilityConsultRate(ByVal SuiteRoom As String, ByVal nodelist As XmlNodeList)

            Dim StatusAvailability(2) As String
            Dim nodelistDos As XmlNodeList
            Dim NumPax As Integer = 0
            Dim i As Integer = 0

            For Each node As XmlElement In nodelist

                If node.Attributes("Suite").Value = SuiteRoom Then

                    nodelistDos = node.GetElementsByTagName("Date")

                    StatusAvailability(0) = node.Attributes("Status").Value

                    For Each nodedos As XmlElement In nodelistDos

                        If i = 0 Then
                            NumPax = nodedos.Attributes("Disp").Value
                        Else
                            If nodedos.Attributes("Disp").Value < NumPax Then
                                NumPax = nodedos.Attributes("Disp").Value
                            End If

                        End If

                        i = i + 1
                    Next
                    i = 0
                End If

            Next

            StatusAvailability(1) = NumPax

            Return StatusAvailability


        End Function


        Function GetAvailability()


            Dim xml As String

            Dim WhosaleValue() As String = Split(Request("WhosaleDetail"), ":")

            'Dim SuiteRoom As String = Request("SuiteAvailability")

            If WhosaleValue(0) = "" Then

                WhosaleValue(0) = "BAR"

            End If

            Dim departuredate As Date = Request("datetimepicker7text")

            'SuiteRoom = SuiteRoom.Replace("#", "")

            xml = "<?xml version=""1.0"" encoding=""utf-8""?> " & _
            "<soap:Envelope xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"" " & _
            "xmlns:xsd=""http://www.w3.org/2001/XMLSchema"" " & _
            "xmlns:soap=""http://schemas.xmlsoap.org/soap/envelope/""><soap:Body>" & _
            "<WS_Request2 xmlns=""http://tempuri.org/Cotizador/Tarifas"">" & _
            "<Hotel>" + Request("HotelSelect") + "</Hotel>" & _
            "<Agencia>" + WhosaleValue(0) + "</Agencia>" & _
            "<Llegada>" + Request("datetimepicker6text") + "</Llegada>" & _
            "<Salida>" + DateAdd(DateInterval.Day, -1, departuredate) + "</Salida>" & _
               "<SoloDisponibilidad>1</SoloDisponibilidad>" & _
            " </WS_Request2>" & _
            "</soap:Body></soap:Envelope>"


            Dim data As String = xml
            Dim url As String = "http://1.2.0.39/cotizador/tarifas.asmx"
            Dim responsestring As String = ""

            Dim myReq As HttpWebRequest = WebRequest.Create(url)
            Dim proxy As IWebProxy = CType(myReq.Proxy, IWebProxy)
            Dim proxyaddress As String
            Dim myProxy As New WebProxy()
            Dim encoding As New ASCIIEncoding
            Dim buffer() As Byte = encoding.GetBytes(xml)
            Dim response As String

            myReq.AllowWriteStreamBuffering = False
            myReq.Method = "POST"
            myReq.ContentType = "text/xml; charset=UTF-8"
            myReq.ContentLength = buffer.Length
            myReq.Headers.Add("SOAPAction", "http://tempuri.org/Cotizador/Tarifas/WS_Request2")
            'myReq.Credentials = New NetworkCredential("abc", "123")
            myReq.PreAuthenticate = False
            proxyaddress = proxy.GetProxy(myReq.RequestUri).ToString

            Dim newUri As New Uri(proxyaddress)
            myProxy.Address = newUri
            myReq.Proxy = myProxy
            Dim post As Stream = myReq.GetRequestStream

            post.Write(buffer, 0, buffer.Length)
            post.Close()

            Dim myResponse As HttpWebResponse = myReq.GetResponse
            Dim responsedata As Stream = myResponse.GetResponseStream
            Dim responsereader As New StreamReader(responsedata)

            response = responsereader.ReadToEnd

            Dim Documents As New XmlDocument
            Documents.LoadXml(response)

            Dim nodelist As XmlNodeList = Documents.GetElementsByTagName("Tarifa")

            'Dim StatusAvailability As String = ""

            'For Each node As XmlElement In nodelist

            '    If node.Attributes("Suite").Value = SuiteRoom Then

            '        StatusAvailability = node.Attributes("Status").Value


            '    End If

            'Next

            ''model.EditGroupData20 = Request("HotelAvailability") + "/" + WhosaleValue(0) + "/" + Request("CheckinAvailability") + "/" + Request("CheckoutAvailability") + "/" + SuiteRoom

            Return nodelist

        End Function


        Function GetRate(ByVal Id_Group As Integer, ByVal Checkin As String, ByVal Checkout As String, ByVal CodeRoom As String, ByVal Adults As Integer, ByVal Teens As Integer, ByVal Childrens As Integer)

            Dim Query As String = " Exec sp_BreakDown " + Id_Group.ToString + ", '" + Checkin + "','" + Checkout + "', '" + CodeRoom + "', " + Adults.ToString + ", " + Teens.ToString + ", " + Childrens.ToString + " "
            Dim CommandUser = New SqlCommand(Query, conn)
            Dim Ratefinal As Double

            conn.Open()
            Dim Results = CommandUser.ExecuteReader()

            If Results.HasRows Then
                While Results.Read()
                    Ratefinal = Results("RateFinal")
                End While
            End If
            Results.Close()
            conn.close()

            Return Ratefinal
        End Function


        Function CheckExistGroup()

            Dim WhosaleValue() As String = Split(Request("WhosaleDetail"), ":")
            Dim Query As String = "select Id_Group from Groups where Cve_Hotel='" + Request("HotelSelect") + "' and Wholesale='" + WhosaleValue(0) + "' and ArrivalDate='" + Request("datetimepicker6text") + "' and DepartureDate='" + Request("datetimepicker7text") + "' and TypeRate=" + Request("selectratetype") + " and Status_Data=1 "
            Dim CommandUser = New SqlCommand(Query, conn)
            Dim Ratefinal As String


            conn.Open()
            Dim Results = CommandUser.ExecuteReader()

            If Results.HasRows Then

                While Results.Read()

                    Ratefinal += Results("Id_Group").ToString + ","

                End While

            Else

                Ratefinal = "OK"
            End If
            Results.Close()
            conn.close()

            Return Ratefinal
        End Function


        Function CheckExistGroupDos()

            Dim Query As String = "select * from Groups where Cve_Hotel='" + Request("HotelSelect") + "' and (ArrivalDate between '" + Request("datetimepicker6text") + "' and '" + Request("datetimepicker7text") + "' or  DepartureDate between '" + Request("datetimepicker6text") + "' and '" + Request("datetimepicker7text") + "') and Status_Data=1"


            Dim CommandUser = New SqlCommand(Query, conn)
            Dim Ratefinal As String


            conn.Open()
            Dim Results = CommandUser.ExecuteReader()

            If Results.HasRows Then

                While Results.Read()

                    Ratefinal += Results("Id_Group").ToString + ","

                End While

            Else

                Ratefinal = "OK"
            End If
            Results.Close()
            conn.close()

            Return Ratefinal
        End Function

        Sub GetDataBreakDown(ByVal model As Object, ByVal DatosObjeto As Object, ByVal IdGroup As String, ByVal GroupBy As String, Optional ByVal QueryID As String = "BreakData")
            conn.Open()

            Dim BreakdownList = New List(Of GroupsBreakList)
            Dim BreakdownListGroupBy = New List(Of GroupsBreakList)
            Dim BreakdownVirtual = New List(Of GroupsBreakList)
            Dim ListSuites = New List(Of SuitesList)

            Dim sqlParameters() As Object
            Dim queryTest = classQuery.GetQueryString(QueryID, "querys.xml", DatosObjeto, sqlParameters)
            Dim CommandTest = New SqlCommand(queryTest, conn)

            CommandTest.CommandType = CommandType.StoredProcedure

            Dim param As System.Data.SqlClient.SqlParameter

            For Each param In sqlParameters
                CommandTest.Parameters.Add(param)
            Next

            Dim xmlr As System.Xml.XmlReader
            xmlr = CommandTest.ExecuteXmlReader()
            'END: Preparación y llamada a base de datos que ejecuta un procedimiento

            'BEGIN: Lectura del xml devuelto por la base de datos y llenado de los modelos del breakdown
            Dim xmlDoc As New XmlDocument
            xmlDoc.Load(xmlr)

            Dim breakDown As XmlNodeList
            breakDown = xmlDoc.SelectNodes("/BREAKDOWN/BREAKDEFAULT/DEFAULT") 'BREAKDOWN default

            Dim break As XmlNode

            For Each break In breakDown
                Dim nodeDefault = break.Attributes
                BreakdownList.Add(New GroupsBreakList With {.RoomID = nodeDefault.GetNamedItem("NumGroup").Value, .RoomCode = nodeDefault.GetNamedItem("Code_Room").Value, .Checkin = nodeDefault.GetNamedItem("Checkin").Value, .Checkout = nodeDefault.GetNamedItem("Checkout").Value})
            Next

            breakDown = xmlDoc.SelectNodes("/BREAKDOWN/BREAKDETAIL/DETAIL") 'BREAKDOWN detalle

            For Each break In breakDown
                Dim nodeDetail = break.Attributes
                BreakdownListGroupBy.Add(New GroupsBreakList With {.RoomID = nodeDetail.GetNamedItem("Id_BreakDown").Value, .GuestName = nodeDetail.GetNamedItem("GuestName").Value + " " + nodeDetail.GetNamedItem("GuestLastName").Value, .RoomCode = nodeDetail.GetNamedItem("Code_Room").Value, .Adults = nodeDetail.GetNamedItem("Adults").Value, .Teens = nodeDetail.GetNamedItem("Teens").Value, .Childrens = nodeDetail.GetNamedItem("Childs").Value, .Infants = nodeDetail.GetNamedItem("Infants").Value, .Checkin = nodeDetail.GetNamedItem("Checkin").Value, .Checkout = nodeDetail.GetNamedItem("Checkout").Value, .RoomNighs = nodeDetail.GetNamedItem("Nights").Value, .StatusPayment = nodeDetail.GetNamedItem("Status_P").Value, .StatusBooking = nodeDetail.GetNamedItem("Status_B").Value, .Deposit = 0, .Balance = 0, .Revenue = nodeDetail.GetNamedItem("Revenue").Value, .TentativeRooms = nodeDetail.GetNamedItem("TentativeRoom").Value, .ComplementaryRooms = nodeDetail.GetNamedItem("ComplementaryRoom").Value})
            Next
            'END: Lectura del xml devuelto por la base de datos y llenado de los modelos del breakdown

            breakDown = xmlDoc.SelectNodes("/BREAKDOWN/BREAKTOTALS/TOTALS") 'BREAKDOWN Total

            For Each break In breakDown
                Dim nodeTotals = break.Attributes

                model.TotalNumRooms = nodeTotals.GetNamedItem("NumberRooms").Value
                model.TotalDeployRooms = nodeTotals.GetNamedItem("TotalBreakdown").Value
                model.TotalTentativeRooms = nodeTotals.GetNamedItem("TotalTentativeRooms").Value
                model.TotalAdults = nodeTotals.GetNamedItem("TotalAdults").Value
                model.TotalTeens = nodeTotals.GetNamedItem("TotalTeens").Value
                model.TotalChildrens = nodeTotals.GetNamedItem("TotalChilds").Value
                model.TotalInfants = nodeTotals.GetNamedItem("TotalInfants").Value
                model.TotalBalance = 0
                model.TotalDeposit = 0
                model.TotalRevenue = nodeTotals.GetNamedItem("TotalRevenue").Value
            Next

            breakDown = xmlDoc.SelectNodes("/BREAKDOWN/BREAKVIRTUAL/VIRTUAL")

            For Each break In breakDown
                Dim nodeVirtual = break.Attributes
                BreakdownVirtual.Add(New GroupsBreakList With {.RoomID = nodeVirtual.GetNamedItem("NUM_ROOMS").Value, .RoomCode = nodeVirtual.GetNamedItem("CODE_ROOM").Value, .Checkin = nodeVirtual.GetNamedItem("INIT_DATE").Value, .Checkout = nodeVirtual.GetNamedItem("END_DATE").Value, .Adults = nodeVirtual.GetNamedItem("NUM_ADULTS").Value, .Teens = nodeVirtual.GetNamedItem("NUM_TEENS").Value, .Childrens = nodeVirtual.GetNamedItem("NUM_CHILDS").Value, .Infants = nodeVirtual.GetNamedItem("NUM_INFANTS").Value})
            Next

            breakDown = xmlDoc.SelectNodes("/BREAKDOWN/LISTROOMS/ROOMS")

            For Each break In breakDown
                Dim nodeSuite = break.Attributes
                ListSuites.Add(New SuitesList With {.Text = nodeSuite.GetNamedItem("NOMB_TC_ACT").Value, .Value = nodeSuite.GetNamedItem("CLAVE_TC").Value, .Status = nodeSuite.GetNamedItem("STATUS").Value})
            Next

            'END: Lectura del xml devuelto por la base de datos y llenado de los modelos del breakdown

            model.ListGroupBreakdownin = BreakdownList
            model.ListGroupBreakdownGroupByin = BreakdownListGroupBy
            model.ListVirtualBreakdownin = BreakdownVirtual
            model.GroupBy = GroupBy
            model.GroupId = IdGroup
            model.ListaSuitein = ListSuites

            conn.Close()
        End Sub


    End Class



End Namespace