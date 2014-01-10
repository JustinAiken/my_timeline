module Kernel
  define_method :rails4? do
    Rails::VERSION::MAJOR >= 4
  end
end
