{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_warp3 (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,0,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/melnikaite/.cabal/bin"
libdir     = "/Users/melnikaite/.cabal/lib/x86_64-osx-ghc-8.0.1/warp3-1.0.0.0-9OPBmzbwwkpJPComY56tEs"
datadir    = "/Users/melnikaite/.cabal/share/x86_64-osx-ghc-8.0.1/warp3-1.0.0.0"
libexecdir = "/Users/melnikaite/.cabal/libexec"
sysconfdir = "/Users/melnikaite/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "warp3_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "warp3_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "warp3_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "warp3_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "warp3_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
