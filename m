Received: from forward502a.mail.yandex.net (forward502a.mail.yandex.net [178.154.239.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A7C2D3EDF;
	Tue, 25 Nov 2025 18:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764097178; cv=none; b=GRNsaRnukYgpX5GAdEQooccEYAw4BT7wI50oAhCO9kk8zDuGZmJecA4A+GXM9/9GGKqrUp3rca8ITCDUlNN802vxJgwWJHMbGPpWeirDgIkemZluFw7L7QRz4K4yqNNFpSM5hHMVg6DYWUhw6fswMjybOXP0zOdBCck7iLW/sWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764097178; c=relaxed/simple;
	bh=QBaR/8DJxbXOD9tjXXucDcto8a2Eo10JGSgojA9IDZc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dz8EU5sKb4FxmxhO6kGdQEID4PJ4S7NPsTBgpjv2EX1s9d2/fxz+gVJJfYfFC3ISuvVQ+TMvffDRzNXdzVhq2xPYZvgUjzbvh08cXUeqx0f7WYcoyvDjp90Y5GuxGnHtnW8inCwNc5gF2W03Qsbmve8VwWq9PrEHZ57ul5wPMYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=TdBP8ScC; arc=none smtp.client-ip=178.154.239.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="TdBP8ScC"
Received: from mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:1c1a:0:640:aab7:0])
	by forward502a.mail.yandex.net (Yandex) with ESMTPS id 3C54188B19;
	Tue, 25 Nov 2025 21:59:26 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id LxhZmR7LsW20-be9Y1kzY;
	Tue, 25 Nov 2025 21:59:25 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1764097165;
	bh=Y5Vxw0NRlJ5S+iHFHi520HdmN39Oe0NNeMzqNt/GxKM=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=TdBP8ScCEpm/J7U8t7qEYNzz7AbeNTP9Ia7sY3DP8HN2eukfiCehRy2X4IYZDxJfK
	 kOxyLev+WVYpoH+0gE+3NQT4lDY/gnJAqf3ZUMpV2yYHXuMf6yAdMyY9uzPowEEGWV
	 TaUpKlICthUbRnuS3mHRzOJgv/6BlLVSkT/xFfT8=
Authentication-Results: mail-nwsmtp-smtp-production-main-84.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Tue, 25 Nov 2025 21:59:19 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org, lossin@kernel.org, lyude@redhat.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, longman@redhat.com, felipe_life@live.com,
 daniel@sedlak.dev, bjorn3_gh@protonmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] rust: ww_mutex: add Mutex, AcquireCtx and
 MutexGuard
Message-ID: <20251125215919.6af03a2e@nimda.home>
In-Reply-To: <A3A21F48-4F9A-46CD-9CC8-80A55B32CDE2@collabora.com>
References: <20251101161056.22408-1-work@onurozkan.dev>
	<20251101161056.22408-5-work@onurozkan.dev>
	<A3A21F48-4F9A-46CD-9CC8-80A55B32CDE2@collabora.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Nov 2025 15:32:08 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:


[...]
> > +    /// Similar to `lock`, but can be interrupted by signals.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The given `mutex` must be created with the [`Class`] that
> > was used
> > +    /// to initialize this [`AcquireCtx`].
> > +    pub unsafe fn lock_interruptible<'a, T>(
> > +        &'a self,
> > +        mutex: &'a Mutex<'a, T>,
> > +    ) -> Result<MutexGuard<'a, T>> {
> > +        // SAFETY: By the safety contract, `mutex` belongs to the
> > same `Class`
> > +        // as `self` does.
> > +        unsafe { lock_common(mutex, Some(self),
> > LockKind::Interruptible) }
> > +    }
> > +
> > +    /// Locks the given mutex on this [`AcquireCtx`] using the
> > slow path.
> > +    ///
> > +    /// This function should be used when `lock` fails (typically
> > due to a potential deadlock).
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The given `mutex` must be created with the [`Class`] that
> > was used
> > +    /// to initialize this [`AcquireCtx`].
>=20
> I=E2=80=99m assuming we either can=E2=80=99t or otherwise don=E2=80=99t w=
ant to store this in
> the Mutex itself?
>=20
> IOW: the class is =E2=80=99static IIUC, so it=E2=80=99s always safe to st=
ore a
> reference anyways, at the cost of providing the storage.
>=20

We used to do this but I had to revert them when I implemented
`from_raw` functions. I wrote about it on [1], let me know what you
think about the solution idea I wrote there.

[1]: https://lore.kernel.org/all/20251124184928.30b8bbaf@nimda/

> > +    pub unsafe fn lock_slow<'a, T>(&'a self, mutex: &'a Mutex<'a,
> > T>) -> Result<MutexGuard<'a, T>> {
> > +        // SAFETY: By the safety contract, `mutex` belongs to the
> > same `Class`
> > +        // as `self` does.
> > +        unsafe { lock_common(mutex, Some(self), LockKind::Slow) }
> > +    }
> > +
> > +    /// Similar to `lock_slow`, but can be interrupted by signals.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The given `mutex` must be created with the [`Class`] that
> > was used
> > +    /// to initialize this [`AcquireCtx`].
> > +    pub unsafe fn lock_slow_interruptible<'a, T>(
> > +        &'a self,
> > +        mutex: &'a Mutex<'a, T>,
> > +    ) -> Result<MutexGuard<'a, T>> {
> > +        // SAFETY: By the safety contract, `mutex` belongs to the
> > same `Class`
> > +        // as `self` does.
> > +        unsafe { lock_common(mutex, Some(self),
> > LockKind::SlowInterruptible) }
> > +    }
> > +
> > +    /// Tries to lock the mutex on this [`AcquireCtx`] without
> > blocking.
> > +    ///
> > +    /// Unlike `lock`, no deadlock handling is performed.
>=20
> You can use [`lock`] here for better docs.
>=20

I will update it as [`Self::lock`] ([`lock`] will not work). There are
some other lines where I need to do the same thing.

> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The given `mutex` must be created with the [`Class`] that
[...]

BR,
Onur
