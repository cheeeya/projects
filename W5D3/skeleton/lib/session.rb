require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    cookie_hash = req.cookies['_rails_lite_app']
    if cookie_hash
      @cookie = JSON.parse(cookie_hash)
    else
      @cookie = {}
    end
  end

  def [](key)
    @cookie[key]
  end

  def []=(key, val)
    @cookie[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    cookie_attributes = { path: '/', value: @cookie.to_json }
    res.set_cookie('_rails_lite_app', cookie_attributes)
  end
end
