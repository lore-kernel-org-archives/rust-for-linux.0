Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793360292;
	b=qwSCta6Ai5C/03a3E1Bn8Vmx3y+iG6paXiIygm1j/XVmvoD0+t5L8oCZopV9Up0BWg+X
	 TZQXNnQdPG6n6aEX0sCAwBOwwbsMXpWbAiOa6cgKyBePzsEBPv0scERTBRZOIxSvbNlMc
	 TUux5Mrg6jxqrS8PNEdjg35J9kgew9IF5vA6y7qkz8pGy6zMohZiN7XFvxIjl8QLMdwI+
	 E0fq1hzZgxuEO1lh7R55LHObHcIXAZgBxsyICaI2h5JxcVTdGgB1ktxcS61wRVFI3Hudx
	 17Vlss/4hdcbVSU3dCg5/c6+EHDauySMunJr4ZN70ddpgCtfI2lId+0qcZwoj9SlFvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=e15qUec2OZ0h2GwREdIp79FcmOHYvFA4NalPpqIJkEE=;
	b=DeCIwLgNelDOeXtgH5fW0+91rx1kaIci885FCI+mw+tiuMo8epU29x01AHmpaav+XtWS
	 7m0TaNz0bUvY33K/CALqRbP2CFwv4zEAT0W8/Isv1RJBOBFUxeszRCXBR+W11s666hku7
	 kyuEBbl9SIYLUpNcv4t2HKWkCYEek5YuvrQ62dZ+naERqts3oWYtA9CuCdYHe/lDIDoXI
	 H1vLH3GPLlJgMDJL7gavF769jG+6r1FdDJbyqsrqFrufilV7l3mFUWHTKN8M19elDfS/o
	 1GQL/6nsh3mguO6IaDScb4W7PClkcTKPvDWTC522wvdRQcfgdvh/yr96LIXbYv3rOmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tE+EbX5K;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E89606A320
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 11:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23E89606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tE+EbX5K
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso300615a12.2
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 04:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793360291; x=1793965091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e15qUec2OZ0h2GwREdIp79FcmOHYvFA4NalPpqIJkEE=;
        b=tE+EbX5KjLQieRMqd53kce/1beDxB0fzvNrXs+EesbVbO6RCbTs3RUvFY2aNHMLqRi
         S+BOPfIe4jnCUuWdIKhOxX9RwPb8om8Txoj5rtTVhA3UxtureS/YrL7Sz6tJ5r+Prd4f
         kKzAeVO8Hcy++POmk1YpQs4j5e5UC8tbQpcaS1nsKqHeRkD/Ioe37qOmbDTYN7QsQn39
         otQXCXtItQPWq1TWhm+b0+s+nfhP2ckecxD31qkJTUOaumPl08H4a1u3QFXro9x5HV2I
         b2BpRZCuNZPlMEJxlCCB42OEtgrFdAouSz2XGIBq2tGXmrmxX7KCtzfWzQxwtCjOjakR
         RyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360291; x=1793965091;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e15qUec2OZ0h2GwREdIp79FcmOHYvFA4NalPpqIJkEE=;
        b=EocPWRYgMfTiRpUoJ7q6Kd60XC28xmc6hnrJTTcBCysm7NousWhdJH9hyT09TTz4J4
         PyJ3YX+9N7GlzQqziyngN0srcZxDYFhOMxv7FkJDB7eI0Ii45nOEvxbiWIfQlXUnjQFT
         j8S58SAs1S7T60t/a8yJDPP07f6TGqn0eb3WTgMOUg8rm75Ql2TFDyfOwachBlO8Cx04
         F7wWOlHCkzN/hHFM4TG88Iw9Mk5Kor9UZOKPU/iz2jWXD8CEjJbSSfWjPagKkEiZbyQY
         koC/pq93UpOxbgUTBpJxfor4er7fLOL4Ce2jUb+h9dkkVVtHN3EGj/DukvW/pmzxtDxP
         fnug==
X-Forwarded-Encrypted: i=1; AKwUvBxyciTQrwr5uEgAEXWc7zZb7CXUhnbRr8eZkAGU4kAKuSYXb2zHI4Fx3FTuFPj6jQaJHQWMVjAzhW9MQ8Yc7Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJAWse0IahlkLI8wLB/w4LAPOQ/LyuCfo5l6yQetvXoB2FoiR+e
	EU4yMgU3lQmE0jhiE+rgXgPus4RbeVoYkFBi45egU3GdM15bfhBsIxix
X-Gm-Gg: AYBFou2MM0rp+LhuUpUBCrQ9L/2emf/+pkJJ8z1VWDLq4MD3Zd/zt2MiEiqJN+2pmSX
	1+ZyO/Oz/YeOUFvO/H6QE4ntaSvFgRbtEo7X3ptqgtlDoL32RE3jswMymrDDAXv6DBJLXgeuLh7
	RBGytBLzFMQeZ2yARADpzRsW24vJdmhpJrPc6ZScfcWtpb+VOSHUVKlzcWUDs+71L6I1fKDDWaP
	hi4IY3M4e5+Bjf4C/HiYa/cVUJUUWoEDn7MdqkUWiqNWEsmEt9Q3TKA7jLFQ+9qCR3V4C8X4Cic
	llmMfiz9wHlYFSDJ2Sz4PnTLN4MnubfzDceM+ep7pINPPR0zp4SR1lbYr9HUlAkfpMAm9MuQ+f1
	cyVPAlGYAeZF1goaaQXaOIan0C5jo8nY8Tsh8z099CsWqtE9aHeG0WBu1MX8ygWpMVpQYqWnTRS
	FPQG3IXpJqBMsWrZhZqkC/wOMuRlFBfWcJ0w8ON+Zr7tsI4fWUL7w7+mgdiKS+G0WscVj4C2JfR
	//bGYX71xMQHG13ZJee9qIdYnUx02mHnQXZDq+kKqxzAGG6QC05yWtU7V5KJZWfI33/b+SjRkiY
	Ybh9vMhfduJGfe0HdXvJMg==
X-Received: by 2002:a05:6a20:918e:b0:3e1:dfcb:5a75 with SMTP id adf61e73a8af0-3e928956abfmr1766192637.21.1793360291245;
        Fri, 30 Oct 2026 04:38:11 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ea4865c8sm679545b3a.0.2026.10.30.04.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:38:10 -0700 (PDT)
Date: Fri, 30 Oct 2026 07:37:54 -0400
From: Kwanghoon Son <asdfkwang@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 10/12] riscv: dts: bouffalolab: Add Sipeed M1s Dock
Message-ID: <auSBktpboye35BrU@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-10-b736ee920078@gmail.com>
 <20261029-pork-resonant-fb692b84bef7@spud>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-pork-resonant-fb692b84bef7@spud>

On Thu, Oct 29, 2026 at 07:07:00PM +0000, Conor Dooley wrote:
> On Thu, Oct 29, 2026 at 01:05:51AM -0400, Kwanghoon Son wrote:
> > Add the M1s SoM memory and 40 MHz crystal, and enable UART3 on the Dock
> > with a direct stdout path and 115200 8N1 settings.
> > 
> > Boot firmware initializes PSRAM, UART pads and shared PLLs. The tested
> > firmware configures D0 TIME at 320 MHz / 380, represented as 842105 Hz.
> > Firmware using another timer configuration must fix up timebase-
> > frequency. The declared 64 MiB PSRAM range must retain firmware
> > reservations or be narrowed by firmware when memory is assigned to
> > another core.
> > 
> > The stdout path selects the native polling printk console; userspace TTY
> > I/O is deferred.
> > 
> > Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> > ---
> >  arch/riscv/boot/dts/Makefile                          |  1 +
> >  arch/riscv/boot/dts/bouffalolab/Makefile              |  2 ++
> >  .../boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts    | 18 ++++++++++++++++++
> >  arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi | 19 +++++++++++++++++++
> >  4 files changed, 40 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> > index 69d8751fb17c803f0efb8003e111ee24144c222b..294f9c119f8f1d608c878ca1f95891843301f07e 100644
> > --- a/arch/riscv/boot/dts/Makefile
> > +++ b/arch/riscv/boot/dts/Makefile
> > @@ -2,6 +2,7 @@
> >  subdir-y += allwinner
> >  subdir-y += andes
> >  subdir-y += anlogic
> > +subdir-y += bouffalolab
> >  subdir-y += canaan
> >  subdir-y += eswin
> >  subdir-y += microchip
> > diff --git a/arch/riscv/boot/dts/bouffalolab/Makefile b/arch/riscv/boot/dts/bouffalolab/Makefile
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..4d63365edc095fbe9df31c4b12e29c4b624cbd1f
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/bouffalolab/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +dtb-$(CONFIG_ARCH_BOUFFALOLAB) += bl808-sipeed-m1s-dock.dtb
> > diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..c719a53c6e2de45f3718b48ba2116e99c70e559b
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
> > @@ -0,0 +1,18 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +/dts-v1/;
> > +
> > +#include "bl808-sipeed-m1s.dtsi"
> > +
> > +/ {
> > +	model = "Sipeed M1s Dock";
> > +	compatible = "sipeed,m1s-dock", "sipeed,m1s", "bflb,bl808";
> > +
> > +	chosen {
> > +		stdout-path = "/soc/serial@30002000:115200n8";
> 
> You should be able to do this normally, with an alias. Why are you not
> just using what Jisheng did?

Because rust does NOT have alias OF yet.
I intended to post the Rust OF alias helper separately after this RFC.
But if this way wrong, I would patch for rust OF alias together.

> 
> > +	};
> > +};
> > +
> > +&uart3 {
> > +	status = "okay";
> > +};
> > diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..ae54e6e301ed2c5a1448d52c530c5074515ee38c
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
> > @@ -0,0 +1,19 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +#include "bl808.dtsi"
> > +
> > +/ {
> > +	compatible = "sipeed,m1s", "bflb,bl808";
> > +	memory@50000000 {
> > +		device_type = "memory";
> > +		reg = <0x50000000 0x04000000>;
> > +	};
> > +
> > +	cpus {
> > +		timebase-frequency = <842105>;
> > +	};
> > +};
> > +
> > +&xtal {
> > +	clock-frequency = <40000000>;
> > +};
> > 
> > -- 
> > 2.47.3
> > 


