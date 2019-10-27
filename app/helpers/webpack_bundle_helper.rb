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
    ['https://musiq-quiz-generator.firebaseapp.com', manifest.fetch(entry)].join
    #['http://localhost:1212', manifest.fetch(entry)].join
  end
end
