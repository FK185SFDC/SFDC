
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

    Protected Sub Mother_DV_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles Mother_DV.ItemUpdated
        'Test for an error during processing
        If e.Exception IsNot Nothing Then
            'Test for an exception during row update
            lblError.Text = "* ERROR: You must fill in all fields! "
            'This suppresses the exception and keeps the
            'row in EditMode
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        Else

            lblError.Text = "Update succeeded. All database entries have been recorded. Thank you."

        End If
    End Sub

    Protected Sub Mother_GV_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles Mother_GV.RowUpdated
        'Test for an error during processing
        If e.Exception IsNot Nothing Then
            'Test for an exception during row update
            lblError2.Text = "* ERROR: You must fill in all fields! "
            'This suppresses the exception and keeps the
            'row in EditMode
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        Else

            lblError2.Text = "Update succeeded. All database entries have been recorded. Thank you."

        End If
    End Sub

    Protected Sub Gridview1_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles GridView1.RowUpdated
        'Test for an error during processing
        If e.Exception IsNot Nothing Then
            'Test for an exception during row update
            lblError3.Text = "* ERROR: You must fill in all fields! "
            'This suppresses the exception and keeps the
            'row in EditMode
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        Else

            lblError3.Text = "Update succeeded. All database entries have been recorded. Thank you."

        End If
    End Sub

    Protected Sub DetailsView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView1.ItemUpdated
        'Test for an error during processing
        If e.Exception IsNot Nothing Then
            'Test for an exception during row update
            lblError14.Text = "* ERROR: You must fill in all fields! "
            'This suppresses the exception and keeps the
            'row in EditMode
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        Else

            lblError14.Text = "Update succeeded. All database entries have been recorded. Thank you."

        End If
    End Sub

    Protected Sub Gridview2_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles GridView2.RowUpdated
        'Test for an error during processing
        If e.Exception IsNot Nothing Then
            'Test for an exception during row update
            lblError4.Text = "* ERROR: You must fill in all fields! "
            'This suppresses the exception and keeps the
            'row in EditMode
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        Else

            lblError4.Text = "Update succeeded. All database entries have been recorded. Thank you."

        End If
    End Sub

    Protected Sub DetailsView2_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView2.ItemUpdated
        'Test for an error during processing
        If e.Exception IsNot Nothing Then
            'Test for an exception during row update
            lblError13.Text = "* ERROR: You must fill in all fields! "
            'This suppresses the exception and keeps the
            'row in EditMode
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        Else

            lblError13.Text = "Update succeeded. All database entries have been recorded. Thank you."

        End If
    End Sub

    Protected Sub Gridview3_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles GridView3.RowUpdated
        'Test for an error during processing
        If e.Exception IsNot Nothing Then
            'Test for an exception during row update
            lblError5.Text = "* ERROR: You must fill in all fields! "
            'This suppresses the exception and keeps the
            'row in EditMode
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        Else

            lblError5.Text = "Update succeeded. All database entries have been recorded. Thank you."

        End If
    End Sub

    Protected Sub DetailsView3_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView3.ItemUpdated
        'Test for an error during processing
        If e.Exception IsNot Nothing Then
            'Test for an exception during row update
            lblError12.Text = "* ERROR: You must fill in all fields! "
            'This suppresses the exception and keeps the
            'row in EditMode
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        Else

            lblError12.Text = "Update succeeded. All database entries have been recorded. Thank you."

        End If
    End Sub

    Protected Sub Gridview4_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles GridView4.RowUpdated
        'Test for an error during processing
        If e.Exception IsNot Nothing Then
            'Test for an exception during row update
            lblError6.Text = "* ERROR: You must fill in all fields! "
            'This suppresses the exception and keeps the
            'row in EditMode
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        Else

            lblError6.Text = "Update succeeded. All database entries have been recorded. Thank you."

        End If
    End Sub

    Protected Sub DetailsView4_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView4.ItemUpdated
        'Test for an error during processing
        If e.Exception IsNot Nothing Then
            'Test for an exception during row update
            lblError11.Text = "* ERROR: You must fill in all fields! "
            'This suppresses the exception and keeps the
            'row in EditMode
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        Else

            lblError11.Text = "Update succeeded. All database entries have been recorded. Thank you."

        End If
    End Sub
    Protected Sub Gridview5_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles GridView5.RowUpdated
        'Test for an error during processing
        If e.Exception IsNot Nothing Then
            'Test for an exception during row update
            lblError7.Text = "* ERROR: You must fill in all fields! "
            'This suppresses the exception and keeps the
            'row in EditMode
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        Else

            lblError7.Text = "Update succeeded. All database entries have been recorded. Thank you."

        End If
    End Sub
    Protected Sub DetailsView5_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView5.ItemUpdated
        'Test for an error during processing
        If e.Exception IsNot Nothing Then
            'Test for an exception during row update
            lblError10.Text = "* ERROR: You must fill in all fields! "
            'This suppresses the exception and keeps the
            'row in EditMode
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        Else

            lblError10.Text = "Update succeeded. All database entries have been recorded. Thank you."

        End If
    End Sub


    Protected Sub Gridview6_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles GridView6.RowUpdated
        'Test for an error during processing
        If e.Exception IsNot Nothing Then
            'Test for an exception during row update
            lblError8.Text = "* ERROR: You must fill in all fields! "
            'This suppresses the exception and keeps the
            'row in EditMode
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        Else

            lblError8.Text = "Update succeeded. All database entries have been recorded. Thank you."

        End If
    End Sub

    Protected Sub DetailsView6_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView6.ItemUpdated
        'Test for an error during processing
        If e.Exception IsNot Nothing Then
            'Test for an exception during row update
            lblError9.Text = "* ERROR: You must fill in all fields! "
            'This suppresses the exception and keeps the
            'row in EditMode
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        Else

            lblError9.Text = "Update succeeded. All database entries have been recorded. Thank you."

        End If
    End Sub
End Class

   

