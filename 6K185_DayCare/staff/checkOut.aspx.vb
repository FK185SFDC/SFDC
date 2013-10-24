Imports System.Data.SqlClient

Partial Class lib_checkOut
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        mID_tb.Focus()

    End Sub

    Protected Sub rentButton_Click(sender As Object, e As System.EventArgs) Handles rentButton.Click

        Dim strMID As String = mID_tb.Text
        Dim strUserName As String = UserName_tb.Text
        Dim rentDate As DateTime = DateTime.Now
        Dim dateDueBack As DateTime = DateAdd("d", 30, Today)

        Dim sqlconn As New SqlConnection(ConfigurationManager.ConnectionStrings("cs_SLPL").ConnectionString)

        Dim sqlAdp As New SqlDataAdapter
        Dim sqlCmd As New SqlCommand

        sqlCmd.Connection = sqlconn
        sqlCmd.CommandText = "sp_aspnet_Users"
        sqlCmd.CommandType = Data.CommandType.StoredProcedure
        sqlCmd.CommandText = "sp_rentals"
        sqlCmd.CommandType = Data.CommandType.StoredProcedure



        sqlCmd.Parameters.Add(New SqlParameter("@UserName", strUserName))
        sqlCmd.Parameters.Add(New SqlParameter("@mId", strMID))
        sqlCmd.Parameters.Add(New SqlParameter("@RentDate", rentDate))
        sqlCmd.Parameters.Add(New SqlParameter("@DateDueBack", dateDueBack))

        sqlconn.Open()
        sqlCmd.ExecuteNonQuery()
        sqlconn.Close()

        Response.Redirect("ViewAllRentals.aspx")

    End Sub
End Class
