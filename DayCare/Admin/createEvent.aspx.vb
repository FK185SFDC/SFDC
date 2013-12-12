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


        Dim startHour As String = ddlHour.SelectedValue
        Dim startMinute As String = ddlMinutes.SelectedValue
        Dim startPeriod As String = ddlPeriod.SelectedValue
        Dim startTime As String = startHour + ":" + startMinute + " " + startPeriod

        Dim startMonth As String = ddlMonth.SelectedValue
        Dim startDay As String = ddlDay.SelectedValue
        Dim startYear As String = ddlYear.SelectedValue
        Dim strStart As String = startTime + " " + startMonth + "/" + startDay + "/" + startYear

        Dim endHour As String = ddlHour2.SelectedValue
        Dim endMinute As String = ddlMinutes2.SelectedValue
        Dim endPeriod As String = ddlPeriod2.SelectedValue
        Dim endTime As String = endHour + ":" + endMinute + " " + endPeriod

        Dim endMonth As String = ddlMonth2.SelectedValue
        Dim endDay As String = ddlDay2.SelectedValue
        Dim endYear As String = ddlYear2.SelectedValue
        Dim strEnd As String = endTime + " " + endMonth + "/" + endDay + "/" + endYear


        'Dim strStartTime As String = startTextBox.Text
        'Dim strStartDate As String = Calendar1.SelectedDate
        'Dim strStart As String = strStartTime + " " + strStartDate

        'Dim strEndTime As String = endTextBox.Text
        'Dim strEndDate As String = Calendar2.SelectedDate
        'Dim strEnd As String = strEndTime + " " + strEndDate

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
    Private Property Day() As Integer
        Get
            If (Not (Request.Form(ddlDay.UniqueID)) Is Nothing) Then
                Return Integer.Parse(Request.Form(ddlDay.UniqueID))
            Else
                Return Integer.Parse(ddlDay.SelectedItem.Value)
            End If
        End Get
        Set(ByVal value As Integer)
            Me.PopulateDay()
            ddlDay.ClearSelection()
            ddlDay.Items.FindByValue(value.ToString).Selected = True
        End Set
    End Property

    Private Property Month() As Integer
        Get
            Return Integer.Parse(ddlMonth.SelectedItem.Value)
        End Get
        Set(ByVal value As Integer)
            Me.PopulateMonth()
            ddlMonth.ClearSelection()
            ddlMonth.Items.FindByValue(value.ToString).Selected = True
        End Set
    End Property

    Private Property Year() As Integer
        Get
            Return Integer.Parse(ddlYear.SelectedItem.Value)
        End Get
        Set(ByVal value As Integer)
            Me.PopulateYear()
            ddlYear.ClearSelection()
            ddlYear.Items.FindByValue(value.ToString).Selected = True
        End Set
    End Property

    Public Property SelectedDate() As DateTime
        Get
            Try
                Return DateTime.Parse(Me.Month & "/" & Me.Day & "/" & Me.Year)
            Catch ex As Exception
                Return DateTime.MinValue
            End Try
        End Get
        Set(ByVal value As DateTime)
            If Not value.Equals(DateTime.MinValue) Then
                Me.Year = value.Year
                Me.Month = value.Month
                Me.Day = value.Day
            End If
        End Set
    End Property

    Private Sub PopulateDay()
        ddlDay.Items.Clear()
        Dim lt As ListItem = New ListItem
        lt.Text = "DD"
        lt.Value = "0"
        ddlDay.Items.Add(lt)
        Dim days As Integer = DateTime.DaysInMonth(Me.Year, Me.Month)
        Dim i As Integer = 1
        Do While (i <= days)
            lt = New ListItem
            lt.Text = i.ToString
            lt.Value = i.ToString
            ddlDay.Items.Add(lt)
            i = (i + 1)
        Loop
        ddlDay.Items.FindByValue(DateTime.Now.Day.ToString).Selected = True
    End Sub

    Private Sub PopulateMonth()
        ddlMonth.Items.Clear()
        Dim lt As ListItem = New ListItem
        lt.Text = "MM"
        lt.Value = "0"
        ddlMonth.Items.Add(lt)
        Dim i As Integer = 1
        Do While (i <= 12)
            lt = New ListItem
            lt.Text = Convert.ToDateTime((i.ToString + "/1/1900")).ToString("MMMM")
            lt.Value = i.ToString
            ddlMonth.Items.Add(lt)
            i = (i + 1)
        Loop
        ddlMonth.Items.FindByValue(DateTime.Now.Month.ToString).Selected = True
    End Sub

    Private Sub PopulateYear()
        ddlYear.Items.Clear()
        Dim lt As ListItem = New ListItem
        lt.Text = "YYYY"
        lt.Value = "0"
        ddlYear.Items.Add(lt)
        Dim i As Integer = DateTime.Now.Year
        Do While (i >= 1950)
            lt = New ListItem
            lt.Text = i.ToString
            lt.Value = i.ToString
            ddlYear.Items.Add(lt)
            i = (i - 1)
        Loop
        ddlYear.Items.FindByValue(DateTime.Now.Year.ToString).Selected = True
    End Sub

    Private Property Day2() As Integer
        Get
            If (Not (Request.Form(ddlDay2.UniqueID)) Is Nothing) Then
                Return Integer.Parse(Request.Form(ddlDay2.UniqueID))
            Else
                Return Integer.Parse(ddlDay2.SelectedItem.Value)
            End If
        End Get
        Set(ByVal value As Integer)
            Me.PopulateDay2()
            ddlDay2.ClearSelection()
            ddlDay2.Items.FindByValue(value.ToString).Selected = True
        End Set
    End Property

    Private Property Month2() As Integer
        Get
            Return Integer.Parse(ddlMonth2.SelectedItem.Value)
        End Get
        Set(ByVal value As Integer)
            Me.PopulateMonth2()
            ddlMonth2.ClearSelection()
            ddlMonth2.Items.FindByValue(value.ToString).Selected = True
        End Set
    End Property

    Private Property Year2() As Integer
        Get
            Return Integer.Parse(ddlYear2.SelectedItem.Value)
        End Get
        Set(ByVal value As Integer)
            Me.PopulateYear2()
            ddlYear2.ClearSelection()
            ddlYear2.Items.FindByValue(value.ToString).Selected = True
        End Set
    End Property

    Public Property SelectedDate2() As DateTime
        Get
            Try
                Return DateTime.Parse(Me.Month2 & "/" & Me.Day2 & "/" & Me.Year2)
            Catch ex As Exception
                Return DateTime.MinValue
            End Try
        End Get
        Set(ByVal value As DateTime)
            If Not value.Equals(DateTime.MinValue) Then
                Me.Year2 = value.Year
                Me.Month2 = value.Month
                Me.Day2 = value.Day
            End If
        End Set
    End Property

    Private Sub PopulateDay2()
        ddlDay2.Items.Clear()
        Dim lt As ListItem = New ListItem
        lt.Text = "DD"
        lt.Value = "0"
        ddlDay2.Items.Add(lt)
        Dim days As Integer = DateTime.DaysInMonth(Me.Year2, Me.Month2)
        Dim i As Integer = 1
        Do While (i <= days)
            lt = New ListItem
            lt.Text = i.ToString
            lt.Value = i.ToString
            ddlDay2.Items.Add(lt)
            i = (i + 1)
        Loop
        ddlDay2.Items.FindByValue(DateTime.Now.Day.ToString).Selected = True
    End Sub

    Private Sub PopulateMonth2()
        ddlMonth2.Items.Clear()
        Dim lt As ListItem = New ListItem
        lt.Text = "MM"
        lt.Value = "0"
        ddlMonth2.Items.Add(lt)
        Dim i As Integer = 1
        Do While (i <= 12)
            lt = New ListItem
            lt.Text = Convert.ToDateTime((i.ToString + "/1/1900")).ToString("MMMM")
            lt.Value = i.ToString
            ddlMonth2.Items.Add(lt)
            i = (i + 1)
        Loop
        ddlMonth2.Items.FindByValue(DateTime.Now.Month.ToString).Selected = True
    End Sub

    Private Sub PopulateYear2()
        ddlYear2.Items.Clear()
        Dim lt As ListItem = New ListItem
        lt.Text = "YYYY"
        lt.Value = "0"
        ddlYear2.Items.Add(lt)
        Dim i As Integer = DateTime.Now.Year
        Do While (i >= 1950)
            lt = New ListItem
            lt.Text = i.ToString
            lt.Value = i.ToString
            ddlYear2.Items.Add(lt)
            i = (i - 1)
        Loop
        ddlYear2.Items.FindByValue(DateTime.Now.Year.ToString).Selected = True
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If (Me.SelectedDate = DateTime.MinValue) Then
                Me.PopulateYear()
                Me.PopulateMonth()
                Me.PopulateDay()
            End If
        Else
            If (Not (Request.Form(ddlDay.UniqueID)) Is Nothing) Then
                Me.PopulateDay()
                ddlDay.ClearSelection()
                ddlDay.Items.FindByValue(Request.Form(ddlDay.UniqueID)).Selected = True
            End If
        End If

        If Not IsPostBack Then
            If (Me.SelectedDate2 = DateTime.MinValue) Then
                Me.PopulateYear2()
                Me.PopulateMonth2()
                Me.PopulateDay2()
            End If
        Else
            If (Not (Request.Form(ddlDay2.UniqueID)) Is Nothing) Then
                Me.PopulateDay2()
                ddlDay2.ClearSelection()
                ddlDay2.Items.FindByValue(Request.Form(ddlDay2.UniqueID)).Selected = True
            End If
        End If


        Dim h As ListItem = New ListItem
        Dim m As ListItem = New ListItem

        m.Text = "00"
        m.Value = "0"
        ddlMinutes.Items.Add(m)
        ddlMinutes2.Items.Add(m)

        Dim i As Integer = 1
        Do While (i <= 12)
            h = New ListItem
            h.Text = i.ToString
            h.Value = i.ToString
            ddlHour.Items.Add(h)
            ddlHour2.Items.Add(h)
            i += 1
        Loop

        Dim k As Integer = 15
        Do While (k < 60)
            m = New ListItem
            m.Text = k.ToString
            m.Value = k.ToString
            ddlMinutes.Items.Add(m)
            ddlMinutes2.Items.Add(m)
            k += 15
        Loop

        ddlPeriod.Items.Add("AM")
        ddlPeriod.Items.Add("PM")
        ddlPeriod2.Items.Add("AM")
        ddlPeriod2.Items.Add("PM")


    End Sub

    Protected Sub cancelButton_Click(sender As Object, e As EventArgs) Handles cancelButton.Click
        Response.Redirect("Calendar.aspx")
    End Sub
End Class
