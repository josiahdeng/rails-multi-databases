namespace :db do

  namespace :writer_database do

    desc "Create writer database"
    task create: :environment do
      ActiveRecord::Base.establish_connection(WRITER_DATABASE.merge(database: nil))
      ActiveRecord::Base.connection.create_database(WRITER_DATABASE['database'], WRITER_DATABASE)
      p "create #{WRITER_DATABASE['database']}"
    end

    desc "Migrate writer database"
    task migrate: :environment do
      migrate_path = File.join(Rails.root, "db", "writer_databases", "migrate")
      ActiveRecord::Base.establish_connection(WRITER_DATABASE)
      ActiveRecord::Migrator.migrate(migrate_path)
    end
  end
end