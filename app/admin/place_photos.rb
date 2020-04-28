ActiveAdmin.register PlacePhoto do

  # 一覧ページの検索条件
  filter :user
  filter :place

  # 一覧ページ
  index do
    column :id
    column :user
    column :place
    column :image_id, :as => :file

    actions
  end

  # 詳細ページ
  show do
    attributes_table do
      row :id
      row :user
      row :place
      row :image_id do
        image_tag(place_photo.image_id.url)
      end
    end
  end

  # 新規作成/編集ページ
  form do |f|
    f.inputs do
      f.input :user
      f.input :place
      f.input :image_id
    end
    f.actions
  end

  permit_params :user_id, :place_id, :image_id # 更新可能な attribute を記載
end
