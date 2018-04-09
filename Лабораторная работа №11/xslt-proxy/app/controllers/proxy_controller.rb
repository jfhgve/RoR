require 'open-uri'
require 'nokogiri'
class ProxyController < ApplicationController
  before_action :parse_params, only: :output
  before_action :prepare_url, only: :output

  def input; end

  def output
    api_response = open(@url)
    render xml: api_response if @side == 'xml'
    @result = xslt_transform(api_response).to_html if @side == 'server'
    render xml: xslt_browzer_transform(api_response).to_xml if @side == 'client-with-xslt'
  end

  def parse_params
    @n = params[:n]
    @side = params[:side]
  end
  private

  BASE_API_URL = 'http://localhost:3000/?format=xml'.freeze
  XSLT_SERVER_TRANSFORM = "#{Rails.root}/public/server_transform.xslt".freeze
  XSLT_BROWZER_TRANSFORM = '/browzer_transform.xslt'.freeze


  def prepare_url
    @url = BASE_API_URL + "&n=#{@n}"
  end

  def xslt_transform(data, transform: XSLT_SERVER_TRANSFORM)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read(transform))
    xslt.transform(doc)
  end

  def xslt_browzer_transform(data, transform: XSLT_BROWZER_TRANSFORM)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc,
                                                    'xml-stylesheet',
                                                    'type="text/xsl" href="' + transform + '"')
    doc.root.add_previous_sibling(xslt)
    doc
  end
end
