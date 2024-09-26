Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch [185.70.40.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D55156CA
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Sep 2024 13:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727357030; cv=none; b=JIKjRCztX9SsnEa4ONCc86vADP2tH7uEF27T33TZuhea4bDQgQOmEznVromEq+xTFoQCaL2/Tg7WqBHEMQxxd3CBay9vSZDJfXjkv9Gp9CJkqn7yI9N2rSCtGv4A/v+2INItgglFrTzAF+FEKlQmMER7XnpIz9p9U5qBF73K3zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727357030; c=relaxed/simple;
	bh=OCn1dTyhnGPT5aF53r21mHi2JRcXPsAcCX+1vopBdXA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bmE5IcRluFxLkSfeY3v4qyXHiZuFvHtsGY0CD6MA+4YJHy74eQykKo6YrRpgfrKdr7hvwjvc7mmZqFXjRAq7fVu6iewItMWJ3nzPTnEvxurBz/veq0aCA/aJrDU6HLXGYxig0XED7U/Pj2wNa8qKlZHpa2C8kSk9/vjUC/c+AK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=UN616mV9; arc=none smtp.client-ip=185.70.40.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="UN616mV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1727357025; x=1727616225;
	bh=b2AdEwZAwPPn/bQlFLfOgNyL9LMv1IU2cwYbMyiznM0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UN616mV9EHLs1CQBf5swLLETNgp4zuShZZ4Qw0sRysxv0hPWSjUfKJJ/3sobP5IOZ
	 92qvOt8eCPBiiX9DwySAdWBThv7wI1Rin7yhQmqhM9vISo/g1Gfa96PzGYHW5FxYo9
	 NkMBHQd87979d86XJd0A0qH6e78kn6fMgHP8X3eM1Dkf2snCpwgwHci87zdp0qkP7Q
	 cQnCaUqia2fSTVqlhT0Y3QkDUkIXpdUiwuibFWaK3XetS3rhW+3j7bOPD6s89FP0nC
	 0KM39NnstKwGaBTwWdDag5Bxl+3sNIQlDF+F0vcemBM3oZYyA7hR9QMSsLZV4ZkXEm
	 Do8xKJF2xKq3Q==
Date: Thu, 26 Sep 2024 13:23:37 +0000
To: Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com, akpm@linux-foundation.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: daniel.almeida@collabora.com, faith.ekstrand@collabora.com, boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v7 09/26] rust: alloc: implement kernel `Box`
Message-ID: <49531204-b320-4652-90d5-d070a67260d2@proton.me>
In-Reply-To: <20240911225449.152928-10-dakr@kernel.org>
References: <20240911225449.152928-1-dakr@kernel.org> <20240911225449.152928-10-dakr@kernel.org>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 7a78d9617d9c55fc053ae27092fce77109763177
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12.09.24 00:52, Danilo Krummrich wrote:
> `Box` provides the simplest way to allocate memory for a generic type
> with one of the kernel's allocators, e.g. `Kmalloc`, `Vmalloc` or
> `KVmalloc`.
>=20
> In contrast to Rust's `Box` type, the kernel `Box` type considers the
> kernel's GFP flags for all appropriate functions, always reports
> allocation failures through `Result<_, AllocError>` and remains
> independent from unstable features.
>=20
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/alloc.rs      |   6 +
>  rust/kernel/alloc/kbox.rs | 465 ++++++++++++++++++++++++++++++++++++++
>  rust/kernel/prelude.rs    |   2 +-
>  3 files changed, 472 insertions(+), 1 deletion(-)
>  create mode 100644 rust/kernel/alloc/kbox.rs

I have two nits below. I think the safety documentation can be improved
later, when we have decided on a better approach (I have to to spend a
significant amount of time coming up with a suggestion and even then I
am not satisfied with it). So

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

> +impl<T, A> Box<T, A>
> +where
> +    T: ?Sized,
> +    A: Allocator,
> +{
> +    /// Creates a new `Box<T, A>` from a raw pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// For non-ZSTs, `raw` must point at an allocation allocated with `=
A`that is sufficiently

Missing space after "with `A`".

> +    /// aligned for and holds a valid `T`. The caller passes ownership o=
f the allocation to the
> +    /// `Box`.
> +    ///
> +    /// For ZSTs, `raw` must be a dangling, well aligned pointer.
> +    #[inline]
> +    pub const unsafe fn from_raw(raw: *mut T) -> Self {
> +        // INVARIANT: Validity of `raw` is guaranteed by the safety prec=
onditions of this function.
> +        // SAFETY: By the safety preconditions of this function, `raw` i=
s not a NULL pointer.
> +        Self(unsafe { NonNull::new_unchecked(raw) }, PhantomData::<A>)
> +    }
> +
> +    /// Consumes the `Box<T, A>` and returns a raw pointer.
> +    ///
> +    /// This will not run the destructor of `T` and for non-ZSTs the all=
ocation will stay alive
> +    /// indefinitely. Use [`Box::from_raw`] to recover the [`Box`], drop=
 the value and free the
> +    /// allocation, if any.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// let x =3D KBox::new(24, GFP_KERNEL)?;
> +    /// let ptr =3D KBox::into_raw(x);
> +    /// let x =3D unsafe { KBox::from_raw(ptr) };
> +    ///
> +    /// assert_eq!(*x, 24);
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    pub fn into_raw(b: Self) -> *mut T {
> +        let b =3D ManuallyDrop::new(b);
> +
> +        b.0.as_ptr()

Why not a single line `ManuallyDrop::new().0.as_ptr()`?

> +    }
> +
> +    /// Consumes and leaks the `Box<T, A>` and returns a mutable referen=
ce.
> +    ///
> +    /// See [Box::into_raw] for more details.
> +    #[inline]
> +    pub fn leak<'a>(b: Self) -> &'a mut T {
> +        // SAFETY: `Box::into_raw` always returns a properly aligned and=
 dereferenceable pointer
> +        // which points to an initialized instance of `T`.
> +        unsafe { &mut *Box::into_raw(b) }
> +    }
> +}

