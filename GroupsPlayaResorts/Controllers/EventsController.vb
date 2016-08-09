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
    Public Class EventsController
        Inherits System.Web.Mvc.Controller
        Public coonString = ConfigurationManager.ConnectionStrings("RemoteConnectionString").ConnectionString
        Public conn = New SqlConnection(coonString)

        '
        ' GET: /Events

        Function Index() As ActionResult
            Return View()
        End Function

        '
        ' GET: /Events/EventsList
        <Authorize()> _
        Function EventsList() As ActionResult

            Dim model = New GroupsList

            conn.Open()

            Dim QueryDos As String = " select a.* , b.Cve_Hotel, b.Wholesale ,b.Company, b.Contact, b.GroupName from Events a left join Groups b on a.Id_Group=b.Id_Group order by a.Date_Register desc "

            Dim CommandUserDos = New SqlCommand(QueryDos, conn)

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

                    GroupList.Add(New GroupsListData With {.Colum1 = Results("Id_Group"), .Colum2 = "000" + Results("Id_Event").ToString, .Colum3 = Results("Event_Name"), .Colum4 = hotel + "000" + Results("Id_Group").ToString, .Colum5 = Results("GroupName"), .Colum6 = Results("Wholesale"), .Colum7 = Results("Contact"), .Colum8 = Results("Company"), .Colum9 = Results("Event_Date"), .Colum10 = Results("Event_StartTime"), .Colum11 = Results("Event_EndTime"), .Colum12 = Results("SalonName"), .Colum13 = Results("Status_Event"), .Colum14 = Results("Num_Pax"), .Colum15 = "", .Colum16 = "", .Colum17 = Results("Deposits"), .Colum18 = Results("Balance"), .Colum19 = Results("Revenue")})
                End While

                Results.Close()
            End If


            model.ListGroupDatain = GroupList

            conn.close()
            Return View(model)


        End Function


    End Class
End Namespace