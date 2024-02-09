Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CC037701
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Feb 2024 12:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707482698; cv=none; b=DNIrspWkLGToAxn6PUGUNoZdrWum20e29A5D52l0MR4f30qsOAmupgYD+BkN4GE+um2TG8TVHv+ioXYG1W8Ilu1so05WfUrk05dJ0Uoewye97E9g+CKrJRiCpx4QDLn0GPLTixile1lVBoigmBj+DgFS+Dec6Ym3KW27mqnWRdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707482698; c=relaxed/simple;
	bh=7sD4/VdZvaL6B6MBf8lpMNv5vDEve5Yd3gQDEDtJjaQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Vy0BkqYSJZZWsFiX+0HINLYW/uST5eRj/a3Sap6zA5uDIwi1b+sAidhJqNgd6YUsw/OVOuDIgNMOwMJC3QfZDs4dxhd7OECH34KLpGXEMathmRAJYJDrqhTEGXOPR6iY89/Vr0Yk7OXYQVjqJlOr/zeXAyxCTIDUvc9hjHV6JwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=asrTaQ0g; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="asrTaQ0g"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-604b6d55dfcso8743427b3.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Feb 2024 04:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707482696; x=1708087496; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aFf0Ml9uL89dbOaB7KSYiQq6mm9Z6rfzt6ltuwmLMGA=;
        b=asrTaQ0gDlvbogAca32nO2xoVcb/T2W/UsJ2GCc3Ocf6fbFD2tQ51hthORgFQL6Nl6
         d1qOFvaLA297XKtynog29rkq2Cc5N0v3TYwNE51ZEVEZQ3mu+gAu5l5mZF89wgbQwzaP
         4iJeGysG/x4jJHZ99CCm3YthN/rkbNwJgyM3rLHaKrynfrhlMEEWl6Ib3OCImzbrUEAS
         x9uSBY6NZkNpEnE2UO5GnwUJXw6nBCD8VoYHl6p1jS3PTjPgJX0eTAua4hLS5xG599ib
         NF0BErl689gKqZf03gndD8XiHd0mB8SGQnfHZZohATWS+CiEm5iO8LajJU026pw63C9n
         O9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707482696; x=1708087496;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aFf0Ml9uL89dbOaB7KSYiQq6mm9Z6rfzt6ltuwmLMGA=;
        b=v4V9psf58dQs9OuCDTOzya6LZi4zlNqgemW1wdJLNsyjUcgzzxcifwTsmY9nFNut66
         zAwj+hN2Yg/rLgU8tw9ys5W8xOLY1pPkVOxbN5uxaIG0HzoqOwTuqn7hCfH4+iMAWu7N
         6t5aOUxHtbfVlpCc2ymkRWKo7sNfPqfzuWsrhaAcpJO9MzUObkA5ewvsX7K9R/nz7/RP
         lOYMt4RxowYnOBmxbgWhJh66/VZu3brwXZPTAyiCB/co0VVNpdIc2eMagyyj2zrskaoM
         PTPqQnsucjpYx79P+olYSJIf+ij+t+lJ2cjVkIlImfmZrhj5klkAqGIPBZos+faxPQvg
         AYuw==
X-Gm-Message-State: AOJu0YyZJUQZNA9Fe5VqiP2vDy9r/d15aJ8dxsPznzQDtMtjdI3osYmJ
	WxIG4Q78dYgf0eZcQCkz3l+nbcHzkNP+rFT0a5gTBlp2DGS3R6aInZHF3p5zAPk0EeSqWv450DL
	Ck/8yLWg5CpojrA==
X-Google-Smtp-Source: AGHT+IHqzRrDy1iqHo01Iw1kdDLbmHf0eWaHOP+zq20fN73d2L7Cw5yZQ9I+YCxxvvnvKivXz3GG8eVo8+C7bjs=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a0d:dfd8:0:b0:604:9fe3:6f0b with SMTP id
 i207-20020a0ddfd8000000b006049fe36f0bmr148111ywe.4.1707482696156; Fri, 09 Feb
 2024 04:44:56 -0800 (PST)
Date: Fri,  9 Feb 2024 12:44:53 +0000
In-Reply-To: <20240116151728.370238-1-mcanal@igalia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240116151728.370238-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240209124453.1570127-1-aliceryhl@google.com>
Subject: Re: [PATCH v6] rust: xarray: Add an abstraction for XArray
From: Alice Ryhl <aliceryhl@google.com>
To: mcanal@igalia.com
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, kernel-dev@igalia.com, lina@asahilina.net, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, wedsonaf@gmail.com, willy@infradead.org
Content-Type: text/plain; charset="utf-8"

> +impl<'a, T: ForeignOwnable> Drop for Guard<'a, T> {
> +    fn drop(&mut self) {
> +        // SAFETY: By the type invariant, we guarantee that we have a reference
> +        // that owns the C xarray object.
> +        unsafe { bindings::xa_unlock(self.1.xa.get()) };
> +    }
> +}

No, we own the lock. We don't own the entire xarray object.

// SAFETY: By the type invariant we own the xarray lock, so we may unlock it here.

> +    /// Looks up and returns a reference to an entry in the array, returning a `Guard` if it
> +    /// exists.
> +    ///
> +    /// This guard blocks all other actions on the `XArray`. Callers are expected to drop the
> +    /// `Guard` eagerly to avoid blocking other users, such as by taking a clone of the value.
> +    pub fn get(&self, index: usize) -> Option<Guard<'_, T>> {

I would rename this function to `get_locked` or something like that. The
name `get` makes more sense for a function that returns an
`Option<Arc<T>>` by incrementing the refcount before releasing the lock.

> +        // SAFETY: `self.xa` is always valid by the type invariant.
> +        //
> +        // As we are taking advantage of the lock to protect the data structures
> +        // that we are storing in the XArray, we need to call xa_lock() before
> +        // calling xa_load(), which we did.
> +        let p = unsafe { bindings::xa_load(self.xa.get(), index.try_into().ok()?) };

The `xa_load` function doesn't require that you hold the lock (but it
does allow you to do so). The reason why you hold the lock is to prevent
`p` from being invalidated by a concurrent call to `set`. I would make
this more explicit.

// SAFETY: `self.xa` is always valid by the type invariant.
//
// We currently hold the xa_lock, which is allowed by xa_load. The
// returned pointer `p` is only valid until we release the lock, which
// is okay here, since the returned `Guard` ensures that the pointer can
// only be used while the lock is still held.

> +        NonNull::new(p as *mut T).map(|p| {
> +            guard.dismiss();
> +            Guard(p, self)
> +        })

I find this confusing. How about this?

let p = NonNull::new(p.cast::<T>())?;
guard.dismiss();
// INVARIANT: We just dismissed the `guard`, so we can pass ownership of
// the lock to the returned `Guard`.
Some(Guard(p, self))

> +        let old = unsafe {
> +            bindings::xa_store(
> +                self.xa.get(),
> +                index.try_into()?,
> +                new.cast_mut(),
> +                bindings::GFP_KERNEL,
> +            )
> +        };
> [..]
> +        let p = unsafe { bindings::xa_load(self.xa.get(), index.try_into().ok()?) };
> [..]
> +        let p = unsafe { bindings::xa_erase(self.xa.get(), index.try_into().ok()?) };

I find these conversions of the index problematic. The type is `unsigned
long`, which is always the same as `usize` in the kernel. I recommend
introducing a method like this:

fn to_index(i: usize) -> c_ulong {
	build_assert!(size_of::<usize>() == size_of::<c_ulong>());
	i as c_ulong
}

And then use this method instead of the `index.try_into().ok()?` stuff.

> +    /// Removes and returns an entry, returning it if it existed.
> +    pub fn remove(&self, index: usize) -> Option<T> {
> +        // SAFETY: `self.xa` is always valid by the type invariant.
> +        let p = unsafe { bindings::xa_erase(self.xa.get(), index.try_into().ok()?) };
> +        if p.is_null() {
> +            None
> +        } else {
> +            // SAFETY: All pointers stored in the array are pointers obtained by
> +            // calling `T::into_foreign`.
> +            Some(unsafe { T::from_foreign(p) })
> +        }
> +    }

Not sure what the status on that patch is, but this could use the new
`ForeignOwnable::try_from_foreign` method.

https://lore.kernel.org/all/0100018d53f737f8-80c1fe97-0019-40d7-ab69-b1b192785cd7-000000@email.amazonses.com/

> +        let guard = ScopeGuard::new(|| {
> +            if !new.is_null() {
> +                // SAFETY: If `new` is not NULL, it came from the `ForeignOwnable` we got
> +                // from the caller.
> +                unsafe { T::from_foreign(new) };
> +            }
> +        });

I would prefer if you always used `drop(T::from_foreign(new))` whenever
you are immediately dropping it.

> +            // SAFETY: All pointers stored in the array are pointers obtained by
> +            // calling `T::into_foreign`.
> +            unsafe {
> +                T::from_foreign(entry);
> +            }

Same here. Also, we generally put the ; outside the unsafe block, since
that formats more nicely.

> +        // SAFETY: `xa_destroy()` is guaranteed to acquire the lock anyway.
> +        unsafe {
> +            bindings::xa_destroy(self.xa.get());
> +        }

This safety comment doesn't make sense to me. Why is the lock relevant?
I would say something along the lines of:

// SAFETY: By the type invariants, we have ownership of the xarray, and
// we don't use it after this call, so we can destroy it.

> +// SAFETY: XArray is thread-safe and all mutation operations are internally locked.
> +unsafe impl<T: Send + ForeignOwnable> Send for XArray<T> {}
> +unsafe impl<T: Sync + ForeignOwnable> Sync for XArray<T> {}

This is wrong. If I have a `!Send + Sync` type, then the XArray will be
`Sync`, so I can use the `&self` methods `set` and `remove` to transfer
ownership of the value to another thread.

Instead, both impls should require `T: Send`. You don't actually need
`Sync` since you currently don't provide any APIs that allow concurrent
access to values in the xarray. However, it still might make sense to
require `T: Send + Sync` in case someone adds such a method in the
future.

Alice
