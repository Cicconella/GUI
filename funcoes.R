
arrumaTabela = function(lista1, lista2, nome1, nome2){
  saida = cbind(head(lista1),head(lista2))
  colnames(saida) = c(nome1, nome2)
  return(saida)
}