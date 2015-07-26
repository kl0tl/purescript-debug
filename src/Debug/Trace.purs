module Debug.Trace where

import Prelude

-- | Log a message to the console for debugging purposes and then return a
-- | value. The return value is thunked so it is not evaluated until after the
-- | message has been printed, to preserve a predictable console output.
-- |
-- | For example:
-- | ``` purescript
-- | doSomething = trace "Hello" \_ -> ... some value or computation ...
-- | ```
trace :: forall a. String -> (Unit -> a) -> a
trace = traceAny

-- | Log a `Show`able value to the console for debugging purposes and then
-- | return a value.
traceShow :: forall a b. (Show a) => a -> (Unit -> b) -> b
traceShow = traceAny <<< show

-- | Log any PureScript value to the console for debugging purposes and then
-- | return a value. This will log the value's underlying representation for
-- | low-level debugging.
foreign import traceAny :: forall a b. a -> (Unit -> b) -> b
