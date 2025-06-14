Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50502E11DD
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Jun 2025 18:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749924077; cv=none; b=k3XqJHFl4YhOTdBp4W30Xk4Igl36gi7I3XGuAFR0IdEVr5JjGoAB6Poa5WiCmIhx38Yn04MiyRdtKxyW54CxRMc7mkERlP39CKfHZ53039dG7PTgD7q1HY8wVPwoEoN/lYz8y7p1qgdPIKif8ruQXo5TKcODqWrBIa/VKcWUY/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749924077; c=relaxed/simple;
	bh=EwbLN1mOerPaBF/4Z7x4v769ihgHL1QM1dAvLidiH00=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=K0hF6aGGD19VqwOEt7QJsQ21Hxv5MkOMagif3bGb0w6CXuXFPaWkRW7+ltgDsk9ZVs9bzFoPAcQGWgJsS/QQo/QgaXEn1alSOR2ihd8LMy3v8vmZfics68OeGIysZC0YHtP7/HpHnqR6LcmnNYUgukBFi01oMh8VOtMDP6yQVpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJ2OwZs5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJ2OwZs5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F48C4CEEB;
	Sat, 14 Jun 2025 18:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749924076;
	bh=EwbLN1mOerPaBF/4Z7x4v769ihgHL1QM1dAvLidiH00=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=pJ2OwZs5fdsNswAPEj/pJexHTC7+ts+Iq1Q0WtGA8UpyArQO/0z8tsFhYCliSeCmV
	 ALHLYWbbbc36ntNfeitHFnnAJaOm1RFlFAOFnfN2JSmrrz1bTX5E8Kj9o+BttadIPq
	 GHt5PjwcuUh6icXpJCUJ33K4L9vRAis+95KGCGcqw6cnF8ETYnWCYeUKbsW6t46ALX
	 k83bAeS/aiildNbihJr08XxiZ7oNiylOgnDWNORWZrXhn2hvoDabXLi53Q3Qblkgg4
	 yJhzLPzAzwo6dkRyTZyx1xI1y9n8LrlasbrBoU0eYHzXjB0jcoNbBlt+ShjF/aMtIR
	 WGoq+hL8PgkDQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Jun 2025 20:01:13 +0200
Message-Id: <DAMGB9H9NV06.11M9CU65BVLXG@kernel.org>
Subject: Re: [PATCH v3] rust: introduce sfile macro for succinct code
 tracing
From: "Benno Lossin" <lossin@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250609223606.2897030-1-ttabi@nvidia.com>
 <DAIPZJ4YMJOI.2HYMHADQG1YER@kernel.org>
 <96ee11ca8f198892b35fc07c72ebdbb06095544e.camel@nvidia.com>
In-Reply-To: <96ee11ca8f198892b35fc07c72ebdbb06095544e.camel@nvidia.com>

On Sat Jun 14, 2025 at 12:46 AM CEST, Timur Tabi wrote:
> On Tue, 2025-06-10 at 10:45 +0200, Benno Lossin wrote:
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 So=
me(slash) =3D> slash + 1,
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 No=
ne =3D> 0,
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let end =3D match rfind_co=
nst(FILE, '.') {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 So=
me(dot) =3D> dot,
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 No=
ne =3D> FILE.len(),
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // The following code the =
equivalent of &FILE[start..start+len],
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // except that it allows f=
or const contexts.=C2=A0 For example,
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 const SFILE=
: &'static str =3D sfile!();
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let base_ptr: *const u8 =
=3D FILE.as_ptr();
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: We know that `s=
tart` is <=3D the length of FILE, because FILE
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // never ends in a slash.
>>=20
>> I don't think that we should rely on that fact for unsafe code.
>>=20
>> There is another argument for `start <=3D length`: when `rfind_const`
>> returns `Some(res)`, then `res < length`.
>
> The problem is the +1:
>
>     let start =3D match ::kernel::str::rfind_const(FILE, '/') {
>         Some(slash) =3D> slash + 1,
>         None =3D> 0,
>     };
>
> `start` is the first character *after* the slash.  If FILE ever did end i=
n a slash, then `start`
> would point past the end of the string.  That didn't seem to cause a prob=
lem when I tested it, but
> technically my code just assumes it's true.
>
> I could add another assertion:
>
>             assert!(start < FILE.len());
>
> If I set FILE to "HELLO\", this causes a compiler error:
>
> 178 |         pr_info!("{}:{}\n", sfile!(), line!());
>     |                             ^^^^^^^^ the evaluated program panicked=
 at 'assertion failed:
> start < FILE.len()', drivers/gpu/nova-core/gpu.rs:178:29
>
> or even:
>
>             assert!(start < end);
>
> This code is only ever supposed on be used on ASCII filenames, which can =
never end in a slash.
>
> I could do something like this:
>
>             let start =3D match ::kernel::str::rfind_const(FILE, '/') {
>                 Some(slash) if slash =3D=3D FILE.len() =3D> slash,
>                 Some(slash) =3D> slash + 1,
>                 None =3D> 0,
>             };
>
> But I don't think this is useful. =20

Let's use an assert, since it shouldn't happen in practice. We need to
assert it though for the unsafe code to be correct.

---
Cheers,
Benno
