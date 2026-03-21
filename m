Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E3D284881;
	Sat, 21 Mar 2026 10:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774088511; cv=none; b=T/2s8P9l/rt9EK++/Vqy9W16ImLRhKbMsx/vNywSb3FcuZfFrDZSlcuiZYFfWuj6Y/HvFbZ027SasPid9tRy1eISPSEqs/njxOQqqQeyH6pk6kfae7x4JyQ05hzm3JmB7bMMB519yia+16fasv+vj+EmSo1+W4eMLWAWsB06leM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774088511; c=relaxed/simple;
	bh=GZHLeWE0JUxVrzu/9LLZMykgiY6wRXpIQUULQtSJSK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhNi2oJrEwjP83s+W/lUxoAg9DFWgkrQUoLpzmXi9Rp8WCAyXpwEDSNiKlKvIbGxFObDs5FCFPeojE/HDVxr+G7UqVr9m4Y9Wpf/N4RJU6vZH5WtVRbbaNB9/XosBvqWikdQ5OEkwrvP2vftiVBggqzJYKBwXxi3xobtklvxWGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6NAISl9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V6NAISl9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234C6C19421;
	Sat, 21 Mar 2026 10:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774088510;
	bh=GZHLeWE0JUxVrzu/9LLZMykgiY6wRXpIQUULQtSJSK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V6NAISl9t278Ip1zgOoGyK3l9JgzP36dI4siPWeehjeeWIJoU1IkQZq1wuQz/nh7J
	 i6p3rd62+8wgCBUqHUxsVpkssIWNNZAxa5M4UzzofxRcn8kgndDE5YrfqmkxlyHHra
	 krkBH4FWQytG4nBbKvulnGumys5G5yqeUf5UQCCyBsTI3/Fvn58lAZU8nwGYtHTcr7
	 p4FqSXzTwZ4kBHz5wtBI6RO+3Sluu9a7gEzHUdkAlC2D4pDFSHGXcYzPLg77Om6nMz
	 b2cybJVl83PD34XAytbc20xqteuvV7YY5Hd3R5c4ZWmip1iBGcqRHH3vLDD8J+mAcS
	 z6efRrquEU9vw==
Date: Sat, 21 Mar 2026 11:21:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: embedded-controller: Add
 synology,microp device
Message-ID: <20260321-rose-armadillo-of-drama-09fdcf@quoll>
References: <20260320-synology_microp_initial-v4-0-0423ddb83ca4@posteo.de>
 <20260320-synology_microp_initial-v4-1-0423ddb83ca4@posteo.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260320-synology_microp_initial-v4-1-0423ddb83ca4@posteo.de>

On Fri, Mar 20, 2026 at 11:09:53PM +0100, Markus Probst wrote:
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +
> +    embedded-controller {
> +      compatible = "synology,microp";
> +
> +      power-led {
> +        color = <LED_COLOR_ID_BLUE>;
> +        function = LED_FUNCTION_POWER;
> +      };
> +
> +      status-led {
> +        color = <LED_COLOR_ID_MULTI>;
> +        function = LED_FUNCTION_STATUS;
> +      };

Where are other leds? Binding mentions 4. Does that mean that they
differ on each device?  The EC is tied to specific model, so that would
be surprising. And if they do not differ, what is exactly the point of
describing the LEDs in DT?

> +    };
> 
> -- 
> 2.52.0
> 
