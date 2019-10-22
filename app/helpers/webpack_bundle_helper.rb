module WebpackBundleHelper
  def javascript_bundle_tag(entry, **options)
    path = public_bundle_path "#{entry}.js"

    options = {
      src: path,
      defer: true
    }.merge(options)

    javascript_include_tag('', **options)
  end

  private

  MANIFEST_PATH = 'public/webpack/manifest.json'.freeze

  def manifest
    @manifest ||= JSON.parse(File.read(MANIFEST_PATH))
  end

  def public_bundle_path(entry)
    # TODO:
    # - Need to set public file server to environment variables.
    # - Need to decide public file srever for staging and production environment.
    # - Need to implement the method to reflect the updates of the manifest file to web server when new static resourses are rebuilt and deployed.
    ['https://', ENV['CDN_ASSET_HOST'], manifest.fetch(entry)].join
  end
end
