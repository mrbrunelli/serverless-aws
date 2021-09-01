# 1. criar arquivo de políticas de segurança
# 2. criar role de segurança na AWS

aws iam create-role \
  --role-name lambda-exemplo \
  --assume-role-policy-document file://policy.json \
  | tee logs/role.log

# 3. criar arquivo com conteudo e zipa-lo
zip function.zip index.js

aws lambda create-function \
  --function-name hello-cli \
  --zip-file fileb://function.zip \
  --handler index.handler \
  --runtime nodejs14.x \
  --role arn:aws:iam::721871044291:role/lambda-exemplo \
  | tee logs/lambda-create.log

# 4. invocar o lambidão
aws lambda invoke \
  --function-name hello-cli \
  --log-type Tail \
  logs/lambda-exec.log

# 5. atualizar e zipar
zip function.zip index.js

# 6. atualizar lambidão
aws lambda update-function-code \
  --zip-file fileb://function.zip \
  --function-name hello-cli \
  --publish \
  | tee logs/lambda-update.log

# 7. invocar de novo o bixo
aws lambda invoke \
  --function-name hello-cli \
  --log-type Tail \
  logs/lambda-exec.log

# ao final, remover toda a bagaça (lambidão e rola)
aws lambda delete-function \
  --function-name hello-cli

aws iam delete-role \
  --role-name lambda-exemplo