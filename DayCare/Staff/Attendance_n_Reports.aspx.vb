Imports System.Data.SqlClient

Partial Class Staff_Attendance_n_Reports
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lbl_Grt_Staff.Text = "Welcome Staff!"

        

    End Sub

    Protected Sub btn_Child_Info_Click(sender As Object, e As EventArgs) Handles btn_Child_Info.Click
        Attendance_Reports_MultiView.SetActiveView(Child_Information_View)
        btn_Child_Info.Focus()

    End Sub

    Protected Sub btn_Child_Attendance_Click(sender As Object, e As EventArgs) Handles btn_Child_Attendance.Click
        Attendance_Reports_MultiView.SetActiveView(Child_Attendance_View)
        btn_Child_Attendance.Focus()

    End Sub

    Protected Sub btn_Meal_Report_Click(sender As Object, e As EventArgs) Handles btn_Meal_Report.Click
        Attendance_Reports_MultiView.SetActiveView(Meal_Report_View)
        btn_Meal_Report.Focus()

    End Sub

    Protected Sub btn_Accident_Type_Click(sender As Object, e As EventArgs) Handles btn_Accident_Type.Click
        Attendance_Reports_MultiView.SetActiveView(Accident_Type_View)
        btn_Accident_Type.Focus()

    End Sub

    Protected Sub btn_Accident_Report_Click(sender As Object, e As EventArgs) Handles btn_Accident_Report.Click
        Attendance_Reports_MultiView.SetActiveView(Accident_Report_View)
        btn_Accident_Report.Focus()
    End Sub

    Protected Sub Insert_btn_Click(sender As Object, e As EventArgs) Handles Insert_btn.Click

        Dim ChildID As Integer = Child_ID_tb.Text
        Dim CheckIN As String = Checkin_Time_tb.Text
        Dim CheckOut As String = Checkout_Time_tb.Text
        Dim todaysDate As Date = Date_tb.Text

        Dim connectionstring As String = ConfigurationManager.ConnectionStrings("fk185_DaycareConnectionString").ConnectionString
        Dim updatesql As String = "INSERT INTO [CHILD_ATTENDANCE] ([Child_ID], [Check_In], [Check_Out], [Date]) VALUES (@ChildID, @CheckIN, @CheckOut, @todaysDate)"

        Using myConnection As New SqlConnection(connectionstring)
            myConnection.Open()
            Dim mycommand As New SqlCommand(updatesql, myConnection)
            mycommand.Parameters.Add(New SqlParameter("@ChildID", ChildID))
            mycommand.Parameters.Add(New SqlParameter("@CheckIN", CheckIN))
            mycommand.Parameters.Add(New SqlParameter("@CheckOut", CheckOut))
            mycommand.Parameters.Add(New SqlParameter("@todaysDate", todaysDate))

            mycommand.ExecuteNonQuery()
            myConnection.Close()
        End Using

        Response.Write("<script>alert('Check-in time has been added to the database.');</script>")

        Response.AddHeader("REFRESH", ".1;URL=Attendance_n_Reports.aspx")


    End Sub

    Protected Sub Calendar_img_btn_Click(sender As Object, e As ImageClickEventArgs) Handles Calendar_img_btn.Click
        Calendar1.Visible = True
        Insert_btn.Focus()
    End Sub

    Protected Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged

        Date_tb.Text = Calendar1.SelectedDate.ToShortDateString()

        Calendar1.Visible = False
        Checkin_Time_tb.Focus()

    End Sub

    Protected Sub Cancel_btn_Click(sender As Object, e As EventArgs) Handles Cancel_btn.Click
        Calendar1.Visible = False
        Date_tb.Text = ""
        Child_ID_tb.Text = ""
        Checkin_Time_tb.Text = ""
        
    End Sub

    Protected Sub Child_Attendance_View_Activate(sender As Object, e As EventArgs) Handles Child_Attendance_View.Activate

    End Sub

    Protected Sub Child_Attendance_View_Load(sender As Object, e As EventArgs) Handles Child_Attendance_View.Load
        Child_ID_tb.Focus()
    End Sub



    Protected Sub Calendar1_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles Calendar1.DayRender
        Dim thiscal As Calendar = CType(sender, Calendar)
        Dim datelink As LiteralControl
        If e.Day.Date < DateTime.Today.Date Then
            e.Cell.Enabled = False
            e.Cell.ToolTip = "This date is not available"

            datelink = CType(e.Cell.Controls(0), LiteralControl)
            datelink.Visible = False


        End If
    End Sub

    Protected Sub GridView5_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles GridView5.RowDeleted
        Response.Write("<script>alert('The record has been deleted.');</script>")
    End Sub

    Protected Sub GridView5_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles GridView5.RowUpdated
        Response.Write("<script>alert('Check-out time has been added to the database.');</script>")
    End Sub

    Protected Sub GridView5_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GridView5.RowUpdating
        
    End Sub
End Class
