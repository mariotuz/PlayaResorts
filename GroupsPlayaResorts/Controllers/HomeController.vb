Imports System.Diagnostics.CodeAnalysis
Imports System.Security.Principal
Imports System.Web.Routing
Imports System.Web.Security
Imports System.Data.SqlClient

Namespace GroupsPlayaResorts
    Public Class HomeController
        Inherits System.Web.Mvc.Controller
        Public coonString = ConfigurationManager.ConnectionStrings("RemoteConnectionString").ConnectionString
        Public conn = New SqlConnection(coonString)

        '
        ' GET: /Home
        Function Index() As ActionResult
            Return View()
        End Function

        '
        ' POST: /Home
        <HttpPost()> _
        Function Index(ByVal model As Login, ByVal returnUrl As String) As ActionResult

            Dim UserValid As Boolean = False
            Dim Query As String
            Dim CommandUser
            Dim Result

            conn.Open()

            Query = "select *from Cat_Users where User_Login='" + model.UserName + "' and [Password]='" + model.UserPassword + "' and Status_Data=1 "
            CommandUser = New SqlCommand(Query, conn)
            Result = CommandUser.ExecuteReader()

            If Result.HasRows Then
                While Result.Read()
                    UserValid = True

                    Session("IDUser") = Result("Id_User")
                    Session("UserName") = Result("User_Login")
                    Session("User_Name") = Result("User_Name") + " " + Result("Last_Name")
                    'Session("LastAccess") = Result("Ultimo_Acceso")
                    'Session("ModulMenu") = "0"
                End While
            End If

            Result.close()

            conn.close()

            If UserValid Then

                FormsAuthentication.SetAuthCookie(model.UserName, True)
                'If Url.IsLocalUrl(returnUrl) AndAlso returnUrl.Length > 1 AndAlso returnUrl.StartsWith("/") _
                '   AndAlso Not returnUrl.StartsWith("//") AndAlso Not returnUrl.StartsWith("/\\") Then
                '    Return Redirect(returnUrl)
                'Else

                '    'Query = "Update Cat_Usuarios set Intentos_Fallidos=0  where id_usuario=" + Session("IDUser").ToString + ""
                '    'conn.Open()
                '    'CommandUser = New SqlCommand(Query, conn)
                '    'CommandUser.ExecuteNonQuery()
                '    'conn.close()

                '    'Return RedirectToAction("Index", "Home")
                'End If

                Return RedirectToAction("GroupsList", "Groups")

            Else

                'UserValid = False
                'Dim ID_USUARIO As Integer
                'Dim INTENTOS_FALLIDOS As Integer

                'conn.Open()

                'Query = "Select *from Cat_Usuarios where Cve_Usuario='" + model.UserName + "'"
                'CommandUser = New SqlCommand(Query, conn)
                'Result = CommandUser.ExecuteReader()

                'If Result.HasRows Then
                '    While Result.Read()
                '        UserValid = True
                '        ID_USUARIO = Result("Id_Usuario")
                '        INTENTOS_FALLIDOS = Result("Intentos_Fallidos")
                '    End While
                'End If
                'Result.close()

                'conn.close()

                'If INTENTOS_FALLIDOS = 5 Then
                '    ModelState.AddModelError("", "El usuario se ecuentra bloqueado por intentos fallidos. Por favor verificar con el Area de Sistemas")
                'Else

                '    If UserValid Then

                '        conn.Open()
                '        Query = "Update Cat_Usuarios set Intentos_Fallidos=Intentos_Fallidos+1 where id_usuario=" + ID_USUARIO.ToString + ""
                '        CommandUser = New SqlCommand(Query, conn)
                '        CommandUser.ExecuteNonQuery()
                '        conn.close()

                '    End If

                ModelState.AddModelError("", "The username or password entered is incorrect.")

                'End If

            End If

            Return View(model)
        End Function


        '
        ' GET: /Home
        Function LogOut() As ActionResult
            FormsAuthentication.SignOut()

            'If Not Session("IDUser") Is Nothing Then

            '    Dim Query As String
            '    Dim CommandUser

            '    conn.Open()

            '    Query = "update Cat_Usuarios set Ultimo_Acceso=GETDATE() where Id_Usuario=" + Session("IDUser").ToString + " "
            '    CommandUser = New SqlCommand(Query, conn)
            '    CommandUser.ExecuteNonQuery()

            '    conn.close()

            'End If

            'Session("ModulMenu") = "0"

            Return RedirectToAction("Index", "Home")
        End Function



        '
        ' GET: /Home/ResetPassword
        Function ResetPassword() As ActionResult
            Return View()
        End Function

        '
        ' GET: /Home/ResetPasswordConfirm
        Function ResetPasswordConfirm() As ActionResult
            Return View()
        End Function






    End Class
End Namespace