module ApplicationHelper
  def site_name
    # Change the value below between the quotes.
    "Sweety"
  end

  def site_url
    if Rails.env.production?
      # Place your production URL in the quotes below
      "http://http://www.sweety.com/"
    else
      # Our dev & test URL
      "http://localhost:3000"
    end
  end
end
