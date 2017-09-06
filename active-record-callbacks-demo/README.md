# README

### 可用的回调

##### 创建对象
* before_validation, after_validation
* before_save, around_save, after_save
* before_create, around_create, after_create
* after_commit/after_rollback

##### 更新对象
* before_validation, after_validation
* before_save, around_save, after_save
* before_update, around_update, after_update
* after_commit/after_rollback

##### 删除对象
* before_destroy, around_destroy, after_destroy
* after_commit/after_rollback

### 调用回调

##### 触发回调的方法
* create, create!
* decrement!
* destroy, destroy!, destroy_all
* increment!
* save, save!, save(validate: false)
* toggle!
* update_attribute, update, update!
* valid?

##### 触发 after_find 回调的方法
* all
* first, last
* find, find_by, find_by_*, find_by_*!, find_by_sql

### 跳过回调

##### 跳过回调的方法
* decrement, decrement_counter
* delete, delete_all
* increment, increment_counter
* toggle
* touch
* update_column, update_columns, update_all, update_counters
