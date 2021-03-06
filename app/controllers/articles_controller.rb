class ArticlesController < ApplicationController
before_filter :authenticate_user!
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
  if  @article.update(article_params)
   
    redirect_to @article
  else
    render action: 'edit'
  end
  end

  def new
    
  end
  def create
  # render plain: params[:article].inspect
  @article = Article.new article_params
  
  if  @article.save
   
    redirect_to @article
  else
    render action: 'new'
  end
end
def show
  @article = Article.find(params[:id])
  @comments = @article.comments
end

def destroy
  @article = Article.find(params[:id])
   if @article.destroy

  redirect_to '/'
end
end

private

def article_params
  params.require(:article).permit(:title, :text)
end

end
