import Data.Char
import qualified Data.Map as Map

type UserName = String

type GamerId = Int

type PlayerCredits = Int

userNameDB :: Map.Map GamerId UserName
userNameDB =
  Map.fromList
    [ (1, "nYarlathoTep")
    , (2, "KINGinYELLOW")
    , (3, "dagon1997")
    , (4, "rcarter1919")
    , (5, "xCTHULHUx")
    , (6, "yogSOThoth")
    ]

creditsDB :: Map.Map UserName PlayerCredits
creditsDB =
  Map.fromList
    [ ("nYarlathoTep", 2000)
    , ("KINGinYELLOW", 15000)
    , ("dagon1997", 300)
    , ("rcarter1919", 12)
    , ("xCTHULHUx", 50000)
    , ("yogSOThoth", 150000)
    ]

--creditsFromId :: GamerId -> Maybe PlayerCredits
lookupUserName :: GamerId -> Maybe UserName
lookupUserName id = Map.lookup id userNameDB

lookupCredits :: UserName -> Maybe PlayerCredits
lookupCredits username = Map.lookup username creditsDB

-- altLookupCredits :: Maybe UserName -> Maybe PlayerCredits
-- altLookupCredits Nothing = Nothing
-- altLookupCredits (Just username) = lookupCredits username
creditsFromId :: GamerId -> Maybe PlayerCredits
creditsFromId id = lookupUserName id >>= lookupCredits

allFmapM :: Monad m => (a -> b) -> m a -> m b
allFmapM func mon = mon >>= (\x -> return (func x))

allApp :: Monad m => m (a -> b) -> m a -> m b
allApp mfunc mon = mfunc >>= (\x -> x <$> mon)

bind :: Maybe a -> (a -> Maybe b) -> Maybe b
bind Nothing _ = Nothing
bind (Just a) func = func a

maxPairM :: (Monad m, Ord a) => m (a, a) -> m a
-- maxPairM mpair = mpair >>= (\x -> return (max (fst x) (snd x)))
maxPairM mpair = mpair >>= (\x -> return (uncurry max x))

capMr :: [String] -> [String]
capMr l =
  ["Mr. " ++ capVal | x <- l, let capVal = (\(x:xs) -> toUpper x : xs) xj]
