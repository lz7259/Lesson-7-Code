#tag Class
Protected Class App
Inherits WebApplication
	#tag Event
		Function HandleURL(Request As WebRequest, Response As WebResponse) As Boolean
		  Dim headerUser As String = Request.Header("User")
		  Dim requestContent As String = Request.Body
		  If requestContent <> "" Then
		    Try
		      If headerUser <> "" Then
		        If headerUser = "MyAccount" Then
		          Dim int As Integer = Integer.FromString(requestContent)
		          int = int * 5
		          Response.Write(int.ToString)
		          Response.Status = 200
		          Return True
		        Else
		          Response.Write("Access forbidden.")
		          Response.Status = 403
		          Return True
		        End If
		      Else
		        Response.Write("You are not authenticated.")
		        Response.Status = 401
		        Return True
		      End If
		    Catch e As RuntimeException
		      Response.Write("Request content is not a valid integer.")
		      Response.Status = 500
		      Return True
		    End Try
		  End If
		End Function
	#tag EndEvent


End Class
#tag EndClass
