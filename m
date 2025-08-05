Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A10A17BA9
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Aug 2025 12:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754397692; cv=pass; b=f4UzfPEyVfngiSmNxaUr1K/pdjJfiteNkzu9xXUI+FxRJ9CexxpimL4m2YXFOaXwNILU5LniHYoIspFGXZXDVFFOsWkxnzosFUpUHe9hrNuyiPWjftzKOSKCcBB9GBcQPo13Yzwo0sek4NJOnihYaQBuMpgo30XNBa/9QIpp85k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754397692; c=relaxed/simple;
	bh=OZ2QD4pf5RfkFEuQHHjFA6EdgMUrAu5dozosIz6RYzI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=VXKZ/0xrdRPSL1xhNx+ldy9pYXZeEAUTYCXgilfznnYx9tXTdIAnZZ+nQT7IuTSZU6l9SAM1oAFP7un823zzl9Tv091mT1ulot3eBmX7HOA8ZlDd/fotrlMTFSC62NymCvKjSj8Se9FkNisdJpVyPt7irzfWkNtU7yoT+JyoXq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Fhw/qGj1; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Fhw/qGj1"
ARC-Seal: i=1; a=rsa-sha256; t=1754397664; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lFXg2PA+w+rTG/0qzAQ4GroRS7aoXhSYX1cXlZbISrGSeDjhp01juy69wnD0q1LqiAjzq43PBYaQd3YyFYnEPk5zKIo9PUUBgu260SY2tlep8RiVcjX8CL/+MRQhzC4Xgg5iysiiFZBG3epN9D/7E35aU2w3iS+Yh8jx2xsboH8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1754397664; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OZ2QD4pf5RfkFEuQHHjFA6EdgMUrAu5dozosIz6RYzI=; 
	b=Dn8oMZdny+0Pdzq8L97z6PSXaXVg6aByFBWqDiwG8vwbgBg/iRdVpvYhFLbB98yEILYFz1CSTymvLz3mcWm3eAsRHj6agIPOxjmKC75oL2tIHDwriRsni8DBzDxoKhe/o7sj6AYFdNBR92cUu/E0Cx6vQKEnhFNyQKfLVbtcrvk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754397663;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=OZ2QD4pf5RfkFEuQHHjFA6EdgMUrAu5dozosIz6RYzI=;
	b=Fhw/qGj1dlwPicmCKI4z0bJQtsoIh7P3RXXQXo0daMAwUPSJNgL91jsbbN18rWfy
	hfeeTfEKxILJ9YEY6/pFsRh75naA3lrWDGwJhWukudWY2j0MW6OdxpyFkf66ejuFKFc
	CCKs/NPCuBUHdtF/v3o8q8+X9wlQxvcWPgFZKamI=
Received: by mx.zohomail.com with SMTPS id 1754397661946623.038837070221;
	Tue, 5 Aug 2025 05:41:01 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver
 abstractions
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aJEtrI6RlU1tiflq@shikoro>
Date: Tue, 5 Aug 2025 09:40:47 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Igor Korotin <igor.korotin.linux@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6FDFFFAB-12CF-40D7-8FCF-5F3E8CED8F90@collabora.com>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com>
 <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>
 <08e89f95-6c95-4998-988c-e25f3cbfb389@gmail.com>
 <DBTQRIGWJDYB.2VNIOFWLKZFG3@kernel.org>
 <3e53e2c8-4988-448e-b2ac-6eaf6d62e050@gmail.com> <aJDbmFx3QAm-TY4L@shikoro>
 <DBTTAEC8HLGA.QYJ0UZOIDYEZ@kernel.org> <aJEtrI6RlU1tiflq@shikoro>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi,

> On 4 Aug 2025, at 19:01, Wolfram Sang =
<wsa+renesas@sang-engineering.com> wrote:
>=20
>=20
>> Besides the I2C infrastructure they require (which doesn't seem too =
much at a
>> first glance), I think we also have to consider how drivers should be =
routed
>> eventually.
>=20
> Well, I2C client drivers go to their specific subsystem, of course. =
I2C
> controller drivers will go to I2C. But as I can't review them, I need =
a
> maintainer for them. Is Igor willing to do this? Review I2C controller
> drivers written in Rust? Or is he only interested in the Rust I2C
> bindings? Anything is fine with me, we should only make sure that the
> MAINTATINERS file describes this correctly.
>=20

FWIW, I can help Igor and Danilo as a reviewer here, if needed.

I never wrote a I2C controller driver before, but as most things, it can =
be
learned. And the review part can fit into the overall bandwidth I have =
to
review Rust patches in general.

I guess it will make Igor more comfortable by having yet another person =
to rely
on.

=E2=80=94 Daniel=
