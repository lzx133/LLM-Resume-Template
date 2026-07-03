FROM registry.baidubce.com/apollo/apollo-env-gpu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN rm -f /etc/apt/sources.list.d/apollo*.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        fonts-dejavu-core \
        fonts-noto-cjk \
        latexmk \
        poppler-utils \
        texlive-lang-chinese \
        texlive-latex-extra \
        texlive-xetex \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i '/apollo-pkg-beta/d' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends texlive-fonts-recommended \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work

ENV TEXINPUTS=/work/fontawesome5//:
ENV HOME=/tmp

CMD ["latexmk", "-xelatex", "-interaction=nonstopmode", "-halt-on-error", "resume-autonomous-driving.tex"]
