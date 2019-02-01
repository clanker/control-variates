# control-variates
code for Wikipedia example of control variates methods

## Code
Run `example.R` to run the Wikipedia example estimating E(1/(1+U)) where U ~ Uniform(0,1).
The control variate here is V = 1+U which we must know ahead of time that E(V) = 1.5

**Note:**  If E(V) is not known and estimated, then there is no benefit to using a
control variate to reduce variance of the estimate of E(1/(1+U)).
See this yourself by replacing 1.5 with mean(v) in the code and generated the results PDF.

## PDF
The PDF in this directory summarizes the results of using a control variate;
it is the output of the above code.

## Reference
https://en.wikipedia.org/wiki/Control_variates

## Questions / Comments
Contact me.
