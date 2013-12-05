<%@ Page Title="" Language="VB" MasterPageFile="MasterPage_Main.master" AutoEventWireup="false" CodeFile="Employment.aspx.vb" 
    Inherits="Employment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" 
        SelectCommand="SELECT * FROM [JOB_POSTING]"></asp:SqlDataSource>

    <br /> <br />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Job_ID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Job_ID" HeaderText="Job_ID" ReadOnly="True" SortExpression="Job_ID" />
            <asp:BoundField DataField="Position" HeaderText="Position" SortExpression="Position" />
            <asp:BoundField DataField="Start_Date" HeaderText="Start_Date" SortExpression="Start_Date" />
            <asp:BoundField DataField="Closing_Date" HeaderText="Closing_Date" SortExpression="Closing_Date" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
        </Columns>
    </asp:GridView>


</asp:Content>

