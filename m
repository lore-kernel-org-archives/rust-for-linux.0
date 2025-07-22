Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D47230268
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 10:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753181503; cv=none; b=PL2UcHwyV1PxZclKugJpZGwwGOSpNSpEajzn3fw/tGd5T6zrxjegKiplMpevGUAyWqZYHSCPgTFheCcjMB8/nfNX1hPW1nT2U8k62NTOh+wyaIX8V9ExuKulZakzs6HlM1igiRvuI/RwRmUaxE4FYl3OFhR9NyRWe5zjj+Rl/vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753181503; c=relaxed/simple;
	bh=Hyc1trAOCpuoyMZSWHfzvSgwJSHoPY92F+XW5u9s1ww=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=sos6KIoyqdDTtMcAnpzYbgyIjUHoSiekfnM58NuqN/AvyMsXcxXjm3rwmMO8AuWN1ICLanr8DyYD8+eujz/mbyBaNkofEYsXvvqNhlb+lczJp13laZwAWefAT0/7vPJNKZlOCO4k2RqgURZq1S+GaBrUOCFhr5tqDViS5iVY5yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dno6Kede; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dno6Kede"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 402C3C4CEEB;
	Tue, 22 Jul 2025 10:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753181502;
	bh=Hyc1trAOCpuoyMZSWHfzvSgwJSHoPY92F+XW5u9s1ww=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=dno6Kede86Icrz9zr8C1hy/1fDfdFRd2MeGra15wBAnphYAKEYeip890tJ3DbdJcH
	 i6Tdvh06pjeFXi7VLScrWu8Szv3zCPuoMl1Zs0qnt1JaYahJF9RKfrnQTkhlyUDz+i
	 0ruB3CJ4wJpoQRSpbuOEdcb6x2RDNKNPnsQIEHifUn9jZi5qPoW7w92R0bDrR5zjs3
	 8ovM35G8TScjtb8Bmmutn8TqnHEjUMZVPrNVwblT3JWHjG2x4I5RjC+kjjvW2g0Qzl
	 MUr8FyjWFj290utjPtvd+L4+CeX6U48CxkWMIe/Af41W79ErZTeews4+952NOAviFJ
	 GYy3pucMx5uOA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Jul 2025 12:51:39 +0200
Message-Id: <DBIIZ28TA8SD.XY1W0S6G280F@kernel.org>
Cc: <aliceryhl@google.com>, <dakr@kernel.org>, <ojeda@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
Subject: Re: [PATCH v7 3/3] rust: revocable: Document RevocableGuard
 invariants/safety and refine Deref safety
From: "Benno Lossin" <lossin@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>
X-Mailer: aerc 0.20.1
References: <20250721010258.70567-1-marcelomoreira1905@gmail.com>
 <20250721010258.70567-4-marcelomoreira1905@gmail.com>
 <DBHSSQS2IALW.2OEWVKX6PY9LZ@kernel.org>
 <CAPZ3m_h4rvV8gfBi0ZQN=569FhB1+DsF2A6XkkLuWAFUEuKPDQ@mail.gmail.com>
In-Reply-To: <CAPZ3m_h4rvV8gfBi0ZQN=569FhB1+DsF2A6XkkLuWAFUEuKPDQ@mail.gmail.com>

On Tue Jul 22, 2025 at 1:01 AM CEST, Marcelo Moreira wrote:
> Em seg., 21 de jul. de 2025 =C3=A0s 11:21, Benno Lossin <lossin@kernel.or=
g> escreveu:
>> On Mon Jul 21, 2025 at 3:01 AM CEST, Marcelo Moreira wrote:
>> > Refinements include:
>> > - `RevocableGuard`'s invariants are updated to precisely state that
>> >   `data_ref` is valid as long as the RCU read-side lock is held.
>> > - The `RevocableGuard::new` constructor is made `unsafe`, explicitly
>> >   requiring callers to guarantee the validity of the raw pointer and
>> >   RCU read-side lock lifetime.
>> > - A new `SAFETY` comment is added to `Revocable::try_access` to
>> >   justify the `unsafe` call to `RevocableGuard::new`, detailing how
>> >   `Self`'s type invariants and the active RCU read-side lock ensure da=
ta
>> >   validity for reads.
>> > - The `Deref` implementation's `SAFETY` comment for `RevocableGuard`
>> >   is refined.
>> >
>> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
>> > ---
>> >  rust/kernel/revocable.rs | 25 ++++++++++++++++++-------
>> >  1 file changed, 18 insertions(+), 7 deletions(-)
>> >
>> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
>> > index 6d8e9237dbdf..0048de23ab44 100644
>> > --- a/rust/kernel/revocable.rs
>> > +++ b/rust/kernel/revocable.rs
>> > @@ -106,9 +106,12 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit=
<Self> {
>> >      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
>> >          let guard =3D rcu::read_lock();
>> >          if self.is_available.load(Ordering::Relaxed) {
>> > -            // Since `self.is_available` is true, data is initialised=
 and has to remain valid
>> > -            // because the RCU read side lock prevents it from being =
dropped.
>> > -            Some(RevocableGuard::new(self.data.get(), guard))
>> > +            // SAFETY:
>> > +            // - `self.data` is valid for reads because of `Self`'s t=
ype invariants:
>> > +            //   `self.is_available` is true.
>> > +            // - The RCU read-side lock is active via `guard`, preven=
ting `self.data`
>> > +            //   from being dropped and ensuring its validity for the=
 guard's lifetime.
>>
>> This shouldn't be needed.
>
> hmm, about what exactly?
>
> Are you suggesting to:
> 1. Simplify the content of the `SAFETY`, is it too verbose?

It's not too verbose. The requirement of holding the RCU read-side lock
is not a *safety requirement*. It's already guaranteed by the existence
of the `rcu::Guard` instance, so we don't need to concern ourselves with
it in the safety requirements.

Essentially you're just stating a tautology in the safety comment like
saying "2 + 2 =3D 4".

> 2. Or are you suggesting that the use of bullet points within the
> `SAFETY` is not preferred here?

No that is always preferred.

>> > +            Some(unsafe { RevocableGuard::new(self.data.get(), guard)=
 })
>> >          } else {
>> >              None
>> >          }
>> > @@ -233,7 +236,7 @@ fn drop(self: Pin<&mut Self>) {
>> >  ///
>> >  /// # Invariants
>> >  ///
>> > -/// The RCU read-side lock is held while the guard is alive.
>> > +/// - `data_ref` is a valid pointer for as long as the RCU read-side =
lock is held.
>> >  pub struct RevocableGuard<'a, T> {
>> >      // This can't use the `&'a T` type because references that appear=
 in function arguments must
>> >      // not become dangling during the execution of the function, whic=
h can happen if the
>> > @@ -245,7 +248,15 @@ pub struct RevocableGuard<'a, T> {
>> >  }
>> >
>> >  impl<T> RevocableGuard<'_, T> {
>> > -    fn new(data_ref: *const T, rcu_guard: rcu::Guard) -> Self {
>> > +    /// Creates a new `RevocableGuard`.
>> > +    ///
>> > +    /// # Safety
>> > +    ///
>> > +    /// Callers must ensure that `data_ref` is a valid pointer to a `=
T` object,
>> > +    /// and that it remains valid for as long as the returned `Revoca=
bleGuard` is alive.
>> > +    /// The RCU read-side lock must be held for the duration of the g=
uard's lifetime,
>> > +    /// as indicated by `rcu_guard`.
>>
>> This last part shouldn't be needed, as the `rcu::Guard` already
>> guarantees it.
>
> Ok, I can remove just that part and keep the rest.

Thanks!

---
Cheers,
Benno
