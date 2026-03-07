Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343023019C3;
	Sat,  7 Mar 2026 10:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772878809; cv=none; b=ZdS1ihM6VQsHC+u5B4WghGkhc3Lay3yzhlwO+3+ejgmWgPCDyhpdlzDjK4wM1OZqpgGV0TaSTWnr+yB8hqJnP2CaTW4OZr70jCMyHToa5R2DTiqHcgJrO5w+xJ/+YWL9gUKUYxgiE72s75X89Pi8hTkuc/INgAzutklAV+HyEm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772878809; c=relaxed/simple;
	bh=1Mh2rqhRPnqmxmIBmAiHS535F1nX9kdU/Nh+Rfg8sW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IC/IyOYM/EWTw8OIP5CoamJNRKGoLWb3QiyaisMRfHbQByDa2H4ownHQY8sy9gi3JJ2futoI5zb4YFpsCkNK5lKjExnAFYiw5NFQZLn16QkPdOQr2ZPWHKu1FKVTN0CdzqzP0mMyKaiIpA1B3cIl8Fv+RBVbdjJMzYGNbiG9PNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqhDR3si; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqhDR3si"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B39A9C19425;
	Sat,  7 Mar 2026 10:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772878808;
	bh=1Mh2rqhRPnqmxmIBmAiHS535F1nX9kdU/Nh+Rfg8sW4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lqhDR3siPi3sHP/N2jkBVMGL+Bd9CHlr+qhspLzwkYxkYBFXH6XGVJyW7ZRTDvrVp
	 h+DkvzdVDhg9EKaFVG4AaoTORbPXASI5u9oJ7tMfvxu4/bGUH6wwsbId/SWuPcJD9u
	 Ui3eDozFcAA6dgd3GT4l5E8ZIN76weYBJ//f1UHwTXy6Lrh9GcHLqzrciP9Fybqajw
	 wiqZ/Q97aRfnVKkmra3QWgbbb92VD42XpRlsOUnVGfNxlrvrzNDvPkT+4vNlrmeW++
	 QjmuadIHJrn/X7FvfrhJdnQClV6GDFPisYRw+w0U3WsKm/IXeEgERc89J7+zrxjchl
	 OKjowqWPGIepg==
Message-ID: <be179573-edc3-4b6c-8c91-ae7b0c61c1b1@kernel.org>
Date: Sat, 7 Mar 2026 11:20:02 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mfd: Add binding for synology,microp
 devices
To: Markus Probst <markus.probst@posteo.de>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, rust-for-linux@vger.kernel.org
References: <20260306-synology_microp_initial-v1-0-fcffede6448c@posteo.de>
 <20260306-synology_microp_initial-v1-1-fcffede6448c@posteo.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260306-synology_microp_initial-v1-1-fcffede6448c@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/03/2026 20:38, Markus Probst wrote:
> Add the Synology Microp devicetree bindings. Those devices are
> microcontrollers found on Synology NAS devices. They are connected to a
> serial port on the host device.

A nit, subject: drop second/last, redundant "binding for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> 
> Those devices are used to control certain LEDs, fan speeds, a beeper, to
> handle buttons, fan failures and to properly shutdown and reboot the
> device.
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  .../devicetree/bindings/mfd/synology,microp.yaml   | 75 ++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/synology,microp.yaml b/Documentation/devicetree/bindings/mfd/synology,microp.yaml
> new file mode 100644
> index 000000000000..0fcb0b750bf0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/synology,microp.yaml
> @@ -0,0 +1,75 @@
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/synology,microp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synology NAS on-board Microcontroller
> +
> +maintainers:
> +  - Markus Probst <markus.probst@posteo.de>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Synology devices contain a microcontroller on their device to control
> +  certain leds, fan speeds, a beeper, to properly handle system shutdown
> +  and reboot, buttons and fan failures.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - synology,microp

Missing blank line. Look at other bindings how to write one.

> +  power-led:
> +    $ref: /schemas/leds/common.yaml
> +    unevaluatedProperties: false
> +  status-led:
> +    $ref: /schemas/leds/common.yaml
> +    unevaluatedProperties: false
> +  alert-led:
> +    $ref: /schemas/leds/common.yaml
> +    unevaluatedProperties: false
> +  usb-led:
> +    $ref: /schemas/leds/common.yaml
> +    unevaluatedProperties: false

That's pretty unreadable code.

> +  no-check-fan:

Vendor prefix

> +    type: boolean
> +    description: |
> +      Disable fan failure check.

You described the desired Linux feature or behavior, not the actual
hardware. The bindings are about the latter, so instead you need to
rephrase the property and its description to match actual hardware
capabilities/features/configuration etc.

> +
> +      The fan failure event is triggered on the device, even if the fan
> +      has been intentionally set to a low speed. This property prevents a
> +      hardware protection shutdown if a fan failure event is reported.
> +  no-check-cpu-fan:

You described the desired Linux feature or behavior, not the actual
hardware. The bindings are about the latter, so instead you need to
rephrase the property and its description to match actual hardware
capabilities/features/configuration etc.

> +    type: boolean
> +    description: |
> +      Disable cpu fan failure check.
> +
> +      The cpu fan failure event is triggered on the device, even if the cpu
> +      fan has been intentionally set to a low speed. This property prevents
> +      a hardware protection shutdown if a cpu fan failure event is
> +      reported.
> +
> +required:
> +  - compatible
> +  - power-led
> +  - status-led
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +
> +    uart {

Drop, unuesed

> +      microp {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

> +        compatible = "synology,microp";
> +
> +        power-led {
> +          color = <LED_COLOR_ID_BLUE>;
> +          function = LED_FUNCTION_POWER;
> +        };
> +
> +        status-led {
> +          color = <LED_COLOR_ID_MULTI>;
> +          function = LED_FUNCTION_STATUS;
> +        };
> +      };
> +    };
> 


Best regards,
Krzysztof
