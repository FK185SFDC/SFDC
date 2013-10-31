<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage_Main.master" AutoEventWireup="false" CodeFile="checkin.aspx.vb" Inherits="Staff_checkin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:fk185_DaycareConnectionString %>" DeleteCommand="DELETE FROM [CHILD_ATTENDANCE] WHERE [Attendance_ID] = @Attendance_ID" InsertCommand="INSERT INTO [CHILD_ATTENDANCE] ([Attendance_ID], [Start_Date], [Child_ID], [Check_In], [Check_Out], [End_Date]) VALUES (@Attendance_ID, @Start_Date, @Child_ID, @Check_In, @Check_Out, @End_Date)" SelectCommand="SELECT * FROM [CHILD_ATTENDANCE]" UpdateCommand="UPDATE [CHILD_ATTENDANCE] SET [Start_Date] = @Start_Date, [Child_ID] = @Child_ID, [Check_In] = @Check_In, [Check_Out] = @Check_Out, [End_Date] = @End_Date WHERE [Attendance_ID] = @Attendance_ID">
        <DeleteParameters>
            <asp:Parameter Name="Attendance_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Attendance_ID" Type="Int32" />
            <asp:Parameter Name="Start_Date" Type="DateTime" />
            <asp:Parameter Name="Child_ID" Type="Int32" />
            <asp:Parameter Name="Check_In" Type="DateTime" />
            <asp:Parameter Name="Check_Out" Type="DateTime" />
            <asp:Parameter Name="End_Date" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Start_Date" Type="DateTime" />
            <asp:Parameter Name="Child_ID" Type="Int32" />
            <asp:Parameter Name="Check_In" Type="DateTime" />
            <asp:Parameter Name="Check_Out" Type="DateTime" />
            <asp:Parameter Name="End_Date" Type="DateTime" />
            <asp:Parameter Name="Attendance_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <br /> <br />
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" DataSourceID="SqlDataSource1">
        <Fields>
            <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>


</asp:Content>

