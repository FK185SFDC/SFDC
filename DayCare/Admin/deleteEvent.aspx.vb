Imports System.Data.SqlClient
Imports System.Data

Imports System.Web
Imports System.Web.UI

Imports Google.GData.AccessControl
Imports Google.GData.Calendar
Imports Google.GData.Client
Imports Google.GData.Extensions

Partial Class Admin_deleteEvent
    Inherits System.Web.UI.Page
    Private Const userName As String = "statefarmdc@gmail.com"
    Private Const userPassword As String = "Stat3Farm"

    '' Here's the feed to access events on the users' private/primar calendar:
    Private feedUri As String = "https://www.google.com/calendar/feeds/default/private/full?max-results=9999"
    '' Here's the feed that lists all calendars that this user has access to:
    Private Const feedOwnCalendars As String = "https://www.google.com/calendar/feeds/default/owncalendars/full"
    '' This is a feed for non-primary calendars that requires an ID field, taken from enumerating the users' calendars...
    Private Const CALENDAR_TEMPLATE As String = "https://www.google.com/calendar/feeds/{0}/private/full?max-results=9999"

    Protected Sub deleteButton_Click(sender As Object, e As EventArgs) Handles deleteButton.Click
        Dim m_Service As CalendarService

        m_Service = New CalendarService("Calendar")

        m_Service.setUserCredentials(userName, userPassword)
        Dim strSearchFor As String = subjectTextBox.Text
        Dim strCalName As String = "Day Care Events"
        Dim str As String = ""

        Dim query As New Google.GData.Client.FeedQuery
        query.Uri = New Uri(feedUri)
        query.Query = strSearchFor

        Dim s_query As EventQuery = New EventQuery
        s_query.Uri = New Uri(feedUri)
        s_query.Query = strSearchFor


        Dim sFeed As Google.GData.Calendar.EventFeed = m_Service.Query(s_query)
        Dim Exists As Boolean = False

        If sFeed.TotalResults > 0 Then
            Exists = True

            Dim calFeed As Google.GData.Client.AtomFeed
            calFeed = m_Service.Query(query)

            If calFeed.Entries.Count > 0 Then
                For x As Integer = 0 To calFeed.Entries.Count - 1
                    str = str & calFeed.Entries(x).Title.Text
                    calFeed.Entries(x).Delete()
                Next
            End If
        End If


        Response.Redirect("Calendar.aspx")


    End Sub
    Protected Sub cancelButton_Click(sender As Object, e As EventArgs) Handles cancelButton.Click
        Response.Redirect("Calendar.aspx")
    End Sub
End Class
