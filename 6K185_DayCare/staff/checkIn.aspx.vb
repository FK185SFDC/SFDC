Imports System.Data.SqlClient
Partial Class child_checkIn
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        returnTextBox.Focus()

    End Sub

    Protected Sub cInButton_Click(sender As Object, e As System.EventArgs) Handles cInButton.Click
        Dim strChildID As String = returnTextBox.Text

        Dim sqlconn As New SqlConnection(ConfigurationManager.ConnectionStrings("fk185_ClassConnectionString").ConnectionString)

        Dim sqlAdp As New SqlDataAdapter
        Dim sqlCmd As New SqlCommand

        sqlCmd.Connection = sqlconn
        sqlCmd.CommandText = "child_checkIn"
        sqlCmd.CommandType = Data.CommandType.StoredProcedure

        sqlCmd.Parameters.Add(New SqlParameter("@Child_ID", strChild_ID))

        sqlconn.Open()
        sqlCmd.ExecuteNonQuery()
        sqlconn.Close()

        Response.Redirect("ViewAllKids.aspx")
    End Sub

    Private Function strChild_ID() As Object
        Throw New NotImplementedException
    End Function

End Class
