ActiveAdmin.register Event do

# 一覧ページの検索条件
  filter :user_id
  filter :idol_id
  filter :place_id
  filter :title
  filter :body
  filter :start_date
  filter :end_date

  # 一覧ページ
  index do
    column :user_id
    column :idol_id
    column :place_id
    column :title
    column :body
    column :start_date
    column :end_date

    actions
  end

  # 詳細ページ
  show do
    attributes_table do
      row :user_id
      row :idol_id
      row :place_id
      row :title
      row :body
      row :start_date
      row :end_date
    end
  end

  # 新規作成/編集ページ
  form do |f|
    f.inputs do
      f.input :user_id
      f.input :idol_id
      f.input :place_id
      f.input :title
      f.input :body
      f.input :start_date
      f.input :end_date
    end
    f.actions
  end

  permit_params :user_id, :idol_id, :place_id, :title, :body, :start_date, :end_date # 更新可能な attribute を記載
end
