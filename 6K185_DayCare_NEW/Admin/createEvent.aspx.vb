Imports System.Data.SqlClient
Imports System.Data

Imports System.Web
Imports System.Web.UI

Imports Google.GData.AccessControl
Imports Google.GData.Calendar
Imports Google.GData.Client
Imports Google.GData.Extensions

Partial Class Admin_createEvent
    Inherits System.Web.UI.Page


    Private Const userName As String = "statefarmdc@gmail.com"
    Private Const userPassword As String = "Stat3Farm"

    '' Here's the feed to access events on the users' private/primar calendar:
    Private feedUri As String = "https://www.google.com/calendar/feeds/default/private/full?max-results=9999"
    '' Here's the feed that lists all calendars that this user has access to:
    Private Const feedOwnCalendars As String = "https://www.google.com/calendar/feeds/default/owncalendars/full"
    '' This is a feed for non-primary calendars that requires an ID field, taken from enumerating the users' calendars...
    Private Const CALENDAR_TEMPLATE As String = "https://www.google.com/calendar/feeds/{0}/private/full?max-results=9999"

    Protected Sub createButton_Click(sender As Object, e As EventArgs) Handles createButton.Click

        Dim m_Service As CalendarService

        m_Service = New CalendarService("Calendar")

        m_Service.setUserCredentials(userName, userPassword)

        Dim query As New CalendarQuery()
        query.Uri = New Uri(feedOwnCalendars)
        Dim calFeed As AtomFeed
        calFeed = m_Service.Query(query)
        Dim str As String = ""
        For x As Integer = 0 To calFeed.Entries.Count - 1
            str = str & calFeed.Entries(x).Title.Text & "|" & _
                  calFeed.Entries(x).Id.AbsoluteUri.Substring(63) & vbCrLf
        Next

        errorLabel.Text = str

        Dim strCalName As String = "Day Care Events"
        Dim strWhere As String = whereTextBox.Text
        Dim strStart As String = startTextBox.Text
        Dim strEnd As String = endTextBox.Text
        Dim strSubject As String = subjectTextBox.Text
        Dim strBody As String = bodyTextBox.Text

        Dim entry As New Google.GData.Calendar.EventEntry


        entry.Title.Text = strSubject
        entry.Content.Content = strBody

        Dim eventLocation As New Where
        eventLocation.ValueString = strWhere
        entry.Locations.Add(eventLocation)

        Dim eventTime As New [When](strStart, strEnd)
        entry.Times.Add(eventTime)

        Dim postUri As Uri = New Uri(feedUri)
        Dim insertedEntry As AtomEntry = m_Service.Insert(postUri, entry)


        Dim strOut As String = ""
        Dim s_query As EventQuery = New EventQuery

        s_query.Uri = New Uri(feedUri)
        s_query.Query = "Successfully added entry"

        calFeed = m_Service.Query(s_query)
        Dim feedEntry As Google.GData.Calendar.EventEntry
        If calFeed.TotalResults > 0 Then

            For Each feedEntry In calFeed.Entries
                strOut = strOut & (feedEntry.Title.Text) & vbCrLf
            Next
        Else
            strOut = "No Results found"
        End If

        errorLabel.Text = strOut

        Response.Redirect("Calendar.aspx")

    End Sub
End Class
