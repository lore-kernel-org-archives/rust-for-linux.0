Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6133A1E67;
	Thu,  1 Jan 2026 20:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767299008; cv=pass; b=EnPrgLk0AhRAJ4YyIcP8YKZfx1NY+BkbtGIgTbF+FvbWsLi4e246mCoPH7042sxvSDyxHq5Kih3VRnzHDe2VNS+XedS8FOiURr/Xz23431QwQqHIC5gZZg8Ui0TnOBmmZPCXWtxsWFPsJE9MbJIdN+FQZ1sbPqfw0H5l2SKuguI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767299008; c=relaxed/simple;
	bh=aU6s3hEJ6URgPPGqNW93TyUH4zNlODmU/DiDnarq6rg=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=OIleOphbJv3sTnHcimKSYrnQqkPawySW5PP9bkJmRob3RGBQhiS0EQa9/7ATOE5wdkosl7NXhT+MfthaeNkmfoV2IIzHltFI3QIyR5EYk8UY/tX8SRyTn6Hfi+EysYWuJuIpVg/90mKNkEU6ltehHYquW3xmHFDfB7WNL+voPcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=fU3ccdK1; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="fU3ccdK1"
ARC-Seal: i=1; a=rsa-sha256; t=1767298986; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IpfvILStX7ejD4ESjB5UNb+LN874ANqfRv8csHQk60GZHprBXKYyFTkPOqMt57D7L66atmm+7G+Tk5xMpCN8cGgG74u1rcaXuhqH+urYlBZqIuWGbZ8t5RoAzEPoAJRh68q0F0Gq3tWLb0uzAo9p6xc7WpTmOwBAudE9wEP4PHA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767298986; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dXQoEVXxtBPwHqRjQp3Pqz0/+YIJzMUlAjliaSjU9p8=; 
	b=iTNa3vys0/I/WG0uHkXE1loIvYa4N4CK6GD/9k5mVG+A0YivjPhKDpydUd29dZNBkaa+QK2GswLmw2paRTL9FoaPosNTGOrud8BxdtEym88dzjM+a3ovHRF8s3o0yG0pkcyb9E+O42VDEI6wCXdmFwZRe/Z4OKVViTZ4vjKV4/Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767298986;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Content-Transfer-Encoding:From:From:Mime-Version:Subject:Subject:Date:Date:Message-Id:Message-Id:References:Cc:Cc:In-Reply-To:To:To:Reply-To;
	bh=dXQoEVXxtBPwHqRjQp3Pqz0/+YIJzMUlAjliaSjU9p8=;
	b=fU3ccdK1/GrAdZ9Gv5C9KZU2G0svlgs3MVBDjiTMkCjIEj3XHuXmhSERSnw7cVgd
	SnuazjrTpyMBztMaoc20INNrfwYeRXuyNT389iLI/iLOC+Q/we4qkpBlcLgaPljVTHn
	bW2rgXuQfD2ehbnNdN9SztdN8UaAX30HgEUHTQHQ=
Received: by mx.zohomail.com with SMTPS id 17672989831801005.2193089860059;
	Thu, 1 Jan 2026 12:23:03 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Daniel Almeida <daniel.almeida@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v7] rust: add new macro for common bitmap operations
Date: Thu, 1 Jan 2026 17:22:45 -0300
Message-Id: <E88301E9-6142-491A-ADA2-F3BD8D9B92EA@collabora.com>
References: <CAKBF=pu2RZOKztWHD-1Y-EY0-nQzc6JrwNheP3yA9fmyKS2fpg@mail.gmail.com>
Cc: Filipe Xavier <felipeaggger@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 felipe_life@live.com, linux-kernel@vger.kernel.org,
 Lyude Paul <lyude@redhat.com>
In-Reply-To: <CAKBF=pu2RZOKztWHD-1Y-EY0-nQzc6JrwNheP3yA9fmyKS2fpg@mail.gmail.com>
To: Kari Argillander <kari.argillander@gmail.com>
X-Mailer: iPhone Mail (23C55)
X-ZohoMailClient: External



> On 1 Jan 2026, at 16:14, Kari Argillander <kari.argillander@gmail.com> wro=
te:
>=20
> =EF=BB=BFOn Thu, 1 Jan 2026 at 20:21, Filipe Xavier <felipeaggger@gmail.co=
m> wrote:
>=20
>> +/// // Combine multiple permissions using operation OR (`|`).
>> +/// let read_write: Permissions =3D Permission::Read | Permission::Write=
;
>> +///
>> +/// assert!(read_write.contains(Permission::Read));
>> +/// assert!(read_write.contains(Permission::Write));
>> +/// assert!(!read_write.contains(Permission::Execute));
>> +/// assert!(read_write.contains_any(Permission::Read | Permission::Execu=
te));
>> +/// assert!(read_write.contains_all(Permission::Read | Permission::Write=
));
>> +///
>> +/// // Removing a permission with operation AND (`&`).
>> +/// let read_only: Permissions =3D read_write & Permission::Read;
>> +/// assert!(read_only.contains(Permission::Read));
>> +/// assert!(!read_only.contains(Permission::Write));
>> +///
>> +/// // Toggling permissions with XOR (`^`).
>> +/// let toggled: Permissions =3D read_only ^ Permission::Read;
>> +/// assert!(!toggled.contains(Permission::Read));
>> +///
>> +/// // Inverting permissions with negation (`!`).
>> +/// let negated =3D !read_only;
>> +/// assert!(negated.contains(Permission::Write));
>> +/// assert!(!negated.contains(Permission::Read));
>=20
> I really like the OR (`|`) operator. Personally, I don=E2=80=99t like anyt=
hing
> else. When
> a function or expression gets longer, something like let negated =3D !read=
_only;
> already feels strange to read.
>=20
> My suggestion is that everything else should be functions, so we would wri=
te:
>=20
> ```rust
>    let xxx =3D Permission::Read | Permission::Write;
>    xxx.remove(Permission::Write | Permission::Read);
>    xxx.toggle(Permission::Execute);
>    xxx.invert();
> ```
>=20
> This way we avoid expressions like:
>=20
> ```rust
>    let a =3D !(!xxx | yyy ^ zzz);
> ```
>=20
=E2=80=9C
> At that point, no one understands what is really happening anymore. People=
 start
> wondering whether operator precedence or evaluation order matters, and may=
 even
> have to go read the source code to figure it out.

I disagree. How would that look like given your suggestion?

>=20
> By only supporting OR (|) as an operator and expressing everything else as=

> explicit function calls, the code becomes much easier to read, review, and=

> maintain.
>=20
>    Argillander

How is A | B readable but not A & B or A ^ B?=

