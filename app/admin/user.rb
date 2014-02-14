ActiveAdmin.register User do
  permit_params :username

  index do
    selectable_column
    id_column
    column :username
    actions
  end

  filter :username


  form do |f|
    f.inputs "User Details" do
      f.input :username
    end
    f.actions
  end

end

