{-# LANGUAGE OverloadedStrings #-}

module Utils where

import Data.Text

bb :: String
bb = "https://elearning.uminho.pt/"

unidades :: String
unidades = "https://elearning.uminho.pt/webapps/portal/execute/tabs/tabAction?tab_tab_group_id=_2_1"

loginFields :: Text -> Text -> (Text, [(Text, Text)])
loginFields username password = ("entry-login", [("user_id", username), ("password", password)])
