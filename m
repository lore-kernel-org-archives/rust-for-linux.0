Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9DA233D62
	for <rust-for-linux@vger.kernel.org>; Sat,  9 Nov 2024 23:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731195762; cv=pass; b=Axj44UouDCaPcd3M/6bclrkaT39iUkhu5gaC2o2wNl6dbvWw/iYy6S07JgzLgFNILwgiO+BkubTfK0yWR+DOcOlvuM1WhGblbe7pJJN/QiY9k/CO38tcu5ZuSyVVhDG43l1O+tjikZ8DhLeRM22TykGmU88e14IolpG3hTZRuj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731195762; c=relaxed/simple;
	bh=+cUuFbMeMskbVlyiIIsFhdb/9+3BEiQiYb2beUpmYyM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=nefa3tNA0LGFiu18z5pAXiNtcQYIlLhQO5ihHckIue0wlXtCNQ0hSjdGehpDXFLcULKtV15ITI7Uzm2Y0+5iGcSO3FLu07EmRu1LmbGxN29R2EfIMIFv/oh9/gReBf58dm5ZwR+IlGak8/0TS+xAX6pmbRSeByaNQScziWho90o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=fB3EwaTp; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="fB3EwaTp"
ARC-Seal: i=1; a=rsa-sha256; t=1731195749; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IXu1DddGhl3F8HqU8S3b3M65nQuRunu2DNp7CVVPeoDwY7ve1DNUcNU2Y4JiYQ+HQbPgF/TS6nt7b5cduXKkDqxrEcI/nrFimm2fdGsivjRtsHBolM9FtQt8Te62jh4HpFWlrSY50LvsXfYSSaj8iTDjsJ+v3qGTGEkoOJs6I6M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731195749; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MVzArtzAhC2KZegJDx/Eg+TgZrGXSJ2H4Nr2IImTR/Q=; 
	b=XFO7ayCayhe9KQ2MLV4tD5p+EeBKeONUvt06BJt8aG7ZBC4zCvEsT0+qb3/2mxQfRAaWgne1cvVfr36E7JFfKjXxxwFtj81N6xTmWnn2v264/bHPVWouZcZUeEeVUZ7xj1CvEaaHLNjCwQ1fbOt4CI9IpNteeLn2FYQXiNBqxUM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731195749;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=MVzArtzAhC2KZegJDx/Eg+TgZrGXSJ2H4Nr2IImTR/Q=;
	b=fB3EwaTpS4+q1atF28LhIZmuKHvQNPvXAfe6YskiWuJ/KedH0/7CeE2Vl3/tey1U
	DLxApkY0bDJUxuJM758vgKaLvvTxXffYAC2NxfLMyyxTuNZCqsKm/76GStO07EP7/ZI
	ey5n9T0OP3JCkJ/j6YvmFA8Pq1rt3ewevdvwR4Yc=
Received: by mx.zohomail.com with SMTPS id 1731195746792914.9116872030504;
	Sat, 9 Nov 2024 15:42:26 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH v4 2/2] rust: add dma coherent allocator abstraction.
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <2afe6041-20c6-4121-acb0-ffb295575619@gmail.com>
Date: Sat, 9 Nov 2024 20:42:12 -0300
Cc: rust-for-linux@vger.kernel.org,
 aliceryhl@google.com,
 a.hindborg@kernel.org,
 dakr@redhat.com,
 airlied@redhat.com,
 miguel.ojeda.sandonis@gmail.com,
 wedsonaf@gmail.com,
 a.hindborg@samsung.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <A970979F-F4E6-4474-81F2-8FF471C82C35@collabora.com>
References: <20241105104726.3111058-1-abdiel.janulgue@gmail.com>
 <20241105104726.3111058-3-abdiel.janulgue@gmail.com>
 <81E07830-0A54-49C8-AC07-6511F6C816C4@collabora.com>
 <2afe6041-20c6-4121-acb0-ffb295575619@gmail.com>
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
X-Mailer: Apple Mail (2.3826.200.121)
X-ZohoMailClient: External

Hi Abdiel,

> On 7 Nov 2024, at 10:01, Abdiel Janulgue <abdiel.janulgue@gmail.com> =
wrote:
>=20
> Hi Daniel,
>=20
> Thanks for the feedback!
>=20
> On 06/11/2024 18:40, Daniel Almeida wrote:
>> Calling `get/get_mut()` for each T seems a bit of too much overhead.
>> If T is u32, for example, I expect a driver to want to read or write
>> a significant number of them at once. This should be common
>> if you want to read or write raw bytes.
>> You should probably make the CPU-addressable region available
>> to users after validating if the range asked is within bounds.
>> Luckily, cpu_buf() will already tie the lifetime of the slice to =
&self,
>> so they cannot touch that memory if the mapping is gone.
>=20
> You mean the read/write helpers could be removed and we expose the =
cpu_buf() helper instead that takes a valid range, returns a checked =
slice and let the user have the flexibility in implementing read/writes =
themselves. Is this what you had in mind?

Yes, that=E2=80=99s what I have in mind.

>=20
>> The fact that reads/writes will copy the memory is also a bit =
problematic
>> given that you can offer access to the underlying buffer without =
copying
>> anything. Also, the bound on `FromBytes/AsBytes` is, for now, a de =
facto
>> bound on `Copy`, since it is only implemented for types which =
themselves
>> implement Copy, i.e.:
>> ```
>> // SAFETY: All bit patterns are acceptable values of the types below.
>> unsafe impl FromBytes for u8 {}
>> unsafe impl FromBytes for u16 {}
>> unsafe impl FromBytes for u32 {}
>> unsafe impl FromBytes for u64 {}
>> unsafe impl FromBytes for usize {}
>> unsafe impl FromBytes for i8 {}
>> unsafe impl FromBytes for i16 {}
>> unsafe impl FromBytes for i32 {}
>> unsafe impl FromBytes for i64 {}
>> unsafe impl FromBytes for isize {}
>> // SAFETY: If all bit patterns are acceptable for individual values =
in an array, then all bit
>> // patterns are also acceptable for arrays of that type.
>> unsafe impl<T: FromBytes> FromBytes for [T] {}
>> unsafe impl<T: FromBytes, const N: usize> FromBytes for [T; N] {}
>> ```
>> Also, I think FromBytes is a bit restrictive here. In a lot of =
places, drivers
>> expect to be able to cast the mapping to a given struct whose =
definition
>> was sourced from some technical document or vendor code somewhere.
>> For example, here is some code for the H.264 decoder in the `rkvdec`
>> driver:
>> ```
>> struct rkvdec_h264_priv_tbl *priv_tbl;
>> <cut>
>> priv_tbl =3D dma_alloc_coherent(rkvdec->dev, sizeof(*priv_tbl),
>>      &h264_ctx->priv_tbl.dma, GFP_KERNEL);
>> ```
>=20
> We could just remove the FromBytes/AsBytes bound and let
> the constructor handle the ZST restriction there (like in the current =
submission)? If that is the case, there would be no need to wrestle with =
this issue then?
>=20
> /Abdiel
>=20

Alice pointed out to me later that the FromBytes/AsBytes traits can be =
implemented
by driver-defined types. I had missed that.

Given this, the FromBytes/AsBytes bound seems fine. Drivers would just =
need to
implement the (unsafe) traits for their types and it would be up to them =
to make
sure that the safety requirements hold.

Given the above, I am fine with FromBytes/AsBytes, you don=E2=80=99t =
need to change
that IMHO.

With read() and write() gone, so is the bound on Copy, which also =
satisfies
my other comment.

=E2=80=94 Daniel.



