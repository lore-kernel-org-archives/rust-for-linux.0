Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C859F3016E0;
	Sun,  8 Mar 2026 18:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772996121; cv=none; b=EtG6gb+uXhQi9wLLxZl/X5NcHPiQGk9X5oFxdjXiH7X61WIXYnkRhVSJEhtGN6vTRUX2ocyS3NKdoPokK6wQDy1Bg5C51O8HuwIEEkh7VGur/yWSkQlCEUzoFMhENuXwdW9DDbTkPvh7t6ttiWPQZ/G1YGGCCLn9f8M7/pc1KHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772996121; c=relaxed/simple;
	bh=RSx761abYApX0s6NDuvzp17AfAnTUYOmexubAKrAIA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YAq57VaLHpB1FjBwwvb1o36Yt7zAb4Z+CEZIhaanTCOJ5oCPQ9TQCC031EK63w2/cSJ+O314R8cMNurvfQbc368jix0Zf/FUB4dyZ6VYCWVZP5dpbZLii2w1+5uYu2GddLKtyNJrRyclwgpBg42tCsGeozQwmWxmibrUdqJ70Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CuncFJWU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CuncFJWU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0269C2BCB0;
	Sun,  8 Mar 2026 18:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772996121;
	bh=RSx761abYApX0s6NDuvzp17AfAnTUYOmexubAKrAIA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CuncFJWUIXj8Fxz4jPPLRScQMocQ4M0obaoBz0/V8WOPuVofh7q/95CvQlJkDK4fH
	 VPuANrniA4cidEmpBG2MwcCUl66tAqbRISj4Tp9kUOjfjikUIOD/9inviFObqC/rAn
	 PCOjuxmWWqIJGPIktUU9Vb8PUpXCzO6pcmw+ZR3Y=
Date: Sun, 8 Mar 2026 19:55:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mfd: Add initial synology microp driver
Message-ID: <2026030827-nautical-overplant-399c@gregkh>
References: <20260308-synology_microp_initial-v2-0-9389963f31c5@posteo.de>
 <20260308-synology_microp_initial-v2-2-9389963f31c5@posteo.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-synology_microp_initial-v2-2-9389963f31c5@posteo.de>

On Sun, Mar 08, 2026 at 06:41:20PM +0000, Markus Probst wrote:
> Add a initial synology microp driver, written in Rust.
> The driver targets a microcontroller found in Synology NAS devices. It
> currently only supports controlling of the power led, status led, alert
> led and usb led. Other components such as fan control or handling
> on-device buttons will be added once the required rust abstractions are
> there.

Why is this a mfd device?  Shouldn't it be an aux device?

But this is just a serial port connection, so why is a kernel driver
needed at all?

> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  MAINTAINERS                                    |   6 +
>  drivers/mfd/Kconfig                            |   2 +
>  drivers/mfd/Makefile                           |   2 +
>  drivers/mfd/synology_microp/Kconfig            |  14 ++
>  drivers/mfd/synology_microp/Makefile           |   2 +
>  drivers/mfd/synology_microp/TODO               |   7 +
>  drivers/mfd/synology_microp/command.rs         |  50 +++++
>  drivers/mfd/synology_microp/led.rs             | 275 +++++++++++++++++++++++++
>  drivers/mfd/synology_microp/synology_microp.rs |  82 ++++++++
>  rust/uapi/uapi_helper.h                        |   2 +
>  10 files changed, 442 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e9e83ab552c7..092cd9e8a730 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25550,6 +25550,12 @@ F:	drivers/dma-buf/sync_*
>  F:	include/linux/sync_file.h
>  F:	include/uapi/linux/sync_file.h
>  
> +SYNOLOGY MICROP DRIVER
> +M:	Markus Probst <markus.probst@posteo.de>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/mfd/synology,microp.yaml
> +F:	drivers/mfd/synology_microp/
> +
>  SYNOPSYS ARC ARCHITECTURE
>  M:	Vineet Gupta <vgupta@kernel.org>
>  L:	linux-snps-arc@lists.infradead.org
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 7192c9d1d268..bc269719749f 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2580,5 +2580,7 @@ config MFD_MAX7360
>  	  additional drivers must be enabled in order to use the functionality
>  	  of the device.
>  
> +source "drivers/mfd/synology_microp/Kconfig"
> +
>  endmenu
>  endif
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index e75e8045c28a..0a6fa33d5c35 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -304,3 +304,5 @@ obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
>  obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
>  
>  obj-$(CONFIG_MFD_LOONGSON_SE)	+= loongson-se.o
> +
> +obj-$(CONFIG_MFD_SYNOLOGY_MICROP)	+= synology_microp/
> diff --git a/drivers/mfd/synology_microp/Kconfig b/drivers/mfd/synology_microp/Kconfig
> new file mode 100644
> index 000000000000..4bbbcf0b6e94
> --- /dev/null
> +++ b/drivers/mfd/synology_microp/Kconfig
> @@ -0,0 +1,14 @@
> +
> +config MFD_SYNOLOGY_MICROP
> +	tristate "Synology Microp driver"
> +	depends on RUST
> +	depends on SERIAL_DEV_BUS

We don't have rust serdev bindings yet, but if we do, shouldn't you just
depend on them instead of two different things here?


> +	depends on LEDS_CLASS && LEDS_CLASS_MULTICOLOR
> +	default n

n is always the default, no need to say it again :)

thanks,

greg k-h
