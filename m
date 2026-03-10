Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C8439937E;
	Tue, 10 Mar 2026 16:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773160958; cv=pass; b=iTiz7bEsl9bUj42AOrzDZpMk6e6d9e03Y2cSiCkizMKnbVQVQg/gnKcDQjR7VVa7jTCxu4oyGAXPqPxdkdnqlzlcjdEu0E9uRvHsGn+sJ3XY6bsfnoqZd7fpCB5hha2yirzjnsjdHIOxCJ6boCaIyjV3iugqnYT97QI+oZziR70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773160958; c=relaxed/simple;
	bh=2q9PrY+u7CiiLSsLsQB+VNPAc+Iq1yl/rE9gJIrZy7w=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qh/vwStt8QwFoLaTyBHIePnoBhkrXv7lKLsSz9NYtK1uIlIFQM1P8uFZ/mazwHccPuDiu6UNhNVPqiVaLiFI+8E6k228muInhTA5YANrt2V0+g2t12Eesjcx/2rwK52FHXchjsgnEnCXZepm/x5v3hC9ubRx9T7ZN3tNyheFfTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=VsjjfjaO; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="VsjjfjaO"
ARC-Seal: i=1; a=rsa-sha256; t=1773160941; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PYQP/xWVzCq4rhnK6W881cit4y/5KQPfQWsI3zFWdSlLPTyiyIc/09BEJdvftVwwQdeP97gJiDC4Ow1f1hGx4GbwYvV/kaQwEUFgArpHEEJSZVgza/Fjv9JVRZK7YEkTQIXS1GDmvnMfmACjcCqCYAnqmNHgdQF+RyeLA6fU6eQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773160941; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=x4ZUFL7C6O1AWnRhFOTIV1ZkPk2qon63P09ppgcmaDk=; 
	b=S0aA39z6RyUXpoEV5DFj0K+JU3o8zFOHOD9I75oetF9s6FHIjcrmIkhik98lCgk+RrBKs1Ghmv1BBzBNM+QfU32Imio7mS8v3yCs+5Te18MyMWIB54/yJElS1DOmP+Z5e3BmpgsbrAPkXZkW053TIxGm4EUuah91Xtl9xz0FdR4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773160941;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=x4ZUFL7C6O1AWnRhFOTIV1ZkPk2qon63P09ppgcmaDk=;
	b=VsjjfjaO3VA9jM3laGZz7ZQXJ6s+JvgsiOpRYS5iyLi1FIS/+34wpToo0ZLQLJnI
	EpLsJhuMFrUCKQfT460nEMjtDaVTGpgYjt47dMLTLTmRXm7NXqxtgvzUSSIPiS0lDIp
	533Hm01mWYe50kxoV+htjYYqrZ96E7czJBIND9Xc=
Received: by mx.zohomail.com with SMTPS id 1773160938738181.37528317253793;
	Tue, 10 Mar 2026 09:42:18 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 1/2] rust: sizes: add u64 variants of SZ_* constants
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CANiq72kiiKkK0Q5w=UKNsPXvuuHMASpRJ7KAMy=2908n_u-DUA@mail.gmail.com>
Date: Tue, 10 Mar 2026 13:42:00 -0300
Cc: John Hubbard <jhubbard@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E7A50492-25C0-4F8B-A833-EDD5690C61A2@collabora.com>
References: <20260310023145.120037-1-jhubbard@nvidia.com>
 <20260310023145.120037-2-jhubbard@nvidia.com>
 <CANiq72kiiKkK0Q5w=UKNsPXvuuHMASpRJ7KAMy=2908n_u-DUA@mail.gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 10 Mar 2026, at 10:51, Miguel Ojeda =
<miguel.ojeda.sandonis@gmail.com> wrote:
>=20
> On Tue, Mar 10, 2026 at 3:31=E2=80=AFAM John Hubbard =
<jhubbard@nvidia.com> wrote:
>>=20
>> +// CAST: every SZ_* value below fits in u64, so `as u64` is always =
lossless.
>=20
> Nit:
>=20
>    // CAST: Every `SZ_*` value below fits in `u64`, so `as u64` is
> always lossless.
>=20
> One alternative could be something like `sizes::u64::SZ_1M`, but if
> you expect to mix `usize` and `u64` often then it may not be great.
>=20
> Regarding adding the constants or not, I am ambivalent. On one hand, I
> see the pain of repeating it; on the other hand, adding these only
> works for particular values (i.e. we still need the safe casts around
> anyway for other values).
>=20

I am not necessarily advocating one way or another, but as a further =
data
point: we also have a bit of this boilerplate scattered throughout Tyr.

It=E2=80=99d be nice to cut down on it, however it ends up being done in =
the end.

I do think that sizes::u64::SZ_1M does look better than what=E2=80=99s =
been proposed
in the patch, though.

> By the way, why don't we use the safe cast here? They are `const fn`,
> right? i.e. that would avoid the need to justify the cast and it would
> serve to double-check the cast too.
>=20
> By the way (x2), if we decide to go with the constants, we may want to
> use a macro to generate most of the file, which could allow us to also
> have the sizes as `u32` too, in case that is useful (in 32-bit
> domains?).
>=20
> Thanks!
>=20
> Cheers,
> Miguel
>=20

