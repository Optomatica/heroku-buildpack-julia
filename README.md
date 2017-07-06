heroku-buildpack-julia
======================

The unofficial Heroku buildpack for Julia apps.  https://devcenter.heroku.com/articles/buildpacks

Here is a sample morsel webserver that is using this buildpack. [Sample Morsel Webserver](https://github.com/amgad-naiem/morsel-on-heroku-test)


Note: if you're using python libraries in your server, you'll need to add `Pkg.build("PyCall")` in the begining of your app before the using libraries statement
