ActiveAdmin.register User do
  permit_params :username

  index do
    selectable_column
    id_column
    column :username
    actions
  end

  filter :username

  show do |u|
    attributes_table do
      row :username
    end
    panel "Logs" do
      columns do
        u.logs.each do |l|
          column :lon do
            l.lon
          end
          column :lat do
            l.lat
          end
          column :logged_at do
            l.logged_at
          end
        end 
      end
    end
  end


  form do |f|
    f.inputs "User Details" do
      f.input :username
    end
    f.actions
  end

end

