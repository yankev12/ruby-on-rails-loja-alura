class ProdutosController < ApplicationController

    before_action :set_produto, only: [:edit, :update, :destroy]
    def index
        @produtos = Produto.order(nome: :desc).limit(5)
        @produtos_com_desconto = Produto.order(:preco).limit(1)
    end

    def create
        @produto = Produto.new(produto_params)

        if @produto.save
            flash[:notice] = "Produto salvo com sucesso!"
            redirect_to root_path
        else
            renderiza :new
        end
    end

    def edit
        renderiza :edit
    end

    def update
        if @produto.update(produto_params)
            flash[:notice] = "Produto atualizado com sucesso!"
            redirect_to root_url
        else
            renderiza :edit
        end
    end
    
    def destroy
        @produto.destroy
        redirect_to root_path
    end

    def busca
        nome = params[:nome]
        @produtos = Produto.where "nome like ?", "%#{nome}%"
    end

    def new
        @produto = Produto.new
        renderiza :new
    end

    private

    def produto_params
        params.require(:produto).permit(:nome, :descricao, :preco, :quantidade, :departamento_id)
    end

    def set_produto
        @produto = Produto.find(params[:id])
    end

    def renderiza(view)
        @departamentos = Departamento.all
        render view
    end
end
