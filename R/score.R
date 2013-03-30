##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##' @title
##' @param labels
##' @param predictions
##' @return
##' @author ahmadou
auc <- function (labels, predictions) {
    r <- rank(predictions)
    n_pos <- sum(labels == 1)
    n_neg <- length(labels) - n_pos
    (sum(r[labels == 1]) - n_pos * (n_pos + 1)/2)/(n_pos *
           n_neg)

}


##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##' @title
##' @export
##' @param labels
##' @param predictions
##' @author ahmadou
forward_auc <- function(labels, predictions) {
    target_one <- (labels == 1) * 1.0
    auc(target_one, predictions)
}


##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##' @title
##' @export
##' @param labels
##' @param predictions
##' @author ahmadou
reverse_auc <- function(labels, predictions) {
    target_neg_one <- (labels == -1) * 1.0
    auc(target_one, -predictions)
}


##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##' @title
##' @export
##' @param labels
##' @param predictions
##' @author ahmadou
bidirectional_auc <- function(labels, predictions) {
    score_forward <- forward_auc(labels, predicitions)
    score_reverse <- reverse_auc(labels, predicitions)
    (score_forward + score_reverse) / 2
}