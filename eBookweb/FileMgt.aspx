﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="FileMgt.aspx.cs" Inherits="eBookweb.FileMgt" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CPH4Admin" runat="server">
    <div class="container">
        <div class="form-horizontal">
            <h2>新增圖書分類</h2>
            <hr />
            <div class="form-group">
                <asp:Label ID="lbCatName" runat="server" CssClass="col-md-2 control-label" Text="輸入分類名稱:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbCatName" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVCatName" CssClass="text-danger" runat="server" ErrorMessage="填入分類名稱" ControlToValidate="tbCatName"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lbCatValue" runat="server" CssClass="col-md-2 control-label" Text="輸入分類序號:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID = "tbCatValue" CssClass="form-contorl" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVCatValue" CssClass="text-danger" runat="server" ErrorMessage="填入分類序號" ControlToValidate="tbCatValue"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btCatUpload" runat="server" Text="新增至資料庫" CssClass="btn btn-default" OnClick="btCatUpload_Click"></asp:Button>
                    <asp:Label ID="lbCatmsg" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
        <div class="container">
            <h2>書籍管理名單</h2>
            <hr />
            <div class="row">  
                <div class="col-md-2 pull-right">
                    <asp:DropDownList ID="ddlCat" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCat_SelectedIndexChanged"></asp:DropDownList>
                </div>
            </div>
            <br />
        </div>
        <div class = "panel panel-default">
            <div class = "panel-heading">檔名分類</div>
            <asp:GridView ID="gvFile" runat="server" AutoGenerateColumns="False"  ShowHeaderWhenEmpty="True" Height="200px" Width="100%" OnRowEditing="gvFile_RowEditing" OnRowCancelingEdit="gvFile_RowCancelingEdit" OnRowUpdating="gvFile_RowUpdating" OnRowDeleting="gvFile_RowDeleting" DataKeyNames="FileId" >
                <Columns>
                    <asp:TemplateField HeaderText="檔案名稱">
                        <ItemTemplate>
                            <asp:Label ID="lbNameFile" runat="server" Text='<%# Eval("FileName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbEditNameFile" runat="server" Text='<%# Eval("FileName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbFooterEditNameFile" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="檔案連結">
                        <ItemTemplate>
                            <asp:Label ID="lbLinkFile" runat="server" Text='<%# Eval("FileLink") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbEditLinkFile" runat="server" Text='<%# Eval("FileLink") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbFooterLinkFile" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="檔案類別">
                        <ItemTemplate>
                            <asp:Label ID="lbIndexFile" runat="server" Text='<%# Eval("FileCategoryIndex") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbEditIndexFile" runat="server" Text='<%# Eval("FileCategoryIndex") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbFooterEditIndexFile" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="上傳科室">
                        <ItemTemplate>
                            <asp:Label ID="lbUploadFile" runat="server" Text='<%# Eval("FileUploadDepartment") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="tbEditUploadFile" runat="server" Text='<%# Eval("FileUploadDepartment") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="tbFooterEditUploadFile" runat="server"></asp:TextBox>
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
