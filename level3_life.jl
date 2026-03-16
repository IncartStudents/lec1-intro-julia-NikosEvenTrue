
module GameOfLife
using Plots

mutable struct Life
    current_frame::Matrix{Int}
    next_frame::Matrix{Int}
end

function step!(state::Life)
    curr = state.current_frame
    next = state.next_frame
    lines, columns = size(curr)

    for i in 1:length(curr)
        l, c = div(i, lines) + 1, mod(i, columns)
        
        neighbors = 0

        for ii in -1:1, jj in -1:1
            ii == 0 && jj == 0 && continue
            neighbors += curr[(mod1(l + ii, lines)), mod1(c + jj, columns)]
        end        

        if curr[i] == 1
            next[i] = neighbors in (2, 3) ? 1 : 0
        else
            next[i] = neighbors == 3 ? 1 : 0
        end
    end

    state.current_frame, state.next_frame = next, curr

    return nothing
end

function (@main)(ARGS)
    n = 20
    m = 40
    total_frames = 100
    fps = 10
    init_life_chance = 0.3

    init = map(_ -> rand() < init_life_chance ? 1 : 0, zeros(n, m))

    game = Life(init, zeros(n, m))

    anim = @animate for frame = 1:total_frames
        step!(game)
        cr = game.current_frame
        heatmap(cr, title="Frame $frame")
    end
    gif(anim, "life.gif", fps = fps)
end

export main

end

using .GameOfLife
GameOfLife.main("")
