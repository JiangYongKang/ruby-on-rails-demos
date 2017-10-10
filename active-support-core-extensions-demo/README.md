```zsh
.
├── Gemfile
├── Gemfile.lock
├── README.md
├── Rakefile
├── app/
│   ├── assets/
│   │   ├── config/
│   │   │   └── manifest.js
│   │   ├── images/
│   │   ├── javascripts/
│   │   │   ├── application.js
│   │   │   ├── cable.js
│   │   │   └── channels/
│   │   └── stylesheets/
│   │       └── application.css
│   ├── channels/
│   │   └── application_cable/
│   │       ├── channel.rb
│   │       └── connection.rb
│   ├── controllers/
│   │   ├── application_controller.rb
│   │   └── concerns/
│   ├── helpers/
│   │   └── application_helper.rb
│   ├── jobs/
│   │   └── application_job.rb
│   ├── mailers/
│   │   └── application_mailer.rb
│   ├── models/
│   │   ├── account.rb                        <==
│   │   ├── application_record.rb             <==
│   │   ├── book.rb                           <==
│   │   ├── cattr_reader_writer_accessor.rb   <==
│   │   ├── class_attribute.rb                <==
│   │   ├── concerns/                         <==
│   │   ├── descendants.rb                    <==
│   │   ├── parent.rb                         <==
│   │   ├── subclasses.rb                     <==
│   │   └── user.rb                           <==
│   ├── services/
│   │   ├── single_support.rb   <==
│   │   └── user_service.rb     <==
│   └── views/
│       └── layouts/
│           ├── application.html.erb
│           ├── mailer.html.erb
│           └── mailer.text.erb
├── bin/
│   ├── bundle*
│   ├── rails*
│   ├── rake*
│   ├── setup*
│   ├── spring*
│   ├── update*
│   └── yarn*
├── config/
│   ├── application.rb
│   ├── boot.rb
│   ├── cable.yml
│   ├── database.yml
│   ├── environment.rb
│   ├── environments/
│   │   ├── development.rb
│   │   ├── production.rb
│   │   └── test.rb
│   ├── initializers/
│   │   ├── application_controller_renderer.rb
│   │   ├── assets.rb
│   │   ├── backtrace_silencers.rb
│   │   ├── cookies_serializer.rb
│   │   ├── filter_parameter_logging.rb
│   │   ├── inflections.rb
│   │   ├── mime_types.rb
│   │   └── wrap_parameters.rb
│   ├── locales/
│   │   └── en.yml
│   ├── puma.rb
│   ├── routes.rb
│   ├── secrets.yml
│   └── spring.rb
├── config.ru
├── db/
│   ├── development.sqlite3
│   ├── migrate/
│   │   ├── 20170926100036_create_users.rb                <==
│   │   ├── 20170928061256_create_books.rb                <==
│   │   ├── 20170929063954_create_accounts.rb             <==
│   │   └── 20170929065605_add_telephone_to_accounts.rb   <==
│   ├── schema.rb
│   ├── seeds.rb
│   └── test.sqlite3
├── lib/
│   ├── assets/
│   └── tasks/
├── log/
│   ├── development.log
│   └── test.log
├── package.json
├── public/
│   ├── 404.html
│   ├── 422.html
│   ├── 500.html
│   ├── apple-touch-icon-precomposed.png
│   ├── apple-touch-icon.png
│   ├── favicon.ico
│   └── robots.txt
├── test/
│   ├── application_system_test_case.rb
│   ├── controllers/
│   ├── fixtures/
│   │   ├── accounts.yml   <==
│   │   ├── books.yml      <==
│   │   ├── files/         <==
│   │   └── users.yml      <==
│   ├── helpers/
│   ├── integration/
│   ├── mailers/
│   ├── models/
│   │   ├── account_test.rb   <==
│   │   ├── book_test.rb      <==
│   │   └── user_test.rb      <==
│   ├── support/
│   │   ├── extensions_to_all_objects_test.rb   <==
│   │   ├── extensions_to_array_test.rb         <==
│   │   ├── extensions_to_class_test.rb         <==
│   │   ├── extensions_to_hash_test.rb          <==
│   │   ├── extensions_to_module_test.rb        <==
│   │   ├── extensions_to_range_test.rb         <==
│   │   └── extensions_to_regexp_test.rb        <==
│   ├── system/
│   └── test_helper.rb
├── tmp/
│   └── cache/
│       └── assets/
└── vendor/

45 directories, 90 files
```
