
Partial Class Msge_confirm
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Response.AddHeader("refresh", "2;url=Default.aspx")
    End Sub
End Class
