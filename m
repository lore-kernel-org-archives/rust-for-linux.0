Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B64D230D1E
	for <rust-for-linux@vger.kernel.org>; Fri,  2 May 2025 11:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746184335; cv=none; b=t+U+vRrqg+4t52dFaNoTzQKYk2lUKZecPeVBW96TjlJo+OLQMXw95OI2YL4knuaNTFXiXirQoLT0bGJRU9ReeEU2iUEKgyDs6FFTBbrSZQGYIyhygZCC+uStvg536vPGj58UyhYwpKfdJGEr1rTbFEBRsliIAgRy4mAsKCTtPLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746184335; c=relaxed/simple;
	bh=CfOQILRrI2oOpfR8BBk2bJsADb5RlDrgVjWRzEAU4SE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xnn7B0Eg77q3tTqu57NMh0GqwPeiYYzls7XHGeWTfWss1sV8EBAp6sXu28nNZw8RCU/vtyFSHdRSxWautG87psr693CKgchJRiTNQmg4ug6TG3ARm+mLlv4dFc86X7UH25a7mg5/xC5N32ZcNIYnFAjiPfkE4FMFlI9Bu/QWF34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=lWgDRGAY; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="lWgDRGAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1746184331; x=1746443531;
	bh=xRovayJYx3DtpzagwTmA/2L4kuh33mTIVzdNmHqy2Ro=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=lWgDRGAY6FfVEr3lCeLwc3j9jijXccPqX7uGSwKQ5S+cR8iFvZ3FKMlSqCGUMth4d
	 O3lMTH3sBRUJRi2M5RAEHHrtQS0VxtcN3e5KI2tJH7SDEaJGIx5MP0sYsmrVBg8ajz
	 dTCDJRU/M/19ru+JCswb3OIa0o8OPf1q+tZIBW9146lcp9oqx3PUuZnnSBWXYpKOWI
	 Gw60ustEeVyich43wgfwh09Yd84LbMpXeH8GDm23IIxdvIW0p6K4VEHYKbN2DDQ0P0
	 RZLleXPCrZN99zgASEy8mx4vopqjLgSEje7CV61v3Z4OefvhM14q4UxWtId3GeCC3j
	 5JrFmFO6sCk3A==
Date: Fri, 02 May 2025 11:12:05 +0000
To: Andreas Hindborg <a.hindborg@kernel.org>
From: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 3/5] rust: Add missing SAFETY documentation for ARef example
Message-ID: <aBSofsTTbt4pgsDU@mango>
In-Reply-To: <87ikmjz45e.fsf@kernel.org>
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me> <ih3kqi48IA3vGKmMFL796yktZHuDzsSsrSz1KA_EIHnhlZaeKRQ2dK0FtgmzWTeVNoy9iVs9rNPjAp-ozQO3Xw==@protonmail.internalid> <20250502-unique-ref-v10-3-25de64c0307f@pm.me> <87ikmjz45e.fsf@kernel.org>
Feedback-ID: 31808448:user:proton
X-Pm-Message-ID: 038d256563889b47a1222ea27d8e05b406ef8404
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 250502 1241, Andreas Hindborg wrote:
> >
> > diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> > index d7fa8934c545f46a646ca900ab8957a04b0ad34d..33d2b4e4a87b991c6d934f4=
e8d2c6c71a15b1bcb 100644
> > --- a/rust/kernel/types.rs
> > +++ b/rust/kernel/types.rs
> > @@ -498,7 +498,9 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
> >      ///
> >      /// struct Empty {}
> >      ///
> > -    /// # // SAFETY: TODO.
> > +    /// // SAFETY: The `RefCounted` implementation for `Empty` does no=
t count references
> > +    /// // and never frees the underlying object. Thus we can act as h=
aving a
> > +    /// // refcount on the object that we pass to the newly created `A=
Ref`.
> >      /// unsafe impl RefCounted for Empty {
> >      ///     fn inc_ref(&self) {}
> >      ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
> > @@ -506,7 +508,7 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
> >      ///
> >      /// let mut data =3D Empty {};
> >      /// let ptr =3D NonNull::<Empty>::new(&mut data).unwrap();
> > -    /// # // SAFETY: TODO.
> > +    /// // SAFETY: We keep `data` around longer than the `ARef`.
>=20
> I still think this applies:
>=20
> >> How about:
> >>
> >>   The `RefCounted` implementation for `Empty` does not count reference=
s
> >>   and never frees the underlying object. Thus we can act as having a
> >>   refcount on the object that we pass to the newly created `ARef`.
> >>

Hi Andreas,

I agree. Sorry, I just messed up the fix. Your wording landed in the
previous to-be-fixed unsafe comment, as you can see.

Happens when you are too much in a hurry and didn't touch the patch for
too long :/

I will fix it in the next version.

Best,

Oliver

