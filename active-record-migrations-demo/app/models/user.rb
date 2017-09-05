# 创建模型
# $ rails generate model User --skip
# Running via Spring preloader in process 67265
      # invoke  active_record
        # skip    db/migrate/20170905045801_create_users.rb
      # create    app/models/user.rb
      # invoke    test_unit
      # create      test/models/user_test.rb
      # create      test/fixtures/users.yml
# 创建模型的命令会自动创建 迁移文件、测试文件、测试固件、模型文件
# 当迁移文件已经被创建的时候
# 通过 --skip 选项来跳过
# 通过 --force 现象来替换原有的迁移文件
class User < ApplicationRecord
end
