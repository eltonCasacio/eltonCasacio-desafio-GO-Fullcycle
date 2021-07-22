FROM golang:alpine AS desafio
WORKDIR /go/src/
COPY . .
RUN GOOS=linux go build -ldflags="-s -w"

FROM scratch

COPY --from=desafio /go/src/ .
CMD [ "./desafiogo" ]