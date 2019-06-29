class RidgepoleRunner
  attr_reader :env, :dry, :notify

  def initialize(env:, dry:, notify:)
    @env = env
    @dry = dry
    @notify = notify
  end

  def self.dryrun(env:, notify: true)
    new(env: env, dry: true, notify: notify).apply
  end

  def self.apply(env:, notify: true)
    new(env: env, dry: false, notify: notify).apply
  end

  def apply
    RidgepoleSlackNotifier.notify "Started ridgepole:#{dry ? "dryrun" : "apply"}:#{env}" if notify

    Open3.popen3(
      "bundle exec ridgepole -E #{env} -c config/database.yml --apply#{" --dry-run" if dry}"
    ) do |_i, stdout, stderr|
      notification_block = []
      while(stdout_str = stdout.gets || stderr_str = stderr.gets) do
        unless stdout_str.nil?
          puts stdout_str
          if stdout_str.strip.empty?
            RidgepoleSlackNotifier.notify notification_block if notify
            notification_block = []
          elsif stdout_str.match?(/\A-- .+/)
            RidgepoleSlackNotifier.notify notification_block if notify
            notification_block = []
            notification_block << stdout_str
          else
            notification_block << stdout_str
          end
        end

        if !stderr_str.nil? && !stderr_str.empty?
          stderr_str.strip!
          puts stderr_str
          RidgepoleSlackNotifier.notify stderr_str, color: "danger" if notify
        end
      end
      RidgepoleSlackNotifier.notify notification_block unless notification_block.empty? if notify
    end

    RidgepoleSlackNotifier.notify "Finished ridgepole:#{dry ? "dryrun" : "apply"}:#{env}" if notify
  rescue
    RidgepoleSlackNotifier.notify "Failed ridgepole:#{dry ? "dryrun" : "apply"}:#{env}", color: "danger" if notify
  end
end

namespace :ridgepole do
  namespace :dryrun do
    desc "'Run ridgepole -E test -c config/database.yml --apply --dry-run'"
    task :test do
      RidgepoleRunner.dryrun(env: :test, notify: false)
    end

    desc "'Run ridgepole -E test -c config/database.yml --apply --dry-run'"
    task :development do
      RidgepoleRunner.dryrun(env: :development, notify: false)
    end

    desc "'Run ridgepole -E test -c config/database.yml --apply --dry-run'"
    task :staging do
      RidgepoleRunner.dryrun(env: :staging)
    end

    desc "'Run ridgepole -E test -c config/database.yml --apply --dry-run'"
    task :production do
      RidgepoleRunner.dryrun(env: :production)
    end
  end

  namespace :apply do
    desc "'Run ridgepole -E test -c config/database.yml --apply'"
    task :test do
      RidgepoleRunner.apply(env: :test, notify: false)
    end

    desc "'Run ridgepole -E test -c config/database.yml --apply'"
    task :development do
      RidgepoleRunner.apply(env: :development, notify: false)
      Rake::Task["annotate_models"].invoke
    end

    desc "'Run ridgepole -E test -c config/database.yml --apply'"
    task :staging do
      RidgepoleRunner.apply(env: :staging)
    end

    desc "'Run ridgepole -E test -c config/database.yml --apply'"
    task :production do
      RidgepoleRunner.apply(env: :production)
    end
  end
end
