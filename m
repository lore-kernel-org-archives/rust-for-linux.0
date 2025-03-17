Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E6E2E336F
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 14:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742223482; cv=none; b=Hml3lrlC1r0Zs85aGilZnV+k0/21MHO8gKV6c94beci7RwNzBiK0hlgbDrFnSuOjm3oMdrvaodnppp6hZPJu6vbsaI/NnVHUylIn5F/PGoTXKw8vE15hPjTUejrnw3ZzmUHPuBQWW1c7YBFiLQniDobfKnU1oekbAMQQLB35ex8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742223482; c=relaxed/simple;
	bh=TsYh26bJ/cAnSPwv/1d6/uTk9EAdE3AnYWdpAZDRkZY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F7EOx1yAlZvkGaeINZ0Tf5SLL4vp8rSGZ1+JNK6zIyotoMW/pVHTVwNzDSTvTui96vSet3CetUoAPPvO3irVPuqQGrG+onvClfOQL/S80b9xWc9p+nL2ZGs7E/3YDYliSmhZcZUvnk2joAVMqXz4bHOBF+Zt8DxYfEW1ZjxEikw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=HM6uCM0a; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="HM6uCM0a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742223478; x=1742482678;
	bh=PAvCZljqfPwTmMvN4PeD741MglUp9JccMIXin6PBy4M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=HM6uCM0aaM/hGPNBbHGpRzeiP5MN19p0vSv9lht5KLfXGUY0lwnZWOe4NJcaTEAkK
	 JIDzt7I15kxw9gJOug3WtNV/AsM2G1XWVMzC0yI6igOnGtPIwqdmOLroALRgzNtRqc
	 qfWKa+s0svvGaE6+UWbaxBVlrOojBvqyeks6g/isqXwZLxceRC2BOnZAO3ZdDfgi4Z
	 OJaDwYb1hlI1v7ZFbtx9+GGVXlTpeCuJWRC2V+kM+Voq2nrRwLNattl0jeTFIdxEhH
	 3CP/ztIUAsThydPqtYrMMpGbSuHviKDbSvlD2RHrRxJ6AU5wMsuw8nLPP0+xfKfDrD
	 pGttXwDUtqw7Q==
Date: Mon, 17 Mar 2025 14:57:51 +0000
To: Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Tamir Duberstein <tamird@gmail.com>, ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, andrewjballance@gmail.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of Vec::set_len()
Message-ID: <D8IMOAKHKYGP.32PTT2W55UH6L@proton.me>
In-Reply-To: <Z9gDt9JbqvoTFORV@pollux>
References: <Z9XIk3WpzruUfh6O@pollux> <Z9bLtgJa3PNB0bkf@pollux> <CAJ-ks9mAS1WHZcRqPzu4qhMOGXP9RNhdHUSbJK79znDvaFRHnA@mail.gmail.com> <Z9bWODCNNEq3xI51@pollux> <D8HVI9K91JWV.NHOPVELH5JE5@proton.me> <Z9cfkKTVKtc3imyK@pollux> <Z9ch0fgUI-V-rlGr@pollux> <D8IG67RM4H53.2K2AW01FZLWJM@proton.me> <Z9gDt9JbqvoTFORV@pollux>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: a5d4f9bc15c7938237abf261859f7083035277d3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon Mar 17, 2025 at 12:12 PM CET, Danilo Krummrich wrote:
> On Mon, Mar 17, 2025 at 09:52:07AM +0000, Benno Lossin wrote:
>> On Sun Mar 16, 2025 at 8:09 PM CET, Danilo Krummrich wrote:
>> > On Sun, Mar 16, 2025 at 07:59:34PM +0100, Danilo Krummrich wrote:
>> >> But let's define it then; what about:
>> >>=20
>> >> "[`Vec::set_len`] takes (or kepps) ownership of all elements within t=
he range
>> >> [0; `new_len`] and abandons ownership of all values outside of this r=
ange, if
>> >> any."
>> >>=20
>> >> The caller may take ownership of the abandoned elements."
>> >>=20
>> >> I'd argue that giving up ownership, while offering someone else to ta=
ke it means
>> >> that it implies that otherwise we'll just end up forgetting about the=
 value.
>> >
>> > Btw. I'd still prefer if we could enforce that the caller has to docum=
ent what
>> > should happen to the abandoned value. But I acknowledge that the safet=
y comment
>> > isn't the scope for it.
>> >
>> > It'd be great if e.g. clippy would give us a tool to do something anal=
ogous to
>> > safety comments.
>> >
>> > It think it would be useful to enfoce some additional safety documenta=
tion. For
>> > instance, I think the kernel would much benefit if we could enforce th=
at
>> > mem::forget() must be justified with a comment, since as mentioned ina=
 previous
>> > mail, it can cause fatal bugs, for instance when used on lock guards.
>>=20
>> I get where you're coming from, but this probably will very quickly get
>> out of hand.
>>=20
>> For example, I can define `forget` safely:
>>=20
>>     fn forget<T>(value: T) {
>>         struct Cycle<T> {
>>             this: RefCell<Option<Arc<Self>>>,
>>             value: T,
>>         }
>>         let cycle =3D Arc::new(Cycle { this: RefCell::new(None), value }=
);
>>         *cycle.this.borrow_mut() =3D Some(cycle.clone());
>>     }
>>=20
>> How would you ensure that this kind of pattern doesn't get written
>> accidentally (or with many indirections)?
>
> I don't think that the possibility of writing safe (but yet buggy) code i=
s an
> argument against having the possibility of enforcing that a caller must w=
rite a
> comment for justification on certain things, such as mem::forget().

My argument is that the problem of forgetting a value is not
self-contained like `unsafe` code is. Even if we were to document all
`forget` or `ManuallyDrop::new` invocations (which we definitely should)
we wouldn't get the security that one can't accidentally forget a lock
guard. I'm totally in favor of mandating an explaining comment above
`forget` calls (but not as a `SAFETY` comment).

> But there's another reason I think having something like this could be
> problematic: It might set the wrong incentive, as in "hey, I can just use=
 a
> "sanity requirement" in my function rather figuring out how to ensure it =
through
> the type system, etc.".

I don't understand your point here, can you explain it more?

---
Cheers,
Benno

