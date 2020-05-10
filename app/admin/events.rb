ActiveAdmin.register Event do
  # 一覧ページの検索条件
  filter :user
  filter :idol
  filter :place
  filter :title
  filter :body
  filter :start_date
  filter :end_date

  # 一覧ページ
  index do
    column :id
    column :user
    column :idol
    column :place
    column :title
    column :body
    column :start_date
    column :end_date

    actions
  end

  # 詳細ページ
  show do
    attributes_table do
      row :id
      row :user
      row :idol
      row :place
      row :title
      row :body
      row :start_date
      row :end_date
    end
  end

  # 新規作成/編集ページ
  form do |f|
    f.inputs do
      f.input :user
      f.input :idol
      f.input :place
      f.input :title
      f.input :body
      f.input :start_date, :start_year => 2020, :minute_step => 10
      f.input :end_date, :start_year => 2020, :minute_step => 10
    end
    f.actions
  end

  permit_params :user_id, :idol_id, :place_id, :title, :body, :start_date, :end_date # 更新可能な attribute を記載
end
