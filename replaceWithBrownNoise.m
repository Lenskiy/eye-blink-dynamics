function replacement = replaceWithBrownNoise(corrupted_eeg, to_std) 
    connecting_points = [corrupted_eeg(1) corrupted_eeg(end)];
    %gererate Brown noise
    replacement = cumsum((rand(length(corrupted_eeg), 1) - 0.5))';
    replacement = (replacement - mean(replacement))/std(replacement);
    %remove trend
    replacement = replacement - (replacement(end) - replacement(1))/length(replacement) * (1:length(corrupted_eeg));
    replacement = replacement - mean(replacement);
    k = (connecting_points(2) - connecting_points(1)) / length(corrupted_eeg); 
    % add trend based on the boundary points
    replacement = to_std * replacement + k * (1:length(corrupted_eeg));
end