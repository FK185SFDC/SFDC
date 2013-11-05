<%@ Page Title="" Language="VB" MasterPageFile="../MasterPage_Main.master" AutoEventWireup="false" CodeFile="Attendance_n_Reports.aspx.vb" Inherits="Staff_Attendance_n_Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h3 class="cntl_h3">Add/Update a Child Attendance, Meal, and Accident Reports</h3> 
    <br />

    <% If Not IsPostBack Then%>  
    <asp:Label ID="lbl_Grt_Staff" runat="server"></asp:Label><br /><br />

    <%End If%>




    <asp:Button ID="btn_Child_Info" runat="server" Text="View Child Information" Width="142px" Height="32px" />
    <asp:Button ID="btn_Child_Attendance" runat="server" Text="Child Attendance" Width="115px" Height="32px" />
    <asp:Button ID="btn_Meal_Report" runat="server" Text="Meal Report" Width="115px" Height="32px" />
    <asp:Button ID="btn_Accident_Type" runat="server" Text="Accident Type" Width="115px" Height="32px" />
    <asp:Button ID="btn_Accident_Report" runat="server" Text="Accident Report" Width="115px" Height="32px" />




    <asp:MultiView ID="Attendance_Reports_MultiView" runat="server">


    <asp:View ID="Child_Information_View" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        </asp:View>

    <asp:View ID="Child_Attendance_View" runat="server">
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView5" runat="server">
        </asp:GridView>
        <br />
        <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="125px">
        </asp:DetailsView>
        </asp:View>

    <asp:View ID="Meal_Report_View" runat="server">
        <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView4" runat="server">
        </asp:GridView>
        <br />
        <asp:DetailsView ID="DetailsView3" runat="server" Height="50px" Width="125px">
        </asp:DetailsView>
        </asp:View>

    <asp:View ID="Accident_Type_View" runat="server">
        <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView3" runat="server">
        </asp:GridView>
        <br />
        <asp:DetailsView ID="DetailsView4" runat="server" Height="50px" Width="125px">
        </asp:DetailsView>
        </asp:View>

    <asp:View ID="Accident_Report_View" runat="server">
        <asp:SqlDataSource ID="SqlDataSource5" runat="server"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView2" runat="server">
        </asp:GridView>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px">
        </asp:DetailsView>
        </asp:View>

    



    </asp:MultiView>









</asp:Content>

