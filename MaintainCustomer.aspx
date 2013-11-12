<%@ Page  Title="" Language="VB" MasterPageFile="~/Site.master" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SQLClient" %>
<%@ Import Namespace="System.Web" %>

<script runat="server">

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim strLN As String
        If String.IsNullOrEmpty(Trim(tbSearch.Text)) Then
            SqlDataSource1.SelectCommand = "SELECT [LastName], [FirstName], [Address], [Active], [UserID], [ID] FROM [Customer] Order By LastName"
        Else
            strLN = CStr((tbSearch.Text).Trim)
            SqlDataSource1.SelectCommand = "SELECT [LastName], [FirstName], [Address], [Active], [UserID], [ID] FROM [Customer] Where LastName Like '%" & strLN & "%' Order By LastName"
        End If
        GridView1.DataBind()
        GridView1.SelectedIndex = -1
        lblMessage.Text = ""
        
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        lblMessage.Text = ""
         
    End Sub

    Protected Sub DetailsView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs)
       
        Dim blnActive As Boolean
        Dim cbControl As CheckBox
        Dim UserGUID As String
        'Grab the row with the active/inactive checkbox
        Dim row As DetailsViewRow = DetailsView1.Rows(3)
      
        'Test for an error during processing of the customer data
        If e.Exception IsNot Nothing Then
            'Test for an exception during row insertion
            lblMessage.Text = "An exception occurred durring the edit. " & e.Exception.Message
            'This suppresses the exception and keeps the
            'row in EditMode
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        Else
            'customer data has been updated, now we need to change active status withon aspnet_user table
            
            'find the editactive checkbox
            cbControl = row.FindControl("EditActive")
            'find the customer's GUID that we need in order to update aspNet_user data
            UserGUID = GridView1.SelectedValue.ToString
            ' Get a reference to the customer aspnet_user being updated
            Dim GUID As New Guid(UserGUID)
            Dim currentUser As MembershipUser = Membership.GetUser(GUID)
            ' Update active/inactive within aspnet_user
            
            If cbControl.Checked Then
                currentUser.Isapproved = True
            Else
                currentUser.Isapproved = False
            End If
            'Update user with new data
            Membership.UpdateUser(currentUser)
            
            SqlDataSource1.SelectCommand = "SELECT [LastName], [FirstName], [Address], [Active], [UserID], [ID] FROM [Customer] Where UserID = '" & GUID.ToString & "' Order By LastName"
            GridView1.DataBind()
             GridView1.SelectedIndex = 0
            lblMessage.Text = "Edit succeeded."
        End If
    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <asp:TextBox ID="tbSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
            Text="Find Customer" />
    </p>
    <p>
        
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="False" AutoGenerateColumns="False" DataKeyNames="UserID" 
            DataSourceID="SqlDataSource1" 
            EmptyDataText="No Customers to Display from search or no search was done" 
            onselectedindexchanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" 
                    SortExpression="LastName" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                    SortExpression="FirstName" />
                <asp:BoundField DataField="Address" HeaderText="Address"
                     SortExpression="ID" />
                <asp:BoundField DataField="Active" HeaderText="Active"
                     SortExpression="ID" />
                <asp:BoundField DataField="UserID" HeaderText="UserID"
                    SortExpression="UserID" Visible="False" />
            </Columns>
            <SelectedRowStyle BackColor="#CCCCCC" BorderStyle="Dotted" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:fk185_ClassConnectionString %>" 
            SelectCommand="">
        </asp:SqlDataSource>
    </p>
    <p>
        
        <asp:DetailsView ID="DetailsView1" runat="server" 
            AutoGenerateRows="False" DataKeyNames="UserID" DataSourceID="SqlDataSource2" 
            EmptyDataText="No Customer Data to Display Or No Customer was selected" 
            Height="50px" Width="125px" 
            onitemupdated="DetailsView1_ItemUpdated" >
            <Fields>
                <asp:BoundField DataField="ID" HeaderText="ID" 
                    ReadOnly="True" Visible= "false" SortExpression="ID" />
                <asp:TemplateField HeaderText="Last Name" SortExpression="LastName">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbEditLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator id = "LastNamerfv" runat="server" ErrorMessage="Last Name Required" ControlToValidate="tbEditLastName">
                    </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                    SortExpression="FirstName" />
                    <asp:BoundField DataField="Address" HeaderText="Address" 
                    SortExpression="Address" />
               <asp:TemplateField HeaderText="Active" SortExpression="Active">
                <EditItemTemplate>
                    <asp:Checkbox ID="EditActive" runat="server" Checked='<%# Bind("Active") %>'>
                    </asp:Checkbox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelActive" runat="server" Text='<%# Bind("Active") %>'></asp:Label>
                </ItemTemplate>   
            </asp:TemplateField>
                <asp:BoundField DataField="UserID" HeaderText="UserID" 
                    SortExpression="UserID" Visible="false"/>
                <asp:CommandField ShowEditButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:fk185_ClassConnectionString %>" 
            SelectCommand="SELECT * FROM [Customer] WHERE ([UserID] = @UserID)"
             UpdateCommand="UPDATE Customer SET
                            LastName = @LastName,
                            FirstName = @FirstName,
                            Address = @Address,
                            Active = @Active
                            WHERE UserId = @UserID"
            >
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="UserID" 
                    PropertyName="SelectedValue" Type="Object" />
            </SelectParameters>
            <UpdateParameters>
                        <asp:Parameter Name="LastName" />
                        <asp:Parameter Name="FirstName" />
                        <asp:Parameter Name="Address" />
                        <asp:Parameter Name="Active" />
                        <asp:Parameter Name="UserID" />
         </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

