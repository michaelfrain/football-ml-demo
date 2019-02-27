import Foundation
import CreateML

let scheduleFile = Bundle.main.url(forResource: "NFL18Updated", withExtension: "csv")!
let dataTable = try MLDataTable(contentsOf: scheduleFile)

let dataColumns = ["Visitor", "Home", "PtsV", "PtsH", "YdsV", "TOV", "YdsH", "TOH"]
let regressorTable = dataTable[dataColumns]
let classifierTable = dataTable[dataColumns]

let (regressorEvalTable, regressorTrainingTable) = regressorTable.randomSplit(by: 0.20, seed: 3)
let (classifierEvalTable, classifierTrainingTable) = classifierTable.randomSplit(by: 0.25, seed: 6)

let regressor = try MLRegressor(trainingData: regressorTrainingTable, targetColumn: "PtsH", featureColumns: dataColumns)

let worstTrainingError = regressor.trainingMetrics.maximumError
let worstValidationError = regressor.validationMetrics.maximumError

let regressorEvaluation = regressor.evaluation(on: regressorEvalTable)
let worstEvalError = regressorEvaluation.maximumError

let classifier = try MLClassifier(trainingData: classifierTrainingTable, targetColumn: "Home", featureColumns: dataColumns)

let trainingError = classifier.trainingMetrics.classificationError
let trainingAccuracy = (1.0 - trainingError) * 100

let validationError = classifier.validationMetrics.classificationError
let validationAccuracy = (1.0 - validationError) * 100

let classifierEvaluation = classifier.evaluation(on: classifierEvalTable)

let evaluationError = classifierEvaluation.classificationError
let evaluationAccuracy = (1.0 - evaluationError) * 100

let homePath = FileManager.default.homeDirectoryForCurrentUser
let desktopPath = homePath.appendingPathComponent("Desktop")

let regressorMetadata = MLModelMetadata(author: "Michael Frain", shortDescription: "Predicts winning score", license: nil, version: "1.0", additional: nil)
try regressor.write(to: desktopPath.appendingPathComponent("ScoreRegressor.mlmodel"), metadata: regressorMetadata)

let classifierMetadata = MLModelMetadata(author: "Michael Frain", shortDescription: "Predicts winning team", license: nil, version: "1.0", additional: nil)
try classifier.write(to: desktopPath.appendingPathComponent("TeamClassifier.mlmodel"), metadata: classifierMetadata)
