guard :rspec, cmd: "rspec" do
  watch('spec/spec_helper.rb')  { "spec" }
  watch(%r{^lib/(.+)\.rb})      { |m| "spec/#{m[1]}_spec.rb" }
end