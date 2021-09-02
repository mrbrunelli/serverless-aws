# 1. instalar o serverless framework
npm i -g serverless

# 2. iniciar um projeto com sls
sls

# 3. sempre fazer deploy antes de tudo para verificar se está com ambiente ok
sls deploy

# 4. invocar o bixo na AWS e trazer o resultado local
sls invoke -f hello

# 5. invocar local
sls invoke local -f hello --log

# 6. configurar dashboard do sls
sls -> deploy (Y)

# 7. verificar logs da função
sls logs -f hello --tail

# 8. remover tudo que foi criado na AWS
sls remove

