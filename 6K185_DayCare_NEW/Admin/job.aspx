<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage_Main.master" AutoEventWireup="false" CodeFile="Job.aspx.vb" Inherits="Admin_Job" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><br />

    <h3 class="cntl_h3">Add/Update Jobs</h3> 
    <br />


    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource><br />





    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px">
    </asp:DetailsView>





</asp:Content>

