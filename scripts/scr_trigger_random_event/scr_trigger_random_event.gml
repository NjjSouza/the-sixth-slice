function TriggerRandomEvent()
{
    var roll = irandom(2);

    switch(roll)
    {
        case 0:
            current_event = EVENT_TYPE.SYSTEM_CHECK;
        break;

        case 1:
            current_event = EVENT_TYPE.OXYGEN_LEAK;
        break;

        case 2:
            current_event = EVENT_TYPE.ALIEN_SIGNAL;
        break;
    }

    ExecuteEvent(current_event);
}