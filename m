Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com [136.143.184.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C01C1FC8
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 18:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764354586; cv=pass; b=jBiuJf2iuej07UtvQl6EgvsNS23Ie4qSbAibNkbNKsfCEs1YcntuDZPeGYyvM9+VymdQfWs50mxEVNoeiyvRjYFislhZDtUGPolF++aXDJUTmsOa2mBAWAySWRc6Ir2nf8ysVK0nrwD7ZB0QL1CS+jnqpoGuj9n0r37+9jLtsw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764354586; c=relaxed/simple;
	bh=c9iCP0Di69HO8BrShJD7UMz8MCKG+gUPGaeBNX88RU0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LjxJBHGjjqwJId2Z9fZl21o/KnMqtFJlYWCo5G23Qgfzlowdiyr8XGO4r3yAwsf/v7m9Xy2LH+z+TS0bXwVctGewuS+YCEMpQBCYrWhcmBL6jKz8jpUNBOxnzKuqCCXxO0+UuRkgFpnlIJQVciHuSqeykR3bvMnxXMz+l3fNbHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=hEE3ZQHE; arc=pass smtp.client-ip=136.143.184.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="hEE3ZQHE"
ARC-Seal: i=1; a=rsa-sha256; t=1764354565; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S8xRhkYNpFQDPxNseIdbgrx0Wwl2GQeDSJaV0nhJHPO3xx7nXcsii2L7UqE3m3SrhWlCjRoYWMVhCmMGTE1IVi8GErYSK+eOwn4k8iXJ9U6oii+qolGBBDwhLnNgmI4U4j7WLfa8ZsoNO1URc3gHljt4RcNxrd9ulVhp2YjBBMg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764354565; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=c9iCP0Di69HO8BrShJD7UMz8MCKG+gUPGaeBNX88RU0=; 
	b=UOHMBv8doNn/LLnMs87z1uFlEhKkuwmDgKgNvZ9mXhrmfnjjAtdZeRPZoEDeQ+G1j5yGR3x2d3Tr3DFqmPqDXKhL9bsZEfVNlO98/g2nlauWn2rprMg1y9ZNdjs+xmY1yiouTBTsVsPDamOzt12x9MbR1kWS4G2tkNJaoJ2uJvk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764354565;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=c9iCP0Di69HO8BrShJD7UMz8MCKG+gUPGaeBNX88RU0=;
	b=hEE3ZQHEpI6jSlc0bjaVLo6N1SSpqcOhSsSlMluT8C5/huysKVZ3CzLub9OmeDBD
	cWHUTk0ip1X+E9pPQuQPPGKSb8G4TcydSGPSbPAWFOBuOu381Az/Cennp61QlJ28VR4
	o5Gt9GdRSuNQtwYCoSqB4AItqMtGKTjI4K5PS0Co=
Received: by mx.zohomail.com with SMTPS id 1764354563823353.23867528640073;
	Fri, 28 Nov 2025 10:29:23 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust: add a function that returns a reference to the IO
 Ports Resource
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <B113730F-8A24-4C68-A2EF-C859281CC136@wyliodrin.com>
Date: Fri, 28 Nov 2025 15:29:09 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org,
 Fiona Behrens <me@kloenk.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <538859A1-25E3-4D8D-A920-CA4960B633B2@collabora.com>
References: <8A9FC261-679B-4596-B7D2-C05466AEFABF@collabora.com>
 <B113730F-8A24-4C68-A2EF-C859281CC136@wyliodrin.com>
To: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Alexandru,

>>=20
>> Have you checked the LED driver that Fiona was working on recently?
>>=20
>> I think she did not have the time to complete it. That was the =
original
>> candidate user for this code. You may be able to pick it up.
>=20
> I did not, but thank you for the tip, could you point me to it?
>=20
> Thank you.
>>=20
>> =E2=80=94 Daniel
>=20
> Alexandru

This seems to be the latest iteration [0]. Fiona also provided a branch =
here [1].

She said she does not have the time to work on this at the moment. If =
you could take over, that would be
a good reason to have the current patch :)

=E2=80=94 Daniel

[0]: =
https://lore.kernel.org/rust-for-linux/20250113121620.21598-1-me@kloenk.de=
v/
[1]: =
https://cyberchaos.dev/kloenk/linux/-/tree/kloenk/rust/leds-v3?ref_type=3D=
heads=
