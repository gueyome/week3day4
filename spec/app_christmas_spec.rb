require_relative '../lib/app_christmas'

describe "the scrapper still work" do
    it "should return an array not nil" do
      expect(join_my_two_arrays(get_townhall_cities("http://www.annuaire-des-mairies.com/val-d-oise.html"),get_all_emails("http://www.annuaire-des-mairies.com/val-d-oise.html"))).not_to be_nil
    end
end
