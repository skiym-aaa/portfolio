ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    # div class: 'blank_slate_container', id: 'dashboard_default_message' do
      # span class: 'blank_slate' do
        # span I18n.t('active_admin.dashboard_welcome.welcome')
        # small I18n.t('active_admin.dashboard_welcome.call_to_action')
      # end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "最近投稿されたイベント" do
          table do
            tr
              td columns :イベント名
              td columns :開始時間
              td columns :新規登録時間
            Event.order(created_at: :desc).map do |event|
              tr
                td link_to(event.title, admin_event_path(event))
                td event.start_date.strftime("%Y-%m-%d %H:%M")
                td event.created_at.strftime("%Y-%m-%d %H:%M")
            end
          end
        end
      end
      column do
        panel "最近編集されたイベント" do
          table do
            tr
              td columns :イベント名
              td columns :開始時間
              td columns :編集時間
            Event.order(updated_at: :desc).map do |event|
              tr
                td link_to(event.title, admin_event_path(event))
                td event.start_date.strftime("%Y-%m-%d %H:%M")
                td event.updated_at.strftime("%Y-%m-%d %H:%M")
            end
          end
        end
      end
    end

    columns do
      column do
        panel "最近投稿されたアイドル" do
          table do
            Idol.order(created_at: :desc).map do |idol|
              tr
                td link_to(idol.name, admin_idol_path(idol))
                td idol.created_at.strftime("%Y-%m-%d %H:%M")
            end
          end
        end
      end
      column do
        panel "最近編集されたアイドル" do
          table do
            Idol.order(updated_at: :desc).map do |idol|
              tr
                td link_to(idol.name, admin_idol_path(idol))
                td idol.updated_at.strftime("%Y-%m-%d %H:%M")
            end
          end
        end
      end
    end

    columns do
      column do
        panel "最近投稿された場所" do
          table do
            Place.order(created_at: :desc).map do |place|
              tr
                td link_to(place.name, admin_place_path(place))
                td place.created_at.strftime("%Y-%m-%d %H:%M")
            end
          end
        end
      end
      column do
        panel "最近投稿された場所" do
          table do
            Place.order(updated_at: :desc).map do |place|
              tr
                td link_to(place.name, admin_place_path(place))
                td place.updated_at.strftime("%Y-%m-%d %H:%M")
            end
          end
        end
      end
    end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    end
end
    # content
