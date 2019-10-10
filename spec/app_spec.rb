require_relative '../lib/app'

describe "the scrapper still work" do
    it "should return an array not nil" do
      expect(join_my_two_arrays(take_symbol("https://coinmarketcap.com/all/views/all/"),take_value("https://coinmarketcap.com/all/views/all/"))).not_to be_nil
    end
end

