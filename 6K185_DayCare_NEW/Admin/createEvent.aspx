﻿<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage_Main.master" AutoEventWireup="false" CodeFile="createEvent.aspx.vb" Inherits="Admin_createEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Create Event</h1>

    <asp:Label ID="locationLabel" runat="server" Text="Location"></asp:Label>
    <asp:TextBox ID="whereTextBox" runat="server"></asp:TextBox><br />

     <asp:Label ID="startLabel" runat="server" Text="Start Date"></asp:Label>
    <asp:TextBox ID="startTextBox" runat="server"></asp:TextBox><br />
     
    <asp:Label ID="endLabel" runat="server" Text="End Date"></asp:Label>
    <asp:TextBox ID="endTextBox" runat="server"></asp:TextBox><br />

     <asp:Label ID="subjectLabel" runat="server" Text="Event Title"></asp:Label>
    <asp:TextBox ID="subjectTextBox" runat="server"></asp:TextBox><br />
    
     <asp:Label ID="bodyLabel" runat="server" Text="Describe Event"></asp:Label>
    <asp:TextBox ID="bodyTextBox" runat="server"></asp:TextBox><br />


    <br />

    <asp:Label ID="errorLabel" runat="server" Text=""></asp:Label>

    <br />

    <asp:Button ID="createButton" runat="server" Text="Create" />
</asp:Content>
