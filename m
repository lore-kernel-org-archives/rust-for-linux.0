Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E473126C7;
	Wed,  3 Dec 2025 17:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764782640; cv=pass; b=fE1b7Q7xGjtXvAM/eKnmyS0qhSQNTQKcam0tez26uwYoEy405ZWUMg63m/mfhTXhYEJn2Ixe9ZD6E6v+MsbxOvNyhV21bFomb2gFpfEKo39XIdGdGKV7i24YKmhO8e5mTu8Kd5b18lp+g22Au+8DPkkaaM37LgdkTLkfLkVt92g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764782640; c=relaxed/simple;
	bh=OpdvYxvoR3/VKaYbR4P482IlHLQLg6usz1craGGKhWI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=AtKSZ5rtq4KQvUj1w3l+7OkmdGcqAagSoLwhAIm+D0GqzosNJZNPIKKUh+4rzqJHewcyRfheDLluRktaRXWfg1cEeGxPRPWeuxcfuDlSoxhSNO+O6z36YgeeH6ZCknHcAajf8+poBICSdYLvYPrCatgE3r7RTim8quRcRaacYgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=dEVD6PAM; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="dEVD6PAM"
ARC-Seal: i=1; a=rsa-sha256; t=1764782611; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZBrDAq+vdhM137k+PWJXHkbdRMSMJQE8Ns5c+WCktU/9mj1ib0KLvDkOj4l4OquspoHFp2b+a1BbHekDV98d7pvK4QbFtKn63iJRe46I1M03EIUgJd2BXUL0fVS8kZ4x8bAVLwJPqBnXM9eDt3BvW1h+4P7MIF+mUvjjiAMiACY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764782611; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=70QijrvT8WTPNx9/aZ0I9hfYEfArN84KUevuAt/78/U=; 
	b=PY+FiSj7Iwb+wWMN4+CRJK3+Ilu+KPVtqMyHeEjOSUISoO26Fij63j/lMv8tDKE2/aQdjbVVEw/tpXm7LGJ14lBWWxXpcNzDwUsFuPFQQ+0R7dO0QNNKwyr32KMFbm7LCMYod2PuSzFWgz2UkaFvcgDuQXUlp/2QOyZXRdaOdEU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764782611;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=70QijrvT8WTPNx9/aZ0I9hfYEfArN84KUevuAt/78/U=;
	b=dEVD6PAMCt0qkgCcnU6viAwT6v/YU1ZIITMLwecTwXl0uaECO324jy/ck95D9XPN
	PT9eu2GVhQe0zDolzpkl/aK5I040fd3cRQ2AI0VyXX3F+KvUaqh6U8zpG4n/8W6T9Pr
	el9qyfLSbKnb7pffSfUZD9+3+1xtkrHBsLcYm88M=
Received: by mx.zohomail.com with SMTPS id 1764782609629680.0176327322816;
	Wed, 3 Dec 2025 09:23:29 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v8 5/6] rust: ww_mutex: add Mutex, AcquireCtx and
 MutexGuard
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aTA6f8gK60h6qaHs@google.com>
Date: Wed, 3 Dec 2025 14:23:14 -0300
Cc: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 rust-for-linux@vger.kernel.org,
 lossin@kernel.org,
 lyude@redhat.com,
 ojeda@kernel.org,
 alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 a.hindborg@kernel.org,
 tmgross@umich.edu,
 dakr@kernel.org,
 peterz@infradead.org,
 mingo@redhat.com,
 will@kernel.org,
 longman@redhat.com,
 felipe_life@live.com,
 daniel@sedlak.dev,
 thomas.hellstrom@linux.intel.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <86E0C8EE-393D-4C6A-9C28-BB036A1FFAD6@collabora.com>
References: <20251201102855.4413-1-work@onurozkan.dev>
 <20251201102855.4413-6-work@onurozkan.dev> <aTA6f8gK60h6qaHs@google.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 3 Dec 2025, at 10:26, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> On Mon, Dec 01, 2025 at 01:28:54PM +0300, Onur =C3=96zkan wrote:
>> Covers the entire low-level locking API (lock, try_lock,
>> slow path, interruptible variants) and integration with
>> kernel bindings.
>>=20
>> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
>=20
>> +impl<'class> Mutex<'class, ()> {
>> +    /// Creates a [`Mutex`] from a raw pointer.
>> +    ///
>> +    /// This function is intended for interoperability with C code.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// The caller must ensure that `ptr` is a valid pointer to a =
`ww_mutex`
>> +    /// and that it remains valid for the lifetime `'a`.
>> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::ww_mutex) -> &'a =
Self {
>=20
> Should also require that the class is valid for the duration of =
'class.
>=20
>> +/// Internal helper that unifies the different locking kinds.
>> +///
>> +/// Returns [`EINVAL`] if the [`Mutex`] has a different [`Class`].
>> +fn lock_common<'a, T: ?Sized>(
>> +    mutex: &'a Mutex<'a, T>,
>> +    ctx: Option<&AcquireCtx<'_>>,
>> +    kind: LockKind,
>> +) -> Result<MutexGuard<'a, T>> {
>> +    let mutex_ptr =3D mutex.inner.get();
>> +
>> +    let ctx_ptr =3D match ctx {
>> +        Some(acquire_ctx) =3D> {
>> +            let ctx_ptr =3D acquire_ctx.inner.get();
>> +
>> +            // SAFETY: `ctx_ptr` is a valid pointer for the entire
>> +            // lifetime of `ctx`.
>> +            let ctx_class =3D unsafe { (*ctx_ptr).ww_class };
>> +
>> +            // SAFETY: `mutex_ptr` is a valid pointer for the entire
>> +            // lifetime of `mutex`.
>> +            let mutex_class =3D unsafe { (*mutex_ptr).ww_class };
>> +
>> +            // `ctx` and `mutex` must use the same class.
>> +            if ctx_class !=3D mutex_class {
>> +                return Err(EINVAL);
>> +            }
>=20
> Hmm, this originates from the previous conversation:
>=20
> https://lore.kernel.org/all/20251124184928.30b8bbaf@nimda/
>>>> +    ///         // SAFETY: Both `lock_set` and `mutex1` uses the
>>>> same class.
>>>> +    ///         unsafe { lock_set.lock(&mutex1)? };
>>>> +    ///
>>>> +    ///         // SAFETY: Both `lock_set` and `mutex2` uses the
>>>> same class.
>>>> +    ///         unsafe { lock_set.lock(&mutex2)? };
>>>=20
>>> I wonder if there's some way we can get rid of the safety contract
>>> here and verify this at compile time, it would be a shame if every
>>> single lock invocation needed to be unsafe.
>>>=20
>>=20
>> Yeah :(. We could get rid of them easily by keeping the class that =
was
>> passed to the constructor functions but that becomes a problem for =
the
>> from_raw implementations.
>>=20
>> I think the best solution would be to expose ww_class type from
>> ww_acquire_ctx and ww_mutex unconditionally (right now it depends on
>> DEBUG_WW_MUTEXES). That way we can just access the class and verify
>> that the mutex and acquire_ctx classes match.
>>=20
>> What do you think? I can submit a patch for the C-side =
implementation.
>> It should be straightforward and shouldn't have any runtime impact.
>=20
> I think there is a better solution. We can create a different type for
> every single class, like how rust/kernel/sync/lock/global.rs creates a
> different type for every single mutex. Then, you know that the classes
> are the same since the class is part of the type.

I don=E2=80=99t think this would work with the from_raw() functions. =
What class
would you assign then? I think this is precisely what sparked the =
current
solution.

>=20
> Alice

