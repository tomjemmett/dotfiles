---------------
---- INPUT ----
---------------

-- https://wiki.hypr.land/Configuring/Variables/#input
hl.config({
    input = {
        kb_layout = "gb",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",

        follow_mouse = 1,

        sensitivity = 0,

        numlock_by_default = true,

        touchpad = {
            natural_scroll = true
        }
    }
})

-- See https://wiki.hypr.land/Configuring/Gestures
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- See https://wiki.hypr.land/Configuring/Keywords/#per-device-input-configs for more

hl.device({
    name = "logitech-usb-receiver-mouse",
    natural_scroll = true
})

