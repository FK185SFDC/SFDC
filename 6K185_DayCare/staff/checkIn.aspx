<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="checkIn.aspx.vb" Inherits="child_checkIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    Kid ID to be checked in:<asp:TextBox ID="returnTextBox" runat="server" ToolTip="enter material ID"></asp:TextBox>

     <br /><br />
   <asp:RequiredFieldValidator ID="rfd_mIDRequired" runat="server" 
                        ControlToValidate="returnTextBox" ErrorMessage="Please enter the Child ID of the Kid arriving." 
                        ToolTip="Please enter the Child ID of the Kid arriving.">
                        <span class='rfd'>*** Please enter the Child ID of the Kid arriving..</span>
               </asp:RequiredFieldValidator>
   

    <br />
    <br />

    <asp:Button ID="cInButton" runat="server" Text="Check In Kid" />
</asp:Content>

