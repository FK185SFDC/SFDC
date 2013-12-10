
Partial Class Admin_Calendar
    Inherits System.Web.UI.Page
    Protected Sub createButton_Click(sender As Object, e As EventArgs) Handles createButton.Click
        Response.Redirect("createEvent.aspx")
    End Sub
    Protected Sub deleteButton_Click(sender As Object, e As EventArgs) Handles deleteButton.Click
        Response.Redirect("deleteEvent.aspx")
    End Sub
End Class
