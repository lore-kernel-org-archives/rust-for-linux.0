Received: from forward501a.mail.yandex.net (forward501a.mail.yandex.net [178.154.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA9534D4E3;
	Wed,  3 Dec 2025 16:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764777768; cv=none; b=VkfVvC1kDWwVZCymq+aW5qW0Rte76X4EzySRIYdni+xakIb4xuTW8YW0HkDLdKePBmB9datY4L5F9eQF7h2AZJsxy2xTFv1IzEOTqD3dVNACQ/X5IsG8nlbEzie1qUmqoIHMk3a6B0nkrW9+RPE9OoKANRi4DDZwY1V1LDIUdK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764777768; c=relaxed/simple;
	bh=G3bRxozGPoLSCROfwLB9M6Ky/i0JWHBAXl5moW9JC+U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SwJnYno+X5Y1Ac1qGVuuuA0XN2HrorHAdtVla3XP5xrHop8O3JhMHb8m8v35Qk1HXpwcC8kqqnNPkpObZ6+hg9wNREHpwJZXlXIJDziQIbh/zf2Nsa75t6Kdf9eimPmWaUBm1stIfugfjnSQg5i6wyJgDw0Ivgp5bXMeHay8VoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=jrbDKcfM; arc=none smtp.client-ip=178.154.239.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="jrbDKcfM"
Received: from mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:340d:0:640:ad51:0])
	by forward501a.mail.yandex.net (Yandex) with ESMTPS id A9F95815E4;
	Wed, 03 Dec 2025 19:02:37 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id W2neZJ0LPSw0-O7OEE7km;
	Wed, 03 Dec 2025 19:02:36 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1764777756;
	bh=yjK59fd+OyDs7uD5fxaRCR/+R4j9Muzk3j1CzHLom04=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=jrbDKcfMGMQSMcNnYdWiM/RrRyqLLEZHlmCME0lIQ/sKQfkWfH8JZMv7DteaG+bjT
	 L3ExSXQMJh6MiL78xK1TTK1Qu3AIWfi9lyCKszHohqckvA8Hv+wklPPa7kO3LUgHvj
	 Y/OawVpZcuWf3jE/reIR0pxguwZvko+eGd6kLEaA=
Authentication-Results: mail-nwsmtp-smtp-production-main-95.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Wed, 3 Dec 2025 19:02:30 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, lossin@kernel.org, lyude@redhat.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, a.hindborg@kernel.org, tmgross@umich.edu,
 dakr@kernel.org, peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 longman@redhat.com, felipe_life@live.com, daniel@sedlak.dev,
 daniel.almeida@collabora.com, thomas.hellstrom@linux.intel.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/6] rust: ww_mutex: add Mutex, AcquireCtx and
 MutexGuard
Message-ID: <20251203190230.077abd3c@nimda>
In-Reply-To: <aTA6f8gK60h6qaHs@google.com>
References: <20251201102855.4413-1-work@onurozkan.dev>
	<20251201102855.4413-6-work@onurozkan.dev>
	<aTA6f8gK60h6qaHs@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 3 Dec 2025 13:26:23 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Mon, Dec 01, 2025 at 01:28:54PM +0300, Onur =C3=96zkan wrote:
> > Covers the entire low-level locking API (lock, try_lock,
> > slow path, interruptible variants) and integration with
> > kernel bindings.
> >=20
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
>=20
> > +impl<'class> Mutex<'class, ()> {
> > +    /// Creates a [`Mutex`] from a raw pointer.
> > +    ///
> > +    /// This function is intended for interoperability with C code.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The caller must ensure that `ptr` is a valid pointer to a
> > `ww_mutex`
> > +    /// and that it remains valid for the lifetime `'a`.
> > +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::ww_mutex) ->
> > &'a Self {
>=20
> Should also require that the class is valid for the duration of
> 'class.
>=20
> > +/// Internal helper that unifies the different locking kinds.
> > +///
> > +/// Returns [`EINVAL`] if the [`Mutex`] has a different [`Class`].
> > +fn lock_common<'a, T: ?Sized>(
> > +    mutex: &'a Mutex<'a, T>,
> > +    ctx: Option<&AcquireCtx<'_>>,
> > +    kind: LockKind,
> > +) -> Result<MutexGuard<'a, T>> {
> > +    let mutex_ptr =3D mutex.inner.get();
> > +
> > +    let ctx_ptr =3D match ctx {
> > +        Some(acquire_ctx) =3D> {
> > +            let ctx_ptr =3D acquire_ctx.inner.get();
> > +
> > +            // SAFETY: `ctx_ptr` is a valid pointer for the entire
> > +            // lifetime of `ctx`.
> > +            let ctx_class =3D unsafe { (*ctx_ptr).ww_class };
> > +
> > +            // SAFETY: `mutex_ptr` is a valid pointer for the
> > entire
> > +            // lifetime of `mutex`.
> > +            let mutex_class =3D unsafe { (*mutex_ptr).ww_class };
> > +
> > +            // `ctx` and `mutex` must use the same class.
> > +            if ctx_class !=3D mutex_class {
> > +                return Err(EINVAL);
> > +            }
>=20
> Hmm, this originates from the previous conversation:
>=20
> https://lore.kernel.org/all/20251124184928.30b8bbaf@nimda/
> >>> +    ///         // SAFETY: Both `lock_set` and `mutex1` uses the
> >>> same class.
> >>> +    ///         unsafe { lock_set.lock(&mutex1)? };
> >>> +    ///
> >>> +    ///         // SAFETY: Both `lock_set` and `mutex2` uses the
> >>> same class.
> >>> +    ///         unsafe { lock_set.lock(&mutex2)? };
> >>=20
> >> I wonder if there's some way we can get rid of the safety contract
> >> here and verify this at compile time, it would be a shame if every
> >> single lock invocation needed to be unsafe.
> >>=20
> >=20
> > Yeah :(. We could get rid of them easily by keeping the class that
> > was passed to the constructor functions but that becomes a problem
> > for the from_raw implementations.
> >=20
> > I think the best solution would be to expose ww_class type from
> > ww_acquire_ctx and ww_mutex unconditionally (right now it depends on
> > DEBUG_WW_MUTEXES). That way we can just access the class and verify
> > that the mutex and acquire_ctx classes match.
> >=20
> > What do you think? I can submit a patch for the C-side
> > implementation. It should be straightforward and shouldn't have any
> > runtime impact.
>=20
> I think there is a better solution. We can create a different type for
> every single class, like how rust/kernel/sync/lock/global.rs creates a
> different type for every single mutex. Then, you know that the classes
> are the same since the class is part of the type.
>=20
> Alice

You can have same types but different memory addresses and that would
break the ww_mutex logic we are trying to solve.

-Onur
