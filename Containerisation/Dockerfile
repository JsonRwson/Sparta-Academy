# State the base image to be used
FROM nginx:alpine-slim

# What we want in the image
COPY index.html /usr/share/nginx/html

# What ports will the image need to use
# We arent mapping ports here
# We are creating an image, we need to map ports when we use it
EXPOSE 80

# Launch the server
CMD ["nginx", "-g", "daemon off;"]

# Note - Each command in this file is a seperate layer of the image built
# docker build . -t jrowson/test_website_img
# docker build . -t jrowson/test_website_img:slim