SMODS.Shader{
    key = "drained",
    path = "drained.fs"
}

SMODS.Edition{
    key = "drained",
    shader = "drained",
    atlas = "fake3",
    pos = {
        x = 0,
        y = 0
    },
    unlocked = true,
    discovered = true,
    weight = 0,
    in_pool = function (self, args)
        return false
    end
}