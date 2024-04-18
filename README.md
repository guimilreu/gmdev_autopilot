# GM Dev - Piloto Automático

Com uma interface intuitiva e agradável, o Piloto Automático da **GM Dev** proporciona uma experiência única ao tornar possível que o jogador navegue pelo mapa sem ter que encostar um dedo no teclado, com flexibilidade, podendo alterar a velocidade máxima de seu veículo e parar a qualquer momento.

## Demonstração
![Preview image](https://i.imgur.com/yY7ljj5.png)

## Recursos

- **Interface Limpa e Simples:** Uma interface minimalista e com apenas o essencial, garantindo uma experiência de usuário agradável.
- **Ativação Simples:** Basta marcar o destino no mapa e pressionar a tecla **N** para iniciar o piloto automático.
- **Velocidade Personalizável:** Defina a velocidade máxima do piloto automático de acordo com suas preferências pressionando as teclas **-** ou **+**.
- **Whitelist de Veículos:** Configure facilmente quais veículos estão autorizados a utilizar o piloto automático.
- **Compatibilidade com o [gmdev_notify](https://github.com/guimilreu/gmdev_notify):** Total compatibilidade com nosso script de notificações, proporcionando uma melhor experiência de jogo.

## Configuração

1. **Whitelist de Carros:**
   - Edite o arquivo `config.lua` e adicione ou remova os veículos desejados da whitelist.

2. **Compatibilidade com gmdev_notify:**
   - Este script é completamente compatível com nosso script de notificações **gmdev_notify**. Para uma experiência mais completa e agradável, recomendamos instalá-lo. Você pode encontrar mais informações e baixar o script [aqui](https://github.com/guimilreu/gmdev_notify).

3. **Configurações Adicionais:**
   - No arquivo `config.lua`, você pode ajustar as seguintes variáveis de acordo com suas preferências:
     - Velocidade Máxima: A velocidade máxima que o piloto automático pode atingir.
     - Velocidade Mínima: A velocidade mínima permitida pelo piloto automático.
     - Velocidade Inicial: A velocidade inicial ao iniciar o piloto automático.
     - Incremento de Velocidade: O aumento ou diminuição da velocidade a cada pressionamento das teclas + ou -.
     - Distância de Parada: A distância em metros até o destino em que o piloto automático deve parar e considerar a rota concluída.

## Utilização

1. Certifique-se de estar em um veículo permitido pela whitelist.
2. Marque o destino desejado no mapa.
3. Pressione a tecla **N** para ativar o piloto automático.
4. Pressione as teclas **-** ou **+** para definir a velocidade desejada.

#
![GM Dev](https://i.imgur.com/ghdtKmx.png)

Gostou deste script? Conheça mais sobre a GM Dev, e junte-se à nossa comunidade no Discord para ficar por dentro das últimas novidades, receber suporte e interagir com outros desenvolvedores.

- **GM Dev:** [https://discord.gg/nBteuHPYgg](https://discord.gg/nBteuHPYgg)

## Licença

[MIT](https://raw.githubusercontent.com/guimilreu/gmdev_autopilot/main/LICENSE)
