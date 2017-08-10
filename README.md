# init.vim

Com o [Neovim](https://neovim.io/) ficando cada vez mais estável, já chegamos a um ponto em que é possível usá-lo no dia-a-dia. #sddsvim

Dentre as opções para instalação simples de plugins, atualmente o que se está usando nesse mundão véio afora é o [Plug](https://github.com/junegunn/vim-plug). Veja as instruções de instalação aí na página e o resto é:

<!-- 1. Copiar este fodendo arquivo de configuração para `$HOME/.config/nvim/`
2. Criar a pasta `$HOME/.config/nvim/plugged`
3. Colocar para instalar os plugins com `:PlugInstall` -->


1. Clonar este fodendo repositório para algum lugar da sua máquina (e.g. `$HOME`)
2. Criar um link simbólico do arquivo `init.vim` para `$HOME/.config/nvim/`
3. Criar a pasta `$HOME/.config/nvim/plugged`
4. Acessar o amigo nvim e instalar os plugins com `:PlugInstall`

``` bash
cd $HOME
git clone https://github.com/tarciozemel/init.vim
ln -s $HOME/init.vim/init.vim $HOME/.config/nvim/init.vim
```

Mas acha que vai ser tão fácil assim, _cabrón_? Se fosse, eu fazia com a esquerda.

## Observações

Antes de usar esse `init.vim` como se não houvesse amanhã, dê uma olhada nas configurações e plugins para não instalar coisa que você não quer/precisa usar. O arquivo está relativamente bem comentado e, na dúvida, há sempre o link para a página do respectivo repo, com explicações detalhadas.

Para o **vim-airline** ficar com uma aparência melhor, é interessante instalar as 
fontes personalizadas recomendadas. Dê uma olhada 
em [como fazer a integração com as Powerline fonts](https://github.com/bling/vim-airline#integrating-with-powerline-fonts).

Há uma configuração que altera onde arquivos de swap são armazenados, especificando que todos devem ir para um só diretório para não ficar lotando as pastas dos projetos com porcaria. Se for manter essa artimanha, crie o diretório `$HOME/.config/nvim/swap`.

Uma das partes mais chatinhas é referente ao combo **deoplete.nvim** (para autocompletes) + **Tern** (autocomplete específico de JavaScript). Apesar de, em teoria, já haver instruções para rodar alguns comandos automaticamente, de repente é bom precaver e:

* Instalar o Tern globalmente com `npm install -g tern`
* Rodar um `npm install` em `$HOME/.config/nvim/plugged/tern_for_vim/`
* (opcionalmente) Configurar seu `.tern-project` [conforme seja necessário](http://ternjs.net/doc/manual.html#configuration)

**WakaTime** é o plugin de um serviço de mesmo nome que serve para marcar o tempo 
em que se fica trabalhando em projetos. Para mais informações e para gerar a chave 
necessária para usar o plugin, acesse o [site oficial do WakaTime](https://wakatime.com/).

E aprenda a usar o [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) (que já vai ser instalado para essas suas mãos preguiçosas usufruirem). Isso separa os meninos dos homens.

## A gente se vê pela web!

Ficou alguma dúvida sobre como instalar e/ou usar algum plugin ou para o quê serve alguma configuração? Se vira. Não tenho filho desse tamanho.

Tô de zoas... Se tiver dúvidas/sugestões/dicas/comentários, é só [abrir uma issue](https://github.com/tarciozemel/init.vim/issues/new) ou enviar uma mensagem para `tarciozemel[arrobis]gmail[pontis]com`.

A gente se vê pela web!  ;-)

PS: Este repo é feito, testado e voltado exclusivamente para ambientes *NIX. Se você estiver usando algum diferente e funcionar, meus parabéns; senão, só lalá.