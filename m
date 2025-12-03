Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11002E265A
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Dec 2025 13:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764768387; cv=none; b=pWbNo2Xjltf+NsrVDcy0S5qBJWIEvWfGTD0wXHeXX/rAA4IR3i9GV7/xkWNI3MSYZpScD5iUdaykJDXu1VhIS3a+86q5eP6k8TEplPlmcA5hfwg+2ENRe6RS0QLheVlRpGxeeJJgMOmDDZBqCTtrL0q9gLBI8sCsE/2VxKUh5uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764768387; c=relaxed/simple;
	bh=MT508+pRJsZzqErlw8sBmr27IiNVJtRfMIrxRNeh/nY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aKGXRFb3gwaecTHjsw67dSv4zUrUv8ntyERr5go2f0bRW6GOUO9pg7lF/EGIzx/QExAhxjnHr2KF/8EeH+n+qLphiM3TYzougXBvV7f9Ejuk2BJnnXkKnhU3eR/2IqIFB/kq7yhjfBdAH5TXsXl38IbcZ6v/RsFiMHOp8+kIf+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VBLQVyl+; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VBLQVyl+"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b735efd650fso873796966b.0
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Dec 2025 05:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764768384; x=1765373184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NngQCEhP7AfIrKRDUqxLMUsn5E4g5RqryUyExV4C4nQ=;
        b=VBLQVyl+61tqmoDbqJNhUBtF1Lxnn+1GCjHUKSGrHnj2HxeI5d5eV2ltXXcA+o4gBK
         bQP3NczUTlG5phcLNXY+UPV/K0aQ2eNvekQS4DQVx3qPKvuY7fNqLx2aO035U60YW+06
         +5BdGM1oNDQubNoUGfbXP74bnH749mOeTd0j5YvNqYLf26PQmxtv14YaUDXQ1ywFUFcE
         3KKfx06D++MRh1J8IUl+SOQ4VSUGyvmfxa/DFR/44vfjzoPkVMooJ33ilKvefhgpzxBF
         6pifa3QwExS5bXSFHvEzYMsXp1S/JX7Qk0sPg7G2W8Pc1m96xV0HhEjbSe21HzO59Sj5
         KzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764768384; x=1765373184;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NngQCEhP7AfIrKRDUqxLMUsn5E4g5RqryUyExV4C4nQ=;
        b=vAUS6jgxZgCI6JIeYnjDjLm9QAx4ZKOmvkFBMezR3c1CnVP7Eb7eQ5l1tlvoOFHQqt
         vttZpsnamuVBGYzta/FU7keqAXRJZ8Qgl87NJsxCevSUWlpuyhTVwltF36l0vshsiXFS
         sBsmhZRLus+5E+2Uep92fG3tit1gWvMsfUZOkbN1qz5xtBxX6ZVbc6sWocihXFcGmb/7
         JrHD1PqyOga2Z4zrH8rZ74uxPzjXS7AWanpUJJp08ZFUogRPkWzoo6yka7NTTnKl2VW9
         62Dt6fKtUCMaxKMhxpDk6LMVsZeGhG7Zc/bQZG3P99GzgeSvubx2M5nqNt0KOBkn7oi+
         g6oQ==
X-Gm-Message-State: AOJu0YyQCRikk2uj9/e10XBH81o39J1mXPYmIx1MJN3A+CkZExvBUoY+
	Nvbtkg1gKMWC452jjMRaZ80NAw8KZIpfTqUnZt0YhXrKK9HNVKyLTUePJqpMIQ1rMS1N2shPPMp
	y2svymFni63xXtMDQYA==
X-Google-Smtp-Source: AGHT+IFU66L4ezF8eRiGtC3PDYfHRJn2cRvxFHJgStRiaKSRsE7ZBhNajpBwUKYy7KCwfqe3lP7GValo/LSXGkk=
X-Received: from ejctl14.prod.google.com ([2002:a17:907:c30e:b0:b73:724e:575e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3f26:b0:b76:2f40:a307 with SMTP id a640c23a62f3a-b79dc782b84mr209158366b.57.1764768384022;
 Wed, 03 Dec 2025 05:26:24 -0800 (PST)
Date: Wed, 3 Dec 2025 13:26:23 +0000
In-Reply-To: <20251201102855.4413-6-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251201102855.4413-1-work@onurozkan.dev> <20251201102855.4413-6-work@onurozkan.dev>
Message-ID: <aTA6f8gK60h6qaHs@google.com>
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

On Mon, Dec 01, 2025 at 01:28:54PM +0300, Onur =C3=96zkan wrote:
> Covers the entire low-level locking API (lock, try_lock,
> slow path, interruptible variants) and integration with
> kernel bindings.
>=20
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

> +impl<'class> Mutex<'class, ()> {
> +    /// Creates a [`Mutex`] from a raw pointer.
> +    ///
> +    /// This function is intended for interoperability with C code.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that `ptr` is a valid pointer to a `ww_mu=
tex`
> +    /// and that it remains valid for the lifetime `'a`.
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::ww_mutex) -> &'a Self=
 {

Should also require that the class is valid for the duration of 'class.

> +/// Internal helper that unifies the different locking kinds.
> +///
> +/// Returns [`EINVAL`] if the [`Mutex`] has a different [`Class`].
> +fn lock_common<'a, T: ?Sized>(
> +    mutex: &'a Mutex<'a, T>,
> +    ctx: Option<&AcquireCtx<'_>>,
> +    kind: LockKind,
> +) -> Result<MutexGuard<'a, T>> {
> +    let mutex_ptr =3D mutex.inner.get();
> +
> +    let ctx_ptr =3D match ctx {
> +        Some(acquire_ctx) =3D> {
> +            let ctx_ptr =3D acquire_ctx.inner.get();
> +
> +            // SAFETY: `ctx_ptr` is a valid pointer for the entire
> +            // lifetime of `ctx`.
> +            let ctx_class =3D unsafe { (*ctx_ptr).ww_class };
> +
> +            // SAFETY: `mutex_ptr` is a valid pointer for the entire
> +            // lifetime of `mutex`.
> +            let mutex_class =3D unsafe { (*mutex_ptr).ww_class };
> +
> +            // `ctx` and `mutex` must use the same class.
> +            if ctx_class !=3D mutex_class {
> +                return Err(EINVAL);
> +            }

Hmm, this originates from the previous conversation:

https://lore.kernel.org/all/20251124184928.30b8bbaf@nimda/
>>> +    ///         // SAFETY: Both `lock_set` and `mutex1` uses the
>>> same class.
>>> +    ///         unsafe { lock_set.lock(&mutex1)? };
>>> +    ///
>>> +    ///         // SAFETY: Both `lock_set` and `mutex2` uses the
>>> same class.
>>> +    ///         unsafe { lock_set.lock(&mutex2)? };
>>=20
>> I wonder if there's some way we can get rid of the safety contract
>> here and verify this at compile time, it would be a shame if every
>> single lock invocation needed to be unsafe.
>>=20
>=20
> Yeah :(. We could get rid of them easily by keeping the class that was
> passed to the constructor functions but that becomes a problem for the
> from_raw implementations.
>=20
> I think the best solution would be to expose ww_class type from
> ww_acquire_ctx and ww_mutex unconditionally (right now it depends on
> DEBUG_WW_MUTEXES). That way we can just access the class and verify
> that the mutex and acquire_ctx classes match.
>=20
> What do you think? I can submit a patch for the C-side implementation.
> It should be straightforward and shouldn't have any runtime impact.

I think there is a better solution. We can create a different type for
every single class, like how rust/kernel/sync/lock/global.rs creates a
different type for every single mutex. Then, you know that the classes
are the same since the class is part of the type.

Alice
