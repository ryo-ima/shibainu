class VariablecostValuesController < ApplicationController
	def index
		@variablecost_values = VariablecostValue.order(year_month: "ASC")
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
