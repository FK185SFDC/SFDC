Imports System.Web.Mail
Imports System.Text
Partial Class Contact
    Inherits System.Web.UI.Page
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim Body As String = "From: " + fname.Text + " " + lname.Text + Environment.NewLine + "email: " + email.Text +
            Environment.NewLine + Environment.NewLine + "Message:" + Environment.NewLine + message.Text
        Dim WM As New System.Net.Mail.SmtpClient
        WM.EnableSsl = True
        WM.Host = "smtp.gmail.com"
        Dim cred As New System.Net.NetworkCredential("statefarm.daycare@gmail.com", "Capstone185")
        WM.Credentials = cred
        WM.Send(email.Text, "ui.capstone185@gmail.com", subject.Text, Body)
        Response.Redirect("Msge_confirm.aspx")
        fname.Text = ""
        lname.Text = ""
        email.Text = ""
        message.Text = ""
        subject.Text = ""
    End Sub
End Class
