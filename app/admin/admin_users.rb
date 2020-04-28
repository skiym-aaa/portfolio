ActiveAdmin.register AdminUser do

# 一覧ページの検索条件
  filter :email
  filter :created_at

  # 一覧ページ
  index do
    selectable_column
    id_column
    column :email
    column :created_at
    actions
  end

  # 詳細ページ
  show do
    attributes_table do
      row :id
      row :email
      row :created_at
    end
  end

  # 新規作成/編集ページ
  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  permit_params :email, :password, :password_confirmation
end
