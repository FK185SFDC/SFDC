<%@ Page  Title="" Language="VB" MasterPageFile="~/Site.master" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SQLClient" %>
<%@ Import Namespace="System.Web" %>
<script runat="server">

    Protected Sub SqlDataSourceGV_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs)
        ' Get a reference to the currently logged on user
        Dim currentUser As MembershipUser = Membership.GetUser()

        ' Determine the currently logged on user's UserId value
        Dim currentUserId As Guid = CType(currentUser.ProviderUserKey, Guid)

        ' Assign the currently logged on user's UserId to the @UserId parameter
        e.Command.Parameters("@UserId").Value = currentUserId
    End Sub


    Protected Sub btnAddBoat_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim objCommand As SqlCommand
        ' Get a reference to the currently logged on user
        Dim currentUser As MembershipUser = Membership.GetUser()
        ' Determine the currently logged on user's UserId value
        Dim currentUserId As Guid = CType(currentUser.ProviderUserKey, Guid)
        'Store values to parameters from controls
        
        Dim strConnectionString As String
        strConnectionString = ConfigurationManager.ConnectionStrings("fk185_ClassConnectionString").ConnectionString
        
        Dim insertSql As String = "Insert into CustomerBoat(Description, LicenseNumber, BoatType, UserID) Values(@Description,@LicenseNumber,@BoatType,@UserId)"
      
        Dim sqlConn As New SqlConnection(strConnectionString)
        sqlConn.Open()
            
        objCommand = New SqlCommand(insertSql, sqlConn)
        
        objCommand.Parameters.AddWithValue("@Description", tbDescription.Text.Trim())
        objCommand.Parameters.AddWithValue("@LicenseNumber", tbLicense.Text.Trim())
        objCommand.Parameters.AddWithValue("@BoatType", ddlBoatType.SelectedValue.Trim())
        
        objCommand.Parameters.AddWithValue("@UserID", currentUserId)
        Try
            
            objCommand.ExecuteNonQuery()
            'Clear the TextBox and Label controls
            tbDescription.Text = ""
            tbLicense.Text = ""
            lblError.Text = "Add succeeded."
            GridView1.DataBind()
        Catch ex As Exception
            'Display exception message if the Insert fails
            lblError.Text = "An exception occurred. " & ex.Message
        Finally
            sqlConn.Close()
        End Try
    End Sub

    Protected Sub GridView1_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs)
        'Test for an error during processing
        If e.Exception IsNot Nothing Then
            'Test for an exception during row update
            lblError.Text = "An exception occurred. " & e.Exception.Message
            'This suppresses the exception and keeps the
            'row in EditMode
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        Else

            lblError.Text = "Update succeeded."

        End If


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
       
        Dim currentUser As MembershipUser = Membership.GetUser()
        
        If Not Roles.IsUserInRole("Customer") Then
            btnAddBoat.Enabled = False
            lblError.Text = "You must be logged in as a customer to add a boat."
        End If
            
    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" AutoGenerateEditButton="True" 
        DataKeyNames="ID" 
        DataSourceID="SqlDataSourceGV" 
        ShowFooter="True"  
        EmptyDataText="No Boat Data Available: You are either not logged in as a customer or you need to add a boat.">
        <Columns>
            <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="ID">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ErrorMessage="Description Required" ControlToValidate="TextBox1" ></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                </ItemTemplate>
                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LicenseNumber" SortExpression="LicenseNumber">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LicenseNumber") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("LicenseNumber") %>'></asp:Label>
                </ItemTemplate>
               
            </asp:TemplateField>
            <asp:TemplateField HeaderText="BoatType" SortExpression="BoatType">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("BoatType") %>' 
                        DataSourceID="SqlDataSourceBoatType" DataTextField="Name" DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceBoatType" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:fk185_ClassConnectionString %>" 
                        SelectCommand="SELECT [ID], [Name] FROM [BoatType]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("BoatType") %>'></asp:Label>
                </ItemTemplate>
                
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UserID" SortExpression="UserID" Visible="False">
                <EditItemTemplate>
                    <asp:Label ID="Label6" visible="false" runat="server" Text='<%# Bind("UserID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" visible="false" runat="server" Text='<%# Bind("UserID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceGV" runat="server" 
        ConnectionString="<%$ ConnectionStrings:fk185_ClassConnectionString %>" 
        SelectCommand="SELECT * FROM [CustomerBoat] Where [UserID] = @UserID" 
        UpdateCommand="UPDATE CustomerBoat SET
                            Description = @Description,
                            LicenseNumber = @LicenseNumber,
                            BoatType = @BoatType
                            WHERE Id = @ID "
        onselecting="SqlDataSourceGV_Selecting" 
        >
        <SelectParameters>
            <asp:Parameter Name="UserId" Type="Object" />
        </SelectParameters>
        <UpdateParameters>
                        <asp:Parameter Name="Description" />
                        <asp:Parameter Name="LicenseNumber" />
                        <asp:Parameter Name="BoatType" />
                        <asp:Parameter Name="ID" />
         </UpdateParameters>
         
        </asp:SqlDataSource>

    

    <table class="style1" id="tblAddBoat">
        <tr>
            <td style="width: 112px">
                Description:</td>
            <td>
                <asp:TextBox ID="tbDescription" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="tbDescInsertRFV" runat="server" 
                    ControlToValidate="tbDescription" ErrorMessage="Description required" ValidationGroup="Insert"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 112px">
                License Number:</td>
            <td>
                <asp:TextBox ID="tbLicense" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 112px">
                Boat Type:</td>
            <td>
                <asp:DropDownList ID="ddlBoatType" runat="server"  
                        DataSourceID="SqlDataSourceBoatTypeInsert" DataTextField="Name" DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceBoatTypeInsert" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:fk185_ClassConnectionString %>" 
                        SelectCommand="SELECT [ID], [Name] FROM [BoatType]"></asp:SqlDataSource>
                
            </td>
        </tr>
        <tr>
            <td style="width: 112px">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnAddBoat" runat="server" Text="Add Boat" 
                    onclick="btnAddBoat_Click" ValidationGroup="Insert" />
            </td>
        </tr>
        <tr>
            <td style="width: 112px">
                &nbsp;</td>
            <td>
                <asp:Label ID="lblError" runat="server" EnableViewState="False"></asp:Label>
            </td>
        </tr>
    </table>

    

</asp:Content>

