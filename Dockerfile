FROM python:3.12
LABEL org.opencontainers.image.source=https://github.com/tvaroska/skills_image

WORKDIR /app

COPY adk.json /app/
COPY Skill_Seekers /app

RUN pip install .

# ENTRYPOINT ["skills_seeker", "unified", "--config"]
# CMD ["adk.json"]