require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true
  
  config.active_job.queue_adapter = :inline

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.disable_request_forgery_protection = true
  config.hosts.clear
end

#1章
#「rails new meshiterro」実行
#config/environments/development.rb内一番下のendの上に「config.hosts.clear」と記述
#「rails g controller homes top」実行
#config/routes.rb内に「get 'homes/top'」と「root to: "homes#top"」追加
#app/views/homes/top.html.erb内に「<h1>Topページ</h1>」追加・P内は中身だけ消す。
#「rails active_storage:install」実行
#「rails db:migrate」実行
#Gemfile内の「# gem 'image_processing', '~> 1.2'」の下に「gem 'image_processing', '~>1.2'」追加
#「bundle install」実行
#config/environments/development.rb内「config.active_record.verbose_query_logs = true」の下に
 #「config.active_job.queue_adapter = :inline」追加
#5-1の下の「画像」クリック、ダウンロード
#app/assets内にドラック&ドロップ(Overwrite か Skip を訊かれたときは、Overwrite を指定)

#2章

#3章

#4章
#Gemfile内の一番最後に「gem 'devise'」追加
#「bundle install」実行

#5章
#「rails g devise:install」実行
#「rails g devise User」実行
#db/migrate/（年月日時分秒）_devise_create_users.rb内の「# t.datetime :locked_at」の下に以下追加
 #「## 名前を保存するカラム」
 #「t.string :name」
#「rails db:migrate」実行

#6章
#「rails g devise:views」実行
#app/views/devise/registrations/new.html.erb内の3行目の後に
 #「<div class="field"><%= f.label :name %><br><%= f.text_field :name %></div>」を4行に分けて追加
#app/controllers/application_controller.rb内1行目の下に
 #meshiterro6/app/controllers/application_controller.rb内2行目以降追加
#app/views/layouts/application.html.erb内にmeshiterro6/app/views/layouts/application.html.erb内の「<body>/<header>内」追加
#app/views/devise/registrations/new.html.erb内2行目に「<%= form_with model: @user, url: user_registration_path do |f| %>」追加
#app/views/devise/sessions/new.html.erb内2行目に「<%= form_with model: @user, url: user_session_path do |f| %>」追加

#7章
#Aboutページの作成
 #config/routes.rb内の「get 'homes/top'」を「get 'homes/top' =>"homes#top"」に書き換え、その次行に「get "homes/about" =>"homes#about", as: 'about'」追加
 #app/views/homes内に新ファイル「about.html.erb」追加about.html.erb内に「<h1>Aboutページ</h1>」記述
#app/controllers/application_controller.rb内の「before_action」の下に「def after_sign_in..end」追加
#app/controllers/application_controller.rb内の「def after_sign_in..end」の下に「def after_sign_out..end」追加

#8章
#「rails g model PostImage」実行
#db/migrate/(作成日時）_create_post_images.rb内に「t.string :title」「t.string :body」追加
#「rails db:migrate」実行
#app/models/post_image.rb内に「has_one_attached :image」追加

#9章
#app/models/user.rb内の「end」の上に「has_many :post_images, dependent: :destroy」記述
#app/models/post_image.rb内「has_one_attached :image」の下に「belongs_to :user」追加
#「rails g controller PostImages new index show」実行
#config/routes.rb内の「get 'post_images/new'～get 'post_images/show'」を「resources :post_images, only: [:new, :index, :show]」に変更