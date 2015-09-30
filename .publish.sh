#!/bin/bash -e
if ([ "$TRAVIS_BRANCH" == "master" ] || [ ! -z "$TRAVIS_TAG" ]) && \
  [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  echo "Deploying image to docker hub"
  # Setup login
  openssl aes-256-cbc -K $encrypted_cbd0800f6b0a_key -iv $encrypted_cbd0800f6b0a_iv -in .dockercfg.enc -out ~/.dockercfg -d
  docker push "camptocamp/puppet:${TRAVIS_TAG}"
else
  echo "Not deploying image"
fi
