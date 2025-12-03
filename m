Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F220C2E0B58;
	Wed,  3 Dec 2025 22:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764799525; cv=none; b=VSCDpaw6klv+sITXi+Fry0Pa2itn4zOlfajEQEelrhbRoj8bFkhnolQlaINoAMY3hupDwXblpnHbUyhlq+aasFk1G5JAaLe6gp4QPNcpdx8WqM8Gb1x8Ni4LdInSNnB46m0q3bXfQ/7Wfe40+dhP7hu71r9HdxceLzv9ALnPXFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764799525; c=relaxed/simple;
	bh=cNfu4p81eutfDjqnT5nUjtw+qF3PyLkPokEFECLND88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHlupF6hU2Y+bg5pQo3PLz6nLTakPylGHLBjbDKv2zIU6hvxpMl6PSeD4UVq/7QTakm/6He8/vDVw3qPKJt0+h08a0WrQXTDUciCjtUyRG8Uj/9kJ67kxasFyZ1aykFOWO/tG4detqdFdPL7xw8k8+tuCH5PpBoYA156MJ/56oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=Fv6U/MPK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kbpQr6Ln; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="Fv6U/MPK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kbpQr6Ln"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id B37E9EC056D;
	Wed,  3 Dec 2025 17:05:19 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Wed, 03 Dec 2025 17:05:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1764799519; x=1764885919; bh=hrkUuR/c8/
	u3r64kL8SQ0JZoBjw0xLu1hCqKUzN1GIk=; b=Fv6U/MPKVFAEnI92ZzQpqJbN4J
	pp65EeUDxyEUwWanKTJ7q8v/u4+ceAVV0iTCcU54ECdt/JrUxKdzGjmVYnd1Ia2R
	dEB1cQu8NndCCpSVhHnnp3c7Z0jZMb/MGslTGUfgANtYnEPBmCkmNTl7awvCBK0w
	iy2CuATl1boDq8b7tpHN1aOmeOLeb4gFpoxkCtaylGUaVe//Q/zzD9nPE1wJawoF
	rMsC94jOBSC9MhZoK5cSk+JZ/4w0AwMH0ybfNEGpmYzxelKCwWtBsiu1HTizht0O
	lRmLQYB0bQIdZ3flgBG0GMtJo5EV8f8tYHRX+QFAWEbdAIGIHRezvmRAd9Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1764799519; x=1764885919; bh=hrkUuR/c8/u3r64kL8SQ0JZoBjw0xLu1hCq
	KUzN1GIk=; b=kbpQr6Lnqf+/COQRE1ah8P23w97Ep00xwXCOKcpcZr7UTD953wU
	cnlpfcpZKFapM5jBHnvbcJA2bth13krP/DfyAUY1KVH0/EPST01LLyWtZbJDJFDX
	Q/FHsLqgsciOBx/4LJXrJ/MV4aWlsyWHoJvIRnhAsQi2iov52VXKLvlr00Pif/mP
	GYHX7thzxHb+SDyCw6Pr68SJ4TxOXV88/R/VkpjEszpivSWL+rJeSrYGFej7ejDo
	ufi7XwvwFRWf8ergpyBXEM0Z7BLvhYCuSKH63CA16ZZOAplqieXrsvjLZYIrqiv6
	hNmMwwEAoxo6QuHAHzCz0KUwf/e/PsvL0pA==
X-ME-Sender: <xms:HrQwaW4rTlM43qvtFAPv_ePdWefr4QCyGxA0ivYg8GfgA9ulA3hYHw>
    <xme:HrQwafV1HDyTvP6puYbUGNjziwdkEjZw5Ib2gYNveoSrAfGTQxnkeJQfLFoEOoOdi
    ivc33nHCrPTR5xyeE20OkXFC1FD32fWm2tDFcmmoDBJt7FJ6_AdUKd8>
X-ME-Received: <xmr:HrQwaWhcH_Ko9lx3OD6rlnWjteow-stj5VNWP2wIngIoq09ZycInge3xr0VOCNiOGd3Zgi0umcIB4xm_QX8l8bOvj5Ei-gj6ULs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcuifhr
    uhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvdffve
    elgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnh
    gvthdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtgho
    mhdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtth
    hopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhh
    sehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegrrdhhihhnuggsohhrgheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgt
    ohhmpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:HrQwaXc76tfkaoOtpCZD-HaubUr600IthSFslmi7bBQHGWdypBE6qA>
    <xmx:HrQwad2rv8QlNvyzg3uxGdufTfCHHNIm5CVC1VnFXbbT20d4UZoxPA>
    <xmx:HrQwabqKUmZSd4ft2fNQUEucM6Y5EApwqpfPex_nfDVD-Se838hiIA>
    <xmx:HrQwadg36wPvMgXuPjSCzje6d_wlcoXFjWiIcAdA3Uy4jDTnFA6McQ>
    <xmx:H7QwaeyIhoD8m-sRtlJdLOCUI5nhtWO9HaKcmHpEAP2meufnNzslng3n>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Dec 2025 17:05:18 -0500 (EST)
Date: Wed, 3 Dec 2025 23:05:16 +0100
From: Janne Grunau <j@jannau.net>
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>,
	Alban Kurti <kurti@invicto.ai>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.de
Subject: Re: [PATCH] rust: pin-init: add references to previously initialized
 fields
Message-ID: <20251203220516.GA592465@robin.jannau.net>
References: <20250905140047.3325945-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250905140047.3325945-1-lossin@kernel.org>

On Fri, Sep 05, 2025 at 04:00:46PM +0200, Benno Lossin wrote:
> After initializing a field in an initializer macro, create a variable
> holding a reference that points at that field. The type is either
> `Pin<&mut T>` or `&mut T` depending on the field's structural pinning
> kind.

just as a heads up: creating references broke part of the agx firmware
init structs which uses a `#[repr(C, packed)]` struct as field in
another struct. This fails with

| error[E0793]: reference to packed field is unaligned
|    --> ../drivers/gpu/drm/asahi/initdata.rs:722:28
|     |
| 722 |                       sub <- try_init!(raw::GlobalsSub::ver {
|     |  ____________________________^
| 723 | |                         unk_54: cfg.global_unk_54,
| 724 | |                         unk_56: 40,
| 725 | |                         unk_58: 0xffff,
| ...   |
| 731 | |                         ..Zeroable::init_zeroed()
| 732 | |                     }),
|     | |______________________^
|     |
|     = note: packed structs are only aligned by one byte, and many modern architectures penalize unaligned field accesses
|     = note: creating a misaligned reference is undefined behavior (even if that reference is never dereferenced)
|     = help: copy the field contents to a local variable, or replace the reference with a raw pointer and use `read_unaligned`/`write_unaligned` (loads and stores via `*p` must be properly aligned even when using raw pointers)
|     = note: this error originates in the macro `$crate::__init_internal` which comes from the expansion of the macro `try_init` (in Nightly builds, run with -Z macro-backtrace for more info)

This was easy enough to work around, I don't see how this embedding of a
`#[repr(C, packed)]` struct was necessary or at least helpful. The code
is not expected to be included in the upstream driver so it no worth
spending effort on this.

I don't think it's likely that anyone else will run into this but I
thought I mention it at least.

The asahi driver also ran into the discussed variable shadowing issue (a
variable was used to initialize a field of the same name and was later
used to initialize another field). This was trivially fixed by renaming
the variable.

Janne
