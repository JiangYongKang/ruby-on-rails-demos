# 创建模型
# $ rails generate model Dept --skip                                                                                                                                                             13:53:35  ☁  master ☂ ✭
# Running via Spring preloader in process 71189
      # invoke  active_record
        # skip    db/migrate/20170905055356_create_depts.rb
      # create    app/models/dept.rb
      # invoke    test_unit
      # create      test/models/dept_test.rb
      # create      test/fixtures/depts.yml
class Dept < ApplicationRecord
end
