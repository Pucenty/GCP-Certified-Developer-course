Provision simple Python HTTP webserver:

cd `mktemp -d` \
    && echo '<html><body>Hello World</body></html>' >./index.html \
    && python -m http.server 8080
