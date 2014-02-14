ActiveAdmin.register Log do
  index do
    selectable_column
    id_column
    column :lon
    column :lat
    column :logged_at
    column :user
    actions
  end

  filter :user
  filter :lon
  filter :lat
  filter :logged_at
end
