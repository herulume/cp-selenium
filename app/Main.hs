module Main where

import Options.Applicative
import Data.Text
import Actions
import Blackboard
import Utils

-- | CLI flags.
data CLI = CLI { username :: String
               , password :: String
               }

-- | CLI flags parser.
cli :: Parser CLI
cli = CLI <$> strOption
                ( long "username" <> short 'u' <> value "" <> help "Blackboard username" )
          <*> strOption
                ( long "password" <> short 'p' <> value "" <> help "Blackboard password" )

flow :: CLI -> IO ()
flow (CLI u p) = runInChrome $ openPageAndWait bb >> uncurry fillForm (loginFields (pack u) (pack p))

main :: IO ()
main = flow =<< execParser opts where
    opts =
      info
        (cli <**> helper)
        ( fullDesc
            <> progDesc "Automatic BlackBoard sessions generator"
            <> header "TBA"
        )
