Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7D73CFF76;
	Tue, 10 Mar 2026 16:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773161982; cv=none; b=g88mOzrfzg7/Mi23pPJmA2PjHAADYx8Q63VxWI8qpF4me9R15B74AKJjl0p8t5r5yP5YMOt+X+MFg4Tx1Esxpi6ivwkqXuGCqmgKKnHn2V1FtQPFbJ71c3M9ev8m3jLKAFqToA/8bbIGnJ7bLTUELghDA4MykHvFbkaEgAB5YIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773161982; c=relaxed/simple;
	bh=j7JSmT7+GsZbGJSZshLzO0/k9v/UpXZnOS8f5fKVPns=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=i9xkwCSIDHa+7la+FOE20uU+v4+s2I15CdtlgFj1zj+48JjFaK6bZB/OW+fTTM3LehUzIVowQ2lIvlos1B4o+lv7eBVuxB6qHPRGSaxJxgkU9BunhYd4OOluQB1BBZjRp6Hj16bjIs1n7YrNzm2INsa5i5sV4qTSfA13vSj6zmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxVZaH6a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxVZaH6a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9F2C19423;
	Tue, 10 Mar 2026 16:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773161982;
	bh=j7JSmT7+GsZbGJSZshLzO0/k9v/UpXZnOS8f5fKVPns=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=TxVZaH6aY48pEX/jSWowCsUVoavdI3fovFN/NABPXushIwqmUI8VMsH/7IFEcx3gw
	 fVNMEgmaC2eI2dfVfVkyivLpY1YIyseK39OeWToyAPXw5BlxBATAWKuCEA3lBHHFlN
	 2QKWUYmte3Ct9Ivxjw8EpE4ZrbeqUuVdw/OnvkoQBUaGk0Pj3RhwxzWJfZUK7E702e
	 iLHDiyNABH9inwdawmpSvjgC9kwq9HHR9MNO8XC4sdgwNPjXAlXPIoE2ctnS79swH6
	 wSVgWsC0GNTAR6HpSdfn+KgWXG3ULXFdkI5Fj870+Zpc5FIXGYiZ5oYosMUjsiRC+O
	 /2Jskau+6W3Qw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 17:59:36 +0100
Message-Id: <DGZ9GMLXYZZ5.17CYRGI7NXGC7@kernel.org>
Subject: Re: [PATCH 1/2] rust: sizes: add u64 variants of SZ_* constants
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260310023145.120037-1-jhubbard@nvidia.com>
 <20260310023145.120037-2-jhubbard@nvidia.com>
In-Reply-To: <20260310023145.120037-2-jhubbard@nvidia.com>

On Tue Mar 10, 2026 at 3:31 AM CET, John Hubbard wrote:
> Drivers that operate on 64-bit address spaces (GPU framebuffer layouts,
> DMA regions, etc.) frequently need these size constants as a u64 type.
> Today this requires repeated usize-to-u64 conversion calls like
> usize_as_u64(SZ_1M) or u64::from_safe_cast(SZ_1M), which adds
> boilerplate without any safety benefit.
>
> Add u64-typed constants (SZ_1K_U64 through SZ_2G_U64) alongside the
> existing usize constants. Every value fits in u64 (actually, within a
> u32 for that matter), so the as-cast is always lossless.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Feel free to add:

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Link: https://lore.kernel.org/all/DGB9G697GSWO.3VBFGU5MKFPMR@kernel.org/
Link: https://lore.kernel.org/all/DGHI8WRKBQS9.38910L6FIIZTE@kernel.org/

As mentioned in the other thread, we could also make this GPU infrastructur=
e and
have GPU specific usize / isize types.
