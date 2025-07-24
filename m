Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB5423ABBB
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753353058; cv=none; b=kV2oVVgSqRDp+bdiEu4FtAtEX/pmdoFBaEITng+X96y8dUquyWomRVlO36HVT78syn5zZyzo3EctMCNtHfvwNIV1swk6QM9oxk1G+q1OlFX/qYf7a3wk4tUvXd3atIrmqZ44Y8eNDRblAqwnNF3fP2CjHdjUsGwdQTIi0VfN8+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753353058; c=relaxed/simple;
	bh=LVenP+nsoNN4ztwTT7+5BvYnHp8m+S0KLrCHEPOqQ1Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=g0YbweTejNpfm7E1illAcM+ZAji+EPt05IHbu7qoorZ7/axqXBCZbIgCJ+0dTq1PtpiRFvF7S+mWjb6D7mV86GoQd2vfcaVcT+WEuFDxsdH3pz3iQ6P0jyS1nimtwYp7nzVaIjla4YRAAJHLXaT20nyEfkz2HY4dHFjOGr5uQB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iR9I8h45; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iR9I8h45"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4CB3C4CEED;
	Thu, 24 Jul 2025 10:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753353058;
	bh=LVenP+nsoNN4ztwTT7+5BvYnHp8m+S0KLrCHEPOqQ1Q=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=iR9I8h45Q7tiIkbLBJykYjfgolOdQ8GAHm36I6pEIclesD32lSlbuWQDqALYU0o1D
	 LGHIBqpE+cEsIUCTGwdlxenPHWcOAhZtQ3sDXFcZqF71ltKGWJwr5URk5HH5N/nLnS
	 Ua5yMfBMDNQKlhl6GywzIO1cSDmieK+I8CvN/SBty0GUoC15cAZ6xNf0Q1VVSI/ilI
	 y8sbncPU4wyyvfD8bN5UsmV+eRbBzmUXcWk/Kk6h8rQ9RbZyFeCTQRAkdG4Y8zRRWE
	 UJ5/TCGocK0Pcy+rtzk19rAxsuGcIERcmsf44w9lEKFKoWw9V/3TOgGIReW5tt1UUQ
	 vPmye+NCbLwZg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Jul 2025 12:30:54 +0200
Message-Id: <DBK7S9OWRZHX.9K74W43S2HRO@kernel.org>
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
 <DBIIZ28TA8SD.XY1W0S6G280F@kernel.org>
 <CAPZ3m_jepxCD-dr+gyun_=hb-fHX_yxTunsd4JX98nt4XmnEQA@mail.gmail.com>
 <DBJI2YV59B29.2CZPPGB7G9TRF@kernel.org>
 <CAPZ3m_i8j90tkjYaEZp+trd7GHSu1eaQLO+rqpn6HhV35JQH-w@mail.gmail.com>
In-Reply-To: <CAPZ3m_i8j90tkjYaEZp+trd7GHSu1eaQLO+rqpn6HhV35JQH-w@mail.gmail.com>

On Thu Jul 24, 2025 at 1:49 AM CEST, Marcelo Moreira wrote:
> Em qua., 23 de jul. de 2025 =C3=A0s 11:22, Benno Lossin <lossin@kernel.or=
g> escreveu:
>>
>> On Tue Jul 22, 2025 at 11:23 PM CEST, Marcelo Moreira wrote:
>> > Em ter., 22 de jul. de 2025 =C3=A0s 07:51, Benno Lossin <lossin@kernel=
.org> escreveu:
>> >> On Tue Jul 22, 2025 at 1:01 AM CEST, Marcelo Moreira wrote:
>> >> > Em seg., 21 de jul. de 2025 =C3=A0s 11:21, Benno Lossin <lossin@ker=
nel.org> escreveu:
>> >> >> On Mon Jul 21, 2025 at 3:01 AM CEST, Marcelo Moreira wrote:
>> >> >> > Refinements include:
>> >> >> > - `RevocableGuard`'s invariants are updated to precisely state t=
hat
>> >> >> >   `data_ref` is valid as long as the RCU read-side lock is held.
>> >> >> > - The `RevocableGuard::new` constructor is made `unsafe`, explic=
itly
>> >> >> >   requiring callers to guarantee the validity of the raw pointer=
 and
>> >> >> >   RCU read-side lock lifetime.
>> >> >> > - A new `SAFETY` comment is added to `Revocable::try_access` to
>> >> >> >   justify the `unsafe` call to `RevocableGuard::new`, detailing =
how
>> >> >> >   `Self`'s type invariants and the active RCU read-side lock ens=
ure data
>> >> >> >   validity for reads.
>> >> >> > - The `Deref` implementation's `SAFETY` comment for `RevocableGu=
ard`
>> >> >> >   is refined.
>> >> >> >
>> >> >> > Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
>> >> >> > ---
>> >> >> >  rust/kernel/revocable.rs | 25 ++++++++++++++++++-------
>> >> >> >  1 file changed, 18 insertions(+), 7 deletions(-)
>> >> >> >
>> >> >> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
>> >> >> > index 6d8e9237dbdf..0048de23ab44 100644
>> >> >> > --- a/rust/kernel/revocable.rs
>> >> >> > +++ b/rust/kernel/revocable.rs
>> >> >> > @@ -106,9 +106,12 @@ pub fn new(data: impl PinInit<T>) -> impl P=
inInit<Self> {
>> >> >> >      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
>> >> >> >          let guard =3D rcu::read_lock();
>> >> >> >          if self.is_available.load(Ordering::Relaxed) {
>> >> >> > -            // Since `self.is_available` is true, data is initi=
alised and has to remain valid
>> >> >> > -            // because the RCU read side lock prevents it from =
being dropped.
>> >> >> > -            Some(RevocableGuard::new(self.data.get(), guard))
>> >> >> > +            // SAFETY:
>> >> >> > +            // - `self.data` is valid for reads because of `Sel=
f`'s type invariants:
>> >> >> > +            //   `self.is_available` is true.
>> >> >> > +            // - The RCU read-side lock is active via `guard`, =
preventing `self.data`
>> >> >> > +            //   from being dropped and ensuring its validity f=
or the guard's lifetime.
>> >> >>
>> >> >> This shouldn't be needed.
>> >> >
>> >> > hmm, about what exactly?
>> >> >
>> >> > Are you suggesting to:
>> >> > 1. Simplify the content of the `SAFETY`, is it too verbose?
>> >>
>> >> It's not too verbose. The requirement of holding the RCU read-side lo=
ck
>> >> is not a *safety requirement*. It's already guaranteed by the existen=
ce
>> >> of the `rcu::Guard` instance, so we don't need to concern ourselves w=
ith
>> >> it in the safety requirements.
>> >>
>> >> Essentially you're just stating a tautology in the safety comment lik=
e
>> >> saying "2 + 2 =3D 4".
>> >
>> > Thanks for showing me that Benno.
>> > So we can keep it like this:
>> > // SAFETY: `self.data` is valid for reads because of `Self`'s type inv=
ariants:
>> > // `self.is_available` is true.
>> >
>> > Sounds good?
>>
>> Ah sorry, I didn't take a good look at the non-RCU justification. I
>> liked the phrasing in the non-safety comment:
>>
>>     // Since `self.is_available` is true, data is initialised and has to=
 remain valid
>>     // because the RCU read side lock prevents it from being dropped.
>>
>> So how about we combine that with your current version:
>>
>>     // SAFETY: `self.data` is valid for reads for as long as the RCU rea=
d-side lock is held because of
>>     // `Self`'s type invariants: `self.is_available` is true and the RCU=
 read-side lock is held by
>>     // `guard`.
>
> good! but how about we simplify it:
> // SAFETY: `self.data` is valid for reads because of `Self`'s type invari=
ants:
> // `self.is_available` is true and the RCU read-side lock is held by `gua=
rd`.

Sounds good!

---
Cheers,
Benno
