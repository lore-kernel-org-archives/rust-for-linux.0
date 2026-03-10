Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD632D3739;
	Tue, 10 Mar 2026 17:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773163259; cv=none; b=IQPUW+cgOiNGaX9Ny0tfmbrfPA6i7o+LhbapfMMowEDnNv6ScIrbka8L2MwhmoUjYlf/Q5gDBcwKElNSrYgWux91BUQaOvtGw/erqBQ3Tu7dcEGIKinEg/3muuNJbrRRrMXRLDs85Mj6XmgyVSf48oY54eK+T0lQIIB+u3nLxuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773163259; c=relaxed/simple;
	bh=uStv4x267+8b2Yp3AuHgiZi+gndeJgu39tqYsG1t8As=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=spZcMBDk7Y6ysm8lSlAad9FjKpXZAETee38dGrWJ/FeR84XEUC7SHJN9R914EXhuCWPjXcqi6Qv4WGCqISJJDYDtt6RFicQOKN6ZRygGDdOJ3n53EVsEz9obtDd3k5QtsLAritcdmL1oySRFXFU0PD1eg97vZkMqFxBQO9wCqkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wk9tdDFx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wk9tdDFx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF9CC19423;
	Tue, 10 Mar 2026 17:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773163259;
	bh=uStv4x267+8b2Yp3AuHgiZi+gndeJgu39tqYsG1t8As=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=Wk9tdDFxCzyo3syaCqm05uAoTmfcYs24ApmmUD0kXu8n9IsFfMR784xzPWSAh0m6h
	 iz2y5N4glemoeNGIa5vI8ZFad1qfVzogi9H2My9IUNLAglrFsiAbuxDTGNKV5lKB+N
	 umIAzkJKWDFQpdnjixW8bsoerbEOHqP9AvCfbz4lDBq0m9JC6UTnlywR7f2ZUctPOw
	 OdBRFjF22SjPBCWk1kQCuZ94tDpUnX3jZte3ITBuHMiYiQ34hcO/dG4415SbJ3O4Qh
	 ZfhzxrHbAiKTvaf4vpm/twrEPsozCvQh1ZMSd9CRj7c5Op0rbxFtr9E3Bw3epGFD/T
	 G6/z8qpR5Ztbw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 18:20:53 +0100
Message-Id: <DGZ9WXGUA19W.RYEM63UQQ358@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v8 00/10] rust: add `register!` macro
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Yury Norov" <yury.norov@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Dirk Behme" <dirk.behme@de.bosch.com>, "Steven Price"
 <steven.price@arm.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260310-register-v8-0-424f80dd43bc@nvidia.com>
In-Reply-To: <20260310-register-v8-0-424f80dd43bc@nvidia.com>

On Mon Mar 9, 2026 at 4:13 PM CET, Alexandre Courbot wrote:
> Alexandre Courbot (10):
>       rust: enable the `generic_arg_infer` feature
>       rust: num: add `shr` and `shl` methods to `Bounded`
>       rust: num: add `into_bool` method to `Bounded`
>       rust: num: make Bounded::get const
>       rust: io: add IoLoc type and generic I/O accessors
>       rust: io: use generic read/write accessors for primitive accesses
>       rust: io: introduce `IntoIoVal` trait and single-argument `write_va=
l`
>       rust: io: add `register!` macro
>       sample: rust: pci: use `register!` macro
>       [FOR REFERENCE] gpu: nova-core: use the kernel `register!` macro

I did not look into the root cause, but fetching this patch series my build
fails due to a build_assert!(). Maybe you have CONFIG_RUST_BUILD_ASSERT_ALL=
OW
enabled?
