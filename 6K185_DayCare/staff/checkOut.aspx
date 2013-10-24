<%@ Page Title="" Language="VB" MasterPageFile="~/group4.master" AutoEventWireup="false" CodeFile="checkOut.aspx.vb" Inherits="lib_checkOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   Material ID:<asp:TextBox ID="mID_tb" runat="server"></asp:TextBox>

   <br /><br />

   UserName:<asp:TextBox ID="UserName_tb" runat="server"></asp:TextBox>

   <br /><br />
   <asp:RequiredFieldValidator ID="rfd_mIDRequired" runat="server" 
                        ControlToValidate="mID_tb" ErrorMessage="Please enter the Material ID of the material being rented." 
                        ToolTip="Please enter the material ID of the material being rented.">
                        <span class='rfd'>*** Please enter the Material ID of the material being rented.</span>
               </asp:RequiredFieldValidator>
    <br /> <br />
    <asp:RequiredFieldValidator ID="rfd_UserNameRequired" runat="server" 
                           ControlToValidate="UserName_tb" ErrorMessage="Please enter the UserName of the person renting the material." 
                           ToolTip="Please enter the UserName of the person renting the material.">
                           <span class='rfd'>*** Please enter a UserName.</span>
                </asp:RequiredFieldValidator>

      

               <br /><br />
    <asp:Button ID="rentButton" runat="server" Text="Check Out" />




</asp:Content>

