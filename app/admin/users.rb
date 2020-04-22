ActiveAdmin.register User do

  # 一覧ページの検索条件
  filter :id
  filter :email
  filter :name

  # 一覧ページ
  index do
    column :id
    column :email
    column :name

    actions
  end

  # 詳細ページ
  show do
    attributes_table do
      row :id
      row :email
      row :name
    end
  end

  # 新規作成/編集ページ
  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :password
      f.input :encrypted_password
    end
    f.actions
  end

  permit_params :email, :name, :password, :encrypted_password # 更新可能な attribute を記載
end
