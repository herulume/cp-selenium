-- |

module Blackboard where

import Test.WebDriver.Capabilities
import Test.WebDriver


-- | Run a 'Selenium' computation in Google Chrome, closing it in the end.
runInChrome :: WD () -> IO ()
runInChrome = runSession chromeSession . finallyClose

-- | WebDriver session configuration for Google Chrome.
chromeSession :: WDConfig
chromeSession = useBrowser chrome defaultConfig { wdHost = "0.0.0.0", wdPort = 4444, wdHTTPRetryCount = 50 }
