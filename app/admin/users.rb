ActiveAdmin.register User do
  # 一覧ページの検索条件
  filter :id
  filter :email
  filter :name
  filter :is_deleted

  # 一覧ページ
  index do
    column :id
    column :email
    column :name
    column :is_deleted

    actions
  end

  # 詳細ページ
  show do
    attributes_table do
      row :id
      row :email
      row :name
      row :body
      row :is_deleted
      row :image_id do
        if user.image_id.to_s == ''
          image_tag(asset_path('no_image.jpg'))
        else
          image_tag(user.image_id.url)
        end
      end
    end
  end

  # 新規作成/編集ページ
  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      # f.input :password
      # f.input :encrypted_password
      f.input :body
      f.input :is_deleted
      f.input :image_id, as: :file
    end
    f.actions
  end

  permit_params :email, :name, :password, :encrypted_password, :body, :is_deleted, :image_id
end
