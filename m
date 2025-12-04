Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DEC32BF32
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 09:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764839310; cv=none; b=RkEeyaYIVjzp3JSZ47LC94YAYX1l/qyBcpeQLzC/86el3jx5MoYg4canzUGDpUesgSxfwQcBn9da4prGttBAu7uIFkzVtrlqij6UkDQhY/FlkUXHb4bL90mVM6Tzv/YGFryj+w4nQQ6LXE6i2h15n0+2klRD5Xf5ih/aHgnww2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764839310; c=relaxed/simple;
	bh=YnaJwWU/ZxLLAev1cHPU9wfhzCZzd7MzUUrcnbPfpW4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f86A/DznoIgv920SYXhpWjWwypBReU+OR/Irg3jM3XxK4+9JoJKrhJVvLexV+5ew6P+ItqQJTG+Nm5qa5Uyog2C2J8zAZkufJix5QK/kby2gfpsYfyQrD1z8I8lThrx5E7+VW6vt3gTYOKIZin+6e/+q5te60OW4r9SWyW/a7Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XC1YwVSA; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XC1YwVSA"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4792bd2c290so5071995e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Dec 2025 01:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764839307; x=1765444107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Dnym+CFcSceIQ7sufuKH8tvzQGNWVGbkMkojadwSA4=;
        b=XC1YwVSARs+n8KSo0usnqFFCCN54X0CC1IC+e8fDemwQrgikhwEwW4ddCfDiBhH69H
         a6Bm1oMJ0ReF871XcV/Z64+004FevAhkbOilOIoVdylc/mK3C2SV8vDHR8Xj0UurHrry
         4i3YDJkZJkwN34V3SZIifbABWWP2krqvSv3tLEJ6WOhCPlpN6jD1APnWOxsZOT3EBJ+w
         7tnFSFOCO1ywWApjfL0rwUgq5MGXI5oAw1F3UsPhpiGBbaWSsdo3hmHDowgmvRZxBeio
         +xCggMnlQA6UVff/iBamqfzCfgU/T8E6ub0g7SxvwBGOsmx8fXqynbENforhdV8HAah1
         RzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764839307; x=1765444107;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2Dnym+CFcSceIQ7sufuKH8tvzQGNWVGbkMkojadwSA4=;
        b=LrynO1osJdP5IrIfuxJXxL+QoW6vkP5vDlyqSQ062W9v1owvnXMRnDNsdF6DWZN0KJ
         vvipUJPH6sutFw3K8VXVzYf2037C3y7N2nsgc+XI+r1mzQNp0aEJFoR2McXdlNvzGKOl
         ekjlLemFu9k/M0Dv7QJIOSVL9NqmbW75/Z/LoXBtgPxqMlibbLdTHZy1u3/NXZai0M3E
         VE8m6J3agZWv2cuE02xOJl9Pi2qJmHnmJW4XEEODncp6FfvM8a5vNcMDOpLuOESvZxqT
         scD6IAEj8zOZiXUk1++woGNx3l9vx/o+OVaKH2y8iFLNrcGtI6JJacnHjh2cQwqYPIkJ
         03zA==
X-Gm-Message-State: AOJu0YxJKTneN9Yp+whBPKX3BP49eK/ShpGsnkeMXQ1qsam2FSj7iOWD
	RMBkLc40YRl5vNYPfQwuG/glFqjlxWBeJPVFVQ+TAWDH0vfSPtd4UX4FGlrZCioUPbnyV73ercn
	sGTVk6QLJ410ccV6IIg==
X-Google-Smtp-Source: AGHT+IE5uaC7s3WywI79YkywM+nFmbT5/k2N8sKPMVC/iz8RKQN47QTnktHLcqmgCFjkWHQtSgqCpbDNMq9IZtQ=
X-Received: from wmot7.prod.google.com ([2002:a05:600c:4507:b0:477:5c67:ee03])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b16:b0:477:abea:901c with SMTP id 5b1f17b1804b1-4792aeeb5bemr52933925e9.11.1764839307089;
 Thu, 04 Dec 2025 01:08:27 -0800 (PST)
Date: Thu, 4 Dec 2025 09:08:25 +0000
In-Reply-To: <20251203190230.077abd3c@nimda>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251201102855.4413-1-work@onurozkan.dev> <20251201102855.4413-6-work@onurozkan.dev>
 <aTA6f8gK60h6qaHs@google.com> <20251203190230.077abd3c@nimda>
Message-ID: <aTFPiTOIVmwGGEp-@google.com>
Subject: Re: [PATCH v8 5/6] rust: ww_mutex: add Mutex, AcquireCtx and MutexGuard
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	peterz@infradead.org, mingo@redhat.com, will@kernel.org, longman@redhat.com, 
	felipe_life@live.com, daniel@sedlak.dev, daniel.almeida@collabora.com, 
	thomas.hellstrom@linux.intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2025 at 07:02:30PM +0300, Onur =C3=96zkan wrote:
> On Wed, 3 Dec 2025 13:26:23 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> > On Mon, Dec 01, 2025 at 01:28:54PM +0300, Onur =C3=96zkan wrote:
> > > +/// Internal helper that unifies the different locking kinds.
> > > +///
> > > +/// Returns [`EINVAL`] if the [`Mutex`] has a different [`Class`].
> > > +fn lock_common<'a, T: ?Sized>(
> > > +    mutex: &'a Mutex<'a, T>,
> > > +    ctx: Option<&AcquireCtx<'_>>,
> > > +    kind: LockKind,
> > > +) -> Result<MutexGuard<'a, T>> {
> > > +    let mutex_ptr =3D mutex.inner.get();
> > > +
> > > +    let ctx_ptr =3D match ctx {
> > > +        Some(acquire_ctx) =3D> {
> > > +            let ctx_ptr =3D acquire_ctx.inner.get();
> > > +
> > > +            // SAFETY: `ctx_ptr` is a valid pointer for the entire
> > > +            // lifetime of `ctx`.
> > > +            let ctx_class =3D unsafe { (*ctx_ptr).ww_class };
> > > +
> > > +            // SAFETY: `mutex_ptr` is a valid pointer for the
> > > entire
> > > +            // lifetime of `mutex`.
> > > +            let mutex_class =3D unsafe { (*mutex_ptr).ww_class };
> > > +
> > > +            // `ctx` and `mutex` must use the same class.
> > > +            if ctx_class !=3D mutex_class {
> > > +                return Err(EINVAL);
> > > +            }
> >=20
> > Hmm, this originates from the previous conversation:
> >=20
> > https://lore.kernel.org/all/20251124184928.30b8bbaf@nimda/
> > >>> +    ///         // SAFETY: Both `lock_set` and `mutex1` uses the
> > >>> same class.
> > >>> +    ///         unsafe { lock_set.lock(&mutex1)? };
> > >>> +    ///
> > >>> +    ///         // SAFETY: Both `lock_set` and `mutex2` uses the
> > >>> same class.
> > >>> +    ///         unsafe { lock_set.lock(&mutex2)? };
> > >>=20
> > >> I wonder if there's some way we can get rid of the safety contract
> > >> here and verify this at compile time, it would be a shame if every
> > >> single lock invocation needed to be unsafe.
> > >>=20
> > >=20
> > > Yeah :(. We could get rid of them easily by keeping the class that
> > > was passed to the constructor functions but that becomes a problem
> > > for the from_raw implementations.
> > >=20
> > > I think the best solution would be to expose ww_class type from
> > > ww_acquire_ctx and ww_mutex unconditionally (right now it depends on
> > > DEBUG_WW_MUTEXES). That way we can just access the class and verify
> > > that the mutex and acquire_ctx classes match.
> > >=20
> > > What do you think? I can submit a patch for the C-side
> > > implementation. It should be straightforward and shouldn't have any
> > > runtime impact.
> >=20
> > I think there is a better solution. We can create a different type for
> > every single class, like how rust/kernel/sync/lock/global.rs creates a
> > different type for every single mutex. Then, you know that the classes
> > are the same since the class is part of the type.
>=20
> You can have same types but different memory addresses and that would
> break the ww_mutex logic we are trying to solve.

The entire idea behind rust/kernel/sync/lock/global.rs is one type per
memory address. Can you elaborate on the difficult case?

Alice
