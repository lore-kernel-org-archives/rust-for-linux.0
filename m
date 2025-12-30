Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED5A134CF
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Dec 2025 00:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767053841; cv=none; b=VOHs6kKTN2pZiAU+4Ay/gCJPZ3vqrjRibnhjaG6z+uT3acLMAdbpwbarraECKtrjiwPo0/xT0U6pta3WVf6QHNORl5jMUkqP6L1tTmqGdPYlOFI/aThsQkye+AA8rotQbnRiwGjVCrK0LNCngVBxJT88E2bNrhu/s4eJ5+z3ZkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767053841; c=relaxed/simple;
	bh=/4DDN/3gIQCM0o5cnOfsf59pP8c4OuQrBPqNlv11YC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSS7/FpMKvXcCpT4DwAXl5Y/FcMuwPzQfUgY63Lhg3+P18sXA/ndX52Hpi5F7s/MkLaSCb7/8N2QzT8pZClPi2O37Myd+hbAUoaOEIXwEYkFjGF/SPb4RpYeMuWU/GeuZBc0McOya2EnAJZB8skhthW5YLWVax92351UB7wYLyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCI3Hsgw; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCI3Hsgw"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4f1b212ba25so83613991cf.2
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 16:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767053839; x=1767658639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3W+y9lqoOSloOorX1TW32/410l7bPpqKG/R2mp51Mg=;
        b=HCI3HsgwL28Aovk81lPv8g9iN3ToSS2bZIwHQcISLclU1BcJViC+/Iv1tf/Airkxhf
         lqxsPHheKX5+OyNll7EhfTE4NHLTNfJ+h+bnUTmIzRdhRLYwaTXcXAoUwwQDoFr1MfrK
         lGvgSZGkxS4Fi5J06eNU8GqTejhSy+01sF41Jmg4XCgsiJWaAtniNsiFIlMMXqb+nUs+
         MOYqbZejE+c3LYDoj8XTBa9ARBbvb1g6CYfUIcDouyqqh9tKGcC3Aty9CY1PXomrwBg4
         V1NIOO3t0PJkL9uXkIz2DtKpnnrFGbuxSy/xc8WNdeyvavpUUSfUWJuW5whVsp18pFa9
         KBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767053839; x=1767658639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I3W+y9lqoOSloOorX1TW32/410l7bPpqKG/R2mp51Mg=;
        b=UC0AqWRPip/kQLab3K+i1ihVGqfDATPunhFE31Ll0AvDSYiCHxgqKXlGv6ynEE0Hnr
         2LbWyfxwRnmCcRAEdiA79fCKQNPuHB0I4oKOzfanTFv0xXR7ZQqJH66Kn283/qhIV8qP
         t9Nk+6zhr92YwlNLjF3FHA8/owGhjTazQs/XHFbZ3nrxBayIM2c/iiF1k7LtymfnMRgb
         4biFyrReLarq32oks4mKpipT9BHDT4Qf5scbW6aO8sbP0ZxscZkAP4T9XaLvj9zPqM0U
         cZsuZPWBULC9VnC7n4+27hYddS7hPLFdMPeTaJ/AFZ3ti3GXE4Dqo0OPO8NEAKU6rPIa
         EXPg==
X-Forwarded-Encrypted: i=1; AJvYcCVLv+nxbdnrMqAA6mKW2kZRf89hV1aJ4fje4t6vja+yOM/4YyOjJRySIiQqAiB0+yk8C6TpRojQbKXoHwjHdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiasqYS85O5nQBjpkPjcKP46YxaJJukTwju/o9iKqPZoy1lLY6
	pCkUXvMrb6Tf4BUlBtQd6xkrPfZDzFX4zlfXnuahD59E5QNlUj4IXSIL
X-Gm-Gg: AY/fxX4KBt6vSaDg2oBG5f8WUdl2dUGlgboAyNjYo+BwS5kSjl39H0K17mrhYMH7UEG
	MWTGOn/eV2Xa2Cfg/+us5ss8YAu3xUGJjB6n4Ps/tk7DRxp2Yq7Mfa0fZWTJEIMajUyZ9Fd8beN
	2lSUZXAAoj39Mrd3IRFZvkPuK99fP4BV5BHu/i+pDRq2cnmfgeNK6xfdK3Cy/SRljoCkQjMIDE0
	ZJsEnV37X/sMKD0HQwuBZUcMvlVe2cUUJ8u76Who3saEzll0KVnB17KMrMa9BbM3Ncu6H6UM7HR
	e3vFme9yXy/jnSbcG1WsY3BuXk3x2hQpyWHxzo/GYfFOM5ELTfoCSxUydTfRSCYxSgiRTmJbyr1
	74dP0BeikR9UWz4T9Z+r04cnsiqiT87ZJEpNBdIZgH9hQQFhOH/lSXtjeWHndx2rikWvCqZGx3d
	1Bg+nxYBp7lh32xozrUUXwd3PhVJ4c4XzaWzBXDMaEEKPwcF5/najUCcFH/PkFtY1marL4F+LoX
	m2pkzmVsEzDZNyqu3VxdROc1Q==
X-Google-Smtp-Source: AGHT+IGMhISQN0aQ5+CVm+O84FCUsvrfO0PjPvKQRNTJQjKuH52aETix+mqiToBhhZBeLE6evVYvUw==
X-Received: by 2002:a05:622a:588c:b0:4f3:4c48:8899 with SMTP id d75a77b69052e-4f4abd8c8damr594549821cf.46.1767053838917;
        Mon, 29 Dec 2025 16:17:18 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac62e1e7sm230890441cf.21.2025.12.29.16.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 16:17:18 -0800 (PST)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id B5F5CF40068;
	Mon, 29 Dec 2025 19:17:17 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 29 Dec 2025 19:17:17 -0500
X-ME-Sender: <xms:DRpTaTnQ761mN5xwzJrL8489UjsF9HpV4DmCtA-Ci9y3E2lhQzRwNQ>
    <xme:DRpTadV9KEz6rM8l8fJwHuWbdB9GqfEmctwG3Omud98YfwlIsmTy3mV9BPQlD1tAi
    zsWdpkbJ_-VBDsW_qx4ZRboeLKwaqdhs-VjIIxuJbXOTbZAX5_R>
X-ME-Received: <xmr:DRpTaXr8kB3qNFb2o5BKtuEJsQuTVSKltjm2KRcdtwr7MmbaWprKD2pMb6X->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejkeehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepfhhujhhithgrrd
    htohhmohhnohhrihesghhmrghilhdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthht
    ohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepug
    grkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:DRpTaeVns3OQ73Nz_y8_yQg9aN-xSbqKrkC4qejvX4fY5uM1e2pU8Q>
    <xmx:DRpTaYHdxEnJjX3QCncUtxy0rWhW-RkoAQMuBNVMv8522sdndVnokQ>
    <xmx:DRpTaVAphvbcwSZvHF_9VtCY9lvHO8m61P5wDZjfjPH8BQxWHaeRlQ>
    <xmx:DRpTaazEdL2lupbLvEGak9BkmFajKU0vB3IxTRuu-xz0HLKV6DhZcg>
    <xmx:DRpTabeMejqKaYx16bshlGrfNpLjDUZh0yehbCoWaGyKDvVgjhx8jav7>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 Dec 2025 19:17:16 -0500 (EST)
Date: Tue, 30 Dec 2025 08:17:13 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, ojeda@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, lossin@kernel.org,
	tmgross@umich.edu, acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v1 1/3] rust: sync: atomic: Prepare AtomicOps macros for
 i8/i16 support
Message-ID: <aVMaCTO1zOAHU6fR@tardis-2.local>
References: <20251228120546.1602275-1-fujita.tomonori@gmail.com>
 <20251228120546.1602275-2-fujita.tomonori@gmail.com>
 <aVJiR72gcz_uonoS@tardis-2.local>
 <20251229163616.732caffb.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229163616.732caffb.gary@garyguo.net>

On Mon, Dec 29, 2025 at 04:36:16PM +0000, Gary Guo wrote:
> On Mon, 29 Dec 2025 19:13:11 +0800
> Boqun Feng <boqun.feng@gmail.com> wrote:
> 
> > On Sun, Dec 28, 2025 at 09:05:44PM +0900, FUJITA Tomonori wrote:
> > > Rework the internal AtomicOps macro plumbing to generate per-type
> > > implementations from a mapping list.
> > > 
> > > Capture the trait definition once and reuse it for both declaration
> > > and per-type impl expansion to reduce duplication and keep future
> > > extensions simple.
> > > 
> > > This is a preparatory refactor for enabling i8/i16 atomics cleanly.
> > > 
> > > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>  
> > 
> > Thanks! I have an idea that uses proc-macro to generate the Atomic*Ops
> > impls, e.g.
> > 
> >     #[atomic_ops(i8, i16, i32, i64)]
> >     pub trait AtomicBasicOps {
> >         #[variant(acquire)]
> >         fn read(a: &AtomicRepr<Self>) -> Self {
> > 	    unsafe { binding_call!(a.as_ptr().cast()) }
> > 	}
> >     }
> 
> Unless the proc macro is generally applicable to a wide range of subsystem
> abstractions, I would still prefer to use declarative macros.
> 

But the tt-muncher style is quite challenging for a boarder audience to
understand and change (if necessary) the declarative macros. IMO, if we
can have mod-specific proc macros (i.e. macros that are only usable in
atomic mod) then it should be fine. Thoughts?

Regards,
Boqun

> Best,
> Gary
> 
> > 
> > But I think the current solution in your patch suffices as a temporary
> > solution at least.
> > 
> > Regards,
> > Boqun
