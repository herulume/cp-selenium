{-# LANGUAGE OverloadedStrings #-}

module Utils where

import Data.Text

bb :: String
bb = "https://elearning.uminho.pt/"

loginFields :: Text -> Text -> (Text, [(Text, Text)])
loginFields username password = ("entry-login", [("user_id", username), ("password", password)])
