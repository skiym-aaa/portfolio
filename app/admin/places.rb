ActiveAdmin.register Place do
  # 一覧ページの検索条件
  filter :user
  filter :name

  # 一覧ページ
  index do
    column :id
    column :user
    column :name
    column :address
    column :about
    column :official_site

    actions
  end

  # 詳細ページ
  show do
    attributes_table do
      row :id
      row :user
      row :name
      row :address
      row :about
      row :official_site
      row :image_id do
        if place.image_id.to_s == ""
          image_tag(asset_path "no_image.jpg")
        else
          image_tag(place.image_id.url, size: "360x240")
        end
      end
    end
  end

  # 新規作成/編集ページ
  form do |f|
    f.inputs do
      f.input :user
      f.input :name
      f.input :address
      f.input :about
      f.input :official_site
      f.input :image_id, :as => :file
    end
    f.actions
  end

  permit_params :user_id, :name, :address, :about, :official_site, :image_id # 更新可能な attribute を記載
end
