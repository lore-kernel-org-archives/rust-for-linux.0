Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67E43803CC;
	Wed, 21 Jan 2026 19:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769022354; cv=pass; b=SMBAmIpyDBmwLCtUtd9K6XSkuoO8+Xqr9381DTcOR3P1MWz+rCiCuFLXSLpXRew8Uoeagl6H1Z7aJKyRS6RwNaKgUGczNUrnjuRIZAY46OBJjFgltmYYpfyyMj9oAW8eO6igNjo2oxOZnnZzHj4yRfr4hO79Zwnbkc9ZEMkrXW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769022354; c=relaxed/simple;
	bh=i2BH72KIf1kFS4NKdLvwydmfpRF2RLnU3mm2FU0wW+M=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=btNuv7KxMuHJBd9llC99H9dlQ+NX2mvyeg4oXunUfjGJ4+RNyzaGtuL6RuMuqClaAf1rGMA8Xxlw3hnf/tvfwRHsV0ZP8al98p1YqhQ//Ufg2H6iSBaglp8u/qHF1MTeWReuUNFRpujNrgtZawp3+B6u4bU5fs1pL/nW+Zknz9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Q+5iA1dS; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Q+5iA1dS"
ARC-Seal: i=1; a=rsa-sha256; t=1769022340; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FfgGndmamLkoIWDKPYiKhzeLM5DSD0H6fhswkcAKM+lSN6G1xwBi5AGONl4blERew8prIOMgYKH0AwzS26wxIm3EOrosAIA+5VyDUGfeWrDbxzQSvKOENSNLd0XObH1L8AE08mMmAdiWR4wbFmkfR5Dx9o2M40FsUNC7nr63wjg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769022340; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GwUrV7Qj4EARXRM+GghZGm9v/6bAFT6QLlVPI91PR80=; 
	b=KXtTDktyyvUFnpGYF9pwo/rpyHkAkeK1v09P8H3t+SkkqpfcP4gBWlOT5c2LuT0WH0FjzdwVo+BSt/Zm9Rg7LGQ/qcxVLz7js9ta8/Yp278QG6DbCuFnCB5CLhW1LHDN9fM1R9aWv2RxrsmTmFmP5aAXlqJIjzYTxmKHcYMZKC4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769022339;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=GwUrV7Qj4EARXRM+GghZGm9v/6bAFT6QLlVPI91PR80=;
	b=Q+5iA1dSt/3flpuK0Bz9f27pEJSWIbb01CBWcMNdoe7E9ljktRj31axsgQ0FyJi9
	8UI4nlvdyS98qJt26e2z5px3kuiQo4yRl4XirwyOg5A4qsOAIPJpVOLMID2Seny/NfO
	YnbW1Y7QyAW65eECwa/oAnJtczfXak1s4b1Bi3uM=
Received: by mx.zohomail.com with SMTPS id 1769022338505656.627659142558;
	Wed, 21 Jan 2026 11:05:38 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 1/2] rust: drm: add support for driver features
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DFUG2U4PVVTN.1DVPXGJK735F8@garyguo.net>
Date: Wed, 21 Jan 2026 16:05:22 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <FBB3C949-5568-4F26-95C8-8873F6DF1530@collabora.com>
References: <20260119-drm-render-v1-0-8326e4d5cb44@collabora.com>
 <20260119-drm-render-v1-1-8326e4d5cb44@collabora.com>
 <DFUG2U4PVVTN.1DVPXGJK735F8@garyguo.net>
To: Gary Guo <gary@garyguo.net>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Gary,

> On 21 Jan 2026, at 14:31, Gary Guo <gary@garyguo.net> wrote:
>=20
> On Mon Jan 19, 2026 at 11:34 PM GMT, Daniel Almeida wrote:
>> Add initial support for drm driver features via the DriverFeatures =
trait.
>> This trait is unsafe, requiring the implementer to comply with the =
safety
>> requirements of each feature individually if the feature is enabled.
>=20
> I think such unsafe requirement is quite vague and also very =
non-local.
>=20
> Maybe we can use a single trait (the `ModesetOps` that you described) =
to do
> this:
>=20
> Something like:
>=20
>    pub unsafe trait ModesetOps<D> { ... }
>=20
>    // Maybe the never type in the future...
>    pub enum NoFeature {}
>=20
>    impl<D> ModesetOps<D> for NoFeature {
>        fn foo(&self, ...) { unimplemented!() }
>    }
>=20
>    impl Driver {
>        /// Reference the modeset implementation (typically Self),
>        /// or `NoFeature` to indicate that the feature is not =
implemented.
>        type Modeset: ModesetOps<Self>;

Yeah, this looks better indeed. I assume we can have multiple features =
by
having multiple traits, right?

>    }
>=20
> When building, you can use `TypeId` to check if it's actually =
implemented, and
> set bits in the feature flags automatically.
>=20
> Best,
> Gary

I assume we would enable FeatureFoo if typeid(Foo) !=3D =
typeid(NoFeatureFoo)?

Where Foo is =E2=80=9Ctype Foo: FooOps=E2=80=9D in the Driver trait.


