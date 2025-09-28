SMODS.JimboQuip{
    key = "de_ref",
    type = "loss",
    filter = function (self, quip_type)
        local most = {
            type = "None",
            amount = 0
        }
        for k, v in pairs(G.GAME.hands) do
            if G.GAME.hands[k].played > most.amount then
                most = {
                    type = k,
                    amount = G.GAME.hands[k].played
                }
            end
        end
        local check = false
        if string.find(most.type, "Spectrum") then check = true end
        if most.type == "Three of a Kind" or most.type == "Flush" or most.type == "Straight" or most.type == "Straight Flush" or most.type == "Two Pair" or most.type == "Full House" then check = true end
        local weight = 2
        return check, {weight = weight}
    end
}