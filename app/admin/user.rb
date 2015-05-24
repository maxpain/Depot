ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :email, :role
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

index do
    column :email
    column :role
    column :last_sign_in_ip
    column :sign_in_count
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    inputs 'Edit user' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, collection: [['User', :user], ['Admin', :admin]], include_blank: false
    end
    actions
  end

end