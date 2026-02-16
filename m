Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0D427055D;
	Mon, 16 Feb 2026 11:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771242281; cv=pass; b=hMTXmNjpz58XyEn4p/koxv0EriLZ6zLEjcMM5lLu2/aKhjcCbQIJRPhcGbMfOGqsQ75M5GADPSfF2jzrJMWdmMuOr7zRWzgZFdDJyf+ud6eu4mOEsl2ZJxP2j2mEgnlZW+RG7oyFkzSXde01XNlLTYdGge5tPo5bIhkk6rA9nPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771242281; c=relaxed/simple;
	bh=D7T2eBrGw8sMYlyCgZaWEbF1pd35mlyD31LKsXdz87s=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=bi04WjB9GN4N7js5aSPTpLInnQh/Ycfpp+DwF16KMoH4Tf6mAL8zGUyOCXq+fcE02FC6mG72x1f2hx+4y51/4u/0axJXuw7ytAiCyp9Wft08FIfDpPe9Qd5yEbIYRVUsDGK7y/47Xu4CuJN/Ale0ZEWYYGNfubuBLPWOaSU0ry8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=G3Z70a7F; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="G3Z70a7F"
ARC-Seal: i=1; a=rsa-sha256; t=1771242268; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R7iM3N1gVHU8aqcYRLwnVDLFU64f5zI7ONzpPKWyKNAqLGAwI4sLAb6qIJxd11GVLjPnyCpHKQtdA50qSRf49jfT6YAWxt0d3PeaEM4U8rbedNSAw0a59E+DZdMQ8aKv/w6ULrmAIlDuJeDuRAl8fx6gX1Tspas9ICK/YstwwEI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771242268; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=D7T2eBrGw8sMYlyCgZaWEbF1pd35mlyD31LKsXdz87s=; 
	b=mMGSEVg9LK7xr33WVzMyweNLdRbg4ptlwFjaabwjxjNh/t5vUzNvf4z7FZyfGjLu1gWt61/FsPndD7Hzxp9OrCdfKP2q/vRFmYADcV0PKNr77ly6d9Q1kP+xcaX4asdeLayXBlKq0LbkP5p2z65+eZ4bWXGoRAUlkQplwmseIG0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771242267;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Content-Transfer-Encoding:From:From:Mime-Version:Subject:Subject:Date:Date:Message-Id:Message-Id:References:Cc:Cc:In-Reply-To:To:To:Reply-To;
	bh=D7T2eBrGw8sMYlyCgZaWEbF1pd35mlyD31LKsXdz87s=;
	b=G3Z70a7FRnbhwttkdujf7uSCRw6hcll0xe7rfLGI7/aB7hwIEo4heMqByfA0+e+V
	gP7wp9XWJTj5HyKcsvhzJWQuwuGzFbWQN6QlNR47XgYkO8dZyI+QiNm1XIqNBv2ChqG
	FatBbON14xs2NRN9TWMwVAgtHK/gdICjHaLhgM+U=
Received: by mx.zohomail.com with SMTPS id 1771242265676913.9833505457289;
	Mon, 16 Feb 2026 03:44:25 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Daniel Almeida <daniel.almeida@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] rust: add a ring buffer implementation
Date: Mon, 16 Feb 2026 08:44:10 -0300
Message-Id: <425CCCE6-4FBF-40F6-AC50-F9D3D536CE50@collabora.com>
References: <87ikbxduxy.fsf@t14s.mail-host-address-is-not-set>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
In-Reply-To: <87ikbxduxy.fsf@t14s.mail-host-address-is-not-set>
To: Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: iPhone Mail (23D127)
X-ZohoMailClient: External



> On 16 Feb 2026, at 04:14, Andreas Hindborg <a.hindborg@kernel.org> wrote:
>=20
> =EF=BB=BF"Daniel Almeida" <daniel.almeida@collabora.com> writes:
>=20
>> Hi Andreas,
>>=20
>=20
> <cut>
>=20
>>=20
>> (sorry for the formatting, replying from my phone)
>>=20
>> We should probably make the backing memory configurable from the get go i=
nstead of hardcoding KVec. It will be cumbersome to retrofit this change lat=
er on, IMHO. I assume that others agree?
>>=20
>> For example, we can immediately use this in Tyr if you let the backing me=
mory be a mapped GEM object. Having it be DMA memory is probably also going t=
o be useful for others.
>=20
> It should at least take flags.
>=20
> iQe can make the backing completely configurable. We could have an
> unsafe initializer that require just a pointer and size at the lowest
> level. The current version is using array indexing to access the memory.
> We could overlay a mutable slice on the pointer and continue using array
> accesses. Or we could change it to just pointer offset calculations, but
> that seems less idea.
>=20
>=20
> Best regards,
> Andreas Hindborg
>=20


Consider adding a second generic parameter with a bound on IoCapable. This i=
s probably what we what here. This will let us delegate the memory accesses t=
o the underlying IoCapable implementation.

=E2=80=94 Daniel=20=

