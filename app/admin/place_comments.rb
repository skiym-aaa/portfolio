ActiveAdmin.register PlaceComment do
  # 一覧ページの検索条件
  filter :user
  filter :place

  # 一覧ページ
  index do
    column :id
    column :user
    column :place
    column :body
    column :rate

    actions
  end

  # 詳細ページ
  show do
    attributes_table do
      row :id
      row :user
      row :place
      row :body
      row :rate
    end
  end

  # 新規作成/編集ページ
  form do |f|
    f.inputs do
      f.input :user
      f.input :place
      f.input :body
      f.input :rate
    end
    f.actions
  end

  permit_params :user_id, :place_id, :body, :rate
end
