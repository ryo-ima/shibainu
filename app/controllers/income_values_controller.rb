class IncomeValuesController < ApplicationController
	before_action :authenticate_user!

	def index
		@income_values = IncomeValue.where(user_id: current_user.id,).order(year_month: "ASC")
	end

	def show
		@income_value = IncomeValue.find(params[:id])
	end

	def new
		@income_value = IncomeValue.new
		year_month_day = params[:year_month] + "-01"
		@year_month = year_month_day.to_date

		# @form = Form::IncomeForm.new
	end

	def edit
		@income_value = IncomeValue.find(params[:id])
	end

	def create
		@income_value = IncomeValue.new(income_value_params)
		if @income_value.save
			redirect_to :income_values, notice: "登録しました"
		else
			redirect_to :income_values, notice: "登録に失敗しました"
		end
	end

	def income_value_params
		params
			.require(:income_value)
			.permit(:title, :value, :description, :year_month)
			.merge(user_id: current_user.id)
	end

	def update
		@income_value = IncomeValue.find(params[:id])
		@income_value.update(income_value_params)
		if @income_value.save
			redirect_to :income_values, notice: "情報を更新しました"
		else
			render "edit"
		end
	end

	def destroy
		@income_value = IncomeValue.find(params[:id])
		@income_value.destroy
		redirect_to :income_values, notice: "データを削除しました。"
	end

end
