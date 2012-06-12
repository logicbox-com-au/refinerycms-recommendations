###Usage:
The usual:
* bundle install
* rails generate refinery:recommendations
* rake db:migrate db:seed

###Functionality:
Hopefully similair to Testimonials refinery1.0 gem, but with:
* Compatability with refinerycms 2.0
* BE/admin: Ability to load new recommendations with photo, video and company links etc.
* FE: Displays all recomendations data for all on both index page and individual shows (including friendly ids to maximise seo)

Items todo.
* Homepage widgets (with rotating display of selections made in BE)

###Additional things you might like to do
####Change the name from recommendations to say testimonials.
* Easiest way, after installing the gem, copy across the components from config/locales/en.yml that you'd like to rename, i.e:
en:
  refinery:
    plugins:
      recommendations:
        title: Testimonials
