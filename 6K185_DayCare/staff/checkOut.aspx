<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="checkOut.aspx.vb" Inherits="lib_checkOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    Kids ID:<asp:TextBox ID="ChildID_tb" runat="server"></asp:TextBox>

   <br /><br />

   UserName:<asp:TextBox ID="UserName_tb" runat="server"></asp:TextBox>

   <br /><br />
   <asp:RequiredFieldValidator ID="rfd_ChildIDRequired" runat="server" 
                        ControlToValidate="ChildID_tb" ErrorMessage="Please enter the Child ID of the Kid leaving." 
                        ToolTip="Please enter the material ID of the material being rented.">
                        <span class='rfd'>*** Please enter the Child ID of the Kid leaving..</span>
               </asp:RequiredFieldValidator>
    <br /> <br />
    <asp:RequiredFieldValidator ID="rfd_UserNameRequired" runat="server" 
                           ControlToValidate="UserName_tb" ErrorMessage="Please enter the UserName of the person checking out the Kid." 
                           ToolTip="Please enter the UserName of the person checking out the Kid.">
                           <span class='rfd'>*** Please enter a UserName.</span>
                </asp:RequiredFieldValidator>

      

               <br /><br />
    <asp:Button ID="CheckOutButton" runat="server" Text="Check Out" />




</asp:Content>

