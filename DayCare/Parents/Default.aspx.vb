
Partial Class Parents_Default
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Message.Text = "Authenticated: " & User.Identity.IsAuthenticated & "<br/>"
        Message.Text &= "User Name: " & User.Identity.Name
    End Sub
End Class
