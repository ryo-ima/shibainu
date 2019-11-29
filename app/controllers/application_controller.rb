class ApplicationController < ActionController::Base
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin_admin_user
      new_admin_admin_user_session_path
    else
      new_user_session_path
    end
  end

	def piechart
		consumptions = VariablecostValue.where(user_id: current_user.id, title: 0, year_month: @year_month)
		wastes = VariablecostValue.where(user_id: current_user.id, title: 1, year_month: @year_month)
		investments = VariablecostValue.where(user_id: current_user.id, title: 2, year_month: @year_month)
		@consumptionvalue = 0
		@wastevalue = 0
		@investmentvalue = 0
		consumptions.each do |consumption|
			@consumptionvalue += consumption.value
		end
		wastes.each do |waste|
			@wastevalue += waste.value
		end
		investments.each do |investment|
			@investmentvalue += investment.value
    end
  end
  
end