ActiveAdmin.register EventComment do
  # 一覧ページの検索条件
  filter :user
  filter :event

  # 一覧ページ
  index do
    column :id
    column :user
    column :event
    column :body

    actions
  end

  # 詳細ページ
  show do
    attributes_table do
      row :id
      row :user
      row :event
      row :body
    end
  end

  # 新規作成/編集ページ
  form do |f|
    f.inputs do
      f.input :user
      f.input :event
      f.input :body
    end
    f.actions
  end

  permit_params :user_id, :event_id, :body # 更新可能な attribute を記載
end
