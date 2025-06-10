Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1FD1A5BA8
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 08:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544264; cv=none; b=nPy1pBzZgJK4xTCwuwZ43CxsGR8UDrvjcB0/H+EObs7aIhqfaEj1grq6ecLS8m6pzMmb+T6bryrXrdtTBvIlQYZS21uNWP3g3OEnQ+jwshwZgo3wet0Qs0gUfVj1iSletSNwk7EINvv7VFWHN+3wF6j2MHgqIrVARssWHEVBl+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544264; c=relaxed/simple;
	bh=LsIVeIWb7pIngAiyePoe7VpozlNTvMGrUfblRiWMPFI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:From:
	 References:In-Reply-To; b=afrmdxSHSrtVdjfa95VqODUKnpGt8kY4f1xOLzbpo3hLsl2FsxbgHIwdcFcBUy1WUcsz7REbIOfgB7EDIpi478lJ4fb1nTMLHk1jeUcWqmMy0fsK/McE6jcMFxSzaTgpt28qZJmxCieq/1eleaKZpW885RVsyFU3WIOT7uFC/P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WlCetvVq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WlCetvVq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 262AEC4CEEF;
	Tue, 10 Jun 2025 08:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749544264;
	bh=LsIVeIWb7pIngAiyePoe7VpozlNTvMGrUfblRiWMPFI=;
	h=Date:To:Subject:From:References:In-Reply-To:From;
	b=WlCetvVqL+2HazeT2uI9kdFxjRe25FYC/3+jYkjWXwdAr25FMp/9K+yZMaXjBWW8k
	 XqzEMRsXx65PpQ7W1UnPfXoAn0LWjKSbJzM8Bt7E0/JXNKWJYZuROYBdedx+wJL5+V
	 NIl4GbW7sxwIMigOomLD8efAvm4iu+KrcaTodFy2iW6jN/cGA5vvIC20ILNjF2ohOZ
	 NiX9HzFN8zDcgyzJKNC7OWNZjJUFOEVVD9aZ1W6FMjrIWNfJIXT3I0mL68VseGClsP
	 1L9k7CG4vOEuyWqx2mTysSNueXMNhGEaCk2RqM6te2G+Pi503HVLaSesG+/wl7DS5B
	 5S3PyQOIXLYXA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Jun 2025 10:31:01 +0200
Message-Id: <DAIPOI4SKL6U.RY7HCY76AYOR@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: introduce sfile macro for succinct code
 tracing
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250609223606.2897030-1-ttabi@nvidia.com>
 <14dce552-c69a-460a-a54e-924423ab569b@nvidia.com>
 <35ca9fa086626f11ea65eb25acaf22fadbbe8710.camel@nvidia.com>
In-Reply-To: <35ca9fa086626f11ea65eb25acaf22fadbbe8710.camel@nvidia.com>

On Tue Jun 10, 2025 at 5:40 AM CEST, Timur Tabi wrote:
> On Mon, 2025-06-09 at 19:33 -0700, John Hubbard wrote:
>> > +/// Returns the index of the last occurrence of `needle` in `haystack=
`, or zero.
>> > +///
>> > +/// Identical to [`str::rfind()`], but unlike that function, this one=
 is const.
>> > +/// That is, the compiler can inline it when called with a string lit=
eral.
>> > +#[inline]
>> > +pub const fn rfind_const(haystack: &str, needle: char) -> Option<usiz=
e> {
>> > +=C2=A0=C2=A0=C2=A0 let bytes =3D haystack.as_bytes();
>>=20
>> Silly nit: "bytes" is just adding an unnecessary variable that also has
>> a non-informative name. Just delete it...
>>=20
>> > +=C2=A0=C2=A0=C2=A0 let mut i =3D haystack.len();
>> > +=C2=A0=C2=A0=C2=A0 while i > 0 {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i -=3D 1;
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if bytes[i] =3D=3D needle =
as u8 {
>>=20
>> ...and write the above line accordingly:
>>=20
>> 	if haystack.as_bytes()[i] =3D=3D needle as u8 {
>>=20
>>=20
>> Yes?
>
> I find my version to be easier to read.  I like using temporary local var=
iables to keep my code
> cleaner.
>
> If I post a v4, I can try to come up with a better name.

You can just reuse haystack:

    let haystack =3D haystack.as_bytes();

---
Cheers,
Benno
