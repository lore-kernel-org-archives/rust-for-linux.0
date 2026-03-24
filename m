Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1106A239085
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 19:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774379028; cv=none; b=sUyM+SCWb6rAR1GNBxl1mSl2e1EK97t6J2v9D0U8uPdulKhMcUeqv7PqJPBk67W4gouqHZyrjZOqQT4Z5d1Ah/iufKPCW9CVyxzh0mqXDk/aPfW58INb403JEGNxYjlWUlk4lGDo8uRQnDGBc4k0IH8lXtiJO84VeuEDLqRvVa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774379028; c=relaxed/simple;
	bh=Lan+kGAwuEYNhY2ObEOkvp3QoS0O8VEG8tmCtDH7f/Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=unnCQpI+kNt9/7+uReg/0I6zoBODLVTFkuTCJHP0GeViJkzipMZoxZbTbStxYThtQzEN6JTxgejNlAAUU2WNFVa2Ww/7k3ANgBe85FmlSzqsrD1J5kr5C3TXptU2H6gvjQPF1s51T0K8vKSiGrB4wDBNfTHD0FeUqsptwkeRihg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMX0xH1D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMX0xH1D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9DDC19424;
	Tue, 24 Mar 2026 19:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774379027;
	bh=Lan+kGAwuEYNhY2ObEOkvp3QoS0O8VEG8tmCtDH7f/Y=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=GMX0xH1DKqLEpcVmd1uRSFFqsch56bbcwwaz2WaIT+4jkboieSelxbopRYJW6mLbM
	 hC8/e4a7f73xuilZetcL27MJxlQR1qszEuPw2hfD+b6Q8yyGk5uFaR3kycygzk8v7W
	 7REiVPL5MY/bgdwM6DV+F/lqB5orEqJa93lvRFXm1nCqxSyx9F4JoaiE8dc+y6estW
	 Lt3WFwZVcvhN17GQipiFIybMNUHDJTX9y9U4aKavhy+9v6dcn+Fxma/QzS76XIm6x0
	 YYuXlNUTRLCfxjajGvIFM5+fNjFN8ni0sBxfrw8E2xkJzPl9j77aVHhX9x1SUaHgvS
	 7Io6GvTFT+FPQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Mar 2026 20:03:41 +0100
Message-Id: <DHB8V9G4DS66.2IDD04F8B0UHI@kernel.org>
Subject: Re: [PATCH v3 01/12] drm/tyr: Use register! macro for GPU_CONTROL
Cc: "Deborah Brouwer" <deborah.brouwer@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Steven Price" <steven.price@arm.com>, "Dirk
 Behme" <dirk.behme@gmail.com>, "Alexandre Courbot" <acourbot@nvidia.com>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260323-b4-tyr-use-register-macro-v3-v3-0-a87daf9e4701@collabora.com> <20260323-b4-tyr-use-register-macro-v3-v3-1-a87daf9e4701@collabora.com> <DHAZ380DRB8A.19SI1OUABRWTP@kernel.org> <20260324130653.74f9c2ab@fedora> <DHB6WU5SYXU7.2QMPFZG1KDOT8@kernel.org> <20260324191554.39485c08@fedora>
In-Reply-To: <20260324191554.39485c08@fedora>

On Tue Mar 24, 2026 at 7:15 PM CET, Boris Brezillon wrote:
> On Tue, 24 Mar 2026 18:31:42 +0100
> "Danilo Krummrich" <dakr@kernel.org> wrote:
>> 	15:0
>> 	31:16
>
> This ^.

Odd, never seen this in a datasheet so far. Anyways, makes sense for Tyr th=
en.
