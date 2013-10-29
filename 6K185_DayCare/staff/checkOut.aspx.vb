Imports System.Data.SqlClient

Partial Class lib_checkOut
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        ChildID_tb.Focus()

    End Sub

    Protected Sub CheckOutButton_Click(sender As Object, e As System.EventArgs) Handles CheckOutButton.Click

        Dim strChild_ID As String = ChildID_tb.Text
        Dim strUserName As String = UserName_tb.Text
        Dim rentDate As DateTime = DateTime.Now
        Dim dateDueBack As DateTime = DateAdd("d", 30, Today)

        Dim sqlconn As New SqlConnection(ConfigurationManager.ConnectionStrings("fk185_ClassConnectionString").ConnectionString)

        Dim sqlAdp As New SqlDataAdapter
        Dim sqlCmd As New SqlCommand

        sqlCmd.Connection = sqlconn
        sqlCmd.CommandText = "sp_aspnet_Users"
        sqlCmd.CommandType = Data.CommandType.StoredProcedure
        sqlCmd.CommandText = "sp_rentals"
        sqlCmd.CommandType = Data.CommandType.StoredProcedure



        sqlCmd.Parameters.Add(New SqlParameter("@UserName", strUserName))
        sqlCmd.Parameters.Add(New SqlParameter("@ChildId", strChild_ID))


        sqlconn.Open()
        sqlCmd.ExecuteNonQuery()
        sqlconn.Close()

        Response.Redirect("ViewAllKids.aspx")

    End Sub
End Class
