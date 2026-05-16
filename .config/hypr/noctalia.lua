local primary = "rgb(4cd9e3)"
local surface = "rgb(0d141c)"
local secondary = "rgb(80d4db)"
local error = "rgb(ffb4ab)"
local tertiary = "rgb(a0cafd)"
local surface_lowest = "rgb(080f16)"
hl.config({
    general = {
        col = {
            active_border = primary,
            inactive_border = surface,
        },
    }
})
hl.config({
    group = {
        col = {
            border_active = secondary,
            border_inactive = surface,
            border_locked_active = error,
            border_locked_inactive = surface,
        },
        groupbar = {
            col = {
                active = secondary,
                inactive = surface,
                locked_active = error,
                locked_inactive = surface,
            },
        },
    }
})
