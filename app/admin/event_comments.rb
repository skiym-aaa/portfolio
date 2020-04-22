ActiveAdmin.register EventComment do

  # 一覧ページの検索条件
  filter :user_id
  filter :event_id

  # 一覧ページ
  index do
    column :user_id
    column :event_id
    column :body
    column :rate

    actions
  end

  # 詳細ページ
  show do
    attributes_table do
      row :user_id
      row :event_id
      row :body
      row :rate
    end
  end

  # 新規作成/編集ページ
  form do |f|
    f.inputs do
      f.input :user_id
      f.input :event_id
      f.input :body
      f.input :rate
    end
    f.actions
  end

  permit_params :user_id, :event_id, :body, :rate # 更新可能な attribute を記載
end
