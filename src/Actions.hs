-- |

module Actions where

import Data.Text (Text)
import Control.Concurrent (threadDelay)
import Control.Monad.IO.Class (liftIO)
import Test.WebDriver

-- | Fill a form in the current webpage.
fillForm :: Text           -- ^ Button to submit form
         -> [(Text, Text)] -- ^ Form fields identifiers and data
         -> WD ()          -- ^ Selenium computation
fillForm _ [] = error "No form fields to submit"
fillForm b l = mapM_ (uncurry findByIdAndSend) l >> sleep 1 >> clickButton b >> sleep 5

-- | Click a button.
-- After clicking the button, the browser waits 5 seconds.
clickButton :: Text  -- ^ Button identifier
            -> WD () -- ^ Selenium computation
clickButton b = findById b >>= click >> sleep 5

-- | Open a webpage and wait 10 seconds.
openPageAndWait :: String -- ^ Webpage URL
                -> WD ()  -- ^ Selenium computation
openPageAndWait p = maximize >> openPage p >> sleep 10

-- | Find an element by its identifier and send a value to it.
findByIdAndSend :: Text  -- ^ Element identifier
                -> Text  -- ^ Value
                -> WD () -- ^ Selenium computation
findByIdAndSend elemId value = findById elemId >>= sendKeys value

-- | Find an element by its identifier.
findById :: Text       -- ^ Element identifier
         -> WD Element -- ^ Element
findById = findElem . ById

-- | Pause the browser @x@ seconds.
sleep :: Int   -- ^ Seconds
      -> WD () -- ^ Selenium computation
sleep = liftIO . threadDelay . (*1000000)
