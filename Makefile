generate-graph:
	terraform graph | dot -Tsvg > graph.svg

