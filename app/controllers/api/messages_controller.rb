class Api::MessagesController < Api::BaseController
  def collection
    sender_id = params[:sender_id]
    receiver_id = params[:receiver_id]

    collection = super
    return collection.where(:sender_id => [sender_id, receiver_id],
                     :receiver_id => [sender_id, receiver_id] ).order("created_at DESC") if sender_id && receiver_id
    collection.where(:receiver_id => receiver_id).order("created_at DESC") if receiver_id && sender_id.nil?
    
  end
end
