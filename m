Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C520136E
	for <rust-for-linux@vger.kernel.org>; Tue, 27 May 2025 01:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748307747; cv=none; b=RLBEakz7s27CI5sukTNySk+cHA+Qd0TrZou/otYgQve64gyhKSirWVlqJWiyncEr8JXH0oVUoRPXvu35qLpmrqWKwGJtLZLU+kb7WHGsorHfgP0WvWtg326w70YXGsIgylqLs5vNb5NpbsfTK+nV7J3XdsdWUOm1lPNnEm6HIpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748307747; c=relaxed/simple;
	bh=0zeiApF+hMFh7qGgQ7iRGgc4LjMhDlkxLVc4oGtkjUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aOk7lLrTijX8w2/mplxmoh3+gL22FgS+v/E/9mGG7qNZxp3pv5Jh3Qv/FOQG26zR3DoOyg1bUtP6OgmdVfWHVJh9+vP85J1Pp8B8LRaqSfM0M+SeQI6R4l/xLJnLIId9pZ47ozx5GHPhlnJKLq4p7qUpkIOJ+xLf6yUKuYR3g98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfHh2Mnw; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfHh2Mnw"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2cca475546fso1938567fac.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 May 2025 18:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748307745; x=1748912545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzPkwOHwuY5jSZtUaFAgkkFRTbCA4+qYv5OsytzJXDQ=;
        b=VfHh2MnwuYL5dwz3ximpAKss5NHOzpetcNCspD0DY8Mvr3DCVp1KIkuF9om0yndQ+G
         EadGycm8pIeSoIoeEZwpmv0wvooKBBhD70tLO9wQWSEOVDEhAvc6PyYDBCk/h1izRCqx
         4RrBAzKMwqNgyUKOt5AF4EA/12PDLcBllHlzg+ESxWwQrOIn+8MELxHb8i1aB4ZKYu1a
         egrKiap6U9VxwR1+m6OjiSqQI4dzU2DY6CCa2/BS1fZ0cdua6/gz/YCKSc924gCVGUUo
         +SbYqoklDjwEgPlFJ8V6hm8dJyc1RCTLeF2JnXqL3XufwvUqT7nfxBzfcljaM+Kt8EkR
         vqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748307745; x=1748912545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xzPkwOHwuY5jSZtUaFAgkkFRTbCA4+qYv5OsytzJXDQ=;
        b=JlqLejOQnYuLNFXxr3sTrzmrwmtNfQd7sX4R157e0Kdf5tdiodwAVLEKhq/FWGonU9
         oBuqLEVDPrZSZWFPBBvdJtfTPocZVMAE4uWOKNhZuZma9CezJD9oHLGtR38SbstG7bmT
         9yAp+7wCFiWynzEqyKMTs6iaszq9UlAqVzlrG9ymdb5DWsyGYbvQVcpXNN0vN5rM3pD4
         +pfnc1HyhpRjebIEq9wYcpJsutY/ZGEmWi5UsC/18nAPQthHIbpaKSdq0NVe4MZxv6+i
         V3YfyRpo55sVm+HLtox0s9MPONaAm/AEDDaeKeQLiUwTuI+QzGnyxnRcnDdawgqVxpTA
         zWBw==
X-Forwarded-Encrypted: i=1; AJvYcCW/A3JKDoFVQMaQkPOAvA+0EROi44JJZx5vrIgq+ABVNdZAGl+S9+q0ALVeJyOotoTJIrBg/0itmBGHCAL/Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl/AM0/nJlnVfnjHuFbcOU5BYJj+NJF7sfWdZfPxNKkiu7FqV4
	AuciU85ZtvDjCajvzUZ0IrM87BqQzXFsJCZPAHvTQWuQj8lRBlb95RAIq4liJxey+vnovoPs15m
	aOVqHY+i4X390zlEGtIGahAk/rZytII3vrg==
X-Gm-Gg: ASbGncvV+PLxohpVAl2avJUZhz8McQH1/gJheVzuM4Cl9U7eZyALuZmaMKFYyy8UyVX
	Tkio4ICvzZHz6qcfKoikgUpldE+OQThqVC8BkBjQHuefJFNTFj0zdIAUBmP6bS3apL1GAEjoIqr
	YDy/tcQ8z80Bd1b1WUf3MUMsVkXPyEDdrDrgTMuSHe++AIpDi9XOseWYs=
X-Google-Smtp-Source: AGHT+IHq0KaM8W/S/o2CDOIvcVUww39MyDMtgJhPWdOSp9phOrNY0aMc+4g5G60TIXdcw/QDZQ+uH8xM9Uyl+Z/fuAM=
X-Received: by 2002:a05:6870:3908:b0:29e:6394:fd4a with SMTP id
 586e51a60fabf-2e861de5c86mr6259660fac.2.1748307744858; Mon, 26 May 2025
 18:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526020125.382976-1-marcelomoreira1905@gmail.com> <DA5YTSGIN9DK.3HQ7DNKTVQRP4@kernel.org>
In-Reply-To: <DA5YTSGIN9DK.3HQ7DNKTVQRP4@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Mon, 26 May 2025 22:02:12 -0300
X-Gm-Features: AX0GCFtFqImtG536_8KaVd6AvacafQ7r26wr4MVsa7qAMPfQ72ymCg2hIfWOfNE
Message-ID: <CAPZ3m_h3rFpMBNmP95H0z_nZn-oG0q2-9VDbSE+Ntt+PBBDYgw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: revocable: Correct safety comments and add invariants
To: Benno Lossin <lossin@kernel.org>
Cc: dakr@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 26 de mai. de 2025 =C3=A0s 05:56, Benno Lossin <lossin@kernel.org>=
 wrote:
>
> On Mon May 26, 2025 at 4:01 AM CEST, Marcelo Moreira wrote:
> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> > index 1e5a9d25c21b..fed860ad2e60 100644
> > --- a/rust/kernel/revocable.rs
> > +++ b/rust/kernel/revocable.rs
> > @@ -61,6 +61,14 @@
> >  /// v.revoke();
> >  /// assert_eq!(add_two(&v), None);
> >  /// ```
> > +/// # Invariants
> > +///
> > +/// - `data` is valid for reads in two cases:
> > +///   - while `is_available` is true, or
> > +///   - while the RCU read-side lock is taken and it was acquired whil=
e `is_available` was `true`.
>
> This looks good now :)

Nice! sounds good =3D)


> > +/// - `data` is valid for writes when `is_available` was atomically ch=
anged from `true` to `false`
> > +///   and no thread is holding an RCU read-side lock that was acquired=
 prior to the change in
> > +///   `is_available`.
>
> This doesn't cover the case needed in `drop`, since there might be a
> thread holding the RCU read-side lock when `drop` is run. But that
> doesn't matter, because that thread isn't going to access `data` (since
> it can't have a reference to the value anymore, after all we're dropping
> it).

My understanding: I understand that the write invariant primarily describes
how data becomes valid for writes after revocation (RCU grace period).
In the specific context of drop, the validity for writes (e.g., drop_in_pla=
ce)
is predominantly guaranteed by the exclusive mutable access (&mut self) of =
the
PinnedDrop implementation, rather than the RCU-based write invariant.
The RCU readers would not be able to access the data being dropped anyway.

Plans for v4: I don't understand if we need to change something here or if =
this
will be reflected in the SAFETY comment for drop.


> >  #[pin_data(PinnedDrop)]
> >  pub struct Revocable<T> {
> >      is_available: AtomicBool,
> > @@ -97,8 +105,9 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<Se=
lf> {
> >      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
> >          let guard =3D rcu::read_lock();
> >          if self.is_available.load(Ordering::Relaxed) {
> > -            // Since `self.is_available` is true, data is initialised =
and has to remain valid
> > -            // because the RCU read side lock prevents it from being d=
ropped.
> > +            // INVARIANT: `self.data` is valid for reads because `self=
.is_available` is true,
> > +            // and the RCU read-side lock held by `guard` ensures this=
 condition is maintained
> > +            // during access.
>
> Two things here:
> 1. This comment should refer to the type invariants of `Self` ie
>    "`self.data` is valid for reads because of the type invariants of
>    `Self` and because ...".
> 2. `INVARIANT` comments report on changes in the type invariants of a
>    type. For example when constructing a type with type invariants, one
>    has to document that the invariants are fulfilled. In this case, the
>    invariants of `RevocableGuard` are:
>
>    /// The RCU read-side lock is held while the guard is alive.
>
>    Which already is fulfilled by us having the `rcu::Guard` type around.
>    So we should also change the invariants of the `RevocableGuard`.
>
> I think I suggested on the previous version that we change `data_ref` to
> a shared reference and thus simplify the `RevocableGuard` type, because
> it won't need `unsafe` any more. Then we can also remove all invariants
> on it. (And we also won't need the `new` function any more, since we
> have direct access to the fields).
>
> (This change should be its own patch)
>
> Then we will gain a new `unsafe` block in the code here that we will
> justify with the type invariant of `Self`.
>
> On second thought, we can reuse the `try_access_with_guard` function and
> then we won't need an `unsafe` block here.
>
> >              Some(RevocableGuard::new(self.data.get(), guard))
> >          } else {
> >              None


My understanding: The INVARIANT comment should be changed to SAFETY,
as we are justifying an unsafe operation (implicitly within RevocableGuard:=
:new
due to self.data.get()), not establishing a new invariant for Revocable<T>.

The SAFETY comment should explicitly state that the validity of self.data f=
or
reads is because of Revocable<T>'s type invariants, in addition to the
conditions
(is_available being true and RCU read-side lock).

The proposed RevocableGuard simplification (changing data_ref to &T and
making RevocableGuard internally safe) is a significant refactoring that
should be in a separate, future patch.

For this v4 patch, RevocableGuard::new will continue to take a raw
pointer. Therefore,
try_access will continue to call RevocableGuard::new(self.data.get(),
guard), and the SAFETY
comment will justify this existing (implicit) unsafe interaction,
rather than introducing a new
unsafe block by calling try_access_with_guard here, which would
prematurely depend on the
RevocableGuard refactoring.

Plans for v4: Change the comment from // INVARIANT: to // SAFETY.
- Reformulate the comment to: "SAFETY: self.data is valid for reads because
of Revocable<T>'s type invariants, as is_available is true and _guard holds
the RCU read-side lock."

- No changes to the underlying logic of try_access (it will still call
RevocableGuard::new with self.data.get()).


> > @@ -115,8 +124,8 @@ pub fn try_access(&self) -> Option<RevocableGuard<'=
_, T>> {
> >      /// object.
> >      pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard)=
 -> Option<&'a T> {
> >          if self.is_available.load(Ordering::Relaxed) {
> > -            // SAFETY: Since `self.is_available` is true, data is init=
ialised and has to remain
> > -            // valid because the RCU read side lock prevents it from b=
eing dropped.
> > +            // SAFETY: `self.data` is valid for reads as `is_available=
` is true and `_guard`
> > +            // holds the RCU read-side lock, adhering to `Revocable<T>=
`'s invariants.
>
> This is the wrong way around, the safety comment *relies* on the type
> invariants of `Self`. So it should be
>
>     SAFETY: `self.data` is valid for reads because of the type
>     invariants of `Self` and as `is_available` is true and `_guard`
>     holds the RCU read-side lock.

My understanding: The SAFETY comment should clarify that the
operation's safety derives from or
relies on Revocable<T>'s type invariants, rather than merely "adhering to" =
them.

Plans for v4: Reformulate the SAFETY comment to:
SAFETY: self.data is valid for reads because of Revocable<T>'s type
invariants, as is_available is true and _guard holds the RCU read-side lock=
.


> >              Some(unsafe { &*self.data.get() })
> >          } else {
> >              None
> > @@ -176,9 +185,11 @@ fn drop(self: Pin<&mut Self>) {
> >          // SAFETY: We are not moving out of `p`, only dropping in plac=
e
> >          let p =3D unsafe { self.get_unchecked_mut() };
> >          if *p.is_available.get_mut() {
> > -            // SAFETY: We know `self.data` is valid because no other C=
PU has changed
> > -            // `is_available` to `false` yet, and no other CPU can do =
it anymore because this CPU
> > -            // holds the only reference (mutable) to `self` now.
> > +            // INVARIANT: `is_available` is true, so `data` is valid f=
or reads.
>
> We're not only reading `data`, but also writing to it! (`drop_in_place`
> takes a mutable raw pointer and will call `Drop::drop` with a mutable
> reference)
>
> > +            // SAFETY: `self.data` is valid for writes because `is_ava=
ilable` is true, and
> > +            // this `PinnedDrop` context (having `&mut self`) guarante=
es exclusive access,
> > +            // ensuring no other thread can concurrently access or rev=
oke `data`.
> > +            // This ensures `data` is valid for `drop_in_place`.
>
> We have to mention the type invariants of `Self` here too. And also we
> have to satisfy all the conditions on the second invariant:
>
>     /// - `data` is valid for writes when `is_available` was atomically c=
hanged from `true` to `false`
>     ///   and no thread is holding an RCU read-side lock that was acquire=
d prior to the change in
>     ///   `is_available`.
>
> This is the problem with that invariant that I outlined above. Nobody
> can access `data`, since we're getting dropped.
>
> >              unsafe { drop_in_place(p.data.get()) };

My understanding: The operation in drop_in_place is a write
(destruction), so the prior INVARIANT
comment focusing on "reads" was a mistake.

The SAFETY comment needs to explicitly mention Revocable<T>'s type invarian=
ts.

For drop, the primary safety guarantee for writes is the exclusive
mutable access (&mut self)
provided by the PinnedDrop context, in addition to is_available being
true. The RCU-specific
conditions of the write invariant are less directly relevant here
because of this exclusive ownership
during drop.

Plans for v4: Remove the line: // INVARIANT: is_available is true, so
data is valid for reads.

Reformulate the // SAFETY: comment to: SAFETY: self.data is valid for
writes because of
Revocable<T>'s type invariants (specifically, that data is valid when
is_available is true),
and because this PinnedDrop context (having &mut self) guarantees
exclusive access,
ensuring no other thread can concurrently access or revoke data. This
ensures data is valid
for drop_in_place.


>
> A function that also needs to be adjusted is the `revoke_internal`
> function. That's where the second type invariant comes in. I suggested
> that we remove that and split the behavior into `revoke()` and
> `revoke_nosync()` and Danilo agreed, so could you add that in another
> patch?
>

My understanding: I fully understand and agree that the following are
significant refactorings
and should be handled in separate, dedicated patches, not in v4

- RevocableGuard Simplification: Changing data_ref from a raw pointer
(*const T) to a shared
reference (&T), removing its unsafe logic and internal invariants.

- revoke_internal Refactoring: Splitting revoke_internal into revoke()
and revoke_nosync() functions.


Thanks again for your invaluable guidance! =3DD

Cheers,
Marcelo Moreira
