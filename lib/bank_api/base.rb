require 'net/http'

module BankAPI
  class Base
    attr_accessor :user, :token, :conn

    def initialize(user)
      self.user = user

      url = 'https://hackathon.postbank.de:443'
      # ssl_settings = { ca_path: Rails.root.join('vendor', 'cert', 'pb.pem').to_s }
      self.conn = Faraday.new(url: url, ssl: cert_opts) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end

      self.token = fetch_token
    end

    private

    def path(additional = null)
      path = '/bank-api/blau/postbankid'
      path = "#{path}/#{additional}" if additional
      path
    end

    def cert_opts
      {
        client_cert: cert_object,
        client_key: key_object,
        verify: false
      }
    end

    def cert_file
      Rails.root.join 'vendor', 'cert', 'pb.pem'
    end

    # create an x509 certificate
    def cert_object
      OpenSSL::X509::Certificate.new File.read(cert_file)
    end

    # create PKey
    def key_object
      OpenSSL::PKey.read File.read(cert_file)
    end

    def fetch_token
      response = conn.post do |req|
        req.url path('token'), username: user.pb_id, password: user.pb_pw

        req.headers['Content-Type'] = 'application/json'
      end

      fail 'It\'s not working man, grab a beer and debug this foo' unless response.status == 200

      JSON.parse(response.body)['token']
    end
  end
end
