class VariablecostValuesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_variablecostvalue, only: [:show, :edit, :update, :destroy]
	before_action :user?, only: [:show, :edit, :update, :destroy]

	def index
		@variablecost_values = VariablecostValue.where(user_id: current_user.id,).order(year_month: "DESC").limit(10)
		@year_month = Time.now.all_month
		piechart
		@chart = [['消費', @consumptionvalue], ['浪費', @wastevalue], ['投資', @investmentvalue]]
	end

	def show

	end

	def new
		@variablecost_value = VariablecostValue.new

		# @form = Form::VariablecostForm.new
	end

	def edit

	end

	def create
		@variablecost_value = VariablecostValue.new(variablecost_value_params)
		if @variablecost_value.save
			redirect_to :variablecost_values, notice: "登録しました"
		else
			redirect_to :variablecost_values, notice: "登録に失敗しました"
		end
	end


	def update

		@variablecost_value.update(variablecost_value_params)
		if @variablecost_value.save
			redirect_to :variablecost_values, notice: "情報を更新しました"
		else
			render "edit"
		end
	end

	def destroy

		@variablecost_value.destroy
		redirect_to :variablecost_values, notice: "データを削除しました。"
	end

private
	def set_variablecostvalue
		@variablecost_value = VariablecostValue.find(params[:id])
	end

	def user?
		if @variablecost_value.user_id != current_user.id
			redirect_to action: "index"
		end
	end

	def variablecost_value_params
		params
			.require(:variablecost_value)
			.permit(:title, :value, :description, :year_month)
			.merge(user_id: current_user.id)
	end

end