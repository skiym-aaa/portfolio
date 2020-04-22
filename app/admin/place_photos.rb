ActiveAdmin.register PlacePhoto do

  # 一覧ページの検索条件
  filter :user_id
  filter :place_id

  # 一覧ページ
  index do
    column :user_id
    column :place_id
    column :image_id, :as => :file

    actions
  end

  # 詳細ページ
  show do
    attributes_table do
      row :user_id
      row :place_id
      row :image_id do
        image_tag(place_photo.image_id.url)
      end
    end
  end

  # 新規作成/編集ページ
  form do |f|
    f.inputs do
      f.input :user_id
      f.input :place_id
      f.input :image_id
    end
    f.actions
  end

  permit_params :user_id, :place_id, :image_id # 更新可能な attribute を記載
end
