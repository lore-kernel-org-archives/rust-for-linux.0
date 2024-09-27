Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D0E17837E
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Sep 2024 08:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727425774; cv=none; b=IA+qHeG9+cVy6uV5oh5E8ttVm6ui61ugm5GgDb300W18P/cICxeA2z64XrWjQsHuMF0bW4qZX7shjZLVBENzmQqdUow5I93E+2dasGO6UV+v8xKkmFpsSf82Jmkojm1M/sEX13z9VYoTnB0Gir7y4iR6r8C0vgAj+pcbPbo7dyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727425774; c=relaxed/simple;
	bh=Mr2G5BzACBgoKGVpGgADUkrUGqFjg1jBP5mOMbcQUpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RsVg+TQCGaovnveDjynqQ1cFFSuP4KGLSHAizo6prlsYDKjxk9d9YOqNpbHTuHYWDGAtdMFjUONlCsvP1PEy+xpg+pC9YHOKYxe6mu292m8nk+FBNNej4JwFRm+KcHkTNEf8JGvx0Tyai9Th1Q34Rtmg6D1MfJ0kB761H4brQqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PapYdntT; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PapYdntT"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7a9ab721058so248650185a.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Sep 2024 01:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727425772; x=1728030572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idc5vrxsx5Zi4ZVxvR5rEgB9NxKGvbYMn3R1wukgqeU=;
        b=PapYdntTy8tdU2IHVNukXONUct2i6skpOUDEoV2BzeL03ckepBKjehOM87umN+prhB
         h7UWfdqs0kH5RxWx+PAsjwPRxTyb1qWbmU9YuIiq5EBushOkGlfsb2J9qORoAW+2+HgI
         j7Kkc7a9lX+ftuHnvzg+XP2zE3dVDNx5W7eGrqlF1dzIRGBZy4IYLmX3iRN9ob6O0HNd
         YOjFdjBi1PyoybjGxB4aUWvKQHWoSTwMzwCLaP9e71fMoiJULbMpc5JF4frPGEhOkyQd
         zrJaDw4HBwPNl1SZARKWm7KbRvqLA/W2lWFgGhqFaBjG8dNcoF8kjW/oMzyRCaLtsscT
         ZWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727425772; x=1728030572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idc5vrxsx5Zi4ZVxvR5rEgB9NxKGvbYMn3R1wukgqeU=;
        b=hwajxbmExh3NTYOtqa1Dgf92KgUFq4O/T8O8atl0JHGK/bnIBp88Mw/eklrf1qJUDh
         5mJSGzqCE4OrTvyZPH7JUABD6VILs9nJoE4vYriEtZW4y1u5y7D9Crq25kxumAp5gvIa
         MusTRIBZDih/EjMT289vPd+Wvv0mIS+uLfm6vNV2v5zRZmA+sg07VDj1Py6ihzIdN9/V
         t5v9jTTMeJt2en1M8zrCWEpMj7o6EQSs7qqemIPAbdam04AbbHd3yMW0m/kcKquh9nQu
         enQNLCrmgcmmWl6N+5J5em2UEfPhmMflwmlzUo8AkAM6cZgzwTz14Dt/NEwF6HyJ4bEw
         7MbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9Py+Pxrk1li52rkdafOEs7yx8kXZhhaYeseyPP05qKPPLoWEvLCiJPJ1VvUwgjxrAw5xGjoRSx7YYK6yHbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1rBwOF2B4eMKgvOwHshW60bwFkissd2aEgp6VLIQb2VGEx/u5
	hlwfOXPI5zirIfQ86ObNxhsFAqX+6kIUz0+6Z/TTen9Wn+ipFLkgZKgrHg==
X-Google-Smtp-Source: AGHT+IHnmEjLR6cvhELZWG5OCqEHP1JKxogbEAYhwWdK73y7tWSKIOW7bqAo+LH3K/hUCAtkiGE6WA==
X-Received: by 2002:a05:620a:454e:b0:7ab:3516:56c1 with SMTP id af79cd13be357-7ae2c627e91mr1101188685a.14.1727425771867;
        Fri, 27 Sep 2024 01:29:31 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ae3782b8f3sm64253485a.72.2024.09.27.01.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 01:29:31 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id ED7631200043;
	Fri, 27 Sep 2024 04:29:30 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 27 Sep 2024 04:29:30 -0400
X-ME-Sender: <xms:6mz2Zk76XdtnCrGOcI85WhT9bm_ivOQBhrMJA4lcqI9ApKUZyBBZ1g>
    <xme:6mz2Zl7Dw4GPfXnSyzyKSManxHebhy1DIGF5BK_trV7MerkhDpbWZKkno978kNOFb
    0YSk-jAOGAsryq4Ww>
X-ME-Received: <xmr:6mz2Zjf76LfUJeMmlE3ealUUNefBhROQGIIAWqjABeSYdgshTLHkXXReGvSqPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtledgtdehucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:6mz2ZpLMfS0z0SNSvfu005xolJGW8hgYxr925p5za5HLHF_fzFsXQw>
    <xmx:6mz2ZoIKN9OfuG3yyqZFeu8yXI5SVgHoVctSLHuaT4DED7gD5QH3Dg>
    <xmx:6mz2Zqzhnk5WYmTP1hE6KCUmOD5nv_fY2IY2y163GPcwt0nwVSa6cQ>
    <xmx:6mz2ZsIvlN3tg_16nDsJ7mJ5IlgxUGNsYOP_hAhdX6PFU3RoV4OAjQ>
    <xmx:6mz2ZnZuicacd_Fyx3bcft7re4a17hUpyPw7hYdSemyYwmH_E5bStJNc>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Sep 2024 04:29:30 -0400 (EDT)
Date: Fri, 27 Sep 2024 01:28:42 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Filipe Xavier <felipe_life@live.com>
Cc: aliceryhl@google.com, ojeda@kernel.org, gary@garyguo.net,
	benno.lossin@proton.me, will@kernel.org, longman@redhat.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3] rust: add trylock method support for lock backend
Message-ID: <ZvZsuh-cLuV6ilRk@boqun-archlinux>
References: <BL0PR02MB4914579914884B5D7473B3D6E96A2@BL0PR02MB4914.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL0PR02MB4914579914884B5D7473B3D6E96A2@BL0PR02MB4914.namprd02.prod.outlook.com>

On Thu, Sep 26, 2024 at 05:50:37PM -0300, Filipe Xavier wrote:
> Add a non-blocking trylock method to lock backend interface, mutex
> and spinlock implementations. It includes a C helper for spin_trylock.
> Rust Binder will use this method together with the new shrinker abstractions
> to avoid deadlocks in the memory shrinker.
> 
> Link: https://lore.kernel.org/all/20240912-shrinker-v1-1-18b7f1253553@google.com
> Signed-off-by: Filipe Xavier <felipe_life@live.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

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
> +    /// Tries to acquire the lock.
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
> +    /// Tries to acquire the lock.
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
