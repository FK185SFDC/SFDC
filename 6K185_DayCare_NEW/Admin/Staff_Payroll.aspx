<%@ Page Title="" Language="VB" MasterPageFile="../MasterPage_Main.master" AutoEventWireup="false" CodeFile="Staff_Payroll.aspx.vb" Inherits="Admin_Staff_Payroll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <h3 class="cntl_h3">Add/Update Staff and Payroll Information</h3> 
    <br />

    <% If Not IsPostBack Then%>  
    <asp:Label ID="lbl_Grt_Admin_Staff" runat="server"></asp:Label><br /><br />

    <%End If%>
     <asp:Button ID="btb_Staff" runat="server" Text="Staff" Width="105px" Height="32px" />
     <asp:Button ID="btn_Payroll" runat="server" Text="Payroll" Width="105px" Height="32px" />



    <asp:MultiView ID="Staff_Multiview" runat="server">


        <asp:View ID="Staff_View" runat="server">

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            <br />
            <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="125px">
            </asp:DetailsView>

        </asp:View>

        <asp:View ID="Payroll_View" runat="server">

            <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView2" runat="server">
            </asp:GridView>
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px">
            </asp:DetailsView>

        </asp:View>











    </asp:MultiView>






















</asp:Content>

