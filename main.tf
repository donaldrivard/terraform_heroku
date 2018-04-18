provider "heroku" {
  email   = "${var.heroku_email}"
  api_key = "${var.heroku_api_key}"
}

resource "heroku_app" "default" {
  name   = "${var.app_name}"
  region = "eu"

  buildpacks = [
    "heroku/ruby",
  ]

  # config_vars {
  #   FOOBAR = "baz"
  # }

  provisioner "local-exec" {
    command = "./git.sh ${heroku_app.default.git_url}"
  }
}

resource "heroku_addon" "database" {
  app  = "${heroku_app.default.name}"
  plan = "heroku-postgresql:hobby-dev"
}

resource "heroku_addon_attachment" "database" {
  app_id   = "${heroku_app.default.id}"
  addon_id = "${heroku_addon.database.id}"
}

output "url" {
  value = "${heroku_app.default.web_url}"
}

output "git_url" {
  value = "${heroku_app.default.git_url}"
}
