# Utilisez une image officielle Elixir en tant qu'image parent.
FROM elixir:latest

# Installez le client PostgreSQL.
RUN apt-get update && \
    apt-get install -y postgresql-client

# Créez un répertoire pour l'application et copiez les fichiers Elixir dedans.
WORKDIR /app
COPY . /app

# Installez le gestionnaire de paquets Hex.
RUN mix local.hex --force
RUN mix local.rebar --force

ENV MIX_ENV=prod
ENV PORT=4000

# Installez les dépendances du projet.
RUN mix deps.get


# Exposez le port sur lequel l'application écoute.
EXPOSE 4000

RUN mix compile

# Spécifiez la commande d'entrée pour lancer votre application en mode production avec les variables d'environnement.
CMD mix phx.server
