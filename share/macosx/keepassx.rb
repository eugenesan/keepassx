require 'formula'

class Keepassx < Formula
  homepage 'http://www.keepassx.org'
  url "https://github.com/eugenesan/keepassx.git", :branch => "2.0-http-totp"
  version "2.0-http-totp"
  head "https://github.com/eugenesan/keepassx.git", :branch => "master"

  depends_on 'cmake'
  depends_on 'qt'
  depends_on 'libgcrypt'
  depends_on 'libmicrohttpd'
  depends_on 'qjson'
  depends_on 'oath-toolkit'

  def install
    mkdir 'build' do
      system 'cmake', '..', *std_cmake_args

      # Do no deploy redundent Qt libs (we do not attempt .dmg bundle since the proccess is broken)
      inreplace 'src/cmake_install.cmake', 'FIXUP_QT4_EXECUTABLE', '#FIXUP_QT4_EXECUTABLE'

      system 'make', 'install'
    end
  end
end
