class InvestimentosController < ApplicationController
  
  def new
    @investimento = Investimento.new
  end
  
  def create
    @investimento = Investimento.new(investimento_params)
    if @investimento.price < 500
      @investimento.nivel = 1
      @investimento.gain = @investimento.price * 0.05
    elsif @investimento.price >= 500 && @investimento.price < 1000
      @investimento.nivel = 2
      @investimento.gain = @investimento.price * 0.10
    elsif @investimento.price >= 1000 && @investimento.price < 5000
      @investimento.nivel = 3
      @investimento.gain = @investimento.price * 0.15
    end
    
    if @investimento.save
      flash[:notice] = "Seu investimento foi recebido! Agradecemos a confiança."
      redirect_to investimento_path(@investimento)
    else
      render 'new'
    end
  end
  
  def show
    @investimento = Investimento.find(params[:id])    
  end
  
  def edit
    @investimento = Investimento.find(params[:id])
  end
  
  def update
    @investimento = Investimento.find(params[:id])
    if @investimento.update(investimento_params)
      flash[:notice] = "Investimento atualizado"
      redirect_to investimento_path(@investimento)
    else
      render 'edit'
    end
  end
  
  private
    def investimento_params
      params.require(:investimento).permit(:name, :price)
    end
    
end
