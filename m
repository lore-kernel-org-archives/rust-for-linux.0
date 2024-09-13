Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2D513AD03
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Sep 2024 19:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726256077; cv=none; b=lYfMx9tvZDEyq+XXHQRu3ejXO17/0+vNktsYUBwywvAz4iP2BJuHbXJNDQVuSb0PpcL4C/Y3YMxi/mUUD0phQu92rY3aV+JCQj++Yt0CwTllmCQHg1GtmJe51+nL533qjVvWKc8FI4UezCTFOVxUMw7vJDzBmRwMrrwzhpNmcjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726256077; c=relaxed/simple;
	bh=CkXN13fdmyAD3r6ZPd2aWuwEhehfRv+lJy1dSwoqoHw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DjC0GwV6Z1bwJHwbb2KbXh6DRB0kXQLGF1NuJmU59axoyklbrl5O/AfxkIFwF2X2F6+l9THTCrUgulN3UgTQAYY1FcDTPbP/cWWRYe+GDTuJX8l7tatkDa/H9WbXP9XDvc4+FPZcKJZi3fMQCcCIFeuwgygsV2zBEuXXvrOxJBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=S2fFOxw8; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="S2fFOxw8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1726256073; x=1726515273;
	bh=QQg1AT08HE6t75CUi7sotIs+Shuh0/gZP6XXEOsLXE4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=S2fFOxw8QS7gukZR9MxEjJQedQtwcHc3INHuH57rPnZOY6el3dFklYaVyYCZcqCc3
	 59A36d6t7TKLU/YQVj9xBcVU+e3FQk4NXs4MgUPa8SldGD0SwYRXD8DQS1QlCDwfQl
	 6cKU0xPbYR5saqwnHFMXzYbcZMJbUaocSeigKDsni90NQ10E/8+2CfaztcvDhvpkz9
	 CI4J2ljZVjRbY9IyP1XluAlA4AiswmlbfGFP5gnKp6DKaaXsi/NJeNHUorl3IHl1gJ
	 sIU5I7V/xmgpUJIVvbMfeZC7RrK3+dITwoH3wQ/bi3hjdAZesKTRWnNjaCoB0wEbgy
	 JvjSZnJEfpcnQ==
Date: Fri, 13 Sep 2024 19:34:27 +0000
To: Joe Perches <joe@perches.com>, Alice Ryhl <aliceryhl@google.com>, Patrick Miller <paddymills@proton.me>
From: Benno Lossin <benno.lossin@proton.me>
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, apw@canonical.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dwaipayanray1@gmail.com, gary@garyguo.net, linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com, ojeda@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu, wedsonaf@gmail.com
Subject: Re: [PATCH v3 2/2] checkpatch: warn on known non-plural rust doc headers
Message-ID: <a9112679-b251-4b98-b55e-e8aabf82ad46@proton.me>
In-Reply-To: <ab5a84a40a5bf73001cd35f6f9108830ff70c5ee.camel@perches.com>
References: <20240912195649.227878-1-paddymills@proton.me> <CAH5fLghxvLoQp+G1oaaVfBx6DOh-GO0Wc=jboiwz9ZCoEtHVpA@mail.gmail.com> <ab5a84a40a5bf73001cd35f6f9108830ff70c5ee.camel@perches.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 0d3fb023f53d580de31d329ac5bf7b5fbff095cf
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 13.09.24 21:21, Joe Perches wrote:
> On Fri, 2024-09-13 at 09:33 +0200, Alice Ryhl wrote:
>> On Thu, Sep 12, 2024 at 9:57=E2=80=AFPM Patrick Miller <paddymills@proto=
n.me> wrote:
>>> @@ -3900,6 +3900,13 @@ sub process {
>>>                              "Avoid using '.L' prefixed local symbol na=
mes for denoting a range of code via 'SYM_*_START/END' annotations; see Doc=
umentation/core-api/asm-annotations.rst\n" . $herecurr);
>>>                 }
>>>
>>> +# check that document section headers are plural in rust files
>>> +               if ($realfile =3D~ /\.rs$/ &&
>>> +                   $rawline =3D~ /^\+\s*\/\/\/\s+#+\s+(Example|Invaria=
nt|Guarantee|Panic)\s*$/) {

@Patrick, could you also add `Error` to this list?

>>> +                       WARN("RUST_DOC_HEADER",
>>> +                            "Rust doc headers should be plural\n" . $h=
erecurr);
>=20
> While OK my suggestion would be to add a $fix option
> and be case insensitive
>=20
> =09=09if ($realfile =3D~ /\.rs$/ &&
> =09=09    $rawline =3D~ /^\+\s*\/\/\/\s+#+\s+(Example|Invariant|Guarantee=
|Panic)\s*$/i) {
> =09=09=09if (WARN("RUST_DOC_HEADER",
> =09                       =09 "Rust doc header '$1' should be plural\n" .=
 $herecurr) &&
> =09=09=09    $fix) {
> =09=09=09=09$fixed[$fixlinenr] =3D s/\b$1\b/ucfirst(lc($1))/e;
> =09=09=09}
>=20
> And if there are going to be more rust specific tests,
> there should be a rust specific block to avoid continual
> tests of $realfile =3D~ /\.rs$/

Yes please, we're already planning more checks.

---
Cheers,
Benno

