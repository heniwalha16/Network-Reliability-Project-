function TT_OD = computeShortestTravelTimes(TT_link)
    % Number of bus stops
    num_stops = size(TT_link, 1);

    % Initialize the TT_OD matrix to store shortest travel times from any origin to any destination
    TT_OD = zeros(num_stops, num_stops, size(TT_link, 3));

    % Iterate over the 3rd dimension of TT_link (50 samples)
    for sample = 1:size(TT_link, 3)
        % Build the adjacency matrix for the current sample
        adjacency_matrix = squeeze(TT_link(:, :, sample));

        % Compute shortest travel times and paths using Dijkstra's algorithm
        for origin = 1:num_stops
            [distances, ~] = dijkstra(adjacency_matrix, origin);
            TT_OD(origin, :, sample) = distances;
        end
    end
end
