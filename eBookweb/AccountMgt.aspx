<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AccountMgt.aspx.cs" Inherits="eBookweb.AccountMgt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH4Admin" runat="server">
    <div class="container">
        <div class="form-horizontal">
            <h2>帳戶管理系統</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="lbActUserName" runat="server" CssClass="col-md-2 control-label" Text="新增帳號:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbActUserName" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVActUserName" CssClass="text-danger" runat="server" ErrorMessage="請填入帳號" ControlToValidate="tbActUserName"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lbActPwd" runat="server" CssClass="col-md-2 control-label" Text="新增密碼:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbActPwd" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVActPwd" CssClass="text-danger" runat="server" ErrorMessage="請填入密碼" ControlToValidate="tbActPwd"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lbActEmail" runat="server" CssClass="col-md-2 control-label" Text="新增信箱:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbActEmail" CssClass="form-contorl" runat="server" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVActEmail" CssClass="text-danger" runat="server" ErrorMessage="請填入信箱" ControlToValidate="tbActEmail"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btActUpload" runat="server" Text="新增至資料庫" CssClass="btn btn-default" OnClick="btActUploadn_Click" ></asp:Button>
                    <asp:Label ID="lbActmsg" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
        <h2>帳號管理名單</h2>
        <asp:GridView ID="gvAct" runat="server" AutoGenerateColumns="False"  ShowHeaderWhenEmpty="True" CellPadding="3" GridLines="Horizontal" Height="147px" Width="276px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" OnRowEditing="gvAct_RowEditing">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:TemplateField HeaderText="帳號">
                    <ItemTemplate>
                        <asp:Label ID="lbUserNameAct" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbEditUserNameAct" runat="server" Text='<%# Eval("Username") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbFooterEditUserNameAct" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="密碼">
                    <ItemTemplate>
                        <asp:Label ID="lbPwdAct" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbEditPwdAct" runat="server" Text='<%# Eval("Password") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbFooterPwdAct" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="信箱">
                    <ItemTemplate>
                        <asp:Label ID="lbEmailAct" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="tbEditEmailAct" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbFooterEditEmailAct" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ID="imEdit" ImageUrl="~/Images/icon_edit.png" CommandName="edit" ToolTip="Edit" Width="20px" Height="20px" runat="server" CausesValidation="False" />
                        <asp:ImageButton ID="imDel" ImageUrl="~/Images/icon_delete.png" CommandName="delete" ToolTip="delete" Width="20px" Height="20px" runat="server" CausesValidation="False" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:ImageButton ID="imUpdate" ImageUrl="~/Images/icon_update.png" CommandName="update" ToolTip="update" Width="20px" Height="20px" runat="server" CausesValidation="False" />
                        <asp:ImageButton ID="imDel" ImageUrl="~/Images/icon_delete.png" CommandName="delete" ToolTip="delete" Width="20px" Height="20px" runat="server" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbFooterEditEmailAct" runat="server"></asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
        <br />
        <asp:Label ID="lbActSuccess" runat="server" Text="上傳成功"></asp:Label>
        <br />
        <asp:Label ID="lbActerror" runat="server" Text="上傳失敗"></asp:Label>

    </div>

</asp:Content>
