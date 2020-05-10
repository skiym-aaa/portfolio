ActiveAdmin.register Idol do
  # 一覧ページの検索条件
  filter :user
  filter :name

  # 一覧ページ
  index do
    column :id
    column :user
    column :name
    column :about
    column :official_site
    column :official_twitter
    column :official_youtube

    actions
  end

  # 詳細ページ
  show do
    attributes_table do
      row :id
      row :user
      row :name
      row :about
      row :official_site
      row :official_twitter
      row :official_youtube
      row :image_id do
        if idol.image_id.to_s == ''
          image_tag(asset_path('no_image.jpg'))
        else
          image_tag(idol.image_id.url, size: '360x360')
        end
      end
    end
  end

  # 新規作成/編集ページ
  form do |f|
    f.inputs do
      f.input :user
      f.input :name
      f.input :about
      f.input :official_site
      f.input :official_twitter
      f.input :official_youtube
      f.input :image_id, as: :file
    end
    f.actions
  end

  permit_params :user_id, :name, :about, :official_site, :official_twitter, :official_youtube, :image_id # 更新可能な attribute を記載
end
