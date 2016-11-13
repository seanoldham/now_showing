class FinishWatchingJob < ApplicationJob
  queue_as :default

  def perform(item)
    i = Item.find(item)
    i.update(status: 1)
  end
end
