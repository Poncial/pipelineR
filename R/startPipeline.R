

startPipeline <- function(){
  con <- connectDb()
  symbolsDb <- fetchSymbols()
  splitList <- splitBatch(symbolsDb)
}
