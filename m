Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF403043D2
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Nov 2025 14:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762440404; cv=none; b=NPhVMWWW3qccIS2EUvuAY7ukrigR+yavmf86ecgcrK1W8Z5SpNl1ew/hPM4q+ONApwCLZ4nJpLJHFuucinv2szIPCQLjGOBi6K/anpzAoEd2m/qfuteosq+PiHFVFMML9rC6ckpzXlmbrFniTgTSubowSfCZTrq6vX0YdVFYMv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762440404; c=relaxed/simple;
	bh=A3LOlJ+2P+D2PlsFppFIIreEyjJoSaZejA1t7XVev0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1VSPV/Dl4ozvaANhSSnp1Q+p6baEeJVKc9gpMYv6J9i2bBZpSNhsuhX7lqWODQkE0nrlHBFmbMNxHFAgsM722p/O1b37I/J7hUo3BT+JDhST5oSvTOIodd+GuTUI5EPXctzeQTTO5d1zso0AwugXDQaZhfYM/2UvoEsMYLvU8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JA63e6/d; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JA63e6/d"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-89e93741839so70245485a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Nov 2025 06:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762440402; x=1763045202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2GbTLjyr1l5zwMDTI/2HT/Y2ZWbOXogXnG8/4gBWBM=;
        b=JA63e6/d9+nNLviDXD53U4yonIBpHXeh6OPy0r1drZrKpQxBpM2RCssase2kE51ZW2
         fx+tEGK+OASe8HkPmqO20SvUjROW9ir3coU8ECflS5pKG2B5wU8XRwsaRm8KxCn+QFWg
         QMaiN3/Gz07rwEnxM0wAnSUN+VocYvB2J4b21FdCbffMVZVscWRx7fQ9w6GE46lU1rtx
         1Ah2L5ocbpQvITdUMOd3XuGdHEsBXHx04aSU9WRn9vTactD2vkPiiWmsoUCWlMdt8v4d
         mbuvki9Ne5fAuZTokgN6YTE2ByMs8oa1W22A4VT9GikEWK3fFb4DFULBPLjOgUVJuHHx
         3upw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762440402; x=1763045202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2GbTLjyr1l5zwMDTI/2HT/Y2ZWbOXogXnG8/4gBWBM=;
        b=tCrAyGTExpE3BLnY3Cmfae8M/xejobH4cA5P7ckQ9XgkdCmFOFi5pOKm3AfUCCxHqh
         kmMNXoKmIm24fA/Xt3NAoTvh0EmyVQug3l1Qn26ptArJYF4kEWH5ifS107iYGB6XYjOf
         xWRUUAZwofcA+ljx4ky/L7GcpyrqqdMa7MqO7tqcF8h7+S9Vn2qb7sUFuRfASsg4dfKl
         bObb5eGqdIQilUNf/b6Fnk5pnjjafvgPRxzwzJxovcfK5IPcIEaHGq6OXNT42bckkr/o
         Y4ilRbyNcGNUeF6aDeHuzdhP4/a0yiSuzZIS0w5e43yehFrctms1ZkKxYeFDou5BcVLB
         SKzw==
X-Forwarded-Encrypted: i=1; AJvYcCWpjq7NH6ttvSBranIwAj5Hwfa3fejwLlp7mRR3xk97bQtPSQBw6yDg+7d1VK1nbPhbzn4/Jv3CRyoH5c0Xog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3E6UfO8OiGI2dptFTTPYgU8TMQvd6a2Ts9ihpJp8qAONUF8d/
	PQdEfgVLHEbu5EmCAOEx1hzSDvVEIrNrUn+iIIuS4m8vG3pik9fRAZBz
X-Gm-Gg: ASbGncsc5/Be8huuynx6LjVh9p8RT793Ohj/MqHpkvx+f5+O3LNcSAUKWEwAmlT7Z0d
	IW/1/k6UpnVDkgCyLBSHe2DK5ACIi53gCvKu2AAcD2WzM4cKDEXI+u9LiatO6exjKMDCmV3QEad
	ibTV1xr467ixfdChG6ss1sbkHeUOL9cRegwmF+mHJ64npGODEIAx8rm7NjohJ92kDmW7TNRRMJB
	fzHD3ymFksOL78saJlHZOSWoDQV80qu79dWalw+JIqxfKL31LqJCMxYRUXSGeehhvJ5Hpx7Sazm
	dfs98GwDUfCj4DN+QEGvpIF7HVKzNRoZZqH6F+ao0+04CuGBFmSP0ANrIm8ALjbI2+wK5gm+kps
	KvjxeRgPM8OJrXut1lVaB0YtTDDkcLVmQ4b9dzT7v1Nb7YLctl1mICF7VD5T/C6Xqy5w1gv+yT5
	dkzQsZLfFhK5wSLe0UO0IG19qzHpvNMfO1Y6yoo8qf4g1fblFQgMLWybP7xiH6UuR+GdTz7W1/X
	e3tawj6xvDxObI=
X-Google-Smtp-Source: AGHT+IG/hHFHgCeeWYjT5WILaTtyj0sDBecrTo85I45dlxkMOVZzDgoQhQVRfkv/5iZ3bTRy8wgqtw==
X-Received: by 2002:a05:620a:29c8:b0:8a3:1b83:fd9 with SMTP id af79cd13be357-8b22083e130mr887030085a.24.1762440401676;
        Thu, 06 Nov 2025 06:46:41 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b23580b649sm209307285a.48.2025.11.06.06.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 06:46:41 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id B87A8F400E2;
	Thu,  6 Nov 2025 09:46:40 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 06 Nov 2025 09:46:40 -0500
X-ME-Sender: <xms:0LQMaTHcHxt7lHxZV9q3ywp-y0GJJuMY-MX3rBd_YaJEwh6RV2It2g>
    <xme:0LQMacIxwmSoJwgT-x_H7MgfeKdXXyNT2LxqGneZa6426aFGb8ePqOs2vUM33NMfD
    SeW-yUWTw4UWikTbtRn_RD8pXIRNm0Lg38MfQdQ5e8mN9tQ6WLQ5rk>
X-ME-Received: <xmr:0LQMaQi1jELzP2n80E3pJ4_PzdqsERwZ-aA38vj35Y1TS4bqXdZLpq0y7GkNXn8GEb0fes7iZyadUkl4iRasjTQjy3thrvWU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeejtdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehfuhhjihhtrgdrthhomhhonhhorhhisehgmhgrihhlrdgtohhmpdhrtghpth
    htohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusgho
    rhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhogh
    hlvgdrtghomhdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdr
    tghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgh
    grrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:0LQMaamBnMYocUKmKSLouHi3B7bJsujGyC_owL1MfNOlamU9Qs157w>
    <xmx:0LQMaXWhd4mWgiNjsW_MMEN7KwIKkg6QYhdxenJcxGemp9WP9AIkbw>
    <xmx:0LQMaXuu2XvyAlLcGIWCNh9_LgFkW4hcS0qtrf5jfO56MDroc9hQ_g>
    <xmx:0LQMaS7abptWQkST4T3_y39iJszha4GDs5McvVqVFIzy8GvXwV2MPA>
    <xmx:0LQMaSS4Ch8o1RxPNyomo_0ilq8wtUG8cnR1l3tfieQ3tfO_aGO6SO72>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Nov 2025 09:46:40 -0500 (EST)
Date: Thu, 6 Nov 2025 06:46:39 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, rust-for-linux@vger.kernel.org,
	tmgross@umich.edu, jens.korinth.tuta.io@kernel.org
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function exactly
 once
Message-ID: <aQy0zxs53EAnntwR@tardis.local>
References: <20251105054731.3194118-1-fujita.tomonori@gmail.com>
 <20251105054731.3194118-2-fujita.tomonori@gmail.com>
 <aQt5GR019t07U0Nk@tardis.local>
 <20251106.091026.1308953895982406095.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106.091026.1308953895982406095.fujita.tomonori@gmail.com>

On Thu, Nov 06, 2025 at 09:10:26AM +0900, FUJITA Tomonori wrote:
> On Wed, 5 Nov 2025 08:19:37 -0800
> Boqun Feng <boqun.feng@gmail.com> wrote:
> 
> >> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> >> index 3dd7bebe7888..19553eb8c188 100644
> >> --- a/rust/kernel/lib.rs
> >> +++ b/rust/kernel/lib.rs
> >> @@ -110,6 +110,7 @@
> >>  #[cfg(CONFIG_NET)]
> >>  pub mod net;
> >>  pub mod of;
> >> +pub mod once_lite;
> > 
> > Would it make more sense to put it the kernel::sync module?
> 
> I actually considered that as well. The OnceLite structure could
> probably live under the sync module.
> 
> However, the do_once_lite macro places its data in the .data..once
> section, which can be zero-cleared when a user writes to debugfs
> clear_warn_once. In that case, there is no guarantee of any atomicity,

This is not true actually, clear_warn_once_set() uses memset() to zero
the memory, which is usually implemented by kernel itself and at least
indicates per-byte atomicity, so it totally works with other atomic
accesses in the kernel memory model. Otherwise pr_*_once() will be
considered as data races.

> so it doesn't really fit the semantics expected for the sync module.
> 
> For now, OnceLite the only used by do_once_lite macro, so I didn't see
> much benefit in splitting it into separate files.

I lean towards Andreas' suggestion that we should use SetOnce() here if
possible. I was missing that before this reply, thank Andrea for bring
it up.

> Also, data placed in the .data..once section should ideally be of a
> type whose zero-cleared state is clearly valid, which makes it
> doubtful that OnceLite would be generally useful in the way that other
> synchronization primitives in sync are.
> 

Why? A lot of synchronization primitives have 0 as a valid value, no?

> From a Rust perspective, data that is shared with the C side and can
> be zero-cleared at any time might ideally require some special
> structures? However, what we actually want to achieve here is simply

I don't think special structures are required or it's already
implemented in our Atomic type.

> something like "probably print only once", which is a very simple use
> case. So I'm not sure it's worth introducing something complicated.
> 

That's my point (and probably also Andreas' point), we already has the
type `SetOnce` to do this, no need for a `OnceLite` type if not
necessary, and the fact that it can be zero'd by debugfs doesn't change
it as I explained above.

> 
> >> +impl OnceLite {
> >> +    /// Creates a new [`OnceLite`] in the incomplete state.
> >> +    #[inline(always)]
> >> +    #[allow(clippy::new_without_default)]
> >> +    pub const fn new() -> Self {
> >> +        OnceLite(Atomic::new(State::Incomplete))
> >> +    }
> >> +
> >> +    /// Calls the provided function exactly once.
> > 
> > I think a few more comments here won't hurt:
> > 
> >     /// There is no other synchronization between two `call_once()`s
> >     /// except that only one will execute `f`, in other words, callers
> >     /// should not use a failed `call_once()` as a proof that another
> >     /// `call_once()` has already finished and the effect is observable
> >     /// to this thread.
> > 
> > Thoughts?
> 
> I don't expect OnceLite to be used in cases where it matters whether
> another thread has completed call_once(), but adding the above comment
> wouldn't hurt, I think.
> 
> 
> >> +    pub fn call_once<F>(&self, f: F) -> bool
> >> +    where
> >> +        F: FnOnce(),
> >> +    {
> >> +        let old = self.0.xchg(State::Complete, Relaxed);
> > 
> > And we probably want a // ORDERING: comment here to explain why
> > `Relaxed` is used here (because of the semantics mentioned above in the
> > comment).
> 
> What kind of comment do you think would be appropriate here?
> 

If we still need this (i.e not using SetOnce), then something like:

// ORDERING: `Relaxed` is used here since no synchronization is required
// for `call_once()`.

Regards,
Boqun
