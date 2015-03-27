require 'mechanize'

#Initializes a mechanize object
mechanize = Mechanize.new

#Loads the Cyberoam page in 'page'
page = Mechanize.new{|a| a.ssl_version, a.verify_mode = 'SSLv23', OpenSSL::SSL::VERIFY_NONE}.get "https://10.100.56.55:8090/httpclient.html"

#Finds first form in the page
form = page.forms.first

#Finds fields by 'name' and filling the values for it.
form['username'] = '201201179'
form['password'] = 'innersanctum'

#Submit the form.
page = form.submit

#Desktop notification that you have successfully signed in.
exec 'notify-send "Cyberoam" "Signed in successfully."'