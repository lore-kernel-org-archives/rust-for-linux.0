Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3551514DC;
	Sat,  6 Dec 2025 17:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765040541; cv=none; b=d3V7ozTWzSIqgM3HMQpQbZjkr/8095cGer5mpaKjDtQVQ3oEJIx0Dp1aRHDGxyxHaDX6xpR1PLh6t632647YRX9FDz/amA6/jk4/XDqJTWfAdg1U2xnIBIPKU7KPfIg0MQiQwweO7XGb0j3erxHo6FoE/5LHSkIDG3tmlMI59Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765040541; c=relaxed/simple;
	bh=YDEldHxbXirkW4qrGW5JIGNP7PwWmaOgDy1K8WA8i4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mx7Z5kIwFIeYzFRvnUmD3O+Sy1CufmVx/mUnxYl2ZaN2DYKro1ZYBLWEVPOb/84814uZwq+mdz3r1R4YBiOsbKP2Ezi/rWgAao55SIaMQhzBXcEjXxVgGbweo18b5vCVlyrz10Xa+D6iCQsa4BY3qJYVQHmpCY/qKNEzWqP1hq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=iqnoTEh2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=d0F9+jaZ; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="iqnoTEh2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="d0F9+jaZ"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2E4CB7A003F;
	Sat,  6 Dec 2025 12:02:17 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sat, 06 Dec 2025 12:02:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1765040537; x=1765126937; bh=akElKtMCvE
	opTkcA7oc7FuQirAtyfyYhr24fQVunu+M=; b=iqnoTEh2A3s75E7E+4BwZp9OE9
	rs3ewr+kl6BgHK7a3Wrl7LxDDba8ELtTATPe4gYtqD9wKWSkXg+9gNL2s9JVLgYw
	319gIyY58hDxEJ8BHKeuyBSxzs1Q3uHDIPuhZQB01Hcxprn5mnYmcz5V5torxRsN
	qnl+0Wrq4ZjkMJ0Ig+Mz9+AaoztBshaFKwn8Go4Fr9DdzaTwGHFUHOkWOzKuyg+Y
	l8ZsTrlAGFhATsUIj9gqu1eSUzyauikleru0rq7KPnRYjjMUN3PNDPqAdeR8DBui
	bsMGg+ZdAaO7gO33w5GxwoX2Et36quojx5bLlBDa/4MgyqONSVR71qHiHjpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765040537; x=1765126937; bh=akElKtMCvEopTkcA7oc7FuQirAtyfyYhr24
	fQVunu+M=; b=d0F9+jaZiu11FcUGiK+qKuhbiYmsG8uoQhXnTKkS0ObAjL0MVVh
	MbrmfzYxU/6MweUVnPQ+8oUwIyFyZxQhtL6AkmcuSa8xdfSlTsZa5APpJ36SX/eJ
	VjCQ73XdgM3hiHYpETUG5hdGvQNfQ9yZEpU5amfKR9ZOBnBTotTdsBKflKnvI+Wr
	eM6u7MZggdMX5KBey+B4hVu8e/hD5Zh8lqSMsyoBqCD9/7dZ5rHubaBtPvyxItoD
	FoF59YTuj1G/LJO1AUrmfaqKIfF46MyVgrWBNbRsBgDXOHhUI2H58QwCt2TqYjxU
	8J8h5HRjw1KAj9HIZUrIxiSEhAxhpgDYrjA==
X-ME-Sender: <xms:mGE0acwbYaRS_eZm09MF5zfWTkrEijSwIFgcdi9CoEmdkKhtDvKqiQ>
    <xme:mGE0aftByd-nlvhHEpeadx4zp8Qhcy47pISrS3eFi0oxnXVWrtKNr0GISwXyMn9FR
    3AuVSVv302qOD68LeNv8zYZ_grfdHkMgN97mLQCdZsD2dlM9Gu4Ig8>
X-ME-Received: <xmr:mGE0afaehyt43uLL73g1i5tl5DSBYisN6-refuNG169EiLAWtnpt7vvKg4Ltjt4DeXoQ0VnlNrwbkJFP5C0YGJm3u9_ZBfJNnq4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnheptdfhff
    euvedvueeijeejjeetvdfgfefgteefveeiueevtddtffehfefhhfetudfhnecuffhomhgr
    ihhnpehgihhthhhusgdrtghomhdpthihphgvshdrrhhsnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggp
    rhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhoshhsih
    hnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhih
    sehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtoh
    hnmhgrihhlrdgtohhmpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtph
    htthhopehtmhhgrhhoshhssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:mGE0ae0lAnQAZPZPJx3chOoc0UFLD_Y31zYo-CzoLSNRpq8zzHEGkg>
    <xmx:mGE0aRuEXDCz03iFqY5YGpjb_lADmAFKBFeVo93jxF511_LVGGpW5w>
    <xmx:mGE0aSBRij925YZFqTW-aEiNF4fB9e9Rzixx6ANALYK0oTgCG6p2Og>
    <xmx:mGE0aUZV8vZXUQkmBhBpAaYjTfGSTWTFEQE3OxplvKt00Z-gTYnhAg>
    <xmx:mWE0aecCCJGUipLD0gnZ32K3nYtQBHT8dpJOAGqJKRsyk6_aRkOcirMJ>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 6 Dec 2025 12:02:15 -0500 (EST)
Date: Sat, 6 Dec 2025 18:02:14 +0100
From: Janne Grunau <j@jannau.net>
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>,
	Alban Kurti <kurti@invicto.ai>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH] rust: pin-init: add references to previously initialized
 fields
Message-ID: <20251206170214.GE1097212@robin.jannau.net>
References: <20250905140047.3325945-1-lossin@kernel.org>
 <20251203220516.GA592465@robin.jannau.net>
 <DEQZLZ9AVCZE.380X3OF521Y5L@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DEQZLZ9AVCZE.380X3OF521Y5L@kernel.org>

On Sat, Dec 06, 2025 at 09:23:08AM +0100, Benno Lossin wrote:
> On Wed Dec 3, 2025 at 11:05 PM CET, Janne Grunau wrote:
> > On Fri, Sep 05, 2025 at 04:00:46PM +0200, Benno Lossin wrote:
> >> After initializing a field in an initializer macro, create a variable
> >> holding a reference that points at that field. The type is either
> >> `Pin<&mut T>` or `&mut T` depending on the field's structural pinning
> >> kind.
> >
> > just as a heads up: creating references broke part of the agx firmware
> > init structs which uses a `#[repr(C, packed)]` struct as field in
> > another struct. This fails with
> >
> > | error[E0793]: reference to packed field is unaligned
> > |    --> ../drivers/gpu/drm/asahi/initdata.rs:722:28
> > |     |
> > | 722 |                       sub <- try_init!(raw::GlobalsSub::ver {
> > |     |  ____________________________^
> > | 723 | |                         unk_54: cfg.global_unk_54,
> > | 724 | |                         unk_56: 40,
> > | 725 | |                         unk_58: 0xffff,
> > | ...   |
> > | 731 | |                         ..Zeroable::init_zeroed()
> > | 732 | |                     }),
> > |     | |______________________^
> > |     |
> > |     = note: packed structs are only aligned by one byte, and many modern architectures penalize unaligned field accesses
> > |     = note: creating a misaligned reference is undefined behavior (even if that reference is never dereferenced)
> > |     = help: copy the field contents to a local variable, or replace the reference with a raw pointer and use `read_unaligned`/`write_unaligned` (loads and stores via `*p` must be properly aligned even when using raw pointers)
> > |     = note: this error originates in the macro `$crate::__init_internal` which comes from the expansion of the macro `try_init` (in Nightly builds, run with -Z macro-backtrace for more info)
> >
> > This was easy enough to work around, I don't see how this embedding of a
> > `#[repr(C, packed)]` struct was necessary or at least helpful. The code
> > is not expected to be included in the upstream driver so it no worth
> > spending effort on this.
> >
> > I don't think it's likely that anyone else will run into this but I
> > thought I mention it at least.
> >
> > The asahi driver also ran into the discussed variable shadowing issue (a
> > variable was used to initialize a field of the same name and was later
> > used to initialize another field). This was trivially fixed by renaming
> > the variable.
> 
> Thanks for the report, I expected the latter kind of error, but was not
> aware of the packed struct issue. If anyone needs a proper workaround
> from pin-init, let me know.

I spoke too soon. The packed struct issue is also present in the capture
driver for Macbook microphones (aop_audio). Working around this issue
there is less obvious and more effort. I think it might be enough to use
unaligned u32 / u64 types already present in asahi [1].

I'm not sure how prevalent packed structs are outside of Apple's
firmware interfaces. I was surprised running into the same issue in a
second driver but I shouldn't have been. There are plans for another
driver where this isssue will be present.

A workaround on pin-init side would be appreciated. Due to the nature of
these packed structs I do not see a need to have access to previously
initialized fields. An optional way to supress the references would be
good enough for the cases I'm aware off.

Thanks

Janne

1: https://github.com/AsahiLinux/linux/blob/asahi-6.17.9-1/drivers/gpu/drm/asahi/fw/types.rs#L48
