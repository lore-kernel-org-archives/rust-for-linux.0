Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7063E204699;
	Thu,  9 Jan 2025 15:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736436855; cv=pass; b=ClnXClyfKnnZ7deUTQLj9r3sZU3TqOdR4olqPBMZY4X2hJW9u6zkcpO8oHXxkBfppd9KwSp/PSegNsTT28ua5j4DyIf8p+MgqiNw4IABe8Hs3OujIp0jJjYHwDRg6cYga4HEInEWODOKvfk1sykwa+FmRMnGdZ/fXbBq80bFdOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736436855; c=relaxed/simple;
	bh=fP1LaVK/KgsupEbEltdsZ3HOhPjpdB3dnnCICzXew8E=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Hc+Sh6Phb/lOljF8JXpPXnTN57jyKpyBc/czRkepcROmkGLACbSdWezAiLXNQ7fudtUYabntxeUek9HB1/JrOslErjXgHni9BjSyZC/qHNYFXGdLZQiYnAz6qvI3iyEReoieNEyk3i2HzNAJuB+fbBCQa+TtVuSrQShU68ztgXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=O3dcbdyl; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="O3dcbdyl"
ARC-Seal: i=1; a=rsa-sha256; t=1736436834; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YoZfPA9C8xQJtvJBSPcAyTnlBdJdHX8er2Wf7UWEDQDVk7eI1goHBetqbMd/DrLFJnScs67y0qdkVxmMmzziPsc6OhjT0rzBX93mA5zCQDqbwZPczkW0CP6JGrAt5t1IWBlOm66leTGZO6vPuIrWHHzwsYO8bUKALyi61XhZEnA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736436834; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GkbeTUOjdpbS14Catn959XkYhQeXuXvfZYsxiZVhQ3U=; 
	b=QjxZECn3eZwLdvgJpNW6Y+XHvMwKhEeJoNskDf2GTq3iJI8ewV2/q8HUiCxIDGgQCfZW2cLTqKuloY+/3cfsmaqTbGAeGP/OPa8GH5k3d72iL06H3h3oknuTHGw/o3sxhk7/RZ2cLSR7GQhNbfPdNJ46zmjaDcSPOKnZVOsRUAc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736436833;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=GkbeTUOjdpbS14Catn959XkYhQeXuXvfZYsxiZVhQ3U=;
	b=O3dcbdylo6oRjGPZHGU/BInItNwnXB/QKbpvgHCMsz6QaMzAp7XbDHDndMtfLoQp
	GiSCkGdIqN/pCjJSYmbRcK/7JO/yL+gFJ9m6ssBQzGDmSsYVVduegMeDOp3UuRVq+nE
	ZPa77XUIar8xsWM/mbg1hbIw5YDqRLBqTEV9L+a8=
Received: by mx.zohomail.com with SMTPS id 1736436831564359.19063740354477;
	Thu, 9 Jan 2025 07:33:51 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v4 2/3] rust: io: mem: add a generic iomem abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CAH5fLghKfUqUNQBiGS4ORz_Ng3a865B+gjPRF4zGxJ=3VgV5Xg@mail.gmail.com>
Date: Thu, 9 Jan 2025 12:33:34 -0300
Cc: alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 benno.lossin@proton.me,
 a.hindborg@kernel.org,
 tmgross@umich.edu,
 gregkh@linuxfoundation.org,
 rafael@kernel.org,
 dakr@kernel.org,
 boris.brezillon@collabora.com,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <EAAFB9D3-D83B-44B9-95CA-D09BE7C7F248@collabora.com>
References: <20241211-topic-panthor-rs-platform_io_support-v3-1-08ba707e5e3b@collabora.com>
 <20250109133057.243751-3-daniel.almeida@collabora.com>
 <CAH5fLghKfUqUNQBiGS4ORz_Ng3a865B+gjPRF4zGxJ=3VgV5Xg@mail.gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External

Hi Alice,

>=20
>> +pub struct IoMem<const SIZE: usize =3D 0> {
>> +    io: IoRaw<SIZE>,
>> +    res_start: u64,
>> +    exclusive: bool,
>=20
> I don't think you need this after the `new` call, so you can remove
> the field from the struct.

Remove what?

Both res_start and exclusive are used in IoMem::drop().

>=20
>> +    /// # Safety
>> +    ///
>> +    /// The caller must ensure that the underlying resource remains =
valid
>> +    /// throughout the `IoMem`'s lifetime. This is usually done by =
wrapping the
>> +    /// `IoMem` in a `Devres` instance, which will properly revoke =
the access
>> +    /// when the device is unbound from the matched driver.
>=20
> I know that this is a requirement for IoRaw, but does the
> `request_mem_region` call not guarantee that the memory region stays
> valid until `drop` runs?

Hmm, I don=E2=80=99t think so. I=E2=80=99d expect the lifetime of the =
iomem to be tied to the lifetime
of the device, really. The mapping will probably remain, but other =
infrastructure will probably
be shutdown, like the clocks or regulators, so accessing the region will =
probably deadlock in such cases.

Other people feel free to correct me, of course ^
=20
=E2=80=94 Daniel=
