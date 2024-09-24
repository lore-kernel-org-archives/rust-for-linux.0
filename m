Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7761126BF6
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 07:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727161410; cv=none; b=UPkSwSKih3lv+MyNZYBXpLRbQ/LbHT3O0OJcGfYo3gFNKqC5mZldOOATGuQNjUTha1J4077DXqWjN6iybuXtCcjdb+1Kgq4TKR2y13RpTUP5bADt86u7utiD9/HYARCi7Lqx5SCKyTJTGFuXFftQNrMvZBBhdeTOLo9AZ7Z4AOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727161410; c=relaxed/simple;
	bh=UhJ7pDSuJV+6dFCjiRGKvOl60Kb/Ip0Xbz7+8VxhJ0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xf4u1Dm84F0xGgXpIMEcx/+uE52GNQEa4hY+5wHAxb1pSBg49AzmG+4tAMZHnDa6Mlb21OdAXfTzMDE+X9m/VvzIs7w7Uw4T6BlhkyWPfWLf/YDYcBp08w/nB2VfNg8MYnGcshMwSYHrwaNC7PlSUkks3OZkgmnp7yZ6qXKpvfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRCUWkUq; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRCUWkUq"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7a99e4417c3so458345985a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 00:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727161407; x=1727766207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5D9aCotdQeGGS5MJMXfktLOIegjils9ig4BGtNBGLc=;
        b=QRCUWkUqjtmu9IjVWIkbasNmm66hB0GBF8ymAoyOgiD9+CKGcM1YzznEnAT/L+u1MX
         iwqPmbWCWfP3GcZgaAU5cNgUO/XTcXGGDi1QV0DUvh7eKNnNkkTnN6GSPrwoIAwpDgpS
         oREOZALHVxdeLz+jQUZwwzwwiv7OuCO+DiHmh5GRtn1IklU4MoGOcPM7LyHU+UUEtB6z
         811PTLvNExSNBpZpZhF7bws9m/pEISW6ryJf+/koOCWI5isFCL81katBRd+qScTfrFnt
         kqoMOu8lnOEPnRMMCl4QqOuPQtWxNI2UxLyhqO75fvtmrjec8K6G8e9iCT7+w8j0i4db
         zOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727161407; x=1727766207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5D9aCotdQeGGS5MJMXfktLOIegjils9ig4BGtNBGLc=;
        b=fbXHFLlIzDluRCNSXm50IDjIRZknyQiAO2xPRr4hcl2D4651GRG7EoWVJl9RzB0fX6
         uhA3jnqJg8zXEHxCiIpK/Vp1m2aQf1s6RgqrhK5o2FOrdZ3150xYUt5nJey5U/T8TR2t
         Kwp/WxJ/1wr+JYZGIasFPMO6xAZDUdxcOvWlx7cp2iyzNmWc5M94G3nemcyoKzYWOvds
         b+QlMV4zz3+JIwycztFELOQ3ljLnP+XkN0F4EFIUa1MhyDXZ/VxLSwD5kOqPDOEvu75k
         9PBnf3cqs1JKkDw/yymI8iYqKB0dvH12EWXdvLcxxEeXTHBEtdPDcWbZFSfDOtIqII1e
         t3ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9lC5GVLCwUy3EkNF94G02/S7tQ+26KZlrDDDdG3mStn3ixF5Cwcf7gQDoH8o52Xmc/2ysOr0Os7TxgVCEFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZVRBwFNnYOn1W3JulXFA9ssot2GTKkI1PS2Ubw50uKHN86Jbl
	QzuLV+fdynxiXivE/XmEKYlljrxRYtnK4+w3ufHwVuT04K1SR+lj
X-Google-Smtp-Source: AGHT+IFLiBvOYKluWCEcvq/aGING0d4izidqzdLNhbiuf7iI8u8sBdBQKw9H3zbIaDDgFYTj10wXhw==
X-Received: by 2002:a05:620a:4411:b0:7a9:bf31:dbc7 with SMTP id af79cd13be357-7acb82206d8mr2559785285a.53.1727161407482;
        Tue, 24 Sep 2024 00:03:27 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7acde625367sm41013385a.129.2024.09.24.00.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 00:03:26 -0700 (PDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id 21343120006A;
	Tue, 24 Sep 2024 03:03:26 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Tue, 24 Sep 2024 03:03:26 -0400
X-ME-Sender: <xms:PmTyZhbqMscsD1tG2JxXuy8K9ifdFL8gdVl1OdxqN3hJBn1Avb7RIA>
    <xme:PmTyZoaLO7dYWFuMGadVrygcKPmSdUFvKw7ihstWckpbYn1tKr4JVofm0iszAbTHA
    NyzHKGtAblIamJFSQ>
X-ME-Received: <xmr:PmTyZj8knU5J_nggVR2vLJ64fM-Yqcd61aSsmJoR_p_0Ci2D-8WYYsHm9z4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtuddgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvve
    fukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegs
    ohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepuddtgf
    fftefhlefhhefgleelheduteeuffethedtkeejvdfhgfefgeekueehteefnecuffhomhgr
    ihhnpehkvghrnhgvlhdrohhrghdpghgvthdrmhgrphenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhp
    vghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrd
    hfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthht
    ohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfhgvlhhiphgvpghlihhfvg
    eslhhivhgvrdgtohhmpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgt
    ohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgh
    grrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhn
    sehprhhothhonhdrmhgvpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlohhnghhmrghnsehrvgguhhgrthdrtghomhdprhgtphhtthhopehruhhs
    thdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    gsohhquhhnsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:PmTyZvp0cPgtENPi3BaS-Qr4PSzpes_8jdsmsuVlonjHyaF8F6o2Pg>
    <xmx:PmTyZsoutq_EEGS2zXQIHVmR3YOFHsdetHwWI5yroDq-zNlPEMtS5w>
    <xmx:PmTyZlQEuk1IcdKSrfpOCWQGLyjHNfAeZ2ARNm81u9DPCL6GbrnkAw>
    <xmx:PmTyZkrhJIAsWV9fBGW8bG7rESsCZT5oNzXcI9LjXNcrD4C4X2Mb9w>
    <xmx:PmTyZl41BZdv-ZVXDv4dOYL4bBy3nIEyeHFfpkYEorrR7Tji-CQGCmIf>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Sep 2024 03:03:25 -0400 (EDT)
Date: Tue, 24 Sep 2024 00:02:46 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Filipe Xavier <felipe_life@live.com>
Cc: aliceryhl@google.com, ojeda@kernel.org, gary@garyguo.net,
	benno.lossin@proton.me, will@kernel.org, longman@redhat.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: add trylock method support for lock backend
Message-ID: <ZvJkFr6kdVx8kIMq@boqun-archlinux>
References: <DM4PR14MB727673292DEC9134C3FE559CE9672@DM4PR14MB7276.namprd14.prod.outlook.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM4PR14MB727673292DEC9134C3FE559CE9672@DM4PR14MB7276.namprd14.prod.outlook.com>

On Sun, Sep 15, 2024 at 12:23:39PM -0300, Filipe Xavier wrote:
> Add a non-blocking trylock method to lock backend interface, mutex
> and spinlock implementations. It includes a C helper for spin_trylock.
> Rust Binder will use this method together with the new shrinker abstractions
> to avoid deadlocks in the memory shrinker.
> 

Getting better, thanks! Please see below:

> Link: https://lore.kernel.org/all/20240912-shrinker-v1-1-18b7f1253553@google.com
> Signed-off-by: Filipe Xavier <felipe_life@live.com>
> ---
>  rust/helpers/spinlock.c           |  5 +++++
>  rust/kernel/sync/lock.rs          | 16 ++++++++++++++++
>  rust/kernel/sync/lock/mutex.rs    | 11 +++++++++++
>  rust/kernel/sync/lock/spinlock.rs | 11 +++++++++++
>  4 files changed, 43 insertions(+)
> 
> diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
> index acc1376b833c..775ed4d549ae 100644
> --- a/rust/helpers/spinlock.c
> +++ b/rust/helpers/spinlock.c
> @@ -22,3 +22,8 @@ void rust_helper_spin_unlock(spinlock_t *lock)
>  {
>  	spin_unlock(lock);
>  }
> +
> +int rust_helper_spin_trylock(spinlock_t *lock)
> +{
> +	return spin_trylock(lock);
> +}
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index f6c34ca4d819..f4e51a5a1f23 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -58,6 +58,13 @@ unsafe fn init(
>      #[must_use]
>      unsafe fn lock(ptr: *mut Self::State) -> Self::GuardState;
>  
> +    /// Tries to acquire the lock without blocking.

As I suggested in v1, "without blocking" is not accurate here because
a lock can be a spinlock. So you can just remove it. I think the word
"Tries" itself implies "neither busy waiting nor blocking".

> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that [`Backend::init`] has been previously called.
> +    unsafe fn try_lock(ptr: *mut Self::State) -> Option<Self::GuardState>;
> +
>      /// Releases the lock, giving up its ownership.
>      ///
>      /// # Safety
> @@ -128,6 +135,15 @@ pub fn lock(&self) -> Guard<'_, T, B> {
>          // SAFETY: The lock was just acquired.
>          unsafe { Guard::new(self, state) }
>      }
> +
> +    /// Tries to acquire the lock and returns immediately

Please remove the "and returns immediately", as the meaning is vague: a
normal lock function also "returns immediately" after acquiring the
lock.

Otherwise, the patch looks good to me, thanks!

Regards,
Boqun

> +    ///
> +    /// Returns a guard that can be used to access the data protected by the lock if successful.
> +    pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
> +        // SAFETY: The constructor of the type calls `init`, so the existence of the object proves
> +        // that `init` was called.
> +        unsafe { B::try_lock(self.state.get()).map(|state| Guard::new(self, state)) }
> +    }
>  }
>  
>  /// A lock guard.
> diff --git a/rust/kernel/sync/lock/mutex.rs b/rust/kernel/sync/lock/mutex.rs
> index 30632070ee67..c4f3b6cbfe48 100644
> --- a/rust/kernel/sync/lock/mutex.rs
> +++ b/rust/kernel/sync/lock/mutex.rs
> @@ -115,4 +115,15 @@ unsafe fn unlock(ptr: *mut Self::State, _guard_state: &Self::GuardState) {
>          // caller is the owner of the mutex.
>          unsafe { bindings::mutex_unlock(ptr) };
>      }
> +
> +    unsafe fn try_lock(ptr: *mut Self::State) -> Option<Self::GuardState> {
> +        // SAFETY: The `ptr` pointer is guaranteed to be valid and initialized before use.
> +        let result = unsafe { bindings::mutex_trylock(ptr) };
> +
> +        if result != 0 {
> +            Some(())
> +        } else {
> +            None
> +        }
> +    }
>  }
> diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/spinlock.rs
> index ea5c5bc1ce12..c900ae23db76 100644
> --- a/rust/kernel/sync/lock/spinlock.rs
> +++ b/rust/kernel/sync/lock/spinlock.rs
> @@ -114,4 +114,15 @@ unsafe fn unlock(ptr: *mut Self::State, _guard_state: &Self::GuardState) {
>          // caller is the owner of the spinlock.
>          unsafe { bindings::spin_unlock(ptr) }
>      }
> +
> +    unsafe fn try_lock(ptr: *mut Self::State) -> Option<Self::GuardState> {
> +        // SAFETY: The `ptr` pointer is guaranteed to be valid and initialized before use.
> +        let result = unsafe { bindings::spin_trylock(ptr) };
> +
> +        if result != 0 {
> +            Some(())
> +        } else {
> +            None
> +        }
> +    }
>  }
> -- 
> 2.46.0
> 
