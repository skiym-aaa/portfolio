ActiveAdmin.register Place do

  # 一覧ページの検索条件
  filter :user_id
  filter :name

  # 一覧ページ
  index do
    column :user_id
    column :name
    column :address
    column :about
    column :official_site
    column :image_id

    actions
  end

  # 詳細ページ
  show do
    attributes_table do
      row :user_id
      row :name
      row :address
      row :about
      row :official_site
      row :image_id
    end
  end

  # 新規作成/編集ページ
  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.input :about
      f.input :official_site
      f.input :image_id
    end
    f.actions
  end

  permit_params :name, :address, :about, :official_site, :image_id # 更新可能な attribute を記載
end

