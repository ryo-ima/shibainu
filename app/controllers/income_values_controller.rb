class IncomeValuesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_incomevalue, only: [:show, :edit, :update, :destroy]
	before_action :user?, only: [:show, :edit, :update, :destroy]

	def index
		@income_values = IncomeValue.where(user_id: current_user.id,).order(year_month: "ASC")
	end

	def show

	end

	def new
		@income_value = IncomeValue.new

		# @form = Form::IncomeForm.new
	end

	def edit

	end

	def create
		@income_value = IncomeValue.new(income_value_params)
		if @income_value.save
			redirect_to :income_values, notice: "登録しました"
		else
			redirect_to :income_values, notice: "登録に失敗しました"
		end
	end

	def update

		@income_value.update(income_value_params)
		if @income_value.save
			redirect_to :income_values, notice: "情報を更新しました"
		else
			render "edit"
		end
	end

	def destroy

		@income_value.destroy
		redirect_to :income_values, notice: "データを削除しました。"
	end
private

	def set_incomevalue
		@income_value = IncomeValue.find(params[:id])
	end

	def user?
		if @income_value.user_id != current_user.id
			redirect_to action: "index"
		end
	end

	def income_value_params
		params
			.require(:income_value)
			.permit(:title, :value, :description, :year_month)
			.merge(user_id: current_user.id)
	end
end
