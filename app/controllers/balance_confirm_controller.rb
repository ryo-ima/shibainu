class BalanceConfirmController < ApplicationController
  def top
  end

  def show
    @year_month = params[:year_month] + "-01"

    #収入計算
		@income_values =IncomeValue.where(year_month: @year_month)
		@income_value_total = cal_income_total(@income_values)


		#変動費計算
		@variablecost_values = VariablecostValue.where(year_month: @year_month)
		@variablecost_value_total = cal_variablecost_total(@variablecost_values)

		#収支差
		@balance_difference = @income_value_total - @variablecost_value_total

	end

	def show_year
		year = params[:year]
		@year = year
		months = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" ]
		year_months = months.map do |month|
			year+"-"+month+"-01"
		end

		puts year_months

		#年度の収入配列を作成
		i=0
		total = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]
    gon.data_incomes = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]	#グラフ用データ
		year_months.each do |year_month|
			income_values = IncomeValue.where(year_month: year_month)
			if income_values.present?
				total[i] = cal_income_total(income_values)
        gon.data_incomes[i] = total[i]	#グラフ用データ
			end
			i += 1
		end
		@income_value_totals = total


		#年度の変動費配列を作成
		i=0
		total = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]
    gon.data_variablecosts = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]	#グラフ用データ
		year_months.each do |year_month|
			variablecost_values = VariablecostValue.where(year_month: year_month)
			if variablecost_values.present?
				total[i] = cal_variablecost_total(variablecost_values)
        gon.data_variablecosts[i] = total[i]	#グラフ用データ
			end
			i += 1
		end
		@variablecost_value_totals = total

		#年度の収支結果を計算
		@balance_differences = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]
    gon.data_results = [nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil,nil]	#グラフ用データ
		0.upto(11) do |i|
			if @income_value_totals[i].present?
				@balance_differences[i] = @income_value_totals[i] - (@fixedcost_value_totals[i] + @variablecost_value_totals[i])
        gon.data_results[i] = @balance_differences[i]	#グラフ用データ
			end
		end
	end

	#収入トータル計算
	def cal_income_total(income_values)
		income_value_total = 0 #固定費合計
		income_values.each do |income_value|
			income_value_total += income_value.value
		end
		income_value_total
	end

	#変動費トータル計算
	def cal_variablecost_total(variablecost_values)
		variablecost_value_total = 0 #変動費合計
		variablecost_values.each do |variablecost_value|
			variablecost_value_total += variablecost_value.value
		end
		variablecost_value_total
	end
end
