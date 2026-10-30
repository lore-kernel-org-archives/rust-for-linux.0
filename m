Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793339928;
	b=Ze09qlT773Zuz469SywPJx9b4fYJIhQA6Qn/YzFYh4asMjONXjq6Un9e4VRcXXntamBr
	 ZMZx/mQxbHYGyFn2QxNrZ/0gKJqh70Q7S1hRBCVvKpSMaWygn9irJohMSf4RASu12NhCF
	 DAeUmJ028/5OnNYh4p/XecSP7t3TfcvMKI89SeVoOJBzlSaoh8jm5EMwd+Qx3UVmDPYM2
	 T5k56kaLB4OCQb7iodl8uxY8v5lhj/dsAGQCka6q0cGBINmFYNNg/mgpMHJEhOquLYI/U
	 yXzbfyIdJmzxTM09Irk9j4xfZxPcvkrjd7KD3mMYEkTKTzZViu+yLhvrTLf+HarS9Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793339928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=x1ZOonFo86/OLdHx4TEfvsl1dhP8QB7LtaQ6AkA34Vc=;
	b=JnVL1TDO+zBLMMmea3elOFVp/R55LLhIaPCL+7Hdi4nJ6vNcldUJBuat3NOMBAbIjWLV
	 TksXH0IRZdSfTPXzdaVvGjc7I69P2JLnPZBWvLIs/p7bVJZDa1oiMy6GteD24mEuIqZoN
	 J9UwPIA21jDeHvZADZTFJCojpuu1DwPT8SXfor0S1D3NiQP1aggfSWunZWG/G4cNL8c7b
	 rfLsSidc2I4EwTwEzD1gPqvFNFJZnqhu+9wVwrI801zxzhH2hyuLKUc803wejHNkNldtb
	 T2eU6HGJT40tvD3bCD5iFr1co3slf30cLS0MZ4Z0oMIvIoMiHqD4xyEAwLyyRt4tAOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UxOWSyi0;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CD0606A31D
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 05:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35CD0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UxOWSyi0
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so275561a91.2
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 22:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793339927; x=1793944727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x1ZOonFo86/OLdHx4TEfvsl1dhP8QB7LtaQ6AkA34Vc=;
        b=UxOWSyi0ZLjT6K/CtEHFfVSX4upjGZhtjvTQuYaOgoghxRdqk6YuYKma/rstK8OnyW
         EnlMZpYbwB5JxxcbXq8zBvy+70m6AbbNzMP6+FwnV2skuLOZ6ipMEK7v5pYZrMDTRWMA
         AyTTdhQO6aHAZ+xHJkR7p1UXP7BbTaP+l3sXKECV2E/6YG8xkNC8Hzwx4lzFGnBXzpzh
         qye8ca0y3z2k++H2xxu1sQvDiEJY2Euq6dJmJ8wdUAnZTEfBMvK1RmzJsXaY7ZA4XjhU
         GuO0J7l9DqYUyarNsZNIDWJGksm/oUJs3nxPxK0HlTarEOkVg9jXhvNXEJBdgV3wfrIP
         naag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793339927; x=1793944727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1ZOonFo86/OLdHx4TEfvsl1dhP8QB7LtaQ6AkA34Vc=;
        b=gS9VuWY+m2ZU+HdHxnUVUpjXfITEeYg/VIDhYwxRI/o619TrCCRGChx0X5UfBHaX0N
         RgHfxO5QtoMj8eho5tpkE2oN1OaCH7amhGTg+XCkOym0FlDBd1a7uPutTQw2HCyWenq/
         0/y7fS1ZV8DGErUHhetpUiIqdTlMc5lmW1fSaiYSIKrEnpsJg77XatTSIldBCT/YY0hP
         knX9hWw/ULhP6sYKmaXXfzNTXiZm5PSRBi+EH80ccMegzs5TSC44tljrt334bRBEIuax
         O9gWOA+RHsjIPPTA6URYiPccpMcDGuRW4rqg1AvzHg6fK+WvH0EOm9vIZ7QiNgQw2wZR
         RLoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNt8Dq4FObp9Tw1kP3PJ4zlcD50fc7hXhj+DEodVRW5OTh0PVjKgPU4n+3yzLkB/1HgTMDp88lW90ScSqHnA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKrXGDeQ2e2wavExH1wmFRCSU/aPlI6ivu6yr9z7MWNjtGCU/YV
	5ZvoXhbl5wKvJ0gJ0UgDeZHBQS0rMpdayvihSMeOOQyIvPzTgxeN3hu9
X-Gm-Gg: AYBFou0+sixJ7XPF5KuBYYsNSIZ8aQTDK3/M0PllXHtZdCmuMsPSlW/KrMrQl+8olL5
	2vIOyvtZ86m9sGcXXNL5RVyMumWB1lcEIvW8Uodw+nYvXVgYsC8UfhPsCaSyjJKHtDfW7BUEFya
	lbCb46/9/rPPEyHtL49F5nPIJp9RXBMtx5rSD0TZTBy4K/yp7T/9q5MuB/A03CgFR73dB8Hbw6y
	Xd+w9QPJFd6xUiaH3ITxBUbamBinAl834DdcxFGekQ+lI3Tla/tBWEr2khhyfQQVm/HG3sqp/Di
	kYs6cwWg8gn7POGYSq1/kA0l6jVdNdpKXs2Q4pffVYPsf7bfZ/ZmmZkEGa9wl/BWGnLHLhapOZ7
	DsHGdwPlfscDgkRNRDPp2+qvJJ/PnZ8cngicUwAW7p8vjgAnGlu7JsRf1DusWXUvpHlsG2uT8lE
	AqTRipAdy+G7s8DWh/7+MIvwmENsUJODM00WukqKJxoYU0oatho909ADhjUKAzxDSqeX0HI2zk/
	Ved8cZ60PO1eloQKOuXl4XyRZRd0u0M9BsJknDeQrO+6FtWCLN+2sUhP/gpzpyqnP4f1MVECeHG
	tnq6FUulY7y4xWLxDzqV4g==
X-Received: by 2002:a17:90b:4e88:b0:3ac:85be:cd52 with SMTP id 98e67ed59e1d1-3ae89867829mr983310a91.59.1793339927439;
        Thu, 29 Oct 2026 22:58:47 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8fb2c5sm7211185a91.3.2026.10.29.22.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 22:58:46 -0700 (PDT)
Date: Fri, 30 Oct 2026 01:58:38 -0400
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
Subject: Re: [PATCH RFC 08/12] riscv: Add Bouffalo Lab SoC selection
Message-ID: <auQyDnBA2tS2MtxV@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-8-b736ee920078@gmail.com>
 <20261029-urging-dimly-3747c8bb9b1f@spud>
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
In-Reply-To: <20261029-urging-dimly-3747c8bb9b1f@spud>

On Thu, Oct 29, 2026 at 06:58:41PM +0000, Conor Dooley wrote:
> On Thu, Oct 29, 2026 at 01:05:49AM -0400, Kwanghoon Son wrote:
> > Add a platform selection for the BL808 64-bit D0 processor, including
> > the T-HEAD errata and common clock framework used by its UART.
> > 
> > Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> > ---
> >  arch/riscv/Kconfig.socs | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index cecbce0c498384d3283ed23cbf2514391eee361d..ea4667da7716a9a8d2ae156c422b277064b42530 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -12,6 +12,14 @@ config ARCH_ANLOGIC
> >  	help
> >  	  This enables support for Anlogic SoC platform hardware.
> >  
> > +config ARCH_BOUFFALOLAB
> > +	bool "Bouffalo Lab BL808 SoC"
> 
> Ideally, this should be more generic because it would eventually include
> other bouffalo devices.

Agreed. I'll change the discription more detail with devices
information.

> 
> > +	depends on 64BIT && MMU
> > +	select ERRATA_THEAD
> 
> > +	select COMMON_CLK
> 
> This is not needed, there's a select of COMMON_CLK at the arch level.
> 

I'll remove the redundant select COMMON_CLK in v2 as well.

> > +	help
> > +	  This enables support for Bouffalo Lab SoC platform hardware.
> > +
> >  config ARCH_ESWIN
> >  	bool "ESWIN SoCs"
> >  	help
> > 
> > -- 
> > 2.47.3
> > 


