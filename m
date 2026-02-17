Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5CA36AB7A;
	Tue, 17 Feb 2026 14:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771338387; cv=none; b=sB5MfpoTLK0LBw//SwqztryzVEwhuo6Sl3+RW4wTo45yIsHiw2EWd4/hejGx5hH6UwbvOkZL7z7ggqcUjkzZz8txVVfJ2d1BIIMqk6HeYiaU4udMmnyvN8/mCHV9auuolAkhgMNXDPEZvgoZVYMBeq33dwWRjJonnsEvLA91LDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771338387; c=relaxed/simple;
	bh=jCt7Pxdd3isJ2FwLRxKW+0DSS6iNyT48uB6xkoW+Btg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=HcmowEdn+sc6/OnnRJfBoNOM27hiYt7RPmkrD3lbEUcAb0eqXc3iOP4yqFCiy8PnuBtFfmtnD9r6x7aaaIX930SvTm+fxNddRFSun9ZWgyqrcZ1md22tNE7nIIGQnV+eVMbwk8fTY2k5aPgWKTaq2SKWKYLoY/SjWlPMJBjxmnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HuGrXkTp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HuGrXkTp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2C9C19423;
	Tue, 17 Feb 2026 14:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771338386;
	bh=jCt7Pxdd3isJ2FwLRxKW+0DSS6iNyT48uB6xkoW+Btg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=HuGrXkTpJBKh+YbzONMa+EdAxYMNbJBFUYN193XsTnos0R6E6UdEX7CyElLGRkn0b
	 wj8tNnp6gPmDkpPhD1EzV0/eM0KsbM8nLiI0qC4SR8e5Oz3TRm/bmVylybT2MJ8jcK
	 LMP9UtEYnmr2jKHk9Ubscc0iaDUM5PWTHALT1VaNKdqweAhryy7OT1FT1myAluBdim
	 Q7Cfgd1021llhiA7ILN+82w3Q8v9ZhsodCAijA+V9yG8TnXKoSkp0Tg1vMTUd+Yb5Z
	 dyYhEEAZYRqlbbX2m+3oXb3batcS+yzUcbYJvm0RaO+peIKvwmI71S7XcNjsnZEVNa
	 LLDGLPKh1NPiQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 15:26:23 +0100
Message-Id: <DGHB1VEL6XTH.2W3803V58FUSH@kernel.org>
Subject: Re: [PATCH] rust: add a ring buffer implementation
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260215-ringbuffer-v1-1-9b359758a1b6@kernel.org>
 <8tULWyvUTjVb3E_HFZeW2maApI87eYLZungGtJ6k9CVT9J-C-TzIqx5ShmHA5vS30yqZRq7TmaBd0AIg5V7u6Q==@protonmail.internalid> <aZMMyJofDKualqXw@google.com> <873430es2p.fsf@t14s.mail-host-address-is-not-set> <C82DE0A6-17FC-4FD9-A272-257B59129A7E@collabora.com> <DGGFZX5JLZ22.3E1C8OVLNUDD6@kernel.org> <3D7C5FE8-CA15-418B-B2F7-D0EA4C37E1F0@collabora.com> <DGGGPFU9E9VD.8TT3HZUWS100@kernel.org> <U-BIeJ2bi8_e-eMwrNeo2r12w5jDIlGja9E3QSTg2bgL7JYAp1lJtO6sPCvTGQsL1PCfkEkMHfR5eLVG3JPJaw==@protonmail.internalid> <71F89D79-DBE1-4617-B58A-8552D0F2B3A2@collabora.com> <87pl63d6xx.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87pl63d6xx.fsf@t14s.mail-host-address-is-not-set>

On Tue Feb 17, 2026 at 11:02 AM CET, Andreas Hindborg wrote:
> We can change the code down the road, no problem. It's not set in stone
> just because we merge it without generic alloc support.

Just to avoid any ambiguity, we should merge it with generic allocator supp=
ort,
but aiming for arbitrary I/O backend support would be a bit too much.

> Perhaps one could imagine a simple API like in this patch being provided
> by a configurable implementation behind the scenes.

Yeah, in the future we could implement the system memory specific one with =
a
type alias on top of the I/O backend agnostic one. But it remains to see if=
 this
will actually work out properly or if it's even worth in terms of
maintainability etc.

(E.g. one of the limitations that I've mentioned already is that I/O backen=
ds do
not support growing and shrinking of the backing memory. And I'm not yet su=
re if
they ever should.)
