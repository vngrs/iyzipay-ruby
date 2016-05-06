module Iyzipay
  module Model
    class RefundChargedFromMerchant < IyzipayResource

      def create(request = {}, options)
        pki_string = to_pki_string(request)
        HttpClient.post("#{options.base_url}/payment/iyzipos/refund/merchant/charge", get_http_header(pki_string, options), request.to_json)
      end

      def to_pki_string(request)
        PkiBuilder.new.append_super(super).
            append(:paymentTransactionId, request[:paymentTransactionId]).
            append_price(:price, request[:price]).
            append(:ip, request[:ip]).
            get_request_string
      end
    end
  end
end