Imports System.Data.SqlClient

Public MustInherit Class ApplicationController
    Inherits System.Web.Mvc.Controller

    Public classQuery As New Querys.Qrys

    Public coonString = ConfigurationManager.ConnectionStrings("RemoteConnectionString").ConnectionString
    Public conn = New SqlConnection(coonString)

    Sub New()

    End Sub

    Sub UserPermissions(ByVal idSecciones As String)
        conn.open()

        Dim DataUser As New Dictionary(Of String, String)
        DataUser.Add("id_user", Session.Item("IDUser"))
        DataUser.Add("solo_permisos", 1)

        ' Dim secciones As String() = idSecciones.Split(New Char() {","c})
        ' Dim seccion As String

        'For Each seccion In secciones
        DataUser.Add("id_secciones", idSecciones)

        Dim query = classQuery.GetQueryString("GetDataUser", "querys.xml", DataUser)
        Dim command = New SqlCommand(query, conn)

        Dim Results = command.ExecuteReader()

        If Results.HasRows Then
            While Results.Read()
                If (Results("NEW_PERMISSION") = 1) Then
                    ViewData("idseccion" & Results("ID_SECCION") & "subseccion" & Results("ID_SUBSECCION") & "new_permission") = Results("NEW_PERMISSION")
                End If
                If (Results("EDIT_PERMISSION") = 1) Then
                    ViewData("idseccion" & Results("ID_SECCION") & "subseccion" & Results("ID_SUBSECCION") & "edit_permission") = Results("EDIT_PERMISSION")
                End If
                If (Results("DELETE_PERMISSION") = 1) Then
                    ViewData("idseccion" & Results("ID_SECCION") & "subseccion" & Results("ID_SUBSECCION") & "delete_permission") = Results("DELETE_PERMISSION")
                End If
                If (Results("CONSULT_PERMISSION") = 1) Then
                    ViewData("idseccion" & Results("ID_SECCION") & "subseccion" & Results("ID_SUBSECCION") & "consult_permission") = Results("CONSULT_PERMISSION")
                End If
                If (Results("UPLOAD_PERMISSION") = 1) Then
                    ViewData("idseccion" & Results("ID_SECCION") & "subseccion" & Results("ID_SUBSECCION") & "upload_permission") = Results("UPLOAD_PERMISSION")
                End If
                If (Results("VALIDATE_PERMISSION") = 1) Then
                    ViewData("idseccion" & Results("ID_SECCION") & "subseccion" & Results("ID_SUBSECCION") & "validate_permission") = Results("VALIDATE_PERMISSION")
                End If
            End While
        End If

        DataUser.Remove("id_seccion")
        Results.Close()
        'Next

        conn.close()
    End Sub

End Class