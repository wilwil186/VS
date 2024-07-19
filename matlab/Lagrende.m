function LagK = Lagrende(r, n, k, x0)
    LagK = 1;
    for j = 1:n
        if j ~= k
            LagK = LagK * (x0 - r(j)) / (r(k) - r(j));
        end
    end
end

