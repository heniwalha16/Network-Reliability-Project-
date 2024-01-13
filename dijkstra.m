% Dijkstra's algorithm function
function [distances, paths] = dijkstra(graph, start)
    num_nodes = size(graph, 1);
    distances = inf(1, num_nodes);
    paths = zeros(1, num_nodes);

    visited = false(1, num_nodes);
    distances(start) = 0;

    for i = 1:num_nodes
        current = -1;
        % Find the unvisited node with the smallest distance
        for j = 1:num_nodes
            if ~visited(j) && (current == -1 || distances(j) < distances(current))
                current = j;
            end
        end

        visited(current) = true;

        % Update distances and paths
        for j = 1:num_nodes
            if graph(current, j) > 0
                if distances(current) + graph(current, j) < distances(j)
                    distances(j) = distances(current) + graph(current, j);
                    paths(j) = current;
                end
            end
        end
    end
end

