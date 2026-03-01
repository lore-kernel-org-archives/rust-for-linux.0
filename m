Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9B43093C1;
	Sun,  1 Mar 2026 17:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772385147; cv=none; b=CsaPS5IxUxJo4m1b2MLeNYskhdrkOULCE+E4toBpHutEYxpQ9x1GhcekB+P4B7OyQBJ/UhA3We2T3OixHIpTY2AeleqkrM4O7DKT1dRc0v6uQeZ7cR1DUIPwnq1s8IwpaZDWdE5XFAeSiZTExUF0NKjV8jEY5151Y193/hqVzUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772385147; c=relaxed/simple;
	bh=vhaUIKmRQqxlusdgAEbn8VEqEE4zNIocOCsLD9scoAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4S8ECOXZMPcBZy1b5oiMQFD57O5VoU7dPv5HDu8tVT62nyTZLLs2dN0wbwEd1bC44M0Sut8dhBYxN53gbV5ixvgiJ/wUFjM/w3GvWfWle7VJaa2hdzkhX8HNSHcOYrA0ebTKDdFITfFfvZKvTAbf0pteO0xraTgkwPIejurVmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=COr3RKDq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=3RQn59wi; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="COr3RKDq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="3RQn59wi"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id D948B1D0005E;
	Sun,  1 Mar 2026 12:12:24 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sun, 01 Mar 2026 12:12:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1772385144; x=1772471544; bh=JvpvEOa8Cw
	cssa/8kfGC7exMi81uwRLONhgntqmZiDI=; b=COr3RKDqms2GN4EZdTWv1RUM9T
	tBRCaWH4HfaY/wXZzFVToe/goQ7QEkpRDwSjuYdugUkJvBDO0PZUU8GBLp+uwZ0J
	RlPhfDNyWnS0HlDBkk4Bo9JAlv/br0XHJesoBbJfzam+ky5VWCvvTrRAgPC4qeJV
	pbz8HS+GwAnZ0uPU+EXwd/BlNXSlwyLmgGQPLUhY5s9C+b47OEt2XJ2TN3FpZUcH
	1aTugTC+ggXAT/Yc0/Zk4MZS0fmFnPugGutRDhv5lIACwvbGE7HRz63M/0YhrN3v
	4lxIz+zf6Mm5iBKZef92zwh+XzdciH17sggOCkeN7EgXKuuL08MW2pLgW5LA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772385144; x=1772471544; bh=JvpvEOa8Cwcssa/8kfGC7exMi81uwRLONhg
	ntqmZiDI=; b=3RQn59wicyxbpapRWscP0sQGydPPzXCYldNWU+Dz7GdqWUDLmhZ
	0/ZuOvAQCn5yDNbDgkXcMEMLd2cd6j1GAwT8Wpihx/+gIDeFMsXY7LoRQzyWqP0a
	bu/ZUME1eSYaGfk+oKRGuZqtobJ2XVqGaYntNR3ymDO0bqp2LVamV4nFvf9avLkK
	GknFTgz12ew75aeGV+tZQ2zS/X8GFYRKhGz/Pcyld2xNpMeK/g82cl38zXv48yJI
	EfHa+V13uBVmFKVfz41Q1EjULkSrdD+StC6XxDVIiRoFyPZ6CFEWS+OxeyQ/kzzO
	y4/OKC4NvgbxiRSjRT8GM1moG0BdB/rG7AA==
X-ME-Sender: <xms:eHOkadhOQI1fbDAVvIlCCm2gUbLMF68DzGy1fOmBNoSZh8-A7_2RnA>
    <xme:eHOkaaJzVhVwfoMeweaXDqeU37xiNKxGSIqtfM32RFN-PpSnclX8nZrUElkI5Psez
    WxA4chVj0ykyGBaDkbQsm6Zd-2hncOPse4Eaa_F-b-sTSAm10cvn0g>
X-ME-Received: <xmr:eHOkacnVo6BPX4TVr0w8dpNDYOyu5t8G9cu2UcwrQAO1QF41TRC5f_3qxVnh2IWJpnCgAXjnI3IdCxeGrfhBNL1GpyeLL-52-2k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvheehfeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefggf
    duveeiudefleeigfefvdeludevffeghfehjeffteekfeeghefggfdtudelgfenucffohhm
    rghinhepiihulhhiphgthhgrthdrtghomhdpghhithhhuhgsrdgtohhmnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhn
    vghtpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhiesghgrrhih
    ghhuohdrnhgvthdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegsohhquhhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsjhhorhhnfegp
    ghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegrrdhhihhnuggsohhrgh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgv
    rdgtohhmpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuhdprhgtphhtth
    hopegurghkrheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:eHOkaSMbi03zPgFOpLCGqxM5tC5RABfXtC114q9LNMXxNQuUJ2ZH0g>
    <xmx:eHOkaW4h0NnW_MntY4LWI_VR9OB2u6AFcdKI4JCHPhvb8w20PWaHnA>
    <xmx:eHOkaWavfFZy4r_9lYDB53TbvfFgtk1n-4bmn-zZoRTR5ehLctozuw>
    <xmx:eHOkaTddnpcBH_D-wLq9RT0wyA4fruT8gGOLepdVzet9nGNw-By6QQ>
    <xmx:eHOkabn_P-xmQBtwVfu2qZn39TYtl5_TDz9Ydxkg5ts7ETW8-6LqMAhE>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Mar 2026 12:12:23 -0500 (EST)
Date: Sun, 1 Mar 2026 18:12:22 +0100
From: Janne Grunau <j@jannau.net>
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, asahi@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: pin-init: internal: init: remove
 `#[disable_initialized_field_access]`
Message-ID: <20260301171222.GA22561@robin.jannau.net>
References: <20260228113713.1402110-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260228113713.1402110-1-lossin@kernel.org>

On Sat, Feb 28, 2026 at 12:37:04PM +0100, Benno Lossin wrote:
> Gary noticed [1] that the initializer macros as well as the `[Pin]Init`
> traits cannot support packed struct, since they use operations that
> require aligned pointers. This means that any code using packed structs
> and pin-init is unsound.
> 
> Thus remove the `#[disable_initialized_field_access]` attribute from
> `init!`, which is the only safe way to create an initializer of a packed
> struct.
> 
> In the future, we can add support for packed structs by changing the
> trait infrastructure to include `UnalignedInit` or hopefully another
> mechanism.
> 
> Reported-by: Gary Guo <gary@garyguo.net>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/561532-pin-init/topic/initialized.20field.20accessor.20detection/with/576210658 [1]
> Fixes: ceca298c53f9 ("rust: pin-init: internal: init: add escape hatch for referencing initialized fields")
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
> This commit does not need backporting, as ceca298c53f9 is not yet in any
> stable tree.
> 
> However, the unsoundness still affects several stable trees, because it
> was unknowingly fixed in commit 42415d163e5d ("rust: pin-init: add
> references to previously initialized fields"). Before then, packed
> structs compiled without any issues with pin-init and thus all prior
> kernel versions with pin-init that do not contain that commit are
> affected.
> 
> We introduced pin-init in 90e53c5e70a6 ("rust: add pin-init API core"),
> which was included in 6.4. The affected stable trees that are still
> maintained are: 6.17, 6.16, 6.12, and 6.6. Note that 6.18 and 6.19
> already contain 42415d163e5d, so they are unaffected.
> 
> I will prepare a separate patch series to backport 42415d163e5d to each
> of the affected trees, including the second patch of this series that
> documents the fact that field accessors are load-bearing for soundness.
> 
> @asahi folks, let me know if I should prioritize a solution for packed
> structs. Otherwise I'd like not support it at the moment, as that
> requires some deeper changes to the internals of pin-init. I'm tracking
> the status of packed structs in:

I have worked around this in the downstream AOP audio driver now. I did
not do that initially since it looked more involved and we were planning
to bring support back.
These structs describe messages for communication with a coprocessor via
shared memory. They are derived by observing messages by tracing. So
there is only limited understanding how the messages are formated. Their
layout has for obvious reason match exactly so `#[repr(C, packed)]` is
the obvious choice.
One of the structs had a size of N * 4 - 1 which results in a alignment
of 1. Fortunately the struct could be padded to multiple of 4.
Nevertheless it was required to replace a few u32 with an unaligned
version.

I'm not sure if there is a need to support unaligned fields in pin-init.
The workarounds in the asahi GPU and AOP audio drivers are acceptable
and could stay indefinitely.

Janne

>     https://github.com/Rust-for-Linux/pin-init/issues/112
