ActiveAdmin.register Manufacturer do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :description, :country, :city
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

index do
    column :title
    column :description
    column :country
    column :city
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    inputs 'Edit Manufacturer' do
      f.input :title
      f.input :description
      f.input :country, as: :country
      f.input :city
    end
    actions
  end

end