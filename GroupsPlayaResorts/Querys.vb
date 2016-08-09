Namespace Querys
    ' Version 1.0.1 Querys 

    Public Class Qrys
        Public Function GetQuery(ByVal qryId As String, ByVal file As String) As String
            Dim url = IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly.GetName.CodeBase.ToString.ToLower).Replace("file:\c:\", "c:\").Replace("\bin", "\Content\xml\")
            Dim element = XElement.Load(url & file)
            Dim qry As IEnumerable(Of XElement) = From query In element.<query> Where query.@id = qryId Select query

            Return qry(0).Element("queryString")
        End Function

        Public Function GetParams(ByVal qryId As String, ByVal file As String) As System.Collections.Specialized.HybridDictionary
            Dim url = IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly.GetName.CodeBase.ToString.ToLower).Replace("file:\c:\", "c:\").Replace("\bin", "\Content\xml\")
            Dim element = XElement.Load(url & file)
            Dim qry As IEnumerable(Of XElement) = From query In element.<query> Where query.@id = qryId Select query
            Dim listParams As New System.Collections.Specialized.HybridDictionary
            Dim key As String

            For Each xEle As XElement In qry.Descendants("parameter")
                If xEle.Attribute("dbname") Is Nothing Then
                    key = CStr(xEle)
                Else
                    key = xEle.Attribute("dbname").Value
                End If

                Try
                    If Not xEle.Attribute("codification") Is Nothing Then
                        listParams(key) = CStr(xEle) & "\c\" & xEle.Attribute("codification").Value
                    ElseIf Not xEle.Attribute("dbParam") Is Nothing Then
                        listParams(key) = CStr(xEle) & "\dbParam\" & xEle.Attribute("dbParam").Value
                    Else
                        listParams(key) = CStr(xEle)
                    End If

                Catch ex As Exception
                    listParams(key) = CStr(xEle)
                End Try
            Next xEle

            Return listParams
        End Function

        Public Overloads Function GetQueryString(ByVal qryId As String, ByVal file As String, ByVal requestObject As Object) As String
            Dim listParameters = GetParams(qryId, file)
            Dim count As Integer = 0
            Dim params As String = ""
            Dim stringQuery As String = ""
            Dim item As System.Collections.DictionaryEntry

            For Each item In listParameters
                Dim arrayString As String() = item.Value.Split(New Char() {"\"c})
                Dim itemString As String
                Dim valueItemString As String

                If arrayString.Length > 1 Then
                    itemString = item.Key

                    Select Case item.Value().ToString().Split("\")(1)
                        Case "c"
                            Dim paramBase64 As Byte() = Convert.FromBase64String(requestObject(item.Key))
                            valueItemString = System.Text.Encoding.UTF8.GetString(paramBase64)
                        Case Else
                            valueItemString = requestObject(item.Key)
                    End Select

                Else
                    itemString = item.Key
                    valueItemString = requestObject(item.Value)
                End If

                If valueItemString <> "" Then
                    If count = 0 Then
                        params = params & " @" & itemString & " = " & "'" & valueItemString & "'"
                    Else
                        params = params & ", @" & itemString & " = " & "'" & valueItemString & "'"
                    End If

                    count = count + 1
                End If
            Next

            stringQuery = GetQuery(qryId, file) & params

            Return stringQuery
        End Function

        Public Overloads Function GetQueryString(ByVal qryId As String, ByVal file As String, ByVal requestObject As Object, ByRef SqlParameters() As Object) As String
            Dim listParameters = GetParams(qryId, file)
            Dim count As Integer = 0
            Dim params As String = ""
            Dim stringQuery As String = ""
            Dim item As System.Collections.DictionaryEntry
            Dim Type As Integer
            Dim Direction As Integer
            Dim rqObj As Object
            'For Each item In listParameters


            'Parque para convertir un request a dictionary
            Select Case requestObject.GetType().Name
                Case "HttpRequestWrapper"
                    Dim rqo As System.Web.HttpRequestWrapper
                    Dim _requestObject As New Dictionary(Of String, String)

                    rqo = requestObject
                    For Each keyRq In listParameters
                        If Not rqo Is Nothing Then
                            _requestObject.Add(keyRq.key, rqo(keyRq.value))
                        End If
                    Next
                    requestObject = _requestObject
            End Select
            'Fin de parche

            ' -- INICIO -- Asigna parametros segun valores del dictionary
            For Each rqObj In requestObject
                ' lECTURA DE LLAVES
                For Each item In listParameters
                    If item.Key = rqObj.ToString().Split("[")(1).Split(",")(0) Then Exit For
                Next
                Dim arrayString As String() = item.Value.Split(New Char() {"\"c})
                Dim itemString As String
                Dim valueItemString As String

                ' Default DataType
                Type = 16 ' String
                ' Default Direction
                Direction = 1 ' Input

                ' Paresea el valor del request a la codificación especifica, o sacar el nombre del campo en la base de datos
                If arrayString.Length > 1 Then
                    itemString = item.Key

                    Select Case item.Value().ToString().Split("\")(1)
                        Case "c"
                            Dim paramBase64 As Byte() = Convert.FromBase64String(requestObject(item.Key))
                            valueItemString = System.Text.Encoding.UTF8.GetString(paramBase64)
                        Case "dbParam"
                            Type = item.Value().ToString().Split("\")(2).Split(",")(0)
                            Direction = item.Value().ToString().Split("\")(2).Split(",")(1)

                            valueItemString = requestObject(item.Key)
                    End Select

                Else
                    itemString = item.Key
                    valueItemString = requestObject(item.Key)
                End If

                Dim param As System.Data.SqlClient.SqlParameter

                If valueItemString <> "" Or Direction <> 1 Then
                    ReDim Preserve SqlParameters(LenghtNullToZero(SqlParameters))
                    SqlParameters(SqlParameters.Length - 1) = New System.Data.SqlClient.SqlParameter
                    With SqlParameters(SqlParameters.Length - 1)
                        .DbType = Type
                        .Direction = Direction
                        .ParameterName = "@" & item.Key
                        .Value = valueItemString
                    End With

                End If
            Next
            ' -- FINAL -- Asigna parametros segun valores del dictionary

            stringQuery = GetQuery(qryId, file)

            Return stringQuery
        End Function


        Public Function LenghtNullToZero(ByVal Obj As Array) As Integer
            If IsNothing(Obj) Then
                Return 0
            Else
                Return Obj.Length
            End If
        End Function

    End Class

End Namespace
