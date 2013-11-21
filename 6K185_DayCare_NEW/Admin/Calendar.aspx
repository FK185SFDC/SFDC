<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage_Main.master" AutoEventWireup="false" CodeFile="Calendar.aspx.vb" Inherits="Admin_Calendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:Button ID="createButton" runat="server" Text="Create Event" />
    &nbsp&nbsp
    <asp:Button ID="deleteButton" runat="server" Text="Delete Event" />
    &nbsp&nbsp
    
    
    <br /><br />

    <iframe src="https://www.google.com/calendar/embed?src=statefarmdc%40gmail.com&ctz=America/Chicago" style="border: 10px solid Black" 
        width="800" height="600"></iframe>



</asp:Content>

