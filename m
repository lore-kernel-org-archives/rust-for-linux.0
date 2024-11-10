Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB55F38FA6
	for <rust-for-linux@vger.kernel.org>; Sun, 10 Nov 2024 19:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731266601; cv=none; b=l4u3WsHOz7Ut42xlP2L4wjgvXB10WenOypvIVwSiPu3d500tAxmqNgtooVxP87qElCqn+bzZZOxzLgotoSa1Rj9O0PtCmvuRADDdXxAizswvcE9YfX/Ak9Jn7bqc+iqQug2OJhzd6ZaNWpsXlAJHiF0yvM8KZj3tthvSotV4gg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731266601; c=relaxed/simple;
	bh=bX1MUWvnYD3JNbCYbWbAIIRqUx63rVvu7yBF5seTKy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwHmcqOysVOatPw0x904Dv90iv0IJbQxpTSi8vHSSNjBpgpAlpwg9Dsj9CWMv/zmZmR3Hlk4puWJOZw2niWAIckUZW1AUqXq3XAp86ouXgylKIDl+MUiq+pwO/3Dhj209I3CpHwDyF1NBdC0uOleNJkqeeQLu6Dq9FUVgGqAmHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6U3YCun; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6U3YCun"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-46098928354so29855511cf.1
        for <rust-for-linux@vger.kernel.org>; Sun, 10 Nov 2024 11:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731266599; x=1731871399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDtNozn9gBHBs1dU/xvUxO/SL23zM63k+G/z1S1bW7w=;
        b=X6U3YCunzGPkmU+hhZL4nHMmRbIdDv5KrClq6/tTVfKhTuZXp5Mn91mEckbD8UZERX
         erFJe0TesFq49L0ItFNtr3hpolz2fcH0Kwl/8EwFb52qTQssLvy+ViRw0yD6GFDpbic/
         rFrp2bwqGMH19NRcYHFTwx6cOGeQkYbl3t3ffxyTL3eYz1FziUm2KIOhztogU1lLGtbJ
         ZdR/Kuoi5rQOi3TONuh1O9NQjaXuuvxDEC5NDcS3op8ben//I0VOBMOOTUfdOOel9uGC
         63lM2L/gvoGaAuJNtpzWMHfVME7D9CrbdoVxedY4I2zmvu1FP0xrBBEAKXjJvaBlkW/C
         En3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731266599; x=1731871399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDtNozn9gBHBs1dU/xvUxO/SL23zM63k+G/z1S1bW7w=;
        b=GdD4L1cK/maKoNZHQzOgNeUyn1ijeN4JDuBZeyAM1tCID1lmY2IXGOiUmLSr3RQ5Xy
         MAowj6Uel19p3YJb9j44QQwHOql8Ag/dMCHV3qwc6v0FxdaPOiGAGBzfGdTmc7b/Lz7Y
         ugW2CqXF8oUNWf2so4FCg3c+l2cBZkBgi6yYNZpSafMPGGUwe/VWVhpHVB4UyD1i5adM
         IpN5SHlW6tdwcAb8fOGU+8fOzbcF0hdmu+O0A3/cvQhJ1HePCSkHeP22DBqor0B3/MEg
         CjecfyBtcoLvx6jSTS4drL1Wp+isfGlX5U07Qg3Rga3gs7naTRkP+MY09dRwSgukGfoi
         4AdA==
X-Forwarded-Encrypted: i=1; AJvYcCXzc5v5vw2m6qt36YnoDUTcUeeP4VOIDIEeB7nkOMvVbel3UuzYgV3w7VnVKirTbp7kOHlDRMy3TyX7kzL7aA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6luBQZXvPOkhB6DL0AoyY1Dxm8EXKUC8N+gR3UXQWovs/ekSB
	RAflbEzvR08lZ3R4uG8O+Vp0L4bAlWE6P/3ND/rLn22luI9qfqlj
X-Google-Smtp-Source: AGHT+IFcNuhI4ePL4LUIUmMkOCZ4LJFQfadyHJsiZzxYv6XWJwJK7bMCpVapvic9osve9GEPnctwCQ==
X-Received: by 2002:a05:622a:a18:b0:461:148b:1883 with SMTP id d75a77b69052e-4630940753emr155474641cf.40.1731266598643;
        Sun, 10 Nov 2024 11:23:18 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ff57ec40sm50127611cf.55.2024.11.10.11.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 11:23:17 -0800 (PST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 40C1D120006A;
	Sun, 10 Nov 2024 14:23:17 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sun, 10 Nov 2024 14:23:17 -0500
X-ME-Sender: <xms:JQgxZ4LucjENwvLe6CNv2JqtHbbTT3LdNmlp-7qhePx4sCqlWjQoVQ>
    <xme:JQgxZ4J1BjQt2MJxKVaRpUEqILPI7j6iBSD6A-Y8V95lQkgfVU41zbGFTEYTDjwrx
    2JNLReELlQ14em_Rg>
X-ME-Received: <xmr:JQgxZ4ssi_vM6hCdFCiYPx_JHv7aDn8rND8-8KkwN9JUNwxF_kwBFISUu0-7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtgdduvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeefteelfeeuudeufeeiueeghfehueffgedtveeg
    veeuveejheetjeelkefhiedvueenucffohhmrghinhepghhouggsohhlthdrohhrghdprh
    hushhtqdhlrghnghdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhith
    ihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgr
    ihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudefpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehjvghnshdrkhhorhhinhhthhesthhuthgrrdhi
    ohdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlh
    gvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghr
    hihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrih
    hlrdgtohhmpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgv
    pdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtmhhgrhho
    shhssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:JQgxZ1ZFTgPZI9GReS6jLESWtdqqv90WB1iQ75Ep7l_MUiv0aHV6SQ>
    <xmx:JQgxZ_aNKnYA4BtBspVPEG-S-SQti-cgyxPdEqTQ5k0IUQ2RTWhCBA>
    <xmx:JQgxZxASWD_jZoKxdiWm8Gp_WRu3Ofkh_ivBEL_dI8WVxK0nrlEEHg>
    <xmx:JQgxZ1aiFxIT8FwpiobnT3PGLalR4DyLSiPS0qhId0GwBnepqIoBrA>
    <xmx:JQgxZ3ov4jN3bTqLnJguaWsBE4FFwtZkmFyH-7WCXmAcT4qCMTrxNZ2B>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 Nov 2024 14:23:16 -0500 (EST)
Date: Sun, 10 Nov 2024 11:23:15 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: jens.korinth@tuta.io
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Rust For Linux <rust-for-linux@vger.kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Dirk Behme <dirk.behme@gmail.com>
Subject: Re: [PATCH v3 1/3] rust: print: Add do_once_lite macro
Message-ID: <ZzEII0JQWACvyYmF@tardis.local>
References: <20241109-pr_once_macros-v3-0-6beb24e0cac8@tuta.io>
 <20241109-pr_once_macros-v3-1-6beb24e0cac8@tuta.io>
 <Zy_oj_k-qUPLSVEr@tardis.local>
 <OBK1JLs--B-9@tuta.io>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OBK1JLs--B-9@tuta.io>

On Sun, Nov 10, 2024 at 08:45:49AM +0100, jens.korinth@tuta.io wrote:
> 
> 
> > With this `Once` type, we can do other things like waiting for some
> > initialization to finish. We can put the waiting as a future work, since
> > `pr_*_once!()` don't need it.
> >
> > Thoughts?
> >
> A `Once` implementation as the general approach of doing things once in
> the kernel would make a lot of sense to me and I think it would be the"rusty" way to go. I'd prefer that to `do_once_lite`, for sure.
> 
> However, I'm not sure if it can replace `do_once_lite`. Doesn't `Once` use
> a closure? I may be mistaken, but wouldn't that have at least the size of afunction pointer?
> 

No, because `Once` doesn't store the closure, it's just a atomic flag to
ensure that Once::call_once() can only execute once, as a result if you
have two threads calling the `call_once()` function in the same time,
only one will win, and the other won't get executed.

It's something like:

	https://godbolt.org/z/6PaWxnWxd

> My second concern would be with the methods of `Once` itself: We would
> have to rely on link-time optimization to inline the methods, which may bedeactivated. If they are not inlined, it could mean a far-jump on a potential

I don't think LTO is the one who inlines the methods, normal compiler
optimization could do the work, hint: `call_once()` is a generic
function over the closure.

> hot-path that could be triggered many times per second?
> 

and normally kernel will be compiled with -Copt-level=2, and the
compiler would "inline" the closures properly.

> > Another meta comment is the usage of `AtomicBool`, please see the LKMM
> > atomic patchset [2]. In short, we won't use core::sync atomics in
> > kernel, instead we can only use the atomics implemented by ourselves.
> > And we currently don't support `Atomic<u8>`, there requires some work to
> > get that done.
> >
> Ouch, I didn't know that. Sounds like an interesting topic! I would like to
> understand in more detail how the Rust part will imitate the inline assembly
> approaches of the arch-specific code in C. So far my mental model of that is
> "we'll wrap it with bindgen". ;)
> 

Feel free to review that patchset! ;-)

> > The other thing of using `AtomicBool` is that it's not the most
> > space-efficient way for `Once` (if xchg() is used) on all the archs that
> > support Rust in kernel. RISCV doesn't has a byte-wise swap, so the
> > implementation has to simulate with a 32-bit or 64-bit swap + mask,
> > that'll be totally 5 instructions, and each instruction take 4 bytes. As
> > a result, if the `swap()` is inlined (which most atomic operations would
> > be for performance reasons), you save 3 bytes by using `AtomicBool`
> > other than `AtomicI32` at data section, but you pay 4*4 extra bytes at
> > the instruction section compared to using `AtomicI32`.
> >
> Ok, wow, good point and explanation! But it does sound like an
> (arch-specific) implementation detail. I would expect the `AtomicBool`
> implementation to do the "smart" thing on every arch, no? I think on thesemantic level we want an `AtomicBool` here, regardless of how it is
> implemented on RISCV, or another arch?

The thing is `AtomicBool` is not the right layer for this, because it
has to be the same represention as a normal bool [1]. `Once` seems to be
a good layer to do it.

[1]: https://doc.rust-lang.org/std/sync/atomic/struct.AtomicBool.html

Regards,
Boqun

Regards,
Boqun
> Jens
