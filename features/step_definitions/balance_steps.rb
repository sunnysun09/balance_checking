Given("I navigate to the page on Chrome") do
  @balanceDetail = BalanceDetail.new(@browser)
end

When("the page is loaded") do
  @balanceDetail.loadpage
end

Then("verify the text fields and total balance are correct") do
  @balanceDetail.verify_balance
end