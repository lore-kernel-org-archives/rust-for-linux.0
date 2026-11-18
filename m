Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031494;
	b=zdAocnlgAxoO66AQdh5aBFbtoHnHqmbxWMHXQnP1zL+wFIGkZu0F5vcrbZozqI/4YPEW
	 vILEygCl1iVgDsLzGKmYcyEY/FuGQAR0IOcMLa8yAloEI7Z2RZBvUI6elHvjHzzLeYN6N
	 mmcFi3trNItB9tfGT2WeeePoq5128C0ohC2Bwhy33ISqxcLut86VSo4deHoqes5zN9dx6
	 KK2TcSvqCVttXf0i9Vn3jhURlQ9z/cuVhxf/K0XaAyfCC1Sy4u+1XsITjYe4eby0BrkJR
	 9t2brvWj/VnXUbjP3VFT0uKn7avYgxDNVJpeXot5XMrBL7DZfnYxPjulGo5mToAS0Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hFZIFuBcLJ0vIHcol0BdyKUl3oPu8AoNqdKHILyKuII=;
	b=FPAmYq99qim6yca37EG5VxmxKblFO1rXefHNwjGvib2h1yhSBFUOrtcgUR1bhAhJaO3b
	 BwEOSZ3xLh4qCFZ/zo7Xm3mxgZGb60neaZ5TLMdsmV3KVfW8hNSYWNt+hViZQ9QDGsDww
	 Jtv9uUrn2XSB9sh41gmT4E+5etUAId+CR4GSXzaYPihP37suBUZDQsYsWi+khP1QGXQs+
	 DrwgGHxXFOtjuILPMM4arbyDMGcgRMsMTaltx75+yZqeBRx1DgLWxoM1rkhY0Wm6LLEDH
	 9LUV2VBwHLPN+2ebn3glF/cCAAlMOREM9LgsoxjRHZYDj/5ugXalym13eoC7/rKIdJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=WKSG3Zvr;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4029D606A32C
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 19:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4029D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=WKSG3Zvr
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-55c48582654so13713891cf.0
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 11:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795031492; x=1795636292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hFZIFuBcLJ0vIHcol0BdyKUl3oPu8AoNqdKHILyKuII=;
        b=WKSG3ZvrbYlpeJhk6eXKzVq3xvXMpAXTZx9MjhnnyVtpO2qrGiihLN5PJpObuRYH+C
         u31+gjYxf/VeBm5+2VXc4kdQG/wUxM0zY04LOXsBQeoMvO0uQnTY11CvJPKkvIVx1le4
         HBqgJaWLX1XNTbaPdzM7oKxghxyrDtxpYKcEdhx9XpM9qT0pZcEAhvoWB+XLb3wg8jkx
         wP7StsJ0BNHPTWZTFspYEEBVlw31KEhhC49n6P3eMFwTEJKJ3z12yekAUaU2X7N30AQL
         uTZbsDqce5hhpuRgqexrdJIaCC8ce9sfirP/A4KQc/gJPkVJOvOvJDVhIp6f6V5eH7zG
         mRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795031492; x=1795636292;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFZIFuBcLJ0vIHcol0BdyKUl3oPu8AoNqdKHILyKuII=;
        b=NaZ/umCO6U7tFRTDgOhp5IMxZm8QFeBPL4LwULr47j1JhVB34w2Nq2EChoAk1YBel6
         z6rgkk7GU78Tzm0LQJIN2lvPqp5x2WYK5hbC096TfkGaZsvJUwcKDLyN3SLe4KQRUFyB
         0JUK6ovwkrFQSsBA27EueYxq8hY6dxuaa0QyzByN3nyFnORZrHQ/5E9Xl7AQKAVeLp7i
         AuziMWf3k4/+2fzyBb/5Y6ew0yf95hERLm1otIsJShdN5tnCrO4HUfkdKzZF4AFQe90w
         y4yD20SvU2KOGm9TKd94ENcupvn+SZ6uPMbxBsN2Z8rdcirru/N9V2VETtubuJNnJLXW
         pe0Q==
X-Forwarded-Encrypted: i=1; AL+hErFg4/Y/nB06DUz9XTxGjwn3MdjNWhLsHiHiqGmJ28+tKj1J47YwoXco2ckITWUKZuMC5V0GWJvnZxFN9YOIjQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+qf3ZbI5AWnMJtBoaP7ZkYymAAguyuIm8IWjNR6MNvgJz0YRMZ
	y0eqCG8IvDfIaHzT8BhbQAHdhjjtEZH7fQZryFKUSY/lpefKxu5m28w3OxXhRBi1AO8=
X-Gm-Gg: AYBFou09Jy2JoAc8kRfg7iORv/UnEIcg2/lD0fZGCa1iVU2PM7wSZ7oZkEsBYOUf4n7
	QOOSRjdWogygzuxccl6V3Os94vjvPq90VALzmKJBshd0YDv6+jTQnxTT2n+CttWBaYNHpUAPK3S
	+APB+rk5GMfG58PJMne2z7gQTaetVjOoX4hkFh/nhZAecMp5eIKv5sdIVNoOwSq/1Im2XUX1czf
	srlzIVCKVns6SGF9HfeyVsPCUNy0iL1/oCFJywt5mdhsNYkteiNzkp018zj0nWIe/4UnKr7Xhss
	bdoZpb9WH86c6pTTuQepSmKWRmJFYaTwl1nfN04Zwlin8s4Xqa55g7oxEeEuV1R/b3itT7g8Kol
	Rj5ZDb4lONQq9T3PgcmOEuwpQFHWA4Dp9b8fjdLrMgGue3K0KsNimhUTtiL197+9lAtr09LjFJi
	lKQr0Yyk4m3vrunP6/E2eMUuvr75Oy8t0vw9U0LkGOmH+QRo/VlK9OX6zRlWw93qOVnqAeURQf1
	yX0+PwZzvS5GKbwehZR3s4w+5HQXF2z9W14yTbik1/OuD/WvLCHkpHWyy8j93eWXHwilnrLBRJf
	pven8w==
X-Received: by 2002:a05:622a:14c6:b0:535:24f8:fe3c with SMTP id d75a77b69052e-55d5a34dfa4mr59779801cf.5.1795031492124;
        Wed, 18 Nov 2026 11:51:32 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d98adbsm29661026d6.40.2026.11.18.11.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:51:31 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTlgo-0000000GIH6-327U;
	Wed, 18 Nov 2026 15:51:30 -0400
Date: Wed, 18 Nov 2026 15:51:30 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, iommu@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 0/6] rust: iommu: add a paging domain abstraction
Message-ID: <20261118195130.GE3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <b145b2ceb92c73a4fa0477d7b3895a6e3b4adf99.camel@collabora.com>
 <20261118160909.GC3115493@ziepe.ca>
 <ede3b421d419a35c115ed584e60e74bfd6b91dff.camel@collabora.com>
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
In-Reply-To: <ede3b421d419a35c115ed584e60e74bfd6b91dff.camel@collabora.com>

On Wed, Nov 18, 2026 at 02:31:28PM -0500, Nicolas Dufresne wrote:
> > > This seem to digress. All we want to do is use the iommu subsystem as intended
> > > for the case the iommu driver is not inside the DRM driver (which seems to have
> > > never been the case so far in DRM).
> > 
> > "As intended" means you use the DMA API and you do not touch
> > the paging domain.
> > 
> > "As intended" means you use iommufd if you want a domain full of user
> > controlled mappings.
> 
> As discussed at LPC, we believe its pointless for this type of device to give
> any direct page choices to userspace. Can you explain why you believe
> differently?

This is what was asked for a few messages back?

> I'm not sure how this applies to our work. But since they are all broken
> according to you, let me give example of cores/iommu mapping we are using, and
> perhaps you'll be able to explain us correctly? I've picked the Rockchip video
> decoder, which is upstream but expose through V4L2 stateless API, but from a
> hardware point of view is pretty much identical:
> 
> The DT (which I read you must be broken and in violation of everything, yet all
> reviewed by DT maintainers):
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi#n1400

You linked to a clocks line, I have no idea what I'm supposed to look
at in this file. Can you explain what parts of the DT apply to what
you are intersted in?

> The multi-core support proposal, its not doing process isolation, its not
> strictly needed in higher level abstraction (though could be better), but its
> using domains so that each core can actually see the same memory:
> https://lore.kernel.org/all/20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com/

IIRC This is the driver that had the weird not-quite-an-iommu issue and
there were many complaints about it doing things with the API that
make no sense because it's HW is bad.

                /*
                 * To rewrite mapping into the attached IOMMU core, attach a new empty domain that
                 * will program an empty table, then detach it to restore the default domain and
                 * all cached mappings.
                 * This is safely done in this interrupt handler to make sure no memory get mapped
                 * through the IOMMU while the empty domain is attached.
                 */

But that doesn't excuse this:

  As each core has its own IOMMU core, buffers must be mapped in each
  core's IOMMU so that any run() call can use any core without having to
  remap everything.

  To do that, we use rockchip iommu domain's iommu devices list.
  With that, one IOMMU domain can be mapped on multiple devices, meaning
  that each call to iommu_map() will flush the new mapping on all devices
  in the list.

We have DT for this already, you use iommus=[] and list all your
iommus and it sets everything up for you. Going around and changing
domains behind the scenes when the core already attached DMA API

Then WTF is this:

-                       ret = iommu_map(iommu_get_domain_for_dev(core->dev),
-                                       virt_addr, phys_addr,

Seriously? You cannot directly map to a DMA API owned domain. It is
fully illegal.

> The DMA abstraction that is used by the above driver:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/common/videobuf2/videobuf2-dma-contig.c

Thats DMA API so it looks OK?

Jason
