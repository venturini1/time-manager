# Utilisez une image officielle Elixir en tant qu'image parent.
FROM elixir:1.15.7

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

# Exécutez les migrations pour créer la base de données et les tables nécessaires (ajouté cette étape).
RUN mix ecto.create
RUN mix ecto.migrate

# Exposez le port sur lequel l'application écoute.
EXPOSE 4000

# Compilez le projet (si nécessaire).
RUN mix compile

# Spécifiez la commande d'entrée pour lancer votre application en mode production avec les variables d'environnement.
CMD mix phx.server
