Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955643451AE;
	Wed,  4 Mar 2026 11:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624353; cv=none; b=NvwutJy71a2lvZZYeHHj/05M3yJIOGJoCJst6Vb+X+y7PPDfGMuIYymhnILIuSf9+7z5kDtAk0VVD5Ifs1JA42kHhKJ+b/GPxj0LyZ/1Gwz+ubKSKMAmB84OKV7qI5dfAg1h8aSOi9vBJriRbu1u3BZPoRethGHkxpZw4DWA9wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624353; c=relaxed/simple;
	bh=UuegjYjNYdFZYA27dchsMoBmg0FJygSXcjoy8zrEaVM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=hqHYN4X4wkjKk3NdD/+J27tq5Az13faGzRFhBA+dbgjy/gmUObm2DOG0pITthbbYBNVDT75s2IF7IAa7fiv7a2BBydjovFNiytbHMu8VatX3L120PwBEsDC3VP84r5XuZDTJmFVZqH4AshvlAtBrYLicb84ceydG5G66nGUDs8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hy2HOrsP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hy2HOrsP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF2DC19423;
	Wed,  4 Mar 2026 11:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772624353;
	bh=UuegjYjNYdFZYA27dchsMoBmg0FJygSXcjoy8zrEaVM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Hy2HOrsPB2b4JElrQXZZO2/AwB1zsGmrhScOPZtBCa7DX8h2EXtAO7CrARdqoG8YT
	 gkSqDunPagYps1kxEXIgVQFw7m2Qbt/sSh62rRVZMi63VwQ1sCfc90uYk1UIDJiWrg
	 /aX1Gt1HLFzk05DW7yhl38EwR7IfUrkqujxbWMAtAJ52X7qKILjLqjVPMQtLLVsK6d
	 h7601dTjKVpm5KTzJT1t5wrf2vvf6/3tFIDuMBhs125oZhEuFm6dpN/LAIp4pCwgRV
	 H8bCOF0aWTK9E+FOROz1kQX6yvoGXDz6nCTg9I2T/8pMd/zI0ZqHl9ncEg9DA84I1F
	 SdR9qICqcPcJA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 12:39:08 +0100
Message-Id: <DGTYVZMRVLLE.3HQVL7ZT6MU7H@kernel.org>
Subject: Re: [PATCH v5 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Zhi Wang" <zhiw@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
 <20260304-cmdq-continuation-v5-2-3f19d759ed93@nvidia.com>
In-Reply-To: <20260304-cmdq-continuation-v5-2-3f19d759ed93@nvidia.com>

On Wed Mar 4, 2026 at 2:42 AM CET, Eliot Courtney wrote:
> +    fn allocate_command(&mut self, size: usize, timeout: Delta) -> Resul=
t<GspCommand<'_>> {
> +        read_poll_timeout(
> +            || Ok(self.driver_write_area_size()),
> +            |available_bytes| *available_bytes >=3D size_of::<GspMsgElem=
ent>() + size,
> +            Delta::ZERO,

Isn't this either creating unneccessary thrashing of the memory controller =
or
unnecessary contention at the cache-coherency level?

I think we should probably add at least a small delay of something around 1=
us.

> +            timeout,
> +        )?;
