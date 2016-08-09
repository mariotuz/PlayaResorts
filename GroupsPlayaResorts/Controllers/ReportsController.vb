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
    Public Class ReportsController
        Inherits System.Web.Mvc.Controller
        Public coonString = ConfigurationManager.ConnectionStrings("RemoteConnectionString").ConnectionString
        Public conn = New SqlConnection(coonString)


        '
        ' GET: /Reports

        Function Index() As ActionResult
            Return View()
        End Function


        '
        ' GET: /Reports/ReportsDetail
        <Authorize()> _
        Function ReportsDetail() As ActionResult




            Return View()
        End Function


        '
        ' POST: /Group/ReportsDetail
        <HttpPost()> _
        Public Function ReportsDetail(ByVal ReportButtons As String) As ActionResult


            Dim Reporte_Prueba = New LocalReport()
            Dim Ubicacion
            Dim ClavHotel As String
          
            Dim GroupsReportGCRList = New List(Of GroupsReportGCRList)
         


            conn.Open()

            Try


                Dim QueryTres = "Exec sp_Report_GroupsGRC_test '" + Request("datetimepickerdate1text") + "' , '" + Request("datetimepickerdate2text") + "'  "
                Dim CommandDos = New SqlCommand(QueryTres, conn)
                CommandDos.CommandTimeout = 0
                Dim ResultsDos = CommandDos.ExecuteReader()


                If ResultsDos.HasRows Then
                    While ResultsDos.Read()

                        GroupsReportGCRList.Add(New GroupsReportGCRList With {.Period = ResultsDos("Period"), .Id_Group = ResultsDos("Id_Group"), .datelist = ResultsDos("datelist"), .NumRooms = ResultsDos("NumRooms"), .GroupName = ResultsDos("GroupName"), .ArrivalDate = ResultsDos("ArrivalDate"), .DepartureDate = ResultsDos("DepartureDate"), .IdGroupCode = ResultsDos("IdGroupCode"), .Revenue = ResultsDos("Revenue"), .TotalRooms = ResultsDos("TotalRooms"), .ADR = ResultsDos("ADR"), .Type_Data = ResultsDos("Type_Data")})

                    End While
                End If
                ResultsDos.Close()



            Catch ex As Exception

                Return Content(ex.ToString)

            End Try


            conn.close()




            If Request("selectypedocument") = 1 Then


                Ubicacion = Server.MapPath("~/bin/Content/Reports/GRCReportMonthly.rdlc")


            End If


            If Request("selectypedocument") = 2 Then


                Ubicacion = Server.MapPath("~/bin/Content/Reports/GRCReportOverall.rdlc")


            End If



            If (System.IO.File.Exists(Ubicacion)) Then
                Reporte_Prueba.ReportPath = Ubicacion

            Else
                Return Content(Ubicacion.ToString)
            End If

            Dim Datos = New ReportDataSource("DataSet1", GroupsReportGCRList)
    

            '    Dim thisDate1 As Date = Date.Now
            '    Dim Parametros1 = New ReportParameter("DATE_INIT", "31/12/" + thisDate1.Year.ToString)
            '    Dim Parametros2 = New ReportParameter("DATE_END", "31/12/" + CStr(thisDate1.Year + 1))
            '    Reporte_Prueba.SetParameters(New ReportParameter() {Parametros1, Parametros2})
            '    AnioReport = CStr(thisDate1.Year + 1)


            Reporte_Prueba.DataSources.Add(Datos)
           


            Dim rereportType As String

            Dim mimeType As String = Nothing
            Dim encoding As String = Nothing
            Dim fileNameExtension As String = Nothing
            Dim deviceInfo As String



            rereportType = "EXCELOPENXML"

            deviceInfo = _
                "<DeviceInfo>" & _
                "  <OutputFormat>EXCELOPENXML</OutputFormat>" & _
                "</DeviceInfo>"




            Dim warnings As Warning() = Nothing
            Dim streams As String() = Nothing
            Dim renderedBytes As Byte() = Nothing

            renderedBytes = Reporte_Prueba.Render(rereportType, deviceInfo, mimeType, encoding, fileNameExtension, streams, warnings)

            'Dim fs As New FileStream("c:\outputvb.xls", FileMode.Create)
            'fs.Write(renderedBytes, 0, renderedBytes.Length)
            'fs.Close()


       

            If Request("selectypedocument") = 1 Then
                Return File(renderedBytes, mimeType, "GRC_Report_Monthly" + "." + fileNameExtension)
            End If

            If Request("selectypedocument") = 2 Then
                Return File(renderedBytes, mimeType, "GRC_Report_Overall" + "." + fileNameExtension)
            End If



        End Function


    End Class
End Namespace