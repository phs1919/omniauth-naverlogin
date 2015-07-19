# encoding: utf-8
require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Naver < OmniAuth::Strategies::OAuth2
      option :name, "naver"

      option :client_options, {
        site: "https://nid.naver.com",
        authorize_url: "https://nid.naver.com/oauth2.0/authorize",
        token_url: "https://nid.naver.com/oauth2.0/token"
      }

      uid { raw_info["id"] }

      info do
        {
          name: raw_info["name"],
          email: raw_info["email"],
          nickname: raw_info["nickname"],
          gender: gender,
          image: raw_info["profile_image"],
          age: raw_info["age"],
          birthday: raw_info["birthday"]
        }
      end

      extra do
        {
          "raw_info" => raw_info
        }
      end

      # ===============================================================
      # 
      #                             PRIVATE
      # 
      # ===============================================================
      private       

        # Returns raw data using access token
        #
        # @example
        #   <?xml version="1.0" encoding="UTF-8"?>
        #   <data>
        #      <result>
        #         <resultcode>00</resultcode>
        #         <message>success</message>
        #      </result>
        #      <response>
        #         <enc_id>AkKauiSQz</enc_id>
        #         <nickname>naverIDLogin</nickname>
        #         <id>UNIQUEID</id>
        #         <gender>M</gender>
        #         <age>40-49</age>
        #         <birthday>01-01</birthday>
        #         <profile_image>http://naver.com/image.url.jpg</profile_image>
        #         <name>username</name>
        #      </response>
        #   </data>
        # @note Default response is in XML
        # @see https://nid.naver.com/devcenter/docs.nhn?menu=API
        #      Section 6.1
        #
        def raw_data
          @raw_data ||= access_token.get(
            "https://apis.naver.com/nidlogin/nid/getUserProfile.xml"
          ).parsed
        end

        # Returns raw info based on raw_data
        # 
        # @example TODO
        # 
        def raw_info
          @raw_info ||= raw_data["data"]["response"]
        end

        # Returns gender info
        # 
        # @note M refers to male, F refers to female
        # @see https://nid.naver.com/devcenter/docs.nhn?menu=API 
        #      Section 6.1
        #         
        def gender
          if raw_info['gender'].include?('M')
            '남성'
          elsif raw_info['gender'].include?('F')
            '여성'
          else
            nil
          end
        end
    end
  end
end

OmniAuth.config.add_camelization "naverlogin", "NaverLogin"