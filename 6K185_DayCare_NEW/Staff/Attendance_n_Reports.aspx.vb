
Partial Class Staff_Attendance_n_Reports
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lbl_Grt_Staff.Text = "Welcome Staff!"

    End Sub

    Protected Sub btn_Child_Info_Click(sender As Object, e As EventArgs) Handles btn_Child_Info.Click
        Attendance_Reports_MultiView.SetActiveView(Child_Information_View)
    End Sub

    Protected Sub btn_Child_Attendance_Click(sender As Object, e As EventArgs) Handles btn_Child_Attendance.Click
        Attendance_Reports_MultiView.SetActiveView(Child_Attendance_View)
    End Sub

    Protected Sub btn_Meal_Report_Click(sender As Object, e As EventArgs) Handles btn_Meal_Report.Click
        Attendance_Reports_MultiView.SetActiveView(Meal_Report_View)
    End Sub

    Protected Sub btn_Accident_Type_Click(sender As Object, e As EventArgs) Handles btn_Accident_Type.Click
        Attendance_Reports_MultiView.SetActiveView(Accident_Type_View)
    End Sub

    Protected Sub btn_Accident_Report_Click(sender As Object, e As EventArgs) Handles btn_Accident_Report.Click
        Attendance_Reports_MultiView.SetActiveView(Accident_Report_View)
    End Sub
End Class
