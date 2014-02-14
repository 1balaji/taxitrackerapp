ActiveAdmin.register User do
  permit_params :username

  index do
    selectable_column
    id_column
    column :username
    column :logs do |u|
      link_to "Download logs", download_logs_admin_user_path(u.id), method: :post
    end
    actions
  end

  filter :username

  show do |u|
    attributes_table do
      row :username do
        u.username
      end
      row :logs do
        link_to "Download logs", download_logs_admin_user_path(u.id), method: :post
      end
    end
  end

  member_action :download_logs, method: :post do
    require 'csv'

    user = User.find(params[:id])
    logs = user.logs

    csv_string = CSV.generate do |csv|
      csv << ["lon", "lat", "logged_at"]
      logs.each do |l|
        csv << [l.lon, l.lat, l.logged_at]
      end
    end

    send_data csv_string, type: "text/csv; header=present", disposition: "attachment;filename=data.csv"
  end

  form do |f|
    f.inputs "User Details" do
      f.input :username
    end
    f.actions
  end

end

