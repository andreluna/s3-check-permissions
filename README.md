### Script para verificação de permissão em Buckets S3

#### Documentação de referência:

* https://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-chap-configure.html
* https://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-chap-configure.html
* https://shellzen.net/aws-criacao-de-chaves-de-acesso-e-awscli/


#### Como utilizar? 
    
É preciso ter configurado em seu computador os profiles utilizando o AWSCLI.
O objetivo é, com o profile verdadeiro executar a listagem de todos os buckets em sua conta 
e com o segundo profile, que chamaremos de falso tentar enviar um arquivo TXT para o bucket.

Caso a permissão do seu bucket esteja com permissão de escrita liberada, o script vai conseguir 
enviar o arquivo poc.txt para dentro do bucket.

***PROFILE_TRUTH*** é o profile do AWSCLI com a permissão para listar todos os buckets.

***PROFILE_FAKE*** é o profile que não deveria ter permissão para escrever no bucket, seu objetivo
é simular o acesso de terceiro sem autorização.

![Image](https://raw.githubusercontent.com/andreluna/s3-check-permissions/master/images/s3_001.PNG)

![Image](https://raw.githubusercontent.com/andreluna/s3-check-permissions/master/images/s3_002.PNG)

![Image](https://raw.githubusercontent.com/andreluna/s3-check-permissions/master/images/s3_003.PNG)


