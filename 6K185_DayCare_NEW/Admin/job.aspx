<%@ Page Title="" Language="VB" MasterPageFile="../MasterPage_Main.master" AutoEventWireup="false" CodeFile="Job.aspx.vb" Inherits="Admin_Job" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><br />

    <h3 class="cntl_h3">Add/Update Jobs</h3> 
    <br />


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [JOB_POSTING] WHERE [Job_ID] = @Job_ID" InsertCommand="INSERT INTO [JOB_POSTING] ([Job_ID], [Position], [Start_Date], [Closing_Date], [Description]) VALUES (@Job_ID, @Position, @Start_Date, @Closing_Date, @Description)" SelectCommand="SELECT * FROM [JOB_POSTING]" UpdateCommand="UPDATE [JOB_POSTING] SET [Position] = @Position, [Start_Date] = @Start_Date, [Closing_Date] = @Closing_Date, [Description] = @Description WHERE [Job_ID] = @Job_ID">
        <DeleteParameters>
            <asp:Parameter Name="Job_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Job_ID" Type="Int32" />
            <asp:Parameter Name="Position" Type="String" />
            <asp:Parameter Name="Start_Date" Type="DateTime" />
            <asp:Parameter Name="Closing_Date" Type="DateTime" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Position" Type="String" />
            <asp:Parameter Name="Start_Date" Type="DateTime" />
            <asp:Parameter Name="Closing_Date" Type="DateTime" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Job_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource><br />





    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Job_ID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Job_ID" HeaderText="Job ID" ReadOnly="True" SortExpression="Job_ID" />
            <asp:BoundField DataField="Position" HeaderText="Position" SortExpression="Position" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Start_Date" HeaderText="Start Date" SortExpression="Start_Date" />
            <asp:BoundField DataField="Closing_Date" HeaderText="Closing Date" SortExpression="Closing_Date" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="Job_ID" DataSourceID="SqlDataSource1">
        <Fields>
            <asp:BoundField DataField="Job_ID" HeaderText="Job_ID" ReadOnly="True" SortExpression="Job_ID" />
            <asp:BoundField DataField="Position" HeaderText="Position" SortExpression="Position" />
            <asp:BoundField DataField="Start_Date" HeaderText="Start_Date" SortExpression="Start_Date" />
            <asp:BoundField DataField="Closing_Date" HeaderText="Closing_Date" SortExpression="Closing_Date" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>





</asp:Content>

