defmodule Spear.PersistentSubscription.Info do
  require Spear.Records.Persistent, as: Persistent

  defstruct [
    :last_checkpointed_event_position,
    :last_known_event_position
  ]

  @doc false
  def from_get_info_response(
        Persistent.get_info_resp(
          subscription_info:
            Persistent.subscription_info(
              last_checkpointed_event_position: last_checkpointed_event_position,
              last_known_event_position: last_known_event_position
            )
        )
      ) do
    %__MODULE__{
      last_checkpointed_event_position: last_checkpointed_event_position,
      last_known_event_position: last_known_event_position
    }
  end
end
