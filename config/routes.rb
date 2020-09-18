Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :v1, defaults: { format: :json } do

    resources :users, only: [:create, :show]  do
       collection do
         get  'unconfirmed_users'
         post 'confirm_token'
         post 'login'
         post 'forgot_password'
         post 'reset_password'
       end
     end

     resources :accounts
     resources :images
     resources :transactions
     resources :profiles
     resources :codes

     resources :organizations do
       namespace :organizations do
            resources :company, :department, :sub_department, :holding_company, :product_group,
            :product, :service_group, :service, :controller => 'organizations', :except => [:destroy, :edit, :update]
       end
     end


     resources :forms do
       namespace :forms do
         resources :consignment, :delivery_note, :dispatch_note, :goods_received, :invoice, :issue_note,
          :job_card, :leave_application,:meal_card, :overtime, :petty_cash, :proforma_ivoice, :purchase_order,
          :purchase, :quotation, :report, :requisition, :controller => 'forms', :except => [:destroy, :edit, :update]
       end
     end

     resources :structures do
          namespace :structures do
            resources :incomes, :expenses, :indirect_expenses, :adminstrative_costs,
            :controller => 'structures', :except => [:destroy, :edit, :update ]
          end
          collection do
            put 'link_unit_groups'
            post 'create_unit_group'
          end
     end
  end


end
