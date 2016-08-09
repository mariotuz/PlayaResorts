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

Namespace GroupsPlayaResorts
    Public Class CatalogsController
        'Inherits System.Web.Mvc.Controller
        Inherits ApplicationController
        'Public coonString = ConfigurationManager.ConnectionStrings("RemoteConnectionString").ConnectionString
        'Public conn = New SqlConnection(coonString)
        'Private classQuery As New Querys.Qrys

        '
        ' GET: /Catalogs
        <Authorize()> _
        Function Index() As ActionResult
            Return View()
        End Function

        '
        ' GET: /Catalogs/CatalogUsers

        <Authorize()> _
        Function CatalogUsers() As ActionResult
            UserPermissions("1,2,3,4")

            Dim model = New CataloUsers

            Dim QueryChannels As String = "Select Id_Channel, Channel_Name from Cat_Channel where Status_Data=1 order by Channel_Name "
            Dim CommanChannels = New SqlCommand(QueryChannels, conn)
            Dim ListChannels = New List(Of SelectListItem)

            Dim QueryProfiles As String = "Select Id_Profile, Profile_Name from Cat_Profiles where Status_Data=1 order by Profile_Name "
            Dim CommanProfiles = New SqlCommand(QueryProfiles, conn)
            Dim ListProfiles = New List(Of SelectListItem)

            conn.Open()

            Dim ResultsChannels = CommanChannels.ExecuteReader()

            If ResultsChannels.HasRows Then
                While ResultsChannels.Read()
                    ListChannels.Add(New SelectListItem With {.Text = ResultsChannels("Channel_Name"), .Value = ResultsChannels("Id_Channel"), .Selected = False})
                End While
            End If
            ResultsChannels.Close()

            Dim ResultsProfiles = CommanProfiles.ExecuteReader()

            If ResultsProfiles.HasRows Then
                While ResultsProfiles.Read()
                    ListProfiles.Add(New SelectListItem With {.Text = ResultsProfiles("Profile_Name"), .Value = ResultsProfiles("Id_Profile"), .Selected = False})
                End While
            End If
            ResultsProfiles.Close()

            Dim QueryDos As String = "Select a.Id_User , a.[User_Name]+' '+a.Last_Name as NameUser, a.User_Login , b.Profile_Name from Cat_Users a left join Cat_Profiles b on a.Id_Profile=b.Id_Profile order by NameUser  "
            Dim CommandUserDos = New SqlCommand(QueryDos, conn)
            Dim Results = CommandUserDos.ExecuteReader()
            Dim UsersList = New List(Of CatalogUsersList)

            If Results.HasRows Then
                While Results.Read()
                    UsersList.Add(New CatalogUsersList With {.Id_User = Results("Id_User"), .User_Name = Results("NameUser"), .User_Login = Results("User_Login"), .User_Profile = Results("Profile_Name")})
                End While
            End If
            Results.Close()


            model.ListUsersin = UsersList


            conn.close()

            model.ListProfilein = ListProfiles
            model.ListChannelin = ListChannels

            Return View(model)
        End Function


        '
        ' POST: /Catalogs/CatalogUsers
        <HttpPost()> _
        Public Function CatalogUsers(ByVal model As CataloUsers, ByVal UserButtons As String) As ActionResult
            UserPermissions("1,2,3,4")

            If UserButtons = "Insert_User" Then
                Try
                    conn.Open()
                    Dim Query = classQuery.GetQueryString("InsertUser", "querys.xml", Request)
                    Dim CommandUser = New SqlCommand(Query, conn)
                    Dim Results = CommandUser.ExecuteReader()
                    Dim UsersList = New List(Of CatalogUsersList)

                    If Results.HasRows Then
                        While Results.Read()
                            UsersList.Add(New CatalogUsersList With {.Id_User = Results("Id_User"), .User_Name = Results("NameUser"), .User_Login = Results("User_Login"), .User_Profile = Results("Profile_Name")})
                        End While
                    End If

                    Results.Close()

                    model.ListUsersin = UsersList

                    Return PartialView("UsersTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()


            End If

            'If UserButtons = "Edit_Market" Then


            '    Dim CommandUser

            '    Dim Query As String = "Update Cat_Markets set Market_Name=@Market_Name, Market_Key=@Market_Key where Id_Market=" + Request("EditMarketID") + " "

            '    CommandUser = New SqlCommand(Query, conn)

            '    CommandUser.Parameters.AddWithValue("@Market_Name", Request("EditMarketName"))
            '    CommandUser.Parameters.AddWithValue("@Market_Key", Request("EditMarketKey"))


            '    conn.Open()

            '    Try
            '        CommandUser.ExecuteNonQuery()

            '        Dim QueryDos As String = "Select *from Cat_Markets where Status_Data=1 order by Id_Market desc   "
            '        Dim CommandUserDos = New SqlCommand(QueryDos, conn)
            '        Dim Results = CommandUserDos.ExecuteReader()
            '        Dim MarketsList = New List(Of CatalogMarketList)

            '        If Results.HasRows Then
            '            While Results.Read()
            '                MarketsList.Add(New CatalogMarketList With {.Id_Market = Results("Id_Market"), .Market_Name = Results("Market_Name"), .Market_Key = Results("Market_Key")})
            '            End While
            '        End If


            '        model.ListMarketin = MarketsList

            '        Return PartialView("MarketsTable", model)

            '    Catch ex As Exception

            '        Return Content("Error")

            '    End Try

            '    conn.close()

            'End If


            'If UserButtons = "Edit_Request_Market" Then


            '    conn.Open()

            '    Try

            '        Dim QueryDos As String = "Select *from Cat_Markets where Status_Data=1 and Id_Market=" + Request("MarketRadio") + "  "
            '        Dim CommandUserDos = New SqlCommand(QueryDos, conn)
            '        Dim Results = CommandUserDos.ExecuteReader()


            '        If Results.HasRows Then
            '            While Results.Read()
            '                model.EditMarketKey = Results("Market_Key")
            '                model.EditMarket = Results("Market_Name")
            '                model.EditMarketid = Results("Id_Market")
            '            End While
            '        End If


            '        Return PartialView("MarketsModal", model)

            '    Catch ex As Exception

            '        Return Content("Error")

            '    End Try
            '    conn.close()

            'End If


            'If UserButtons = "Delete_Market" Then

            '    Dim CommandUser

            '    Dim Query As String = "Update Cat_Markets set Status_Data=0 where Id_Market=" + Request("DeleteMarketID") + " "

            '    CommandUser = New SqlCommand(Query, conn)

            '    conn.Open()

            '    Try
            '        CommandUser.ExecuteNonQuery()

            '        Dim QueryDos As String = "Select *from Cat_Markets where Status_Data=1 order by Id_Market desc "
            '        Dim CommandUserDos = New SqlCommand(QueryDos, conn)
            '        Dim Results = CommandUserDos.ExecuteReader()
            '        Dim MarketsList = New List(Of CatalogMarketList)

            '        If Results.HasRows Then
            '            While Results.Read()
            '                MarketsList.Add(New CatalogMarketList With {.Id_Market = Results("Id_Market"), .Market_Name = Results("Market_Name"), .Market_Key = Results("Market_Key")})
            '            End While
            '        End If


            '        model.ListMarketin = MarketsList

            '        Return PartialView("MarketsTable", model)

            '    Catch ex As Exception

            '        Return Content("Error")

            '    End Try

            '    conn.close()

            'End If




            Return View(model)
        End Function

        <HttpPost()> _
        Public Function EditUser(ByVal model As CataloUsers) As ActionResult
            UserPermissions("1,2,3,4")
            conn.Open()

            Dim Query = classQuery.GetQueryString("UpdateUser", "querys.xml", Request)
            Dim CommandUser = New SqlCommand(Query, conn)
            Dim Results = CommandUser.ExecuteReader()
            Dim UsersList = New List(Of CatalogUsersList)

            If Results.HasRows Then
                While Results.Read()
                    UsersList.Add(New CatalogUsersList With {.Id_User = Results("Id_User"), .User_Name = Results("NameUser"), .User_Login = Results("User_Login"), .User_Profile = Results("Profile_Name")})
                End While
            End If

            Results.Close()

            model.ListUsersin = UsersList
            conn.Close()

            Return PartialView("UsersTable", model)
        End Function

        <HttpPost()> _
        Public Function GetDataUser() As ActionResult
            conn.Open()

            Dim UserXml As String
            Dim XMLResult As System.Xml.XmlReader
            Dim Query = classQuery.GetQueryString("GetDataUser", "querys.xml", Request)
            Dim Command = New SqlCommand(Query, conn)

            XMLResult = Command.ExecuteXmlReader()
            XMLResult.Read()

            UserXml = XMLResult.ReadOuterXml()

            conn.Close()

            Return Content(UserXml.ToString)
        End Function

        '
        ' POST: /Catalogs/CatalogProfiles
        <HttpPost()> _
        Public Function CatalogProfiles(ByVal model As CatalogProfile, ByVal ProfileButtons As String) As ActionResult


            If ProfileButtons = "Insert_Profile" Then
                conn.Open()

                Dim sqlParameters() As Object
                Dim Query = classQuery.GetQueryString("InsertProfile", "querys.xml", Request, sqlParameters)
                Dim CommandUser = New SqlCommand(Query, conn)

                CommandUser.CommandType = CommandType.StoredProcedure
                Dim param As System.Data.SqlClient.SqlParameter
                For Each param In sqlParameters
                    CommandUser.Parameters.Add(param)
                Next

                Dim Results = CommandUser.ExecuteReader()
                Dim ProfileList = New List(Of CatalogProfileList)

                If Results.HasRows Then
                    While Results.Read()
                        ProfileList.Add(New CatalogProfileList With {.Id_Profile = Results("Id_Profile"), .Profile_Name = Results("Profile_Name")})
                    End While
                End If

                Results.Close()

                model.ListProfilein = ProfileList

                Return PartialView("ProfileTable", model)

                'Dim CommandUser

                'Dim Query As String = "Insert into Cat_Profiles(Id_Profile, Profile_Name, Status_Data ) VALUES(@Id_Profile,@Profile_Name ,@Status_Data )"

                'CommandUser = New SqlCommand(Query, conn)
                'CommandUser.Parameters.AddWithValue("@Id_Profile", ConsecutiveValue("Id_Profile", "Cat_Profiles"))
                'CommandUser.Parameters.AddWithValue("@Profile_Name", model.ProfileName)
                'CommandUser.Parameters.AddWithValue("@Status_Data", 1)



                'conn.Open()

                'Try
                '    CommandUser.ExecuteNonQuery()

                '    Dim QueryDos As String = "Select *from Cat_Profiles where Status_Data=1 order by Id_Profile desc  "
                '    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                '    Dim Results = CommandUserDos.ExecuteReader()
                '    Dim ProfilesList = New List(Of CatalogProfileList)

                '    If Results.HasRows Then
                '        While Results.Read()
                '            ProfilesList.Add(New CatalogProfileList With {.Id_Profile = Results("Id_Profile"), .Profile_Name = Results("Profile_Name")})
                '        End While
                '    End If


                '    model.ListProfilein = ProfilesList

                '    Return PartialView("ProfileTable", model)

                'Catch ex As Exception

                '    Return Content("Error")

                'End Try

                'conn.close()


            End If

            'If ProfileButtons = "Edit_Market" Then


            '    Dim CommandUser

            '    Dim Query As String = "Update Cat_Markets set Market_Name=@Market_Name, Market_Key=@Market_Key where Id_Market=" + Request("EditMarketID") + " "

            '    CommandUser = New SqlCommand(Query, conn)

            '    CommandUser.Parameters.AddWithValue("@Market_Name", Request("EditMarketName"))
            '    CommandUser.Parameters.AddWithValue("@Market_Key", Request("EditMarketKey"))


            '    conn.Open()

            '    Try
            '        CommandUser.ExecuteNonQuery()

            '        Dim QueryDos As String = "Select *from Cat_Markets where Status_Data=1 order by Id_Market desc   "
            '        Dim CommandUserDos = New SqlCommand(QueryDos, conn)
            '        Dim Results = CommandUserDos.ExecuteReader()
            '        Dim MarketsList = New List(Of CatalogMarketList)

            '        If Results.HasRows Then
            '            While Results.Read()
            '                MarketsList.Add(New CatalogMarketList With {.Id_Market = Results("Id_Market"), .Market_Name = Results("Market_Name"), .Market_Key = Results("Market_Key")})
            '            End While
            '        End If


            '        model.ListMarketin = MarketsList

            '        Return PartialView("MarketsTable", model)

            '    Catch ex As Exception

            '        Return Content("Error")

            '    End Try

            '    conn.close()

            'End If


            'If ProfileButtons = "Edit_Request_Market" Then


            '    conn.Open()

            '    Try

            '        Dim QueryDos As String = "Select *from Cat_Markets where Status_Data=1 and Id_Market=" + Request("MarketRadio") + "  "
            '        Dim CommandUserDos = New SqlCommand(QueryDos, conn)
            '        Dim Results = CommandUserDos.ExecuteReader()


            '        If Results.HasRows Then
            '            While Results.Read()
            '                model.EditMarketKey = Results("Market_Key")
            '                model.EditMarket = Results("Market_Name")
            '                model.EditMarketid = Results("Id_Market")
            '            End While
            '        End If


            '        Return PartialView("MarketsModal", model)

            '    Catch ex As Exception

            '        Return Content("Error")

            '    End Try
            '    conn.close()

            'End If


            'If ProfileButtons = "Delete_Market" Then

            '    Dim CommandUser

            '    Dim Query As String = "Update Cat_Markets set Status_Data=0 where Id_Market=" + Request("DeleteMarketID") + " "

            '    CommandUser = New SqlCommand(Query, conn)

            '    conn.Open()

            '    Try
            '        CommandUser.ExecuteNonQuery()

            '        Dim QueryDos As String = "Select *from Cat_Markets where Status_Data=1 order by Id_Market desc "
            '        Dim CommandUserDos = New SqlCommand(QueryDos, conn)
            '        Dim Results = CommandUserDos.ExecuteReader()
            '        Dim MarketsList = New List(Of CatalogMarketList)

            '        If Results.HasRows Then
            '            While Results.Read()
            '                MarketsList.Add(New CatalogMarketList With {.Id_Market = Results("Id_Market"), .Market_Name = Results("Market_Name"), .Market_Key = Results("Market_Key")})
            '            End While
            '        End If


            '        model.ListMarketin = MarketsList

            '        Return PartialView("MarketsTable", model)

            '    Catch ex As Exception

            '        Return Content("Error")

            '    End Try

            '    conn.close()

            'End If




            Return View(model)
        End Function

        <HttpPost()> _
        Public Function EditProfile(ByVal model As CatalogProfile) As ActionResult
            UserPermissions("1,2,3,4")
            conn.Open()

            Dim Query = classQuery.GetQueryString("UpdateProfile", "querys.xml", Request)
            Dim CommandUser = New SqlCommand(Query, conn)
            Dim Results = CommandUser.ExecuteReader()
            Dim ProfileList = New List(Of CatalogProfileList)

            If Results.HasRows Then
                While Results.Read()
                    ProfileList.Add(New CatalogProfileList With {.Id_Profile = Results("Id_Profile"), .Profile_Name = Results("Profile_Name")})
                End While
            End If

            Results.Close()

            model.ListProfilein = ProfileList
            conn.Close()

            Return PartialView("ProfileTable", model)
        End Function

        <HttpPost()> _
        Public Function GetDataProfile() As ActionResult
            conn.Open()

            Dim Xml As String
            Dim XMLResult As System.Xml.XmlReader
            Dim Query = classQuery.GetQueryString("GetDataProfile", "querys.xml", Request)
            Dim Command = New SqlCommand(Query, conn)

            XMLResult = Command.ExecuteXmlReader()
            XMLResult.Read()

            Xml = XMLResult.ReadOuterXml()

            conn.Close()

            Return Content(Xml.ToString)
        End Function


        '
        ' GET: /Catalogs/CatalogProfiles
        <Authorize()> _
        Function CatalogProfiles() As ActionResult
            UserPermissions("1,2,3,4")

            Dim model = New CatalogProfile


            conn.Open()

            Try

                Dim QueryDos As String = "Select *from Cat_Profiles where Status_Data=1 order by Id_Profile desc  "
                Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                Dim Results = CommandUserDos.ExecuteReader()
                Dim ProfilesList = New List(Of CatalogProfileList)

                If Results.HasRows Then
                    While Results.Read()
                        ProfilesList.Add(New CatalogProfileList With {.Id_Profile = Results("Id_Profile"), .Profile_Name = Results("Profile_Name")})
                    End While
                End If


                model.ListProfilein = ProfilesList

                conn.close()
                Return View(model)

            Catch ex As Exception

                conn.close()
                Return Content("Error")

            End Try

        End Function


        '
        ' GET: /Catalogs/CatalogProperties
        <Authorize()> _
        Function CatalogProperties() As ActionResult
            UserPermissions("1,2,3,4")
            Return View()
        End Function


        '
        ' GET: /Catalogs/CatalogPromotions
        <Authorize()> _
        Function CatalogPromotions() As ActionResult
            UserPermissions("1,2,3,4")
            Dim model = New CataloPromo
            conn.Open()

            Try

                Dim QueryDos As String = "Select Clav_Hotel,Clave_TC,Clav_Rate,Ano,Descuento,VigenciaI,VigenciaF,BookingI,Isnull(BookingF , getdate()) as BookingF,Fecha_Activa from vw_Promociones order by Fecha_Activa desc "
                Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                Dim Results = CommandUserDos.ExecuteReader()
                Dim PromoList = New List(Of CatalogPromoList)
                Dim Date1 As Date
                Dim Date2 As Date
                Dim Date3 As Date
                Dim Date4 As Date
                Dim Date5 As Date

                If Results.HasRows Then
                    While Results.Read()
                        Date1 = Results("VigenciaI")
                        Date2 = Results("VigenciaF")
                        Date3 = Results("BookingI")
                        Date4 = Results("BookingF")
                        Date5 = Results("Fecha_Activa")
                        PromoList.Add(New CatalogPromoList With {.CveHotel = Results("Clav_Hotel"), .RoomType = Results("Clave_TC"), .RateName = Results("Clav_Rate"), .Ano = Results("Ano"), .Discount = Results("Descuento"), .InitialDate = Date1.ToString("yyyy-MM-dd"), .EndDate = Date2.ToString("yyyy-MM-dd"), .BookingInitialDate = Date3.ToString("yyyy-MM-dd"), .BookingEndDate = Date4.ToString("yyyy-MM-dd"), .ActiveDate = Date5.ToString("yyyy-MM-dd hh:mm:ss tt")})
                    End While
                End If


                model.ListPromoin = PromoList

                conn.close()
                Return View(model)

            Catch ex As Exception

                conn.close()
                Return Content("Error")

            End Try

        End Function


        '
        ' POST: /Catalogs/CatalogPromotions
        <HttpPost()> _
        Public Function CatalogPromotions(ByVal model As CataloPromo, ByVal PromoButtons As String) As ActionResult
            UserPermissions("1,2,3,4")

            If PromoButtons = "Insert_Promo" Then

                Dim CommandUser

                Dim Query As String = "Exec sp_T_New_Promo @Hotel='" + Request("HotelSelect") + "' , @Ano=" + Request("promoyear") + " , @Descuento=" + model.PromoDiscount.ToString + " , @VigenciaI='" + Request("datetimepickerdate1text") + "' , @VigenciaF='" + Request("datetimepickerdate2text") + "' , @BookingI='" + Request("datetimepickerdate3text") + "' , @BookingF='" + Request("datetimepickerdate4text") + "'   "

                CommandUser = New SqlCommand(Query, conn)

                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select Clav_Hotel,Clave_TC,Clav_Rate,Ano,Descuento,VigenciaI,VigenciaF,BookingI,BookingF,Fecha_Activa from vw_Promociones order by Fecha_Activa desc "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim PromoList = New List(Of CatalogPromoList)
                    Dim Date1 As Date
                    Dim Date2 As Date
                    Dim Date3 As Date
                    Dim Date4 As Date
                    Dim Date5 As Date

                    If Results.HasRows Then
                        While Results.Read()
                            Date1 = Results("VigenciaI")
                            Date2 = Results("VigenciaF")
                            Date3 = Results("BookingI")
                            Date4 = Results("BookingF")
                            Date5 = Results("Fecha_Activa")
                            PromoList.Add(New CatalogPromoList With {.CveHotel = Results("Clav_Hotel"), .RoomType = Results("Clave_TC"), .RateName = Results("Clav_Rate"), .Ano = Results("Ano"), .Discount = Results("Descuento"), .InitialDate = Date1.ToString("yyyy-MM-dd"), .EndDate = Date2.ToString("yyyy-MM-dd"), .BookingInitialDate = Date3.ToString("yyyy-MM-dd"), .BookingEndDate = Date4.ToString("yyyy-MM-dd"), .ActiveDate = Date5.ToString("yyyy-MM-dd hh:mm:ss tt")})
                        End While
                    End If


                    model.ListPromoin = PromoList

                    Return PartialView("PromotionsTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()


            End If



            Return View(model)
        End Function

        '
        ' GET: /Catalogs/CatalogMarkets
        <Authorize()> _
        Function CatalogMarkets() As ActionResult
            UserPermissions("1,2,3,4")
            Dim model = New CatalogMarket


            conn.Open()

            Try

                Dim QueryDos As String = "Select *from Cat_Markets where Status_Data=1  order by Id_Market desc "
                Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                Dim Results = CommandUserDos.ExecuteReader()
                Dim MarketsList = New List(Of CatalogMarketList)

                If Results.HasRows Then
                    While Results.Read()
                        MarketsList.Add(New CatalogMarketList With {.Id_Market = Results("Id_Market"), .Market_Name = Results("Market_Name"), .Market_Key = Results("Market_Key")})
                    End While
                End If


                model.ListMarketin = MarketsList

                conn.close()
                Return View(model)

            Catch ex As Exception

                conn.close()
                Return Content("Error")

            End Try
            'ModelState.AddModelError("", "Se creo el usuario.")


            'Return View(model)

        End Function


        '
        ' POST: /Catalogs/CatalogMarkets
        <HttpPost()> _
        Public Function CatalogMarkets(ByVal model As CatalogMarket, ByVal MarketButtons As String) As ActionResult
            UserPermissions("1,2,3,4")
            If MarketButtons = "Insert_Market" Then

                Dim CommandUser

                Dim Query As String = "Insert into Cat_Markets(Id_Market, Market_Name, Market_Key, Status_Data ) VALUES(@Id_Market,@Market_Name,@Market_Key ,@Status_Data )"

                CommandUser = New SqlCommand(Query, conn)
                CommandUser.Parameters.AddWithValue("@Id_Market", ConsecutiveValue("Id_Market", "Cat_Markets"))
                CommandUser.Parameters.AddWithValue("@Market_Name", model.MarketName)
                CommandUser.Parameters.AddWithValue("@Market_Key", model.MarketKey)
                CommandUser.Parameters.AddWithValue("@Status_Data", 1)



                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_Markets where Status_Data=1 order by Id_Market desc  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim MarketsList = New List(Of CatalogMarketList)

                    If Results.HasRows Then
                        While Results.Read()
                            MarketsList.Add(New CatalogMarketList With {.Id_Market = Results("Id_Market"), .Market_Name = Results("Market_Name"), .Market_Key = Results("Market_Key")})
                        End While
                    End If


                    model.ListMarketin = MarketsList

                    Return PartialView("MarketsTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()


            End If

            If MarketButtons = "Edit_Market" Then


                Dim CommandUser

                Dim Query As String = "Update Cat_Markets set Market_Name=@Market_Name, Market_Key=@Market_Key where Id_Market=" + Request("EditMarketID") + " "

                CommandUser = New SqlCommand(Query, conn)

                CommandUser.Parameters.AddWithValue("@Market_Name", Request("EditMarketName"))
                CommandUser.Parameters.AddWithValue("@Market_Key", Request("EditMarketKey"))


                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_Markets where Status_Data=1 order by Id_Market desc   "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim MarketsList = New List(Of CatalogMarketList)

                    If Results.HasRows Then
                        While Results.Read()
                            MarketsList.Add(New CatalogMarketList With {.Id_Market = Results("Id_Market"), .Market_Name = Results("Market_Name"), .Market_Key = Results("Market_Key")})
                        End While
                    End If


                    model.ListMarketin = MarketsList

                    Return PartialView("MarketsTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()

            End If


            If MarketButtons = "Edit_Request_Market" Then


                conn.Open()

                Try

                    Dim QueryDos As String = "Select *from Cat_Markets where Status_Data=1 and Id_Market=" + Request("MarketRadio") + "  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()


                    If Results.HasRows Then
                        While Results.Read()
                            model.EditMarketKey = Results("Market_Key")
                            model.EditMarket = Results("Market_Name")
                            model.EditMarketid = Results("Id_Market")
                        End While
                    End If


                    Return PartialView("MarketsModal", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try
                conn.close()

            End If


            If MarketButtons = "Delete_Market" Then

                Dim CommandUser

                Dim Query As String = "Update Cat_Markets set Status_Data=0 where Id_Market=" + Request("DeleteMarketID") + " "

                CommandUser = New SqlCommand(Query, conn)

                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_Markets where Status_Data=1 order by Id_Market desc "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim MarketsList = New List(Of CatalogMarketList)

                    If Results.HasRows Then
                        While Results.Read()
                            MarketsList.Add(New CatalogMarketList With {.Id_Market = Results("Id_Market"), .Market_Name = Results("Market_Name"), .Market_Key = Results("Market_Key")})
                        End While
                    End If


                    model.ListMarketin = MarketsList

                    Return PartialView("MarketsTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()

            End If




            Return View(model)
        End Function



        '
        ' GET: /Catalogs/CatalogGroupType
        <Authorize()> _
        Function CatalogGroupType() As ActionResult
            UserPermissions("1,2,3,4")
            Dim model = New CatalogGroupType

            conn.Open()

            Try

                Dim QueryDos As String = "Select *from Cat_GroupType where Status_Data=1  order by Id_Type desc "
                Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                Dim Results = CommandUserDos.ExecuteReader()
                Dim GroupTypeList = New List(Of CatalogGroupTypeList)

                If Results.HasRows Then
                    While Results.Read()
                        GroupTypeList.Add(New CatalogGroupTypeList With {.Id_GroupType = Results("Id_Type"), .GroupType_Name = Results("Type_Name")})
                    End While
                End If


                model.ListGroupTypein = GroupTypeList

                Return View(model)

            Catch ex As Exception

                Return Content("Error")

            End Try
            'ModelState.AddModelError("", "Se creo el usuario.")
            conn.close()

            Return View(model)
        End Function

        '
        ' POST: /Catalogs/CatalogGroupType
        <HttpPost()> _
        Public Function CatalogGroupType(ByVal model As CatalogGroupType, ByVal GroupTypeButtons As String) As ActionResult
            UserPermissions("1,2,3,4")

            If GroupTypeButtons = "Insert_GroupType" Then

                Dim CommandUser

                Dim Query As String = "Insert into Cat_GroupType(Id_Type, Type_Name, Status_Data, Special_Concessions , Special_Concessions_MICE ) VALUES(@Id_Type,@Type_Name ,@Status_Data, @Special_Concessions , @Special_Concessions_MICE )"

                CommandUser = New SqlCommand(Query, conn)
                CommandUser.Parameters.AddWithValue("@Id_Type", ConsecutiveValue("Id_Type", "Cat_GroupType"))
                CommandUser.Parameters.AddWithValue("@Type_Name", model.GroupTypeName)
                CommandUser.Parameters.AddWithValue("@Special_Concessions", Request("specialData"))
                CommandUser.Parameters.AddWithValue("@Special_Concessions_MICE", Request("specialDataMICE"))
                CommandUser.Parameters.AddWithValue("@Status_Data", 1)



                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_GroupType where Status_Data=1  order by Id_Type desc  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim GroupTypeList = New List(Of CatalogGroupTypeList)

                    If Results.HasRows Then
                        While Results.Read()
                            GroupTypeList.Add(New CatalogGroupTypeList With {.Id_GroupType = Results("Id_Type"), .GroupType_Name = Results("Type_Name")})
                        End While
                    End If


                    model.ListGroupTypein = GroupTypeList

                    Return PartialView("GroupTypeTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()


            End If

            If GroupTypeButtons = "Edit_GroupType" Then


                Dim CommandUser

                Dim Query As String = "Update Cat_GroupType set Type_Name=@Type_Name, Special_Concessions=@Special_Concessions , Special_Concessions_MICE=@Special_Concessions_MICE  where Id_Type=" + Request("EditGroupTypeID") + " "

                CommandUser = New SqlCommand(Query, conn)

                CommandUser.Parameters.AddWithValue("@Type_Name", Request("EditGroupTypeName"))
                CommandUser.Parameters.AddWithValue("@Special_Concessions", Request("EditspecialData"))
                CommandUser.Parameters.AddWithValue("@Special_Concessions_MICE", Request("EditspecialDataMICE"))


                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_GroupType where Status_Data=1  order by Id_Type desc   "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim GroupTypeList = New List(Of CatalogGroupTypeList)

                    If Results.HasRows Then
                        While Results.Read()
                            GroupTypeList.Add(New CatalogGroupTypeList With {.Id_GroupType = Results("Id_Type"), .GroupType_Name = Results("Type_Name")})
                        End While
                    End If


                    model.ListGroupTypein = GroupTypeList

                    Return PartialView("GroupTypeTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()

            End If


            If GroupTypeButtons = "Edit_Request_GroupType" Then


                conn.Open()

                Try

                    Dim QueryDos As String = "Select *from Cat_GroupType where Status_Data=1 and Id_Type=" + Request("GroupTypeRadio") + "  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()


                    If Results.HasRows Then
                        While Results.Read()
                            model.EditGroupTypeName = Results("Type_Name")
                            model.EditGroupTypeID = Results("Id_Type")
                            model.EditGroupSpecial = Results("Special_Concessions")
                            model.EditGroupSpecialMICE = Results("Special_Concessions_MICE")
                        End While
                    End If


                    Return PartialView("GroupTypeModal", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try
                conn.close()

            End If


            If GroupTypeButtons = "Delete_GroupType" Then

                Dim CommandUser

                Dim Query As String = "Update Cat_GroupType set Status_Data=0 where Id_Type=" + Request("DeleteGroupTypeID") + " "

                CommandUser = New SqlCommand(Query, conn)

                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_GroupType where Status_Data=1 order by Id_Type desc "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim GroupTypeList = New List(Of CatalogGroupTypeList)

                    If Results.HasRows Then
                        While Results.Read()
                            GroupTypeList.Add(New CatalogGroupTypeList With {.Id_GroupType = Results("Id_Type"), .GroupType_Name = Results("Type_Name")})
                        End While
                    End If


                    model.ListGroupTypein = GroupTypeList

                    Return PartialView("GroupTypeTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()

            End If




            Return View(model)
        End Function

        '
        ' GET: /Catalogs/CatalogWholesale
        <Authorize()> _
        Function CatalogWholesale() As ActionResult
            UserPermissions("1,2,3,4")
            Return View()
        End Function

        '
        ' GET: /Catalogs/CatalogCompanies
        <Authorize()> _
        Function CatalogCompanies() As ActionResult
            UserPermissions("1,2,3,4")
            Dim model = New CatalogCompanies

            conn.Open()

            Try

                Dim QueryDos As String = "Select *from Cat_Companies where Status_Data=1  order by Id_Company desc "
                Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                Dim Results = CommandUserDos.ExecuteReader()
                Dim CompaniesList = New List(Of CatalogCompanyList)

                If Results.HasRows Then
                    While Results.Read()
                        CompaniesList.Add(New CatalogCompanyList With {.Id_Company = Results("Id_Company"), .Company_Name = Results("Company_Name"), .Company_Key = Results("Company_Key")})
                    End While
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
                model.ListCompaniesin = CompaniesList

                Return View(model)

            Catch ex As Exception

                Return Content("Error")

            End Try
            'ModelState.AddModelError("", "Se creo el usuario.")
            conn.close()

            Return View(model)
        End Function


        '
        ' POST: /Catalogs/CatalogCompanies
        <HttpPost()> _
        Public Function CatalogCompanies(ByVal model As CatalogCompanies, ByVal CompanyButtons As String) As ActionResult
            UserPermissions("1,2,3,4")
            If CompanyButtons = "Insert_Company" Then
                conn.Open()

                Try
                    Dim CompaniesList = New List(Of CatalogCompanyList)

                    Dim sqlParameters() As Object
                    Dim queryTest = classQuery.GetQueryString("InsertCompany", "querys.xml", Request, sqlParameters)
                    Dim CommandTest = New SqlCommand(queryTest, conn)

                    CommandTest.CommandType = CommandType.StoredProcedure

                    Dim param As System.Data.SqlClient.SqlParameter

                    For Each param In sqlParameters
                        CommandTest.Parameters.Add(param)
                    Next

                    Dim Results = CommandTest.ExecuteReader()

                    If Results.HasRows Then
                        While Results.Read()
                            CompaniesList.Add(New CatalogCompanyList With {.Id_Company = Results("Id_Company"), .Company_Name = Results("Company_Name"), .Company_Key = Results("Company_Key")})
                        End While
                    End If

                    model.ListCompaniesin = CompaniesList

                    Return PartialView("CompaniesTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()


            End If

            If CompanyButtons = "Edit_Company" Then


                Dim CommandUser

                Dim Query As String = "Update Cat_Companies set Company_Name=@Company_Name, Company_Key=@Company_Key , Company_IATA=@Company_IATA , Company_ZIP=@Company_ZIP , Company_Country=@Company_Country, Company_State=@Company_State, Company_city = @City, Company_Address = @Address, Modified_by = @User  where Id_Company=" + Request("EditComapnyID") + " "

                CommandUser = New SqlCommand(Query, conn)

                CommandUser.Parameters.AddWithValue("@Company_Name", Request("EditCompanyName"))
                CommandUser.Parameters.AddWithValue("@Company_Key", Request("EditCompanyKey"))
                CommandUser.Parameters.AddWithValue("@Company_IATA", Request("EditCompanieIATA"))
                CommandUser.Parameters.AddWithValue("@Company_ZIP", Request("EditCompanieZipCode"))
                CommandUser.Parameters.AddWithValue("@Company_Country", Request("editcompanycountry"))
                CommandUser.Parameters.AddWithValue("@Company_State", Request("editcompanystate"))
                CommandUser.Parameters.AddWithValue("@City", Request("city"))
                CommandUser.Parameters.AddWithValue("@Address", Request("address"))
                CommandUser.Parameters.AddWithValue("@User", Request("user"))

                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_Companies where Status_Data=1 order by Id_Company desc   "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim CompaniesList = New List(Of CatalogCompanyList)

                    If Results.HasRows Then
                        While Results.Read()
                            CompaniesList.Add(New CatalogCompanyList With {.Id_Company = Results("Id_Company"), .Company_Name = Results("Company_Name"), .Company_Key = Results("Company_Key")})
                        End While
                    End If


                    model.ListCompaniesin = CompaniesList

                    Return PartialView("CompaniesTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()

            End If


            If CompanyButtons = "Edit_Request_Company" Then


                conn.Open()

                Try

                    Dim QueryDos As String = "Select Id_Company,Company_Name,Company_Key,Company_IATA,Company_ZIP,Company_Country,Company_State,ISNULL(Company_City,'') as Company_City,ISNULL(Company_Address,'') as Company_Address,ISNULL(Modified_by,'') as Modified_by from Cat_Companies where Status_Data=1 and Id_Company=" + Request("CompanyRadio") + "  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()


                    If Results.HasRows Then
                        While Results.Read()
                            model.EditComapnieKey = Results("Company_Key")
                            model.EditCompanie = Results("Company_Name")
                            model.EditCompanieid = Results("Id_Company")
                            model.EditCompanieIATA = Results("Company_IATA")
                            model.EditCompanieZIP = Results("Company_ZIP")
                            model.EditCompanieCountry = Results("Company_Country")
                            model.EditCompanieState = Results("Company_State")
                            model.City = Results("Company_City")
                            model.Address = Results("Company_Address")
                        End While
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
                    Return PartialView("CompaniesModal", model)

                Catch ex As Exception

                    conn.close()
                    Return Content("Error")

                End Try


            End If


            If CompanyButtons = "Delete_Company" Then

                Dim CommandUser

                Dim Query As String = "Update Cat_Companies set Status_Data=0 where Id_Company=" + Request("DeleteCompanyID") + " "

                CommandUser = New SqlCommand(Query, conn)

                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_Companies where Status_Data=1 order by Id_Company desc "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim CompaniesList = New List(Of CatalogCompanyList)

                    If Results.HasRows Then
                        While Results.Read()
                            CompaniesList.Add(New CatalogCompanyList With {.Id_Company = Results("Id_Company"), .Company_Name = Results("Company_Name"), .Company_Key = Results("Company_Key")})
                        End While
                    End If


                    model.ListCompaniesin = CompaniesList

                    Return PartialView("CompaniesTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()

            End If


            Return View(model)
        End Function

        '
        ' GET: /Catalogs/CatalogContacts
        <Authorize()> _
        Function CatalogContacts() As ActionResult
            UserPermissions("1,2,3,4")
            Dim model = New CatalogContacts

            conn.Open()

            Try

                Dim QueryDos As String = "Exec sp_Cat_Contacts_List ' ' , 0 "
                Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                Dim Results = CommandUserDos.ExecuteReader()
                Dim ContactList = New List(Of CatalogContactList)

                If Results.HasRows Then
                    While Results.Read()
                        ContactList.Add(New CatalogContactList With {.Id_Contact = Results("Id_Contact"), .Contact_Name = Results("Contact_Name"), .Contact_Email = Results("Contact_Email"), .Contact_Phone = Results("Phones"), .Contact_Type = Results("Contact_Type"), .Contact_CompanyWhosale = Results("WhosaleCompany"), .PostalCode = Results("Postal_code"), .Country = Results("Country"), .State = Results("State"), .City = Results("City"), .Address = Results("Address")})
                    End While
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
                model.ListContactsin = ContactList

                Return View(model)

            Catch ex As Exception

                Return Content("Error")

            End Try
            'ModelState.AddModelError("", "Se creo el usuario.")
            conn.close()

            Return View(model)
        End Function


        '
        ' POST: /Catalogs/CatalogContacts
        <HttpPost()> _
        Public Function CatalogContacts(ByVal model As CatalogContacts, ByVal ContactButtons As String) As ActionResult
            UserPermissions("1,2,3,4")
            If ContactButtons = "Insert_Contact" Then

                Dim CommandUser

                Dim Query As String = "Insert into Cat_Contacts( Contact_Name, Contact_Email, Phone_Uno, Phone_Dos , Contact_Type, Contact_Agency, Contact_Company , Status_Data , postal_code, country, state, city, address, modified_by) VALUES( @Contact_Name, @Contact_Email, @Phone_Uno, @Phone_Dos , @Contact_Type, @Contact_Agency, @Contact_Company , @Status_Data , @postal_code, @country, @state, @city, @address, @modifiedby)"

                CommandUser = New SqlCommand(Query, conn)
                'CommandUser.Parameters.AddWithValue("@Id_Company", ConsecutiveValue("Id_Company", "Cat_Companies"))
                CommandUser.Parameters.AddWithValue("@Contact_Name", model.ContactName)
                CommandUser.Parameters.AddWithValue("@Contact_Email", model.ContactEmail)
                CommandUser.Parameters.AddWithValue("@Phone_Uno", model.ContactPhone)
                CommandUser.Parameters.AddWithValue("@Phone_Dos", Request("phonedos"))
                CommandUser.Parameters.AddWithValue("@Contact_Type", Request("ContactType"))
                CommandUser.Parameters.AddWithValue("@Status_Data", 1)

                CommandUser.Parameters.AddWithValue("@postal_code", Request("postal_code"))
                CommandUser.Parameters.AddWithValue("@country", Request("country"))
                CommandUser.Parameters.AddWithValue("@state", Request("state"))
                CommandUser.Parameters.AddWithValue("@city", Request("city"))
                CommandUser.Parameters.AddWithValue("@address", Request("address"))
                CommandUser.Parameters.AddWithValue("@modifiedby", Request("user"))


                If Request("ContactType") = 1 Then
                    Dim WhosaleValue() As String = Split(model.ContactWhosaleCompany, ":")
                    CommandUser.Parameters.AddWithValue("@Contact_Agency", WhosaleValue(0))
                    CommandUser.Parameters.AddWithValue("@Contact_Company", 0)

                Else
                    CommandUser.Parameters.AddWithValue("@Contact_Agency", "")
                    CommandUser.Parameters.AddWithValue("@Contact_Company", FindCompany(model.ContactWhosaleCompany))
                End If

                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Exec sp_Cat_Contacts_List ' ' , 0 "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim ContactList = New List(Of CatalogContactList)

                    If Results.HasRows Then
                        While Results.Read()
                            ContactList.Add(New CatalogContactList With {.Id_Contact = Results("Id_Contact"), .Contact_Name = Results("Contact_Name"), .Contact_Email = Results("Contact_Email"), .Contact_Phone = Results("Phones"), .Contact_Type = Results("Contact_Type"), .Contact_CompanyWhosale = Results("WhosaleCompany"), .PostalCode = Results("Postal_code"), .Country = Results("Country"), .State = Results("State"), .City = Results("City"), .Address = Results("Address")})
                        End While
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
                    model.ListContactsin = ContactList

                    Return PartialView("ContactsTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()


            End If

            If ContactButtons = "Edit_Contact" Then


                Dim CommandUser

                Dim Query As String = "Update Cat_Contacts set Contact_Name=@Contact_Name, Contact_Email=@Contact_Email ,Phone_Uno=@Phone_Uno ,Phone_Dos=@Phone_Dos ,Contact_Type=@Contact_Type , Contact_Agency=@Contact_Agency , Contact_Company=@Contact_Company , Postal_code=@postal_code , Country=@Country, State=@State, City = @City, Address = @Address, Modified_by = @modifiedby where Id_Contact=" + Request("EditContactID") + " "

                CommandUser = New SqlCommand(Query, conn)

                CommandUser.Parameters.AddWithValue("@Contact_Name", Request("Editcontacname"))
                CommandUser.Parameters.AddWithValue("@Contact_Email", Request("Editcontacemail"))
                CommandUser.Parameters.AddWithValue("@Phone_Uno", Request("Editcontacphoneuno"))
                CommandUser.Parameters.AddWithValue("@Phone_Dos", Request("Editcontacphonedos"))
                CommandUser.Parameters.AddWithValue("@Contact_Type", Request("EditContactType"))

                CommandUser.Parameters.AddWithValue("@postal_code", Request("postal_code"))
                CommandUser.Parameters.AddWithValue("@country", Request("country"))
                CommandUser.Parameters.AddWithValue("@state", Request("state"))
                CommandUser.Parameters.AddWithValue("@city", Request("city"))
                CommandUser.Parameters.AddWithValue("@address", Request("address"))
                CommandUser.Parameters.AddWithValue("@modifiedby", Request("user"))


                If Request("EditContactType") = 1 Then
                    Dim WhosaleValue() As String = Split(Request("Editcontacwhosalecompany"), ":")
                    CommandUser.Parameters.AddWithValue("@Contact_Agency", WhosaleValue(0))
                    CommandUser.Parameters.AddWithValue("@Contact_Company", 0)

                Else
                    CommandUser.Parameters.AddWithValue("@Contact_Agency", "")
                    CommandUser.Parameters.AddWithValue("@Contact_Company", FindCompany(Request("Editcontacwhosalecompany")))
                End If


                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Exec sp_Cat_Contacts_List ' ' , 0 "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim ContactList = New List(Of CatalogContactList)

                    If Results.HasRows Then
                        While Results.Read()
                            ContactList.Add(New CatalogContactList With {.Id_Contact = Results("Id_Contact"), .Contact_Name = Results("Contact_Name"), .Contact_Email = Results("Contact_Email"), .Contact_Phone = Results("Phones"), .Contact_Type = Results("Contact_Type"), .Contact_CompanyWhosale = Results("WhosaleCompany"), .PostalCode = Results("Postal_code"), .Country = Results("Country"), .State = Results("State"), .City = Results("City"), .Address = Results("Address")})
                        End While
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
                    model.ListContactsin = ContactList

                    Return PartialView("ContactsTable", model)

                Catch ex As Exception

                    Return Content(ex.ToString())

                End Try

                conn.close()

            End If


            If ContactButtons = "Edit_Request_Contact" Then


                conn.Open()

                Try

                    Dim QueryDos As String = " Exec sp_Cat_Contacts_List ' ' , " + Request("ContactRadio") + "  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()


                    If Results.HasRows Then
                        While Results.Read()
                            model.EditContactName = Results("Contact_Name")
                            model.EditContactEmail = Results("Contact_Email")
                            model.EditContactPhoneUno = Results("Phone_Uno")
                            model.EditContactPhoneDos = Results("Phone_Dos")
                            model.EditContactType = Results("Contact_Type")
                            model.EditContactid = Results("Id_Contact")
                            model.EditContactWhosaleCompany = Results("WhosaleCompany")
                            model.PostalCode = Results("Postal_code")
                            model.Country = Results("Country")
                            model.State = Results("State")
                            model.City = Results("City")
                            model.Address = Results("Address")
                        End While
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


                    Return PartialView("ContactsModal", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try
                conn.close()

            End If


            If ContactButtons = "Delete_Contact" Then

                Dim CommandUser

                Dim Query As String = "Update Cat_Contacts set Status_Data=0 where Id_Contact=" + Request("DeleteContactID") + " "

                CommandUser = New SqlCommand(Query, conn)

                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Exec sp_Cat_Contacts_List ' ' , 0 "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim ContactList = New List(Of CatalogContactList)

                    If Results.HasRows Then
                        While Results.Read()
                            ContactList.Add(New CatalogContactList With {.Id_Contact = Results("Id_Contact"), .Contact_Name = Results("Contact_Name"), .Contact_Email = Results("Contact_Email"), .Contact_Phone = Results("Phones"), .Contact_Type = Results("Contact_Type"), .Contact_CompanyWhosale = Results("WhosaleCompany"), .PostalCode = Results("Postal_code"), .Country = Results("Country"), .State = Results("State"), .City = Results("City"), .Address = Results("Address")})
                        End While
                    End If


                    model.ListContactsin = ContactList

                    Return PartialView("ContactsTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()

            End If


            Return View(model)
        End Function


        '
        ' GET: /Catalogs/CatalogPorS
        <Authorize()> _
        Function CatalogPorS() As ActionResult
            UserPermissions("1,2,3,4")
            Return View()
        End Function

        '
        ' GET: /Catalogs/CatalogChannel
        <Authorize()> _
        Function CatalogChannel() As ActionResult
            UserPermissions("1,2,3,4")
            Dim model = New CatalogChannel

            conn.Open()

            Try

                Dim QueryDos As String = "Select *from Cat_Channel where Status_Data=1  order by Id_Channel desc "
                Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                Dim Results = CommandUserDos.ExecuteReader()
                Dim ChannelList = New List(Of CatalogChannelList)

                If Results.HasRows Then
                    While Results.Read()
                        ChannelList.Add(New CatalogChannelList With {.Id_Channel = Results("Id_Channel"), .Channel_Name = Results("Channel_Name")})
                    End While
                End If


                model.ListChannelin = ChannelList

                Return View(model)

            Catch ex As Exception

                Return Content("Error")

            End Try
            'ModelState.AddModelError("", "Se creo el usuario.")
            conn.close()

            Return View(model)

        End Function


        '
        ' POST: /Catalogs/CatalogChannel
        <HttpPost()> _
        Public Function CatalogChannel(ByVal model As CatalogChannel, ByVal ChannelButtons As String) As ActionResult
            UserPermissions("1,2,3,4")

            If ChannelButtons = "Insert_Channel" Then

                Dim CommandUser

                Dim Query As String = "Insert into Cat_Channel(Id_Channel, Channel_Name, Status_Data ) VALUES(@Id_Channel,@Channel_Name ,@Status_Data )"

                CommandUser = New SqlCommand(Query, conn)
                CommandUser.Parameters.AddWithValue("@Id_Channel", ConsecutiveValue("Id_Channel", "Cat_Channel"))
                CommandUser.Parameters.AddWithValue("@Channel_Name", model.ChannelName)
                CommandUser.Parameters.AddWithValue("@Status_Data", 1)



                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_Channel where Status_Data=1  order by Id_Channel desc  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim ChannelList = New List(Of CatalogChannelList)

                    If Results.HasRows Then
                        While Results.Read()
                            ChannelList.Add(New CatalogChannelList With {.Id_Channel = Results("Id_Channel"), .Channel_Name = Results("Channel_Name")})
                        End While
                    End If


                    model.ListChannelin = ChannelList

                    Return PartialView("ChannelTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()


            End If

            If ChannelButtons = "Edit_Channel" Then


                Dim CommandUser

                Dim Query As String = "Update Cat_Channel set Channel_Name=@Channel_Name where Id_Channel=" + Request("EditChannelID") + " "

                CommandUser = New SqlCommand(Query, conn)

                CommandUser.Parameters.AddWithValue("@Channel_Name", Request("EditChannelName"))



                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_Channel where Status_Data=1  order by Id_Channel desc   "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim ChannelList = New List(Of CatalogChannelList)

                    If Results.HasRows Then
                        While Results.Read()
                            ChannelList.Add(New CatalogChannelList With {.Id_Channel = Results("Id_Channel"), .Channel_Name = Results("Channel_Name")})
                        End While
                    End If


                    model.ListChannelin = ChannelList

                    Return PartialView("ChannelTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()

            End If


            If ChannelButtons = "Edit_Request_Channel" Then


                conn.Open()

                Try

                    Dim QueryDos As String = "Select *from Cat_Channel where Status_Data=1 and Id_Channel=" + Request("ChannelRadio") + "  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()


                    If Results.HasRows Then
                        While Results.Read()
                            model.EditChannelName = Results("Channel_Name")
                            model.EditChannelID = Results("Id_Channel")
                        End While
                    End If


                    Return PartialView("ChannelModal", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try
                conn.close()

            End If


            If ChannelButtons = "Delete_Channel" Then

                Dim CommandUser

                Dim Query As String = "Update Cat_Channel set Status_Data=0 where Id_Channel=" + Request("DeleteChannelID") + " "

                CommandUser = New SqlCommand(Query, conn)

                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_Channel where Status_Data=1 order by Id_Channel desc "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim ChannelList = New List(Of CatalogChannelList)

                    If Results.HasRows Then
                        While Results.Read()
                            ChannelList.Add(New CatalogChannelList With {.Id_Channel = Results("Id_Channel"), .Channel_Name = Results("Channel_Name")})
                        End While
                    End If


                    model.ListChannelin = ChannelList

                    Return PartialView("ChannelTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()

            End If




            Return View(model)
        End Function

        '
        ' GET: /Catalogs/CatalogAgencyType
        <Authorize()> _
        Function CatalogAgencyType() As ActionResult
            UserPermissions("1,2,3,4")
            Dim model = New CatalogAgencyType

            conn.Open()

            Try

                Dim QueryDos As String = "Select *from Cat_AgencyType where Status_Data=1  order by Id_Type desc "
                Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                Dim Results = CommandUserDos.ExecuteReader()
                Dim AgencyTypeList = New List(Of CatalogAgencyTypeList)

                If Results.HasRows Then
                    While Results.Read()
                        AgencyTypeList.Add(New CatalogAgencyTypeList With {.Id_AgencyType = Results("Id_Type"), .AgencyType_Name = Results("Type_Name")})
                    End While
                End If


                model.ListAgencyTypein = AgencyTypeList

                Return View(model)

            Catch ex As Exception

                Return Content("Error")

            End Try
            'ModelState.AddModelError("", "Se creo el usuario.")
            conn.close()

            Return View(model)
        End Function


        '
        ' POST: /Catalogs/CatalogAgencyType
        <HttpPost()> _
        Public Function CatalogAgencyType(ByVal model As CatalogAgencyType, ByVal AgencyTypeButtons As String) As ActionResult
            UserPermissions("1,2,3,4")

            If AgencyTypeButtons = "Insert_AgencyType" Then

                Dim CommandUser

                Dim Query As String = "Insert into Cat_AgencyType(Id_Type, Type_Name, Status_Data ) VALUES(@Id_Type,@Type_Name ,@Status_Data )"

                CommandUser = New SqlCommand(Query, conn)
                CommandUser.Parameters.AddWithValue("@Id_Type", ConsecutiveValue("Id_Type", "Cat_AgencyType"))
                CommandUser.Parameters.AddWithValue("@Type_Name", model.AgencyTypeName)
                CommandUser.Parameters.AddWithValue("@Status_Data", 1)



                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_AgencyType where Status_Data=1  order by Id_Type desc  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim AgencyTypeList = New List(Of CatalogAgencyTypeList)

                    If Results.HasRows Then
                        While Results.Read()
                            AgencyTypeList.Add(New CatalogAgencyTypeList With {.Id_AgencyType = Results("Id_Type"), .AgencyType_Name = Results("Type_Name")})
                        End While
                    End If


                    model.ListAgencyTypein = AgencyTypeList

                    Return PartialView("AgencyTypeTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()


            End If

            If AgencyTypeButtons = "Edit_AgencyType" Then


                Dim CommandUser

                Dim Query As String = "Update Cat_AgencyType set Type_Name=@Type_Name where Id_Type=" + Request("EditAgencyTypeID") + " "

                CommandUser = New SqlCommand(Query, conn)

                CommandUser.Parameters.AddWithValue("@Type_Name", Request("EditAgencyTypeName"))



                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_AgencyType where Status_Data=1  order by Id_Type desc   "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim AgencyTypeList = New List(Of CatalogAgencyTypeList)

                    If Results.HasRows Then
                        While Results.Read()
                            AgencyTypeList.Add(New CatalogAgencyTypeList With {.Id_AgencyType = Results("Id_Type"), .AgencyType_Name = Results("Type_Name")})
                        End While
                    End If


                    model.ListAgencyTypein = AgencyTypeList

                    Return PartialView("AgencyTypeTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()

            End If


            If AgencyTypeButtons = "Edit_Request_AgencyType" Then


                conn.Open()

                Try

                    Dim QueryDos As String = "Select *from Cat_AgencyType where Status_Data=1 and Id_Type=" + Request("AgencyTypeRadio") + "  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()


                    If Results.HasRows Then
                        While Results.Read()
                            model.EditAgencyTypeName = Results("Type_Name")
                            model.EditAgencyTypeID = Results("Id_Type")
                        End While
                    End If


                    Return PartialView("AgencyTypeModal", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try
                conn.close()

            End If


            If AgencyTypeButtons = "Delete_AgencyType" Then

                Dim CommandUser

                Dim Query As String = "Update Cat_AgencyType set Status_Data=0 where Id_Type=" + Request("DeleteAgencyTypeID") + " "

                CommandUser = New SqlCommand(Query, conn)

                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_AgencyType where Status_Data=1 order by Id_Type desc "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim AgencyTypeList = New List(Of CatalogAgencyTypeList)

                    If Results.HasRows Then
                        While Results.Read()
                            AgencyTypeList.Add(New CatalogAgencyTypeList With {.Id_AgencyType = Results("Id_Type"), .AgencyType_Name = Results("Type_Name")})
                        End While
                    End If


                    model.ListAgencyTypein = AgencyTypeList

                    Return PartialView("AgencyTypeTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()

            End If




            Return View(model)
        End Function


        '
        ' GET: /Catalogs/CatalogSupplier
        <Authorize()> _
        Function CatalogSupplier() As ActionResult
            UserPermissions("1,2,3,4")
            Dim model = New CatalogSupplier

            conn.Open()

            Try

                Dim QueryDos As String = "Select *from Cat_Suppliers where Status_Data=1 order by Id_Supplier desc  "

                Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                Dim Results = CommandUserDos.ExecuteReader()
                Dim SupplierList = New List(Of CatalogSupplierList)

                If Results.HasRows Then
                    While Results.Read()
                        SupplierList.Add(New CatalogSupplierList With {.Id_Supplier = Results("Id_Supplier"), .Supplier_Name = Results("Supplier_Name"), .Supplier_Email = Results("Supplier_Email"), .Supplier_RFC = Results("Supplier_RFC"), .Supplier_Phone1 = Results("Supplier_Phone1"), .Supplier_Phone2 = Results("Supplier_Phone2")})
                    End While

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
                model.ListSupplierin = SupplierList

                Return View(model)

            Catch ex As Exception

                Return Content("Error")

            End Try
            'ModelState.AddModelError("", "Se creo el usuario.")
            conn.close()

            Return View(model)
        End Function

        '
        ' POST: /Catalogs/CatalogSupplier
        <HttpPost()> _
        Public Function CatalogSupplier(ByVal model As CatalogSupplier, ByVal SupplierButtons As String) As ActionResult
            UserPermissions("1,2,3,4")

            If SupplierButtons = "Insert_Supplier" Then

                Dim CommandUser

                Dim Query As String = "Insert into Cat_Suppliers(Id_Supplier, Supplier_Name, Supplier_RFC , Supplier_Email , Supplier_Phone1 , Supplier_Phone2 , Supplier_Country , Supplier_State , Supplier_City , Supplier_Address , Status_Data ) VALUES(@Id_Supplier , @Supplier_Name, @Supplier_RFC , @Supplier_Email , @Supplier_Phone1 , @Supplier_Phone2 , @Supplier_Country , @Supplier_State , @Supplier_City , @Supplier_Address , @Status_Data )"

                CommandUser = New SqlCommand(Query, conn)
                CommandUser.Parameters.AddWithValue("@Id_Supplier", ConsecutiveValue("Id_Supplier", "Cat_Suppliers"))
                CommandUser.Parameters.AddWithValue("@Supplier_Name", model.SupplierName)
                CommandUser.Parameters.AddWithValue("@Supplier_RFC", model.SupplierRFC)
                CommandUser.Parameters.AddWithValue("@Supplier_Email", model.SupplierEmail)
                CommandUser.Parameters.AddWithValue("@Supplier_Phone1", model.SupplierPhone1)
                CommandUser.Parameters.AddWithValue("@Supplier_Phone2", model.SupplierPhone2)
                CommandUser.Parameters.AddWithValue("@Supplier_Country", Request("suppliercountry"))
                CommandUser.Parameters.AddWithValue("@Supplier_State", Request("supplierstate"))
                CommandUser.Parameters.AddWithValue("@Supplier_City", model.SupplierCity)
                CommandUser.Parameters.AddWithValue("@Supplier_Address", Request("supplieraddress"))
                CommandUser.Parameters.AddWithValue("@Status_Data", 1)



                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_Suppliers where Status_Data=1  order by Id_Supplier desc  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim SupplierList = New List(Of CatalogSupplierList)

                    If Results.HasRows Then
                        While Results.Read()
                            SupplierList.Add(New CatalogSupplierList With {.Id_Supplier = Results("Id_Supplier"), .Supplier_Name = Results("Supplier_Name"), .Supplier_Email = Results("Supplier_Email"), .Supplier_RFC = Results("Supplier_RFC"), .Supplier_Phone1 = Results("Supplier_Phone1"), .Supplier_Phone2 = Results("Supplier_Phone2")})
                        End While
                    End If


                    model.ListSupplierin = SupplierList

                    Return PartialView("SupplierTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()


            End If


            If SupplierButtons = "Edit_Request_Supplier" Then


                conn.Open()

                Try

                    Dim QueryDos As String = "Select *from Cat_Suppliers where Status_Data=1 and Id_Supplier=" + Request("SupplierRadio") + "  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()


                    If Results.HasRows Then
                        While Results.Read()
                            model.EditSupplierID = Results("Id_Supplier")
                            model.EditSupplierName = Results("Supplier_Name")
                            model.EditSupplierRFC = Results("Supplier_RFC")
                            model.EditSupplierEmail = Results("Supplier_Email")
                            model.EditSupplierPhone1 = Results("Supplier_Phone1")
                            model.EditSupplierPhone2 = Results("Supplier_Phone2")
                            model.EditSupplierCountry = Results("Supplier_Country")
                            model.EditSupplierState = Results("Supplier_State")
                            model.EditSupplierCity = Results("Supplier_City")
                            model.EditSupplierAddress = Results("Supplier_Address")

                        End While
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
                    Return PartialView("SupplierModal", model)

                Catch ex As Exception

                    conn.close()
                    Return Content("Error")

                End Try


            End If



            If SupplierButtons = "Edit_Supplier" Then


                Dim CommandUser

                Dim Query As String = "Update Cat_Suppliers set Supplier_Name=@Supplier_Name, Supplier_RFC=@Supplier_RFC , Supplier_Email=@Supplier_Email , Supplier_Phone1=@Supplier_Phone1 , Supplier_Phone2=@Supplier_Phone2 , Supplier_Country=@Supplier_Country , Supplier_State=@Supplier_State , Supplier_City=@Supplier_City , Supplier_Address=@Supplier_Address  where Id_Supplier=" + Request("EditSupplierId") + " "

                CommandUser = New SqlCommand(Query, conn)

                CommandUser.Parameters.AddWithValue("@Supplier_Name", Request("editsuppliername"))
                CommandUser.Parameters.AddWithValue("@Supplier_RFC", Request("editsupplierrfc"))
                CommandUser.Parameters.AddWithValue("@Supplier_Email", Request("editsupplieremail"))
                CommandUser.Parameters.AddWithValue("@Supplier_Phone1", Request("editphone1"))
                CommandUser.Parameters.AddWithValue("@Supplier_Phone2", Request("editphone2"))
                CommandUser.Parameters.AddWithValue("@Supplier_Country", Request("editsuppliercountry"))
                CommandUser.Parameters.AddWithValue("@Supplier_State", Request("editsupplierstate"))
                CommandUser.Parameters.AddWithValue("@Supplier_City", Request("editsuppliercity"))
                CommandUser.Parameters.AddWithValue("@Supplier_Address", Request("editsupplieraddress"))


                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_Suppliers where Status_Data=1  order by Id_Supplier desc  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim SupplierList = New List(Of CatalogSupplierList)

                    If Results.HasRows Then
                        While Results.Read()
                            SupplierList.Add(New CatalogSupplierList With {.Id_Supplier = Results("Id_Supplier"), .Supplier_Name = Results("Supplier_Name"), .Supplier_Email = Results("Supplier_Email"), .Supplier_RFC = Results("Supplier_RFC"), .Supplier_Phone1 = Results("Supplier_Phone1"), .Supplier_Phone2 = Results("Supplier_Phone2")})
                        End While
                    End If


                    model.ListSupplierin = SupplierList

                    Return PartialView("SupplierTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()

            End If



            If SupplierButtons = "Delete_Supplier" Then

                Dim CommandUser

                Dim Query As String = "Update Cat_Suppliers set Status_Data=0 where Id_Supplier=" + Request("DeleteSupplierID") + " "

                CommandUser = New SqlCommand(Query, conn)

                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_Suppliers where Status_Data=1  order by Id_Supplier desc  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim SupplierList = New List(Of CatalogSupplierList)

                    If Results.HasRows Then
                        While Results.Read()
                            SupplierList.Add(New CatalogSupplierList With {.Id_Supplier = Results("Id_Supplier"), .Supplier_Name = Results("Supplier_Name"), .Supplier_Email = Results("Supplier_Email"), .Supplier_RFC = Results("Supplier_RFC"), .Supplier_Phone1 = Results("Supplier_Phone1"), .Supplier_Phone2 = Results("Supplier_Phone2")})
                        End While
                    End If


                    model.ListSupplierin = SupplierList

                    Return PartialView("SupplierTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()

            End If




            Return View(model)
        End Function


        '
        ' GET: /Catalogs/CatalogDistribution
        <Authorize()> _
        Function CatalogDistribution() As ActionResult
            UserPermissions("1,2,3,4")
            Dim model = New CatalogDistributionGroup
            Dim ListEmails = New List(Of SelectListItem)

            conn.Open()

            Try

                Dim QueryDos As String = "Select *from Cat_DistributionGroups where Status_Data=1 order by Id_DistributionGroup desc  "
                Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                Dim Results = CommandUserDos.ExecuteReader()
                Dim DistributionGroupList = New List(Of CatalogDistributionGroupList)

                If Results.HasRows Then
                    While Results.Read()
                        DistributionGroupList.Add(New CatalogDistributionGroupList With {.Id_DistributionGroup = Results("Id_DistributionGroup"), .DistributionGroup_Name = Results("DistriGroup_Name"), .DistributionGroup_Property = Results("Cve_Hotel")})
                    End While
                End If

                model.ListaEmailGroupsin = ListEmails
                model.ListDistributionGroupsin = DistributionGroupList

                Return View(model)

            Catch ex As Exception

                Return Content("Error")

            End Try
            'ModelState.AddModelError("", "Se creo el usuario.")
            conn.close()

            Return View(model)



        End Function


        '
        ' POST: /Catalogs/CatalogDistribution
        <HttpPost()> _
        Public Function CatalogDistribution(ByVal model As CatalogDistributionGroup, ByVal DistributionGroupsButtons As String) As ActionResult
            UserPermissions("1,2,3,4")

            If DistributionGroupsButtons = "Insert_DistributionGroup" Then

                Dim CommandUser
                Dim IdDistributionGroup
                Dim i As Integer = 0

                Dim Query As String = "Insert into Cat_DistributionGroups(Id_DistributionGroup, DistriGroup_Name, Cve_Hotel, Status_Data ) VALUES(@Id_DistributionGroup, @DistriGroup_Name, @Cve_Hotel , @Status_Data )"

                IdDistributionGroup = ConsecutiveValue("Id_DistributionGroup", "Cat_DistributionGroups")

                CommandUser = New SqlCommand(Query, conn)
                CommandUser.Parameters.AddWithValue("@Id_DistributionGroup", IdDistributionGroup)
                CommandUser.Parameters.AddWithValue("@DistriGroup_Name", model.DistributionGroupName)
                CommandUser.Parameters.AddWithValue("@Cve_Hotel", Request("HotelSelect"))
                CommandUser.Parameters.AddWithValue("@Status_Data", 1)


                Dim CommandUserEmailList

                Dim QueryEmailList As String = " INSERT INTO  Cat_DistributionGroupEmails (Id_DistributionGroup , Email , Status_Data )  VALUES "

                Dim EmailList() As String = Split(Request("emailist"), ",")


                For i = 0 To EmailList.Count - 1

                    If i = EmailList.Count - 1 Then
                        QueryEmailList += " ( " + IdDistributionGroup.ToString + " , '" + EmailList(i) + "' , 1 )  "
                    Else
                        QueryEmailList += " ( " + IdDistributionGroup.ToString + " , '" + EmailList(i) + "' , 1 ) , "
                    End If

                Next

                CommandUserEmailList = New SqlCommand(QueryEmailList, conn)

                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    CommandUserEmailList.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_DistributionGroups where Status_Data=1 order by Id_DistributionGroup desc  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim DistributionGroupList = New List(Of CatalogDistributionGroupList)

                    If Results.HasRows Then
                        While Results.Read()
                            DistributionGroupList.Add(New CatalogDistributionGroupList With {.Id_DistributionGroup = Results("Id_DistributionGroup"), .DistributionGroup_Name = Results("DistriGroup_Name"), .DistributionGroup_Property = Results("Cve_Hotel")})
                        End While
                    End If


                    model.ListDistributionGroupsin = DistributionGroupList

                    Return PartialView("DistributionTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()


            End If


            If DistributionGroupsButtons = "Edit_Distribution" Then


                Dim CommandUser

                Dim Query As String = "Update Cat_DistributionGroups set DistriGroup_Name=@DistriGroup_Name, Cve_Hotel=@Cve_Hotel where Id_DistributionGroup=" + Request("EditDistributionId") + " "

                CommandUser = New SqlCommand(Query, conn)

                CommandUser.Parameters.AddWithValue("@DistriGroup_Name", Request("EditDistributionName"))
                CommandUser.Parameters.AddWithValue("@Cve_Hotel", Request("EditHotelSelect"))


                Dim CommandUserEmailListUpdate

                Dim QueryEmailListUpdate As String = "Update Cat_DistributionGroupEmails set Status_Data=0  where Id_DistributionGroup=" + Request("EditDistributionId") + " "

                CommandUserEmailListUpdate = New SqlCommand(QueryEmailListUpdate, conn)


                Dim CommandUserEmailList
                Dim i As Integer = 0
                Dim QueryEmailList As String = " INSERT INTO  Cat_DistributionGroupEmails (Id_DistributionGroup , Email , Status_Data )  VALUES "

                Dim EmailList() As String = Split(Request("editemailist"), ",")


                For i = 0 To EmailList.Count - 1

                    If i = EmailList.Count - 1 Then
                        QueryEmailList += " ( " + Request("EditDistributionId") + " , '" + EmailList(i) + "' , 1 )  "
                    Else
                        QueryEmailList += " ( " + Request("EditDistributionId") + " , '" + EmailList(i) + "' , 1 ) , "
                    End If

                Next

                CommandUserEmailList = New SqlCommand(QueryEmailList, conn)



                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    CommandUserEmailListUpdate.ExecuteNonQuery()

                    CommandUserEmailList.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_DistributionGroups where Status_Data=1 order by Id_DistributionGroup desc  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim DistributionGroupList = New List(Of CatalogDistributionGroupList)

                    If Results.HasRows Then
                        While Results.Read()
                            DistributionGroupList.Add(New CatalogDistributionGroupList With {.Id_DistributionGroup = Results("Id_DistributionGroup"), .DistributionGroup_Name = Results("DistriGroup_Name"), .DistributionGroup_Property = Results("Cve_Hotel")})
                        End While
                    End If


                    model.ListDistributionGroupsin = DistributionGroupList

                    Return PartialView("DistributionTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()

            End If


            If DistributionGroupsButtons = "Edit_Request_Distribution" Then


                conn.Open()

                Try

                    Dim QueryDos As String = "Select *from Cat_DistributionGroups where Status_Data=1 and Id_DistributionGroup=" + Request("DistributionGroupRadio") + "  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()


                    If Results.HasRows Then
                        While Results.Read()
                            model.EditDistributionGroupID = Results("Id_DistributionGroup")
                            model.EditDistributionGroupName = Results("DistriGroup_Name")
                            model.EditDistributionProperty = Results("Cve_Hotel")
                        End While
                    End If
                    Results.Close()

                    Dim QueryTres As String = "Select *from Cat_DistributionGroupEmails where Status_Data=1 and Id_DistributionGroup=" + Request("DistributionGroupRadio") + "  "
                    Dim CommandUserTres = New SqlCommand(QueryTres, conn)
                    Dim ResultsDos = CommandUserTres.ExecuteReader()
                    Dim ListEmails = New List(Of SelectListItem)

                    If ResultsDos.HasRows Then
                        While ResultsDos.Read()

                            ListEmails.Add(New SelectListItem With {.Text = ResultsDos("Email"), .Value = ResultsDos("Id_GroupEmail")})
                        End While
                    End If
                    ResultsDos.Close()

                    model.ListaEmailGroupsin = ListEmails

                    Return PartialView("DistributionModal", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try
                conn.close()

            End If


            If DistributionGroupsButtons = "Delete_Distribution" Then

                Dim CommandUser

                Dim Query As String = "Update Cat_DistributionGroups set Status_Data=0 where Id_DistributionGroup=" + Request("DeleteDistributionID") + " "

                CommandUser = New SqlCommand(Query, conn)

                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_DistributionGroups where Status_Data=1 order by Id_DistributionGroup desc  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim DistributionGroupList = New List(Of CatalogDistributionGroupList)

                    If Results.HasRows Then
                        While Results.Read()
                            DistributionGroupList.Add(New CatalogDistributionGroupList With {.Id_DistributionGroup = Results("Id_DistributionGroup"), .DistributionGroup_Name = Results("DistriGroup_Name"), .DistributionGroup_Property = Results("Cve_Hotel")})
                        End While
                    End If


                    model.ListDistributionGroupsin = DistributionGroupList

                    Return PartialView("DistributionTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()

            End If



            Return View(model)
        End Function


        '
        ' GET: /Catalogs/CatalogUnitMeasure
        <Authorize()> _
        Function CatalogUnitMeasure() As ActionResult
            UserPermissions("1,2,3,4")
            Dim model = New CatalogDetail

            conn.Open()

            Try

                Dim QueryDos As String = "Select *from Cat_UnitsMeasure where Status_Data=1 order by Id_Unit desc  "
                Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                Dim Results = CommandUserDos.ExecuteReader()
                Dim UnitsMeasureList = New List(Of CatalogUnitMeasureList)

                If Results.HasRows Then
                    While Results.Read()
                        UnitsMeasureList.Add(New CatalogUnitMeasureList With {.Id_Unit = Results("Id_Unit"), .Unit_Name = Results("Unit_Name"), .Unit_Key = Results("Unit_Key")})
                    End While
                End If


                model.ListUnitMeasurein = UnitsMeasureList

                Return View(model)

            Catch ex As Exception

                Return Content("Error")

            End Try
            'ModelState.AddModelError("", "Se creo el usuario.")
            conn.close()

            Return View(model)
        End Function


        '
        ' POST: /Catalogs/CatalogUnitMeasure
        <HttpPost()> _
        Public Function CatalogUnitMeasure(ByVal model As CatalogDetail, ByVal UnitMeasureButtons As String) As ActionResult
            UserPermissions("1,2,3,4")

            If UnitMeasureButtons = "Insert_Measure" Then

                Dim CommandUser

                Dim Query As String = "Insert into Cat_UnitsMeasure(Id_Unit, Unit_Name, Unit_Key, Status_Data ) VALUES(@Id_Unit,@Unit_Name,@Unit_Key ,@Status_Data )"

                CommandUser = New SqlCommand(Query, conn)
                CommandUser.Parameters.AddWithValue("@Id_Unit", ConsecutiveValue("Id_Unit", "Cat_UnitsMeasure"))
                CommandUser.Parameters.AddWithValue("@Unit_Name", model.UnitMeasure)
                CommandUser.Parameters.AddWithValue("@Unit_Key", model.UnitKey)
                CommandUser.Parameters.AddWithValue("@Status_Data", 1)



                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_UnitsMeasure where Status_Data=1 order by Id_Unit desc  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim UnitsMeasureList = New List(Of CatalogUnitMeasureList)

                    If Results.HasRows Then
                        While Results.Read()
                            UnitsMeasureList.Add(New CatalogUnitMeasureList With {.Id_Unit = Results("Id_Unit"), .Unit_Name = Results("Unit_Name"), .Unit_Key = Results("Unit_Key")})
                        End While
                    End If


                    model.ListUnitMeasurein = UnitsMeasureList

                    Return PartialView("UnitMeasureTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()


            End If


            If UnitMeasureButtons = "Edit_Measure" Then


                Dim CommandUser

                Dim Query As String = "Update Cat_UnitsMeasure set Unit_Name=@Unit_Name, Unit_Key=@Unit_Key where Id_Unit=" + Request("EditUnitId") + " "

                CommandUser = New SqlCommand(Query, conn)

                CommandUser.Parameters.AddWithValue("@Unit_Name", Request("EditUnitMeasure"))
                CommandUser.Parameters.AddWithValue("@Unit_Key", Request("EditUnitKey"))

                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_UnitsMeasure where Status_Data=1 order by Id_Unit desc  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim UnitsMeasureList = New List(Of CatalogUnitMeasureList)

                    If Results.HasRows Then
                        While Results.Read()
                            UnitsMeasureList.Add(New CatalogUnitMeasureList With {.Id_Unit = Results("Id_Unit"), .Unit_Name = Results("Unit_Name"), .Unit_Key = Results("Unit_Key")})
                        End While
                    End If


                    model.ListUnitMeasurein = UnitsMeasureList

                    Return PartialView("UnitMeasureTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()

            End If


            If UnitMeasureButtons = "Edit_Request_Measure" Then


                conn.Open()

                Try

                    Dim QueryDos As String = "Select *from Cat_UnitsMeasure where Status_Data=1 and Id_Unit=" + Request("UnitMeasureRadio") + "  "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()


                    If Results.HasRows Then
                        While Results.Read()
                            model.EditUnitKey = Results("Unit_Key")
                            model.EditUnitMeasure = Results("Unit_Name")
                            model.EditUnitID = Results("Id_Unit")
                        End While
                    End If


                    Return PartialView("UnitMeasureModal", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try
                conn.close()

            End If

            If UnitMeasureButtons = "Delete_Measure" Then

                Dim CommandUser

                Dim Query As String = "Update Cat_UnitsMeasure set Status_Data=0 where Id_Unit=" + Request("DeleteMeasureID") + " "

                CommandUser = New SqlCommand(Query, conn)

                conn.Open()

                Try
                    CommandUser.ExecuteNonQuery()

                    Dim QueryDos As String = "Select *from Cat_UnitsMeasure where Status_Data=1 order by Id_Unit desc "
                    Dim CommandUserDos = New SqlCommand(QueryDos, conn)
                    Dim Results = CommandUserDos.ExecuteReader()
                    Dim UnitsMeasureList = New List(Of CatalogUnitMeasureList)

                    If Results.HasRows Then
                        While Results.Read()
                            UnitsMeasureList.Add(New CatalogUnitMeasureList With {.Id_Unit = Results("Id_Unit"), .Unit_Name = Results("Unit_Name"), .Unit_Key = Results("Unit_Key")})
                        End While
                    End If


                    model.ListUnitMeasurein = UnitsMeasureList

                    Return PartialView("UnitMeasureTable", model)

                Catch ex As Exception

                    Return Content("Error")

                End Try

                conn.close()

            End If

            Return View(model)
        End Function



        Public Function ConsecutiveValue(ByVal Table As String, ByVal CveTable As String)

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

    End Class
End Namespace