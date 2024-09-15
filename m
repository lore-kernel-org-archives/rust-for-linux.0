Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806F4DF49
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Sep 2024 05:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726378546; cv=none; b=fIMhFH0JG79sE7YyuSyOz8bBU84jb1mBRijSQc6lctw7FtYg4S59fLHcwLcgFM4yvLWs5Vc2mLfK2rDlY3XjvnA/CUX9TfOMo8TkJQCzZ5UhRL8S0nbE9a5hWncMvgoHLIuzV4qJkdbpfQE9l0slYYkP+O3H+AnB56SOAV8VxPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726378546; c=relaxed/simple;
	bh=S/me0RORQ2mrh7cuqbe8n/GVH/agAGzAtJFOOE4ymUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRZUBWT1nYVBvkKb//6hbQeXHoXLaRjOvJIW/iT3VddrdwZK+dTI0VEZlPHRAcmSeTCF034S+sNpzdr7T2IRmzYiJ2BLZ9B92hAchmgptm6MOTD9Zn84+Te1OERKP9tJilwWHMp24Lc2qUt4o+RneXBTXWVRLR1L+qSQpgeqDrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITOA+FL/; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITOA+FL/"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7a9a3e731f9so303634785a.0
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Sep 2024 22:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726378543; x=1726983343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKQOLuPS9LN0cAB9FYMxp92FH3flsTpWiBsupktJig4=;
        b=ITOA+FL/NbLeOMkv+RLUlBsddn8XQrfpKwsKHEqZJkPscU7d9LpO6U5uX4f8q/oeYb
         uyGBlRsoeF1KbbPS34LUsUyeCqPPtJ7j/C+MhxP5wg1cjEXqO1tPrCiTKtABYkj92JqV
         n65PrjRKd8F6igwDwdEn1yzzp+HSk34k6x4RuL+lj0Jy1tjZl7oPCCF6l7p4tpYNioYI
         zbISQJqLj2tcD3d+COkPSilEd2ONzq1RS0oLa4DRfLUzlnlNExa4xe28OZ9MIFaCjf4d
         HzcevuCmEp4fXETXR7scsFYnhRanXUH2+ReoR4vnS5cj4KsEDVC6PCHZQ/KnzUNQhWu3
         /ZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726378543; x=1726983343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKQOLuPS9LN0cAB9FYMxp92FH3flsTpWiBsupktJig4=;
        b=i4Ugh0TX+PG4hiN5wL2FjDvpsF9eQjHgrm8sRhuBo3oV9LWkucS7s6WDrcTRUn1232
         CHtvgXV8HNVYmPBuaGbUsP/r8stS28d7UFhjKtDsyXmz8T95pCych0ZNG7dfasRdXqTk
         3AdQr40QczZ0gWfUS2zI8r7eNiaOJb5rXraHZoeFxI+rO+nebfW2R6NIXZo6874rNry/
         G9S+JXBYZWk5HFAgUb5SrVNke55Eb6p/yxo2DNrcyRgaMfw9vhDznbhPdfBKzdtpaT+N
         kQU92+MPlEVcaEDPP+yXQc6Nd6EVlMqelz7cGDVWNCgGQ7CZr86xAwaI65lfcbGnSpqL
         92VA==
X-Forwarded-Encrypted: i=1; AJvYcCUUwSIrSiJZLEr4tXY4fKQrnbjeRnI1y98lGs6EzDDQNmDAJYamw4YQFF+GT9gJ9/6fAtmW6+5BLoG72qQ0ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq+3n8DyE4T+wjOHFJb/z1201sdnitxDtauwAvbYo4iqxZNJM+
	tbQ/2LHhjD9aXivXuxyzlt55qK7xTJhrNUwLq9u1PBUbkzr6MLI6
X-Google-Smtp-Source: AGHT+IEJEV2pCOMI2C1lgg+P7d5mmj9JwwagUW+9WQgIaPDYSTNMduT6C++M8bP4RIdMhwdOP2lXwA==
X-Received: by 2002:a05:620a:4693:b0:7a6:5b3a:72cc with SMTP id af79cd13be357-7a9e5f81b93mr1866434685a.55.1726378543168;
        Sat, 14 Sep 2024 22:35:43 -0700 (PDT)
Received: from fauth1-smtp.messagingengine.com (fauth1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ab3e96544bsm133881085a.22.2024.09.14.22.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 22:35:42 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4A98C1200069;
	Sun, 15 Sep 2024 01:35:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 15 Sep 2024 01:35:42 -0400
X-ME-Sender: <xms:LnLmZjZ_yxAyWbvI8pebTvXpi8Pj__M-MBksdUGJQxowLEG9T2LqYw>
    <xme:LnLmZibKrVwCVqT767cr6-5zVo4oHJUrm-JzzKwF-SdxLa1Tjy7TsoEbVK6g8xB4w
    CXkzGRh3IXX-07G7g>
X-ME-Received: <xmr:LnLmZl-OBeBJJR6UonlitDy9s1PVHxK3eZGi7oUegrFUp9do4vDvIkWThkeFtg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudekuddgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvve
    fukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegs
    ohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepjeetle
    efhffhtdehvefghfdthfefkeefveejgefffeekkedvkeegjefhjeduueejnecuffhomhgr
    ihhnpehgvghtrdhmrghpnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidq
    ieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilh
    drtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehfvghlihhpvggplhhifhgvsehlihhvvgdrtghomhdprh
    gtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopeho
    jhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrghrhiesghgrrhihghhuoh
    drnhgvthdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdp
    rhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopegsohhquhhnsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:LnLmZppkvkZ8_7vcnd721kdlPfFzsDkAruAbuCqRjdNO76Xe7RiQxg>
    <xmx:LnLmZur1rrOMqNcpiHa6kn8sEVYACfsSLTGO-b4toMQ6NvHh561psQ>
    <xmx:LnLmZvSMDdP7ibqiw0eU3-nSG-iVVufk8NRA8BdmjL5_zVM8q3z4Rg>
    <xmx:LnLmZmrN9QT_QswHkDCM5cFX-ZdgrUbdPlPbL4yn6j_Rs5bb4swFMQ>
    <xmx:LnLmZv5-nkVHUaUPgJi0ugOs56wk46rQmoYdEbmSub1MEZ7Bi0-vevo8>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Sep 2024 01:35:41 -0400 (EDT)
Date: Sat, 14 Sep 2024 22:35:29 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Filipe Xavier <felipe_life@live.com>
Cc: aliceryhl@google.com, ojeda@kernel.org, gary@garyguo.net,
	benno.lossin@proton.me, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add trylock method support for lock backend
Message-ID: <ZuZyIRaGHxGMGUid@boqun-archlinux>
References: <DM4PR14MB727606461A9C870981F44D9BE9662@DM4PR14MB7276.namprd14.prod.outlook.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM4PR14MB727606461A9C870981F44D9BE9662@DM4PR14MB7276.namprd14.prod.outlook.com>

Hi Filipe,

Thanks for the patch.

On Sat, Sep 14, 2024 at 11:00:33AM -0300, Filipe Xavier wrote:
> 

^ unnecessary empty line here.

> Add a non-blocking trylock method to lock backend interface, mutex
> and spinlock implementations. It includes a C helper for spin_trylock.

The commit log needs to explain why the change is needed rather than
what the change is. Do you have a (potential) usage of these trylock
APIs? I know that trylock concept has been there for quite a while, but
still an usage will help us understand why this is needed in Rust code.

Also could you Cc lock maintainers next time, you can find the list of
their email address at MAINTAINERS file (there is a "LOCKING PRIMITIVES"
section).

v unnecessary empty line here as well.
> 
> 
> Signed-off-by: Filipe Xavier <felipe_life@live.com>
> ---
>  rust/helpers/spinlock.c           |  5 +++++
>  rust/kernel/sync/lock.rs          | 15 +++++++++++++++
>  rust/kernel/sync/lock/mutex.rs    | 11 +++++++++++
>  rust/kernel/sync/lock/spinlock.rs | 11 +++++++++++
>  4 files changed, 42 insertions(+)
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

I'd just change this to `boolean`, but I don't whether it affects
LTO-inlining, Gary?

> +{
> +	return spin_trylock(lock);
> +}
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index f6c34ca4d819..c13595a735ae 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -27,6 +27,7 @@
>  ///
>  /// [`lock`]: Backend::lock
>  /// [`unlock`]: Backend::unlock
> +/// [`try_lock`]: Backend::try_lock

Other links are added because they are used in previous document
section, but this patch doesn't add the corresponding document for
`try_lock`.

>  /// [`relock`]: Backend::relock
>  pub unsafe trait Backend {
>      /// The state required by the lock.
> @@ -65,6 +66,13 @@ unsafe fn init(
>      /// It must only be called by the current owner of the lock.
>      unsafe fn unlock(ptr: *mut Self::State, guard_state: &Self::GuardState);
>  
> +    /// Tries to acquire the mutex without blocking.

Why use word "mutex" in a generic trait for all locks?

> +    ///
> +    /// # Safety
> +    ///
> +    /// Returns `Some(state)` if successful, `None` if already locked.

This is not a safety require for this function.

> +    unsafe fn try_lock(ptr: *mut Self::State) -> Option<Self::GuardState>;
> +
>      /// Reacquires the lock, making the caller its owner.
>      ///
>      /// # Safety
> @@ -128,6 +136,13 @@ pub fn lock(&self) -> Guard<'_, T, B> {
>          // SAFETY: The lock was just acquired.
>          unsafe { Guard::new(self, state) }
>      }
> +
> +    /// Tries to acquire the lock without blocking and returns a guard that can be used

I'd make a new paragraph for the second part of the second (i..e "and
returns ..."). "Tries to acquire the lock without blocking" is good
enough to describe what the function is (although maybe "without
blocking" can be also dropped, because "blocking" can mean exactly
"sleep blocking" but that's not the case for spinlock), and the rest of
the sentence is really further describing the return behavior which
usually needs a separate paragraph.

> +    /// to access the data protected by the lock if successful.
> +    pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
> +        // SAFETY: The backend `try_lock` method has been implemented securely.

I didn't find any description on how `try_lock` should be implemented
securely, but yet you mention it here. Could you take the `lock()`
functions in `Backend` and `Lock` as an example, and see what you are
missing? You probably need a "safety" section for trait Backend.

Regards,
Boqun

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
