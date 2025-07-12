Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE3E83CC7
	for <rust-for-linux@vger.kernel.org>; Sat, 12 Jul 2025 19:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752350174; cv=none; b=CEPqCADO76gusfL8DLQyKEAh9x/fz3W39lRKsSKv4MiYfSMnR9of/WbawX3hdiZGoKZ5cT7hIGyPzjG9NdzBTtSH0D4yb8fiHMxs/o9BFXVHEiWBy53b1fwPOKWnyhghdfMFv8DtLBKe6MqfxvotznwfcWH1fTRySH2N0lfIzcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752350174; c=relaxed/simple;
	bh=JvGBFTz3wFpNwUgc8TuQFigg3NyS5N7y0sJ8ltuuBWk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=reGdjyv5RTY/zuKObKQFesicCyYckV6GL/4DrzTSfGbmva03zjZPWSfiAuVNVXcYTVGyAnAFZ7AF4uESSjSPKkVBmmTyNbW1g2YQwTKF+mLtRXN16y6A2Dqt+9PjD4GEiJ+9B34cO+4RULt0X0Q8RRzBy8E7gBi1XJUk41sMqd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HcCEEhCY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HcCEEhCY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E89C4CEEF;
	Sat, 12 Jul 2025 19:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752350174;
	bh=JvGBFTz3wFpNwUgc8TuQFigg3NyS5N7y0sJ8ltuuBWk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=HcCEEhCYBmoh5C4ZKqjHVxTONFY39JfgNp2Pg7LeMpY9EP1WMDcsSIRCxJMSQds8H
	 EXOfxGlQD77cDHFVYui9xh9QK60d9CrirvRMfKMOYkwbw+kBi+dhItQnkUWl56a2xj
	 Mk7ChW+iNuBdvJcJcIIYcuo1PLJd+XSvIrpGnlDfWU6/ZwH5eWCMFOnqh1c1q/C4WC
	 qY19QETuV5HMaxajtfD4bLKYz0iyCM/BgyTaYYXnZpFqRGBiCkkKedSMDFr5btq27o
	 22oAlElTF4iyDcLKgPqHo73LTvGgFzQKY1bC73bus45nf90r+5DE6yj2Do0pHS/1po
	 4r/OkvW7sMEBg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Jul 2025 21:56:11 +0200
Message-Id: <DBACAJ6K5FAH.3IHMMM6NHITEJ@kernel.org>
Cc: <aliceryhl@google.com>, <dakr@kernel.org>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v6 3/3] rust: revocable: Document RevocableGuard
 invariants and refine Deref safety
From: "Benno Lossin" <lossin@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250708003428.76783-1-marcelomoreira1905@gmail.com>
 <20250708003428.76783-4-marcelomoreira1905@gmail.com>
 <DB6RKSNTHUZ8.DW0EBFDU6L1I@kernel.org>
 <CAPZ3m_h37mCRO7oZX3qLnc+iFNwUu_wgYqEu_r0g-gtOB0661w@mail.gmail.com>
 <DB9XM595UG4V.3N51HST2TFVW@kernel.org>
 <CAPZ3m_grA_T_ixfHs7Z44nf5je4ftBcqCx=vcyvJOsJb+LaMFg@mail.gmail.com>
In-Reply-To: <CAPZ3m_grA_T_ixfHs7Z44nf5je4ftBcqCx=vcyvJOsJb+LaMFg@mail.gmail.com>

On Sat Jul 12, 2025 at 8:49 PM CEST, Marcelo Moreira wrote:
> Em s=C3=A1b., 12 de jul. de 2025 =C3=A0s 05:26, Benno Lossin <lossin@kern=
el.org> escreveu:
>>
>> On Sat Jul 12, 2025 at 1:06 AM CEST, Marcelo Moreira wrote:
>> > Em ter., 8 de jul. de 2025 =C3=A0s 12:04, Benno Lossin <lossin@kernel.=
org> escreveu:
>> >> On Tue Jul 8, 2025 at 2:33 AM CEST, Marcelo Moreira wrote:
>> >> > Improves the `RevocableGuard` documentation by explicitly stating t=
hat
>> >> > its `data_ref` member is a valid pointer as an invariant. Additiona=
lly,
>> >> > the `Deref` implementation's `SAFETY` comment is refined to justify
>> >> > the `unsafe` dereference based on this new invariant and the
>> >> > `_rcu_guard` ensuring data accessibility.
>> >> >
>> >> > These changes address feedback regarding the clarity and completene=
ss
>> >> > of `RevocableGuard`'s safety guarantees.
>> >> >
>> >> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
>> >> > ---
>> >> >  rust/kernel/revocable.rs | 7 ++++---
>> >> >  1 file changed, 4 insertions(+), 3 deletions(-)
>> >> >
>> >> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
>> >> > index 6d8e9237dbdf..64fe44b4f5a3 100644
>> >> > --- a/rust/kernel/revocable.rs
>> >> > +++ b/rust/kernel/revocable.rs
>> >> > @@ -233,7 +233,8 @@ fn drop(self: Pin<&mut Self>) {
>> >> >  ///
>> >> >  /// # Invariants
>> >> >  ///
>> >> > -/// The RCU read-side lock is held while the guard is alive.
>> >> > +/// - `data_ref` is a valid pointer to a `T` object for the entire=
 lifetime of this guard.
>> >>
>> >> This should be:
>> >>
>> >>     /// - `data_ref` is a valid pointer for as long as the RCU read-s=
ide lock is held.
>> >>
>> >> > +/// - The RCU read-side lock is held while the guard is alive.
>> >>
>> >> And this invariant is unnecessary.
>> >>
>> >> >  pub struct RevocableGuard<'a, T> {
>> >> >      // This can't use the `&'a T` type because references that app=
ear in function arguments must
>> >> >      // not become dangling during the execution of the function, w=
hich can happen if the
>> >> > @@ -258,8 +259,8 @@ impl<T> Deref for RevocableGuard<'_, T> {
>> >> >      type Target =3D T;
>> >> >
>> >> >      fn deref(&self) -> &Self::Target {
>> >> > -        // SAFETY: By the type invariants, we hold the rcu read-si=
de lock, so the object is
>> >> > -        // guaranteed to remain valid.
>> >> > +        // SAFETY: `self.data_ref` is valid for writes because of =
`Self`'s type invariants,
>> >> > +        // and `_rcu_guard` ensures the data's accessibility for t=
he lifetime of this guard.
>> >>
>> >> This also needs to be adjusted.
>> >>
>> >> Also this patch should fix any invariant comments needed to construct
>> >> `RevocableGuard`.
>> >
>> > Regarding this point, "...fix any invariant comments needed to
>> > construct `RevocableGuard`."
>> >
>> > I looked at the function that constructs `RevocableGuard`
>> > (try_access->RevocableGuard::new) and I think it's correct.
>> >
>> > In `try_access`, the comment justifies the validity of self.data.get()
>> > by mentioning that `self.is_available` is true and that the RCU read
>> > lock prevents data from being dropped. This aligns well with what we
>> > already have in try_access_with_guard, for example (from patch 1/3).
>>
>> The comment seems wrong to me, it isn't even an `INVARIANT` comment. It
>> also talks about RCU in the wrong way and doesn't mention the type
>> invariants of `Self`...
>>
>> > Since there are no other code snippets that construct
>> > `RevocableGuard`, I thought I'd submit the patch with just the
>> > adjustments I made previously.
>>
>> There also is the `new` function of `RevocableGuard` that doesn't use an
>> invariant comment. It also isn't unsafe despite taking a raw pointer...
>> So either we make it unsafe, add the correct safety requirements which
>> should just be the type invariants of the guard or we remove it, since
>> we only use it once.
>
> Even if it's only called once, I think it's better to make `new`
> unsafe because it can be used in the future, and keeping it unsafe
> gives us the advantage of maintainability.

Eh I'm not so sure that there is the need to construct it in more places
than one. And if we ever need it, we could add it back in. But we can go
either way. Maybe Danilo has a preference?

> Understood, Benno. I'll change `new` to be unsafe, change
> `RevocableGuard::new` to an unsafe block, and adjust the `SAFEFY`
> comment.
> ok?

Sounds good, you also need to add an invariant comment inside of
`RevocableGuard::new`.

---
Cheers,
Benno
