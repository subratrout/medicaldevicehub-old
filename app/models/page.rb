class Page < ActiveRecord::Base

	def self.text_search(search)
			if search.present?
				where("generic_name @@ :s or trade_name @@ :s or description @@ :s or applicant @@ :s", s: search)
				redirect_to page_path
			else
				all
			end
		end
end