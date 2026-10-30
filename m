Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793360686;
	b=DZdFUF9S8G1jItGIXFyRKxbyjAT8fXZ095vcefxBIARNlC9PEG9bUUVsbt4ArH67vPg4
	 stt+Q17YzVhsVZNe1/PYymXQXqq7NozJftSgq8AburcqTSV//L390h0d2xd+f5oEMN63P
	 3GWoOAhcHQhuXYBgmQ+iItO0Or6eaeS5YaLhWrTIARvGai5RG9VhnjE0Mnnuop1F96S4v
	 3TgVorV+URzK0r9ZH1ruEpS1ckRhq5vz4AldAiuq1xPAr8/qN/WN1sTT+sE0PmaEGfJ9C
	 exVCkFF6MIUWKWp9H4KL4e4wNLrjLlz8dptRfh4FyBwLcnhXMMGgjwsSHNyVWPv9PJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=J/6UIvMwC+2M7xk6hrl7rsj5PVVyi+u7mrNva4BtF6A=;
	b=yrGttfagVOIUlb3gPctFyFsWnblLZTT4ROoGf5s5Gg+RuhdEor/36JQ/cOPCh9s+XkEo
	 ZcdaCwQOOvWlpGd4RESt2qMrD/6UqLwXHWngjoqVxwgfscQdxWERBs2Sfo7x4x07+WK0J
	 qC20jeIyUA157ZL2xj3dlX9FuQYY8fRBkgPj3iTr7c1lJoE2o0g8eD/0kqfwegMIYX/I/
	 wMwouKY6zxJuYThbVocr+eBuakWNST8HJRBGtGgo/prhHOppvZErVJYVe8glD0xZoHJFu
	 7+RNfDNA4WxTVqHXFXNXD972tQJ6OADpV/C8PTCmd/7QgdvsxbXW3w7Y066QeBR87Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2ZLV5dl;
	arc=none smtp.remote-ip=74.125.228.8
Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F03F606A335
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 11:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F03F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2ZLV5dl
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-cd3da0e82daso107098a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 04:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793360684; x=1793965484; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J/6UIvMwC+2M7xk6hrl7rsj5PVVyi+u7mrNva4BtF6A=;
        b=g2ZLV5dlxpbuDPCjK1MaVrsjqjHMaipBPBqsisVQUZ6Ty0skoAdWgIyeA/J9clATlp
         1p31QUCLSPGy4TWe5KV53YJ0M5p3O8t50RFB+4xnBn+6p7AZfE273lGPVGIPHOozNW4I
         Brk88Y8w+9TGUkPqvbXhVtdn57OSLzIo8kkyGSJKcqqMoGP9/9uk2gR7hADIIutWzDjg
         7gpHz4vxYE0+7wo7MVXxWBdrsSaWVdHnQ86v2oJOfSh+JISrsA4SZCk6lj5ulEpnJ10Q
         ulC+27nUlFpdausCL04tV09g1AbYKQxaiCg3/e6n6n8iqx/cOEYX/bJmH8eJ822ICDF1
         m3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360684; x=1793965484;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/6UIvMwC+2M7xk6hrl7rsj5PVVyi+u7mrNva4BtF6A=;
        b=cee4+uzNE1yoe6FOKaoamR2/w8JmUXYJtyB79A2+PbhsNJGcJJMKVAsLUC2u+Cxf0G
         3pft79OZwPzYE3JA90mFawFUVE6CXbWIEnzGGQJrCokTZzwWe8sgb5SPehli8SysYdHJ
         Jx8Il/sYhA1BSK1Tmp8/wOEKO9WL4DxQU5IAiuBWjywy6Wob/nTATmcWM8b6fyqh6q/P
         UM1ThZZjl7h0Q8WGCFiwgn26YT4+wOfYhYXPCa5LA5uUhYnTXQLF46cSE2mtzvqN2UVS
         e3vloAL4pgMnuDwtYV6XAP+Wnu8WdqTxlqiIpZ8eybfsuTPhI5d+VUdWBKMd6MmaFllY
         seiw==
X-Forwarded-Encrypted: i=1; AKwUvByVcOkAQfC10y+ASE9KkVTj1IZRU57b7MtJoVO5YqaUR++vG89DaTM9feENZw12lpVJEZfSNlKepoNKo+O+NQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIkZOE9dTL70sueR6FKFgmTX6kiZnO+NNSYxwkF6DOnVtHIRvqR
	vWU8oXEAEF9m4B8X+n51Q9BDNdEiInbREVM5WjryZpLCOZfJbbIZhnur
X-Gm-Gg: AYBFou1S3MvyOu4O9pSzRI40qos+OW3+LqiO64MSPxqIys2H7B2G+pkognzazZ+J6Rh
	Hrstl03obJJFQHzKVFOvneJnZK3vWKBcP/KX05w5ge0N7jByPdW6rGpbm4CGe8/ImefSYN0jmGr
	052sYHnsHIE6w1VybTOHw4C78wzw9SW5+ySB2rU7eIOKhQ2EAmL11sNJcWfq7MuU1dTtrS5GRb6
	lDA4WmtUtViXQe3lyjqe5uSINkGaHItq6AYU1bxdd92bss9e7G95SBFfXnuL6BfZj7CJMA/62pM
	JC3HRGM4m1sMs93Q+wd+dh1WRhkx6u17G6+jqsUfdt3puKnN5lKb/yvTneZahLpMwYtt/g4EC6e
	aMOi6L6x4fnGGsI+xuKC22b/dbQ8uCQ9q6q3j8ao/P5EFlluY/pou44lXOxSbxKjS6/ZiSjD+/8
	Cx4nQhUrNxPPttFwnwDAeDsm52syV7cb99e/V7QhGwm86ph0O1+Lk6p9fu2i3fHsGlRMBz8t+Wx
	U4MGMxwQjxn1lDzJ0wX+9d5f9wSNHioKNT3+o9iZ76rIcpj4KybD+xlWjbeqPFmvtkFiQj0NDxl
	7ao0UAV7hY1y+Sd9JtZH3Q==
X-Received: by 2002:a05:6a00:2d1c:b0:8a0:7dc4:95c0 with SMTP id d2e1a72fcca58-8a9be5896acmr1842901b3a.15.1793360684421;
        Fri, 30 Oct 2026 04:44:44 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9eef957e6sm660253b3a.15.2026.10.30.04.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:44:43 -0700 (PDT)
Date: Fri, 30 Oct 2026 07:44:36 -0400
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
Subject: Re: [PATCH RFC 12/12] MAINTAINERS: Add Bouffalo Lab BL808 support
Message-ID: <auSDJH9V31wmbrYv@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
 <20261029-spyglass-evasion-772697094cb9@spud>
 <20261029-amuser-savior-6a6ab062f471@spud>
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
In-Reply-To: <20261029-amuser-savior-6a6ab062f471@spud>

On Thu, Oct 29, 2026 at 07:20:41PM +0000, Conor Dooley wrote:
> On Thu, Oct 29, 2026 at 07:08:56PM +0000, Conor Dooley wrote:
> > On Thu, Oct 29, 2026 at 01:05:53AM -0400, Kwanghoon Son wrote:
> > > Add a MAINTAINERS entry for the Bouffalo Lab BL808 platform, device trees
> > > and Rust serial driver and abstractions.
> > > 
> > > Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> > > ---
> > >  MAINTAINERS | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 801f964899ba790a8f71fe61f9b3777a494dabd5..b76d3e168468bf6139c958a81b626c73b422c0d4 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -4926,6 +4926,19 @@ S:	Maintained
> > >  F:	Documentation/devicetree/bindings/iio/imu/bosch,bmi323.yaml
> > >  F:	drivers/iio/imu/bmi323/
> > >  
> > > +BOUFFALO LAB BL808 SUPPORT
> > > +M:	Kwanghoon Son <asdfkwang@gmail.com>
> > > +L:	linux-riscv@lists.infradead.org
> > > +L:	linux-serial@vger.kernel.org
> > > +S:	Maintained
> > 
> > Missing git tree, unless you're expecting me to apply patches for the
> > platform for you?

I added this entry after seeing checkpatch's MAINTAINERS warning,
but made its scope too broad. I'll separate the BL808 platform support
from the generic Rust serial abstractions in MAINTAINERS.

> 
> Additionally, are you actually going to add wider scale support for this
> device? Like a clock-controller driver and the various other
> peripherals, or is this really just a vehicle to support your rust
> serial driver work?
> 

Yes, I'd like to extend BL808 support beyond serial. I have local work
on peripheral clock/reset support, pinctrl/GPIO, SPI and PWM, including
an SPI display on the M1s Dock.

I'd like to bring those pieces upstream incrementally as they are ready!

> > 
> > > +F:	Documentation/devicetree/bindings/riscv/bflb.yaml
> > > +F:	Documentation/devicetree/bindings/serial/bflb,uart.yaml
> > > +F:	arch/riscv/boot/dts/bouffalolab/
> > > +F:	drivers/tty/serial/bflb_uart.rs
> > 
> > > +F:	rust/helpers/serial.c
> > > +F:	rust/kernel/serial.rs
> > > +F:	rust/kernel/serial/
> > 
> > These should probably not be maintained under the arch support since
> > they're not platform specific.
> > 
> > > +
> > >  BPF JIT for ARC
> > >  M:	Shahab Vahedi <list+bpf@vahedi.org>
> > >  L:	bpf@vger.kernel.org
> > > 
> > > -- 
> > > 2.47.3
> > > 
> 
> 

Thanks for review!

Best regards,
Kwang.
