ActiveAdmin.register EventPhoto do
  # 一覧ページの検索条件
  filter :user
  filter :event

  # 一覧ページ
  index do
    column :id
    column :user
    column :event

    actions
  end

  # 詳細ページ
  show do
    attributes_table do
      row :id
      row :user
      row :event
      row :image_id do
        image_tag(event_photo.image_id.url, size: '360x240')
      end
    end
  end

  # 新規作成/編集ページ
  form do |f|
    f.inputs do
      f.input :user
      f.input :event
      f.input :image_id, as: :file
    end
    f.actions
  end

  permit_params :user_id, :event_id, :image_id
end
