FROM ruby:alpine

ENV ENTRYKIT_VERSION 0.4.0
RUN wget --quiet https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && tar -xvzf entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && rm entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
  && mv entrykit /bin/entrykit \
  && chmod +x /bin/entrykit \
  && entrykit --symlink

RUN mkdir /worker
WORKDIR /worker

ENTRYPOINT [ \
  "prehook", \
    "bundle install -j4 --quiet", \
    "--" \
]

CMD ["bundle", "exec", "faktory-worker", "-q", "hello", "-r", "./app.rb"]
