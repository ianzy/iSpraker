class Api::BaseController < ApplicationController
  inherit_resources
  
  before_filter :authenticate_api_key_and_token!
  
  respond_to :json
  
  # standardized exception handling
  [
    {:klass => InvalidParameters, :status => 422, :errors => ['invalid parameters']},
    {:klass => ActiveRecord::RecordNotFound, :status => 404, :errors => ['not found']}
  ].each do |h|
    rescue_from h[:klass] do |e|
      render_errors_json(h[:errors], h[:status])
    end
  end
  
  def index
    respond_to do |format|
      format.json do
        render :json => { :data => collection, :paging => pagination_data(collection) }
      end
    end
  end
  
  def show
    respond_to do |format|
      format.json do
        render :json => { :data => resource, :paging => nil }
      end
    end
  end
  
  actions :all, :except => %w( edit new )
  attr_accessor :current_user
  
  # use pagination for all collections
  def collection
    requested_options = params.only("page", "per_page").symbolize_keys
    default_pagination_options = {:page => 1, :per_page => 10}.merge(requested_options)

    collection = get_collection_ivar || set_collection_ivar(end_of_association_chain)
    collection.page(default_pagination_options[:page]).per(default_pagination_options[:per_page])
  end
  
  def authenticate_api_key_and_token!
    render(:json => {"error" => "invalid API key or token"}, :status => 403) and return unless (key = ApiKey.find_by_key(params[:api_key]) && (user = User.find_by_token(params[:token])))
    self.current_user = user
  end
  
  private
    def render_errors_json(errors, status)
      render :json => {'errors' => errors.map{|x| {'error' => x}}}, :status => status
    end
    
    def pagination_data(collection)
      return {} unless collection && collection.respond_to?(:current_page)
      {
        :current_page => collection.current_page,
        :per_page => collection.limit_value,
        :total_count => collection.total_count,
        :num_pages => collection.num_pages
      }
    end
end
