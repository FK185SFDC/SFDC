<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage_Main.master" AutoEventWireup="false" CodeFile="view_checkin.aspx.vb" Inherits="Staff_view_checkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" SelectCommand="SELECT * FROM [CHILD_ATTENDANCE]"></asp:SqlDataSource>

    <br />


    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Attendance_ID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Child_ID" HeaderText="Child ID" SortExpression="Child_ID" />
            <asp:BoundField DataField="Check_In" HeaderText="Check In" SortExpression="Check_In" />
            <asp:BoundField DataField="Check_Out" HeaderText="Check Out" SortExpression="Check_Out" />
            <asp:BoundField DataField="End_Date" HeaderText="End_Date" SortExpression="End_Date" />
        </Columns>
    </asp:GridView>


</asp:Content>

