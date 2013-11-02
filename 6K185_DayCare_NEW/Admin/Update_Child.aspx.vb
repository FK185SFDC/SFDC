
Partial Class Admin_Update_Child
    Inherits System.Web.UI.Page

    Protected Sub btn_Mother_Click(sender As Object, e As EventArgs) Handles btn_Mother.Click
        MultiView1.SetActiveView(Mother_View)
    End Sub

    Protected Sub btn_Father_Click(sender As Object, e As EventArgs) Handles btn_Father.Click
        MultiView1.SetActiveView(Father_View)
    End Sub

    Protected Sub btn_Emergency_Click(sender As Object, e As EventArgs) Handles btn_Emergency.Click
        MultiView1.SetActiveView(Emergency_Contact_View)
    End Sub

    Protected Sub btn_Medical_Click(sender As Object, e As EventArgs) Handles btn_Medical.Click
        MultiView1.SetActiveView(Medical_Contact_View)
    End Sub

    Protected Sub btn_Gaurdian_Click(sender As Object, e As EventArgs) Handles btn_Gaurdian.Click
        MultiView1.SetActiveView(Gaurdian_View)
    End Sub

    Protected Sub btn_Class_Click(sender As Object, e As EventArgs) Handles btn_Class.Click
        MultiView1.SetActiveView(Class_View)
    End Sub

    Protected Sub btn_Child_Click(sender As Object, e As EventArgs) Handles btn_Child.Click
        MultiView1.SetActiveView(Child_View)
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        lbl_Grt_Admin.Text = "Welcome Adminstrator!"
    End Sub
End Class
