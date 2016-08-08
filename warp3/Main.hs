{-# LANGUAGE OverloadedStrings #-}
import Network.Wai (responseLBS)
import Network.Wai.Handler.Warp (run)
import Network.HTTP.Types (status200)
import Network.HTTP.Types.Header (hContentType)

main = run 3000 $ \_ f -> f $
    responseLBS status200 [(hContentType, "text/plain")] "Hello, world!\n"
