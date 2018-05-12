<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="FileMgt.aspx.cs" Inherits="eBookweb.FileMgt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH4Admin" runat="server">
    <div class="container">
        <div class="form-horizontal">
            <h2>檔案管理系統</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="lbFileName" runat="server" CssClass="col-md-2 control-label" Text="輸入檔案名稱:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbFileName" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVFileName" CssClass="text-danger" runat="server" ErrorMessage="填入檔案名稱" ControlToValidate="tbFileName"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lbFileLink" runat="server" CssClass="col-md-2 control-label" Text="輸入檔案連結:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbFileLink" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVFileLink" CssClass="text-danger" runat="server" ErrorMessage="填入檔案連結" ControlToValidate="tbFileLink"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lbFileBrief" runat="server" CssClass="col-md-2 control-label" Text="輸入檔案簡述"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbFileBrief" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVFileBrief" CssClass="text-danger" runat="server" ErrorMessage="填入檔案簡述" ControlToValidate="tbFileBrief"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btFileUpload" runat="server" Text="新增至資料庫" CssClass="btn btn-default" OnClick="btFileUpload_Click"></asp:Button>
                    <asp:Label ID="lbFilemsg" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
        <h2>帳號管理名單</h2>
        <div class = "panel panel-default">
            <div class = "panel-heading">Panel Heading</div>
            <asp:GridView ID="gvFile" runat="server" AutoGenerateColumns="False"  ShowHeaderWhenEmpty="True" Height="200px" Width="100%" OnRowEditing="gvFile_RowEditing" OnRowCancelingEdit="gvFile_RowCancelingEdit" OnRowUpdating="gvFile_RowUpdating" OnRowDeleting="gvFile_RowDeleting" DataKeyNames="Id" >
                <Columns>
                    <asp:TemplateField HeaderText="檔案名稱">
                        <ItemTemplate>
                            <asp:Label ID="lbNameFile" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbEditNameFile" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbFooterEditNameFile" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="檔案連結">
                        <ItemTemplate>
                            <asp:Label ID="lbLinkFile" runat="server" Text='<%# Eval("Link") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbEditLinkFile" runat="server" Text='<%# Eval("Link") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbFooterLinkFile" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="檔案簡述">
                        <ItemTemplate>
                            <asp:Label ID="lbBriefFile" runat="server" Text='<%# Eval("Brief") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbEditBriefFile" runat="server" Text='<%# Eval("Brief") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbFooterEditBriefFile" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="imEdit" ImageUrl="~/Images/icon_edit.png" CommandName="edit" ToolTip="Edit" Width="20px" Height="20px" runat="server" CausesValidation="False" />
                            <asp:ImageButton ID="imDel" ImageUrl="~/Images/icon_delete.png" CommandName="delete" ToolTip="delete" Width="20px" Height="20px" runat="server" CausesValidation="False" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ID="imUpdate" ImageUrl="~/Images/icon_update.png" CommandName="update" ToolTip="update" Width="20px" Height="20px" runat="server" CausesValidation="False" />
                            <asp:ImageButton ID="imDel" ImageUrl="~/Images/icon_cancel.png" CommandName="cancel" ToolTip="cancel" Width="20px" Height="20px" runat="server" CausesValidation="False" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbFooterEditBriefFile" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:Label ID="lbFileerrormsg" runat="server" Text=""></asp:Label>
        <br />
        <br />
        <br />
    </div>
    
</asp:Content>
