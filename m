Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2B6366DB7;
	Mon,  2 Mar 2026 13:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772457171; cv=none; b=WARqBYfmIR8HORg0KWZHN6R9pdXXSl3UN3QpunJWAb7ec+qrtsfTSvRlmJrwfd57R1Bfc4yIi4wy8G8IpcJ6RO938YIjEk3DZ214+ANj/9/GKRxdFmh0TlAs+jzyY/J8g4fiq8j/4jxYL8386JePocSxVT3SriJcGlrE0E8YTyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772457171; c=relaxed/simple;
	bh=uvFhw3IWb5ZztoKxYDYB9Yf53vQK/bEsPG0a7bs9Cn0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=NWRD8BevuJu0z6w+o7vvX2CzN+4giSSE/TNKPV5ZsI04NyEIopQI1GKN3BuyKNIPkwBnMZhlo1xsWTptIkk5k2EGBwtu0c4twbKLh4hFJwfIuze0pHS34JjirNpC4AvZX002wxT27PDQHGvOtPTahuPk9uw2HJgVVGT84mVdbq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kz7qMLhL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kz7qMLhL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF04C2BC86;
	Mon,  2 Mar 2026 13:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772457171;
	bh=uvFhw3IWb5ZztoKxYDYB9Yf53vQK/bEsPG0a7bs9Cn0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Kz7qMLhLqvlMyB1R1IoePM/NQL5rf3tLJ3fS/ityMqHV/f/hQ4lXmedMJuBjp2RdU
	 BqiVvz3UM42szVxb6lw5bRWACsWbIr/awxi+OkD3+ILhaGt2lAJCxqfNkC5vRNRNbo
	 9t3Y/eS2SjBbIIZ6uClJ+79AHMY59rNVq1t4xdolrjzpCnaTfbMpmkkEQNdZp2OsoJ
	 cQZqJNXGbjZHITM+Yy3q6fZB4+uMlgd+2Y+AR1moMfTUFlklIroq2m81xJBs+TkxgK
	 dGeIQpHHuHxYP0Fcv71idtd04gCg0pAfd72l/P7M6/ie727ANqPsW156XjOhdznggS
	 QMNjqvG4lIdEw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 14:12:45 +0100
Message-Id: <DGSBMKY53C5T.3BRV3QI7KOZTL@kernel.org>
Subject: Re: [PATCH v7 05/10] rust: io: add IoLoc and IoWrite types
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260224-register-v7-0-aad44f760f33@nvidia.com>
 <20260224-register-v7-5-aad44f760f33@nvidia.com>
 <DGPXX0NEGDZ4.1PKJR9IWL2FS3@garyguo.net>
 <DGQ67S1NH3OA.2MS0YVO0UU2E2@nvidia.com>
 <DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net>
 <DGRWZVJNLLH0.39JYHZIIMC9XK@nvidia.com>
 <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>
In-Reply-To: <DGSB81ZE18O1.31CVVHMP38U2W@garyguo.net>

On Mon Mar 2, 2026 at 1:53 PM CET, Gary Guo wrote:
> On Mon Mar 2, 2026 at 1:44 AM GMT, Alexandre Courbot wrote:
>> That should be doable. Note that we currently support `zeroed` and
>> `default` as initializers, so having the same level of coverage would
>> require two `write` variants. I'd like to hear what Danilo thinks.
>
> I wonder if just providing a single version that starts with
> `Default::default()` should be sufficient? For most users, zeroed version=
 is the
> default version anyway. For those where default is not zero, it perhaps m=
akes
> more sense to start with default anyway; if explicitly zeroing is needed =
they
> can always do an explicit `::zeroed()`.

I was thinking about this for a while and also thought that we probably onl=
y
ever need a version that starts with Default::default().

What I still dislike is that the common case becomes write_with() instead o=
f
just write(). (Just to clarify, the name write_with() is perfectly fine for=
 what
the function does, it's more that we need it in the first place.)

Also, IIUC, if the value is not created within the closure, we'd still have=
 the
following redundancy, right?

	let reg =3D regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>()
		.try_init(|r| r.try_with_offs(load_offsets.dst_start + pos))?;

	bar.write(regs::NV_PFALCON_FALCON_DMATRFMOFFS::of::<E>(), reg);

It's just that this case nicely converts to write_with().
