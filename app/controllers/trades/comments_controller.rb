class Trades::CommentsController < CommentsController
  before_action :set_commentable

  private

  def set_commentable
    @commentable = Trade.find_by(id: params[:trade_id])
  end
end
