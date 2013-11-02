
Partial Class Admin_Staff_Payroll
    Inherits System.Web.UI.Page

    Protected Sub btb_Staff_Click(sender As Object, e As EventArgs) Handles btb_Staff.Click
        Staff_Multiview.SetActiveView(Staff_View)
    End Sub

    Protected Sub btn_Payroll_Click(sender As Object, e As EventArgs) Handles btn_Payroll.Click
        Staff_Multiview.SetActiveView(Payroll_View)
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lbl_Grt_Admin_Staff.Text = "Welcome Adminstrator!"
    End Sub
End Class
