Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D13157490
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Sep 2024 09:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727428048; cv=none; b=Y1jPR2tl7xRMZKsdO/N7/hgD75VRQd4v/Cs58PyNDQbCGnNtk9qQj3KcWjHyBTq/YBzxd9nhfmhQqB0bdKDYHTHM9nCpZPIQtGLjDNjMguRugnuekIJcw+X0bpgj1djPRer4gGK65UPbnySLAvLYcJrBiQlzcHjV4BjMfb14tkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727428048; c=relaxed/simple;
	bh=KKXhNxOc2IWQQ9/QmPpG49Ogvpi+0dxE+FD5WpybLvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BsZEGz7GiHXdg2cC0dFuzAT/WvxgerZbFHF9m9u49E0CBddjdM9EiM2PshFyOcINf3yje336eib8+EGHBtAlENZwRrj0RJlWlSK1fWD2fAV424TvqwNQesQDq6kPS5FoeIhuKjf4w9q084IPvpvj/gJMesXJeEnZATmstLUGD9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=O8ei7zAF; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="O8ei7zAF"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1727428043; bh=quDcP/FuoGkJOoo99uV0/cYWwCwVL61x7FIZIuS5NUE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=O8ei7zAFUhyTXnum7GFi9B2XJptyU82CdRQh3gHAhJ0PGF2vgs8Rsz9eUqsyNVcJx
	 GXZbRx3/MSkuAPj9z819a5w8ZITQ/BjSUfYSTbAOl7ydA+OPBpNI1f7EmDXEGx2iW+
	 rSzNeeqL38UudRrlzu4R9vXJAxGEbGbanWzzYjZY=
To: Filipe Xavier <felipe_life@live.com>
Cc: aliceryhl@google.com, ojeda@kernel.org, boqun.feng@gmail.com,
 gary@garyguo.net, benno.lossin@proton.me, will@kernel.org,
 longman@redhat.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3] rust: add trylock method support for lock backend
Date: Fri, 27 Sep 2024 11:07:22 +0200
Message-ID: <E3215FBF-CA50-44A1-92A1-DC65E94AA0EE@kloenk.dev>
In-Reply-To: <BL0PR02MB4914579914884B5D7473B3D6E96A2@BL0PR02MB4914.namprd02.prod.outlook.com>
References: <BL0PR02MB4914579914884B5D7473B3D6E96A2@BL0PR02MB4914.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable



On 26 Sep 2024, at 22:50, Filipe Xavier wrote:

> Add a non-blocking trylock method to lock backend interface, mutex
> and spinlock implementations. It includes a C helper for spin_trylock.
> Rust Binder will use this method together with the new shrinker abstrac=
tions
> to avoid deadlocks in the memory shrinker.
>
> Link: https://lore.kernel.org/all/20240912-shrinker-v1-1-18b7f1253553@g=
oogle.com
> Signed-off-by: Filipe Xavier <felipe_life@live.com>

Reviewed-by: Fiona Behrens <me@kloenk.dev>

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
> +    /// Callers must ensure that [`Backend::init`] has been previously=
 called.
> +    unsafe fn try_lock(ptr: *mut Self::State) -> Option<Self::GuardSta=
te>;
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
> +    /// Returns a guard that can be used to access the data protected =
by the lock if successful.
> +    pub fn try_lock(&self) -> Option<Guard<'_, T, B>> {
> +        // SAFETY: The constructor of the type calls `init`, so the ex=
istence of the object proves
> +        // that `init` was called.
> +        unsafe { B::try_lock(self.state.get()).map(|state| Guard::new(=
self, state)) }
> +    }
>  }
>
>  /// A lock guard.
> diff --git a/rust/kernel/sync/lock/mutex.rs b/rust/kernel/sync/lock/mut=
ex.rs
> index 30632070ee67..c4f3b6cbfe48 100644
> --- a/rust/kernel/sync/lock/mutex.rs
> +++ b/rust/kernel/sync/lock/mutex.rs
> @@ -115,4 +115,15 @@ unsafe fn unlock(ptr: *mut Self::State, _guard_sta=
te: &Self::GuardState) {
>          // caller is the owner of the mutex.
>          unsafe { bindings::mutex_unlock(ptr) };
>      }
> +
> +    unsafe fn try_lock(ptr: *mut Self::State) -> Option<Self::GuardSta=
te> {
> +        // SAFETY: The `ptr` pointer is guaranteed to be valid and ini=
tialized before use.
> +        let result =3D unsafe { bindings::mutex_trylock(ptr) };
> +
> +        if result !=3D 0 {
> +            Some(())
> +        } else {
> +            None
> +        }
> +    }
>  }
> diff --git a/rust/kernel/sync/lock/spinlock.rs b/rust/kernel/sync/lock/=
spinlock.rs
> index ea5c5bc1ce12..c900ae23db76 100644
> --- a/rust/kernel/sync/lock/spinlock.rs
> +++ b/rust/kernel/sync/lock/spinlock.rs
> @@ -114,4 +114,15 @@ unsafe fn unlock(ptr: *mut Self::State, _guard_sta=
te: &Self::GuardState) {
>          // caller is the owner of the spinlock.
>          unsafe { bindings::spin_unlock(ptr) }
>      }
> +
> +    unsafe fn try_lock(ptr: *mut Self::State) -> Option<Self::GuardSta=
te> {
> +        // SAFETY: The `ptr` pointer is guaranteed to be valid and ini=
tialized before use.
> +        let result =3D unsafe { bindings::spin_trylock(ptr) };
> +
> +        if result !=3D 0 {
> +            Some(())
> +        } else {
> +            None
> +        }
> +    }
>  }
> -- =

> 2.46.0
