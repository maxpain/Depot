ActiveAdmin.register Tiding do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :description, :image_url
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
    column :image_url
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    inputs 'Edit Tiding' do
      f.input :title
      f.input :description
      f.input :image_url
    end
    actions
  end

end