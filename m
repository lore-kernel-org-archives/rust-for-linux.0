Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D322BEFE3
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Sep 2025 09:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758274047; cv=none; b=ZHPFl5X31ID+7yOkRQih801pjkHbRXOaITykr+YRVc5myS4O9/cWX5I9qUNSnW/tmY6lzb2aeMdXz+jRTLd6gnM3lvyuLkcgelZiacft+Bvl9hR4fzNVw429rjTqD7oxHVWnVDaaxMN+XmNiaJHopahbeEJgQU6IO3Wqx96mEpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758274047; c=relaxed/simple;
	bh=pO9xHI/3NTLDS2M7hbjsA2aT/8nvi3Ps8SWXCVjl6ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsULu1beKNXarg8Xena90q/U+j005Hr46scTS0SE/M2my3SJM4z7LilE1O6GxKl/TymjIWQwWUelYcqZyR5FgjYKTeJEpe7bSmImxwBLoXOojdYM5cMoOtYpIx2hbiTAmXUwIImZJ9wA8yk04r4PRury4f/n4/+xQ9+9MKy+RaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zs2jPYSn; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zs2jPYSn"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b48eabaef3so20299631cf.1
        for <rust-for-linux@vger.kernel.org>; Fri, 19 Sep 2025 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758274044; x=1758878844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqbmWWdJDXBgyKwnalFIBvgryIt7TZh4TmAJnnjDHxo=;
        b=Zs2jPYSnLxqD/U0g1pNHfWyuuXMNZig5gyYtv3Ad7OHWG/rc8j4t6S7zPOoSS8GrS9
         mPGkVLq0lErTRgjAjv5Slfg6ePCFhRAkUk+tzSF722Cbfr3/R13akutkvuRQffy7HQxt
         mcFoI9O9LoceBpcoo3X1WbvbUuiVMwRaPFRsO+u/sSH/nm2IAmgfckdQTwLBZmKTGZJE
         PhojOKrGfjkA1q10hf7mjhVMOg6ddw9M0mwv1V6KSwH4FoY/pFnTct5OMGWJFzGnVlTX
         SKklj0v/Ey8Pk+yKbIGymOfMPQdsCLGck0GZfBZi/sv6HVOQQqpUdR4QftTRwZlitLKp
         auAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758274044; x=1758878844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqbmWWdJDXBgyKwnalFIBvgryIt7TZh4TmAJnnjDHxo=;
        b=k798xtcXpxDFe2XZ6Av1V33CLn8keJkndc5BeBuCNaqt/Zqrpks8RscEKv2v81L1l6
         7EmB2cIam+kefmutGnm3CJNgJbeiknPLyAvwxODNYTYiA+xeRiSX+isd+cFu8dujFqVE
         xHEwDCLGM3IUjOrdoJqW+vi8HO+tXhFyx9pac6Lcp62ZodNI9Neb9hmQu8+WbrKqqsfS
         SisqRNXnG3cq7dMlr5omqQUi9IdeV5CW6O+KtWDiq7ogNIKloLQNjFD7TXbZwQMoysGC
         9Rgoj5yWDkXo+IcPQMkMG/WVETi6vNiQMOniVNdhiRe24mfnZZl0bsMqO1FRqCyMl2dT
         cyXA==
X-Gm-Message-State: AOJu0Yx4/n9GDYuxJRTjXvM8duQtbfAyBrQ2kIKCPF/jAsd1xlO+cYX7
	Sup5gEY2A1EZ6tPXzHOAtDwI4v0u1qDMRosaQQdWHu0LZnXLT16wYYUg
X-Gm-Gg: ASbGncu8SeYw15kNOIHBzRw8pMVNxA1jt1d+hIQ23ifFhIc8iEVfW34rzH1K2LVgkun
	UaqzPOqnF8CEU1/9ME7Wh7sfh/ItYMnsrBRjzIpirBByvcYI1FmeNge6alOmGvSriDMWZXHzMrj
	bUu6hdPoi7Zl5v/HLmrIi91vmt3jq+jhiL0/gRDB58I0eyHTK0fyk7ygshvKLvi+fA3owuZxGRV
	9hmISBI+NnztMbVEkBSdWGvYuESHoLTiAe9szbQ9S7gIVZZ+bXeqqv2MksGEqbqy/V34m5y/aLK
	TxxR988pQBvSjLm8bYcYXuJirZRi5wk36dTYu0+cgurgcruBRqjxn8FjM6GEWFOiTRRhk0RaGhu
	JUpSNiT3ebbWrTAMP/VAW/B3J/Ud6SjTiFmBwnOHIdoHdCfCpGatF5AUBRXix51LVgV2DIntlgQ
	PrPTbEWoMYdQ1U+L85E0QbFx4=
X-Google-Smtp-Source: AGHT+IHZl2gBRa8IPk+yYPfu2t1GBuNovm3HJV6SdeKZiR7k67Eso799bbVcBGWih9MKbRUNcrqhuw==
X-Received: by 2002:ac8:5a0a:0:b0:4b5:dd39:c43e with SMTP id d75a77b69052e-4c073106a4fmr22277991cf.61.1758274043835;
        Fri, 19 Sep 2025 02:27:23 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4bda943c27bsm26085791cf.40.2025.09.19.02.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:27:23 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 02D66F40066;
	Fri, 19 Sep 2025 05:27:23 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 19 Sep 2025 05:27:23 -0400
X-ME-Sender: <xms:-iHNaBkwO3DYEDxSYsXg8wFkKOiIS8phS8s8pRFCBqf9WzNeuByhgQ>
    <xme:-iHNaDb6GxEetX6dNAlw9EPxqB50AXD3wsZ75OvBbtgDzfuTJ5gx8JacHPpX4pW-F
    tmLA_jADSX74pwYZw>
X-ME-Received: <xmr:-iHNaJVqYf7QNLYw9xEdKS7acp1QcHwgpVGSID7A1pbsOIpPMiQp02_oy0kG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegkeekhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    udelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehpvghtvghriiesihhnfhhrrg
    guvggrugdrohhrghdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehruhhsth
    dqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlkhhmmheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopeifihhllheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhonhhgmhgrnhesrhgvughhrghtrdgtohhmpd
    hrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:-iHNaLCRh_5ubnQ5AoDgj0PURt6J12rk7W6G0Bo51OsW6gcvAsiRuA>
    <xmx:-iHNaAxgkz_me4xLOhAjOgp0OAvyCpeBHOoHYU3EfwtLTYO15C4AdQ>
    <xmx:-iHNaJaheYe0ptx-WRIt8NN0Q3ZCrMN5zvDTgjvwXaPYAHOv_c5D8g>
    <xmx:-iHNaFRoEH3hpRcwqqW1hUCXOTVWu-FXQjuViF7eL4ZDdR5MrIGGMg>
    <xmx:-iHNaEgsdDYXWCGRgV2Rv48KkPQtkdknb_aYAmUHDwUGaL9kUZXGC7of>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Sep 2025 05:27:21 -0400 (EDT)
Date: Fri, 19 Sep 2025 11:27:14 +0200
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	lkmm@lists.linux.dev, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Waiman Long <longman@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	alex.gaynor@gmail.com, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>
Subject: Re: [GIT PULL] [PATCH 0/4] Rust locking changes for v6.18
Message-ID: <aM0h8oMzSnGwP3R4@tardis-2.local>
References: <20250919091241.32138-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919091241.32138-1-boqun.feng@gmail.com>

[Fixed Peter's email address...]

On Fri, Sep 19, 2025 at 11:12:37AM +0200, Boqun Feng wrote:
> Hi Peter & Ingo,
> 

Peter, I somehow had a typo in the "To:" field of your email address,
but you should be still Cced correctly, sorry about that :(

Regards,
Boqun

> Please pull this (mostly) Rust locking changes to tip. It's a bit late
> than usual because I was at Kangrejos conference this week, however the
> changes are relatively small and simple, so I think it's Ok for v6.18.
> I also try using "git notes" for submission links as Thomas suggests,
> let see how it goes ;-)
> 
> The following changes since commit 17d9f8eaa87d40a2ff66598875a43363e37a909b:
> 
>   MAINTAINERS: update atomic infrastructure entry to include Rust (2025-09-15 09:38:36 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/ tags/rust-locking.2025.09.19a
> 
> for you to fetch changes up to 9622209360c25d78a81048a9db72f1efef7fbc58:
> 
>   rust: lock: Add a Pin<&mut T> accessor (2025-09-15 22:28:35 -0400)
> 
> Regards,
> Boqun
> 
> ----------------------------------------------------------------
> Locking changes for v6.18:
> 
> - Fix a data-race in do_raw_write_lock reported by KCSAN
> 
> Rust locking changes for v6.18
> 
> - Make `data` in `Lock` structurally pinned.
> 
>   Previously the `data` field of a `Lock<T>` is not structurally pinned,
>   and it's impossible to initialize the `data` field with a
>   pin-initializer, hence e.g. a `Lock<T>` where T is a pin-initialized
>   type is not supported. This encourages workarounds like
>   `Lock<Pin<KBox<T>>`, which is more complicated and less efficient.
>   Therefore make the `data` field in `Lock` structurally pinned to
>   support pin-initialized types in a `Lock<T>`.
> 
>   Since the `data` field is structurally pinned, make `Guard<T, ...>`
>   only `DerefMut` is T is Unpin, otherwise `Guard::as_mut()` is added to
>   provide a `Pin<&mut T>`. This is different than normal Rust standand
>   library locks.
> -----BEGIN PGP SIGNATURE-----
> 
> iQEzBAABCAAdFiEEj5IosQTPz8XU1wRHSXnow7UH+rgFAmjNGoEACgkQSXnow7UH
> +riU8ggAnRUTBam8NTmHJpZfVbbNSfx1ndaARxd9Wb/MLEh8OHYKbVRPJwvWGge+
> dafO0VYULku7ho1SeIlLXp4Bbjy3YC6o/J6xOpr9xMmysUky7RHi+Ys0y9gKaSmW
> daPurQEOS8TBUWu5yVxNAfWoRgPEiPULovbzgANKKAV7QsljyoEg7mQCPxLftPze
> Hr22HxU+lr6SDH5Efc8ihGqXJAvwunk+0mkJymZbjWo3ZF3cuhXlTMcIlu1SK14a
> R1VQu5UoX8S5y0T0gkJ84UJ11e0wrSZyT0EqmHWSpVBnyGgWk8H1u284hDiGG2iG
> FvwoSQ9iVuxLhxjhPUSOjq30DzmFfg==
> =MZj4
> -----END PGP SIGNATURE-----
> 
> ----------------------------------------------------------------
> Alexander Sverdlin (1):
>       locking/spinlock/debug: Fix data-race in do_raw_write_lock
> 
> Daniel Almeida (3):
>       rust: lock: guard: Add T: Unpin bound to DerefMut
>       rust: lock: Pin the inner data
>       rust: lock: Add a Pin<&mut T> accessor
> 
>  kernel/locking/spinlock_debug.c |  4 ++--
>  rust/kernel/sync/lock.rs        | 41 +++++++++++++++++++++++++++++++++++++----
>  rust/kernel/sync/lock/global.rs |  5 ++++-
>  3 files changed, 43 insertions(+), 7 deletions(-)
