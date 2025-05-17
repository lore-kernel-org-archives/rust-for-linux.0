Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B921367
	for <rust-for-linux@vger.kernel.org>; Sat, 17 May 2025 00:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747440198; cv=none; b=UFpJGGQQT00ZhTpZBDFK19pVyuWoC+Q4izTqaR7XeuuQ29cxbLvisf+b/JbnszuRX8LvUb4lRE+FaS0ch4Zu9+qObP7siRxMujEq/RTXIhm0zwf+ZMwoToNIt5X0Of2ICkMpR19MqqtLs9DUOKp7lHhhZWsp1KFb0QZkzsZy01s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747440198; c=relaxed/simple;
	bh=NZ3zAOgFrGZJhZlkzLRCBvTh2j9Kn3YGWDHl6HOO2MU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H435GA83fwlYeTnDLNLTLLuh9t60/UcTBERHh1sTwq4iYoIROXQQiRss13oY3pnhbc+wQzwwV5VdCwulk4JD9CJRdN0WFTlWeCy7X3gOp9Nc4IlkdGysvn0AMDMsY/mxfJLkt8J+yIKK4ZlgBW03Td3OiMAQqk0Z0mr8TrEXyNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOAxbh3n; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOAxbh3n"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3feb0db95e6so2121467b6e.1
        for <rust-for-linux@vger.kernel.org>; Fri, 16 May 2025 17:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747440196; x=1748044996; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fH8dW5UE47sf3FpTA0xQ8yqieYLO4yazP4wNG7Z03EA=;
        b=UOAxbh3n6J5K5E+Rdhz93DQy1q2kFK1mIlxZ/+uuuiDKle19V3y7z6R8XJ178+7ics
         xXhDUGkxX3baiXnogxayj55phT/pLYA7XPgK4P1T0WEd859roI1o0Geo3a+NoXw5O3D7
         qtpllno4bcf93iv1z/aI5pc6aC+TGhza8x8x4lwYM23B0MWzDjwbUXhxdj2WTHsXy6WL
         CdAI1H5DGLxYG/L2HYIie/E5K6dsEkwl2bvWh+BXyadeA2KFFtxON/HaNUFcuH9PceRb
         5vXQakAIH6TBUp3BTR2MuE/LtqZpCZ1CWotamDYFHB8J3Uxx0eaSBh4Ft/GrDrcJDIPS
         IdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747440196; x=1748044996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fH8dW5UE47sf3FpTA0xQ8yqieYLO4yazP4wNG7Z03EA=;
        b=TKleIz6h7T0hJy7+wHux2oUidCZEZO7ZuxYAvkmvM6SGLiL1xLSPWO1RytD5eRWyIg
         frOtHtK9O4B+hhfF5iahhe3OlHdh9aTZmKoLM2g+0DP4YdOqiCbhmzhIvrivXs9TXDFG
         kFreUAqkzE01XsrfJPr6+UiZa9Wq/HgXYixJUkW6hJvip84ws9YlnVY0Y7vlwLunlYnZ
         /64ImqLmtxsxHb8vDbW6/Pq/tVnMzAbb3Vb2cF680OavqZcG4weLUx5L4fbO3cJ9L1eP
         zVOi2Hvate8bIFFMudQPyH7+cwAuVCSMbyu2skFmtTknV3oxbalT7KiQnpNPQiKel8zv
         71gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVilZF6+TBV7Thj29747KoDsWZDLD+nAsR/OMDvIazVEvpCm6aOi1Ivjk074Z4Gt2WylQWMKJR/iKh7hn30Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaxR0vSUOJJ+kFp9hDtOvnd6lKbk8HoOZJsBIvbghEdqGGk2Wn
	az07NYLFLSdvA4k7Z/bLWBj+LbNf+VF/y6bQxD4F9+SoGOL+K0mHOj1iSLffgHqrbpf18AMWQkn
	1OONmU23cc6kLUSCTblNwucfbIVJJfW0=
X-Gm-Gg: ASbGncu8BB3wAZnjLmAnHigencsVLPsKkNOCqC2F6l5D+8RFgJbVsE5FKJYh+CtP1mY
	12VGpHB/TDozySeP05k6IuhngYFnoCBOA3F8B6puR3rtPx8s8wd5ZBVLAde/gnbwuYZxV+Q/oIE
	q9Ki4hV3iijdfj8X4H+GPAOslNIsNWSPEucnRkrSloD/5N
X-Google-Smtp-Source: AGHT+IFjo3ZVivpjBOBjIP4euGZPLiHArWJ0VKrlzqgnciqA+1NgqmU3r5gGh9fWuqsuXmaOq682r80GWhDstpRxgIQ=
X-Received: by 2002:a05:6808:6a98:b0:403:3626:b33b with SMTP id
 5614622812f47-404d8698a2bmr3958980b6e.9.1747440195822; Fri, 16 May 2025
 17:03:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503145307.68063-1-marcelomoreira1905@gmail.com> <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org>
In-Reply-To: <D9RJQYNTIOK1.3HI7NDDWPK6IM@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Fri, 16 May 2025 21:03:04 -0300
X-Gm-Features: AX0GCFu1wMIZlUomooF1C3N7EyveU1xK_LrLv8fLTi2NGxo1Hq7deXXY70_wo8o
Message-ID: <CAPZ3m_hZ0uNgwpRefMOuu7x7q011VVzfntMRV5D68wdcrjnLAw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: doc: Clarify safety invariants for Revocable type
To: Benno Lossin <lossin@kernel.org>
Cc: benno.lossin@proton.me, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello guys!

Thank you for the continued feedback =3D)

Based on your point, I'm revising the `# Invariants` section for `Revocable=
<T>`
to be more precise about when access to `data` is valid. I'm
considering the following wording:

- data is valid if and only if is_available is true.
- Access to data is valid while the RCU read-side lock is held, ensuring no
concurrent revocation, or within the specific scope of the
revoke_internal function
where the revocation logic guarantees exclusive access before dropping data=
.
 - Once is_available is set to false, further access to data outside
of the revocation
process is disallowed, and the object is dropped either after an RCU
grace period
(in [revoke]), or immediately (in [revoke_nosync]).

I've attempted to clarify that the RCU read-side lock protects against
concurrent
revocation during normal access, but that `revoke_internal` has its own saf=
ety
guarantees that allow access without the lock in that specific context. I
'd appreciate your feedback on this revised wording to ensure it accurately
reflects the intended behavior and safety invariants.

Thank you for your patience and guidance. I will send the next version
of the patch soon.

Best regards,
Marcelo Moreira


Em sex., 9 de mai. de 2025 =C3=A0s 07:10, Benno Lossin <lossin@kernel.org> =
escreveu:
>
> On Sat May 3, 2025 at 4:53 PM CEST, Marcelo Moreira wrote:
> > The Revocable type in rust/kernel/revocable.rs lacked a comprehensive
> > documentation of its safety invariants, specifically regarding the
> > validity of the wrapped data and the necessity of holding the RCU
> > read-side lock for access. This patch addresses this by:
> >
> > - Adding an '# Invariants' section to the documentation of `Revocable<T=
>`
> >   clarifying that `data` is valid if and only if `is_available` is true=
,
> >   and that access to `data` requires holding the RCU read-side lock.
> > - Adding '// INVARIANT:' comments in `try_access` and `try_access_with_=
guard`
> >   to explicitly refer to these invariants before accessing the underlyi=
ng data.
> > - Adding an '# Invariants' section to the documentation of `RevocableGu=
ard<'_, T>`
> >   documenting that the RCU read-side lock is held for the lifetime of t=
he guard
> >   and that `data_ref` points to valid data during this time.
> > - Updating the safety comment in the `Deref` implementation of `Revocab=
leGuard`
> >   to explicitly mention the relevant invariants.
> >
> > Changes in v2:
>
> The changelog should not be part of the commit message, instead place it
> below the `---`, but before any file diff. It then will only appear in
> the email and not the commit message.
>
> Another thing: could you please CC Danilo Krummrich the next time you
> send this patch? I think he should also take a look at this.
>
> >
> > - Refined the wording of the invariants in `Revocable<T>` to be more di=
rect
> >   and address feedback regarding the phrase 'must occur'.
> > - Added '// INVARIANT:' comments in `try_access` and `try_access_with_g=
uard`
> >   as suggested by reviewers.
> > - Added the missing invariant for `RevocableGuard<'_, T>` regarding the
> >   validity of `data_ref`.
> > - Updated the safety comment in the `Deref` implementation of `Revocabl=
eGuard`
> >   to refer to the new invariant.
> >
> > Reported-by: Benno Lossin <benno.lossin@proton.me>
> > Closes: https://github.com/Rust-for-Linux/linux/issues/1160
> > Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> > ---
>
> ^^ right here would be the place for the changelog.
>
> >  rust/kernel/revocable.rs | 29 ++++++++++++++++-------------
> >  1 file changed, 16 insertions(+), 13 deletions(-)
>
> It seems to me that you sent this patch on top of your previous one [1].
> Normally, one doesn't do that and instead sends the patch based on a tag
> (like `v6.15-rc4`) or the subsystems `-next` branch (so in our case
> `rust-next`). So a new version should not rely on any previous one.
>
> [1]: https://lore.kernel.org/all/20250501005726.744027-1-marcelomoreira19=
05@gmail.com
>
> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> > index 2da3e9460c07..7ef2f34782b4 100644
> > --- a/rust/kernel/revocable.rs
> > +++ b/rust/kernel/revocable.rs
> > @@ -64,12 +64,11 @@
> >  ///
> >  /// # Invariants
> >  ///
> > -/// - The wrapped object `data` is valid if and only if `is_available`=
 is `true`.
> > -/// - Access to `data` must occur only while holding the RCU read-side=
 lock (e.g., via
> > -///   [`Revocable::try_access`] or [`Revocable::try_access_with_guard`=
]).
> > -/// - Once `is_available` is set to `false`, further access to `data` =
is disallowed,
> > -///   and the object is dropped either after an RCU grace period (in [=
`revoke`]),
> > -///   or immediately (in [`revoke_nosync`]).
> > +/// - `data` is valid if and only if `is_available` is true.
> > +/// - Access to `data` requires holding the RCU read-side lock.
>
> I'm not sure what the correct wording here should be. The current
> wording makes the `revoke_internal` function illegal, as it doesn't hold
> the read-side lock, but still accesses `data`.
>
> Maybe @Danilo can help here, but as I understand it, the value in `data`
> is valid for as long as the rcu read-side lock is held *and* if
> `is_available` was true at some point while holding the lock.
>
> > +/// - Once is_available is set to false, further access to data is dis=
allowed,
> > +///   and the object is dropped either after an RCU grace period (in [=
revoke]),
> > +///   or immediately (in [revoke_nosync]).
>
> Several missing `
>
> >  #[pin_data(PinnedDrop)]
> >  pub struct Revocable<T> {
> >      is_available: AtomicBool,
> > @@ -106,8 +105,9 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<S=
elf> {
> >      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
> >          let guard =3D rcu::read_lock();
> >          if self.is_available.load(Ordering::Relaxed) {
> > -            // Since `self.is_available` is true, data is initialised =
and has to remain valid
> > -            // because the RCU read side lock prevents it from being d=
ropped.
> > +            // INVARIANT: Since `self.is_available` is true, `self.dat=
a` is valid. The
> > +            // RCU read-side lock held by `guard` ensures that `self.d=
ata` remains valid for
> > +            // the lifetime of the guard.
> >              Some(RevocableGuard::new(self.data.get(), guard))
> >          } else {
> >              None
> > @@ -124,8 +124,10 @@ pub fn try_access(&self) -> Option<RevocableGuard<=
'_, T>> {
> >      /// object.
> >      pub fn try_access_with_guard<'a>(&'a self, _guard: &'a rcu::Guard)=
 -> Option<&'a T> {
> >          if self.is_available.load(Ordering::Relaxed) {
> > -            // SAFETY: Since `self.is_available` is true, data is init=
ialised and has to remain
> > -            // valid because the RCU read side lock prevents it from b=
eing dropped.
> > +            // SAFETY:
>
> Empty SAFETY comment?
>
> > +            // INVARIANT: Since `self.is_available` is true, `self.dat=
a` is valid. The
> > +            // RCU read-side lock held by `_guard` ensures that `self.=
data` remains valid for
> > +            // the lifetime of the returned reference.
> >              Some(unsafe { &*self.data.get() })
> >          } else {
> >              None
> > @@ -200,7 +202,8 @@ fn drop(self: Pin<&mut Self>) {
> >  ///
> >  /// # Invariants
> >  ///
> > -/// The RCU read-side lock is held while the guard is alive.
> > +/// The RCU read-side lock is held for the lifetime of this guard.
> > +/// `data_ref` points to valid data for the lifetime of this guard.
>
> Please use a bullet point list.
>
> ---
> Cheers,
> Benno
>
> >  pub struct RevocableGuard<'a, T> {
> >      data_ref: *const T,
> >      _rcu_guard: rcu::Guard,
> > @@ -221,8 +224,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
> >      type Target =3D T;
> >
> >      fn deref(&self) -> &Self::Target {
> > -        // SAFETY: By the type invariants, we hold the rcu read-side l=
ock, so the object is
> > -        // guaranteed to remain valid.
> > +        // SAFETY: By the invariant of `Revocable`, `self.data_ref` is=
 valid because the
> > +        // RCU read-side lock is held for the lifetime of this guard.
> >          unsafe { &*self.data_ref }
> >      }
> >  }
>
