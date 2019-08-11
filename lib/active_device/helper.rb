#--
# Copyright (c) 2009 Shenouda Bertel <sbertel@mobithought.com>, MobiThought.
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

module ActiveDevice

  module Helper

    ##
    # User agent name symbol.

    def agent_name
      ActiveDevice::Browser.name request.user_agent
    end

    ##
    # User agent version.

    def agent_version
      ActiveDevice::Browser.version request.user_agent
    end

    ##
    # User agent engine symbol.

    def agent_engine
      ActiveDevice::Engine.engine request.user_agent
    end

    ##
    # User agent engine version user_agent.

    def agent_engine_version
      ActiveDevice::Engine.engine_version request.user_agent
    end

    ##
    # User agent os symbol.

    def agent_os
      ActiveDevice::Os.os request.user_agent
    end

    ##
    # User agent engine version user_agent.

    def agent_os_version
      ActiveDevice::Os.os_version request.user_agent
    end

    ##
    # User agent engine version user_agent.

    def agent_os_series
      ActiveDevice::Os.os_series request.user_agent
    end

    ##
    # User agent model symbol.

    def device_model
      ActiveDevice::Model.brand_model request.user_agent
    end

    ##
    # User agent model Reselution symbol.

    def device_model_reselution
      ActiveDevice::Model.model_reselution request.user_agent
    end

    ##
    # User agent brand symbol.

    def device_brand
      ActiveDevice::Brand.mobile_brand request.user_agent
    end

  end
end
