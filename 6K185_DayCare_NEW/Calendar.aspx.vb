


Partial Class Calendar
    Inherits System.Web.UI.Page

End Class

'Imports System.IO
'Imports System.Data.SqlClient

'Imports System.Web.Services
'Imports System.Web.Services.Protocols
'Imports System.ComponentModel

''Imports Google.GData.AccessControl
'Imports Google.GData.Calendar
'Imports Google.GData.Client
'Imports Google.GData.Extensions

'<System.Web.Services.WebService(Namespace:="http://localhost/GoogleCalendarInVBNET/")> _
'<System.Web.Services.WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _

'Public Class Calendar
'    Inherits System.Web.Services.WebService

'    Private Const userName As String = "statefarmdc@gmail.com"
'    Private Const userPassword As String = "Stat3Farm"

'    '' Here's the feed to access events on the users' private/primar calendar:
'    Private feedUri As String = "https://www.google.com/calendar/feeds/default/private/full?max-results=9999"
'    '' Here's the feed that lists all calendars that this user has access to:
'    Private Const feedOwnCalendars As String = "https://www.google.com/calendar/feeds/default/owncalendars/full"
'    '' This is a feed for non-primary calendars that requires an ID field, taken from enumerating the users' calendars...
'    Private Const CALENDAR_TEMPLATE As String = "https://www.google.com/calendar/feeds/{0}/private/full?max-results=9999"

'#Region "Single Call Public Functions"


'    Public Function A1ListMyCalendars() As String
'        Dim str As String
'        str = ListAllCalendars()
'        Return str
'    End Function


'    Public Function A1CreateEvent(ByVal stCalName As String, ByVal strWhere As String, ByVal strStart As String, ByVal strEnd As String, ByVal strSubject As String, ByVal strBody As String, ByVal strRecurData As String) As String
'        Return CreateEvent(GetCalendarService, stCalName, strWhere, strStart, strEnd, strSubject, strBody, strRecurData)
'    End Function


'    Public Function A1DeleteEvent(ByVal intTripNo As Integer, ByVal stCalName As String) As String
'        Return DeleteEvent(GetCalendarService, intTripNo, stCalName)
'    End Function


'    Public Function A1ListUsersCalendars() As String
'        Dim Service As CalendarService = GetCalendarService()
'        Dim query As New FeedQuery
'        query.Uri = New Uri(feedUri) ' Private feedUri 'cause for users calendars

'        Dim calFeed As AtomFeed
'        calFeed = Service.Query(query)

'        Dim str As String = ""
'        For x As Integer = 0 To calFeed.Entries.Count - 1
'            str = str & calFeed.Entries(x).Title.Text
'            If calFeed.Entries.Count > 1 And x < (calFeed.Entries.Count - 1) Then
'                str = str & ", " & calFeed.Title.Text & vbCrLf
'            End If
'        Next

'        Return str
'    End Function

'#End Region

'#Region "Public GET Functions"
'    Public Function GetCalendarService() As CalendarService
'        Dim Service As CalendarService = New CalendarService("My-exampleApp-1")
'        Service.setUserCredentials(userName, userPassword)
'        Return Service
'    End Function


'    Public Function GetCalendarID(ByRef Service As CalendarService, ByVal strCalName As String) As String
'        Dim query As New FeedQuery
'        Dim str As String = ""

'        query.Uri = New Uri(feedOwnCalendars)

'        Dim calFeed As AtomFeed
'        calFeed = Service.Query(query)

'        For x As Integer = 0 To calFeed.Entries.Count - 1
'            If calFeed.Entries(x).Title.Text = strCalName Then
'                str = calFeed.Entries(x).Id.AbsoluteUri.Substring(63)
'            End If
'        Next

'        Return str
'    End Function


'    Public Function GetCalendarURI(ByRef Service As CalendarService, ByVal stCalName As String) As String
'        Dim stURI As String = String.Format(CALENDAR_TEMPLATE, GetCalendarID(Service, stCalName))
'        '' Easy override to go back to the users' primary calendar!!!
'        If stCalName = "Primary" Then
'            stURI = feedUri
'        End If
'        Return stURI
'    End Function
'#End Region


'    Public Function ListAllCalendars() As String
'        Dim Service As CalendarService = GetCalendarService()
'        Dim query As New FeedQuery
'        query.Uri = New Uri(feedOwnCalendars)

'        Dim calFeed As AtomFeed
'        calFeed = Service.Query(query)

'        Dim str As String = ""
'        For x As Integer = 0 To calFeed.Entries.Count - 1
'            str = str & calFeed.Entries(x).Title.Text & "|" & calFeed.Entries(x).Id.AbsoluteUri.Substring(63) & vbCrLf
'        Next

'        Return str
'    End Function


'    Public Function DeleteAllEvents(ByVal strCalName As String) As String

'        Dim str As String = ""

'        Dim Service As CalendarService = GetCalendarService()
'        Dim query As New FeedQuery
'        query.Uri = New Uri(GetCalendarURI(Service, strCalName))

'        Dim calFeed As AtomFeed
'        calFeed = Service.Query(query)

'        If calFeed.Entries.Count > 0 Then
'            For x As Integer = 0 To calFeed.Entries.Count - 1
'                str = str & calFeed.Entries(x).Title.Text & vbCrLf
'                calFeed.Entries(x).Delete()
'            Next
'        End If

'        Return str

'    End Function

'    Public Function DeleteEvent(ByRef Service As CalendarService, ByVal strSearchFor As String, ByVal stCalName As String) As String

'        Dim str As String = ""

'        Dim query As New FeedQuery
'        query.Uri = New Uri(GetCalendarURI(Service, stCalName))
'        query.Query = strSearchFor

'        Dim sFeed As EventFeed = Service.Query(query)
'        Dim Exists As Boolean = False

'        If sFeed.TotalResults > 0 Then
'            Exists = True

'            Dim calFeed As AtomFeed
'            calFeed = Service.Query(query)

'            If calFeed.Entries.Count > 0 Then
'                For x As Integer = 0 To calFeed.Entries.Count - 1
'                    str = str & calFeed.Entries(x).Title.Text
'                    calFeed.Entries(x).Delete()
'                Next
'            End If
'        End If

'        Return str

'    End Function

'    Private Function CreateEvent(ByRef Service As CalendarService, _
'                                        ByVal strCalName As String, _
'                                        ByVal strWhere As String, _
'                                        ByVal strStart As String, _
'                                        ByVal strEnd As String, _
'                                        ByVal strSubject As String, _
'                                        ByVal strBody As String, _
'                                        ByVal strRecurData As String) As String

'        Dim entry As New EventEntry
'        entry.Title.Text = "New Test"
'        entry.Content.Content = strBody

'        Dim eventLocation As New Where
'        eventLocation.ValueString = strWhere
'        entry.Locations.Add(eventLocation)

'        Dim eventTime As New [When]("11 / 10 / 2013", "11 / 10 / 2103")
'        entry.Times.Add(eventTime)

'        Dim postUri As Uri = New Uri(GetCalendarURI(Service, strCalName))
'        Dim insertedEntry As AtomEntry = Service.Insert(postUri, entry)

'        Return insertedEntry.ToString

'    End Function

'    Public Function FindEvent(ByRef Service As CalendarService, ByVal strCalName As String, ByVal strSearchFor As String) As String
'        Dim strOut As String = ""
'        Dim query As EventQuery = New EventQuery

'        query.Uri = New Uri(GetCalendarURI(Service, strCalName))
'        query.Query = strSearchFor.ToString

'        Dim calFeed As EventFeed = Service.Query(query)
'        Dim feedEntry As EventEntry
'        If calFeed.TotalResults > 0 Then

'            For Each feedEntry In calFeed.Entries
'                strOut = strOut & (feedEntry.Title.Text) & vbCrLf
'            Next
'        Else
'            strOut = "No Results found"
'        End If

'        Return strOut
'    End Function


'End Class
