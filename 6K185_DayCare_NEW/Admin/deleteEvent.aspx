<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage_Main.master" AutoEventWireup="false" CodeFile="deleteEvent.aspx.vb" Inherits="Admin_deleteEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Delete Event</h1>

    <asp:Label ID="subjectLabel" runat="server" Text="Enter Event Title To Delete Below:"></asp:Label><br />
    <asp:TextBox ID="subjectTextBox" runat="server"></asp:TextBox><br /><br />

    <asp:Button ID="deleteButton" runat="server" Text="Delete Event" />
    <asp:Button ID="cancelButton" runat="server" Text="Cancel" />
</asp:Content>

