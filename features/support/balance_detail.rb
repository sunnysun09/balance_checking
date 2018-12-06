require 'page-object'
require "net/http"

class BalanceDetail
  include PageObject
  
  def initialize(browser)
    @browser = browser
  end
  
  def loadpage
    
    #@browser.goto 'https://www.exercise1.com/values'
    @browser.goto 'C:\Users\guaizi\test\balance\features\TestForm.html'

    sleep 2
    
    @val1_str =  @browser.text_field(:id => 'txt_val_1')
    @val2_str =  @browser.text_field(:id => 'txt_val_2')
    @val3_str =  @browser.text_field(:id => 'txt_val_3')
    @val4_str =  @browser.text_field(:id => 'txt_val_4')
    @val5_str =  @browser.text_field(:id => 'txt_val_5')
    @balance_str =  @browser.text_field(:id => 'txt_ttl_val')   
  end
  
  def verify_values_appear
    puts "      Verify values appears"
    
    if !(@val1_str.exists? && @val2_str.exists? && @val3_str.exists? \
          && @val4_str.exists? && @val5_str.exists? && @balance_str.exists?)
      raise "Value fields should appear"
    end
  end
  
  def verify_values_currency_format
    puts "      Verify values are in currency format"
   
    if check_currency_format(@val1_str.value) || check_currency_format(@val2_str.value) \
        || check_currency_format(@val3_str.value) || check_currency_format(@val4_str.value) \
        || check_currency_format(@val5_str.value) || check_currency_format(@balance_str.value)
      raise "Value fields are not in currency format"
    end
     
    @val1 =  currency_to_float(@val1_str.value)
    @val2 =  currency_to_float(@val2_str.value)
    @val3 =  currency_to_float(@val3_str.value)
    @val4 =  currency_to_float(@val4_str.value)
    @val5 =  currency_to_float(@val5_str.value)
    @balance =  currency_to_float(@balance_str.value)
  end
  
  def verify_values_greater_than_zero
    puts "      Verify values larger than 0"
    if @val1.zero? || @val2.zero? || @val3.zero? || @val4.zero? || @val5.zero?
      raise "Value fields should be greater than 0"
    end
  end
  
  def verify_balance_correct
    puts "      Verify balance is right"
    @calc_total = @val1 + @val2 + @val3 + @val4 + @val5   #   + 3000
    if !(@calc_total -  @balance).zero?
      raise "Total balance should be $#{@calc_total}, not $#{@balance}"
    end
  end
  
  # check whether the number is in "$23329.50" format
  def check_currency_format(currency)
    currency.gsub(/^(?!0\.00)\d{1,3}(,\d{3})*(\.\d\d)?$/, '').empty?
  end
  
  def currency_to_float(currency)
    currency.gsub(/[^\d^\.]/, '').to_f
  end
  
  def verify_balance
     verify_values_appear
     verify_values_currency_format
     verify_values_greater_than_zero
     verify_balance_correct
  end

end