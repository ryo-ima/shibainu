class VariablecostValuesController < ApplicationController
	before_action :authenticate_user!
	def index
		@variablecost_values = VariablecostValue.where(user_id: current_user.id,).order(year_month: "ASC")
		piechart
		@chart = [['消費', @consumptionvalue], ['浪費', @wastevalue], ['投資', @investmentvalue]]
	end

	def show
		@variablecost_value = VariablecostValue.find(params[:id])
	end

	def new
		@variablecost_value = VariablecostValue.new
		year_month_day = params[:year_month] + "-01"
		@year_month = year_month_day.to_date

		# @form = Form::VariablecostForm.new
	end

	def edit
		@variablecost_value = VariablecostValue.find(params[:id])
	end

	def create
		@variablecost_value = VariablecostValue.new(variablecost_value_params)
		if @variablecost_value.save
			redirect_to :variablecost_values, notice: "登録しました"
		else
			redirect_to :variablecost_values, notice: "登録に失敗しました"
		end
	end

	def variablecost_value_params
		params
			.require(:variablecost_value)
			.permit(:title, :value, :description, :year_month)
			.merge(user_id: current_user.id)
	end

	def update
		@variablecost_value = VariablecostValue.find(params[:id])
		@variablecost_value.update(variablecost_value_params)
		if @variablecost_value.save
			redirect_to :variablecost_values, notice: "情報を更新しました"
		else
			render "edit"
		end
	end

	def destroy
		@variablecost_value = VariablecostValue.find(params[:id])
		@variablecost_value.destroy
		redirect_to :variablecost_values, notice: "データを削除しました。"
	end
end

private

def piechart
	consumptions = VariablecostValue.where(user_id: current_user.id, title: 0)
	wastes = VariablecostValue.where(user_id: current_user.id, title: 1)
	investments = VariablecostValue.where(user_id: current_user.id, title: 2)
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