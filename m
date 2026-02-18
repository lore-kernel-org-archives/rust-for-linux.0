Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1645F2F1FEA;
	Wed, 18 Feb 2026 20:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771447006; cv=none; b=oCZG57c1CpT10+zvhtiIJVj7zRQBICToc8J4cc03pig9rRunO5aDQdth0FKbEpOQigBTpKLj2tFKBBuh4ATLuGtAqHVW+5+JPh0z1OSJg2oSbkQLlwseQEdiU5E8gPYmo6Su+wezBSQ2a8KSADFMjVhZUrQDV/aED4wTdZBpnAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771447006; c=relaxed/simple;
	bh=18JDuWxcMloGOppyaobLfukhcGxYe3k28wKDmylYMos=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=L5/e2JlBGhvu978/tlW2ZPp4POGo5JyQsQcbokgefHepG7jUPihKPq9XzvY15j3nLhspR7u1jDZ8xGkATBf1fVgQxn/XxN+orCjPNahWubXNlqXEaAmWvjKehqLaqDS8fWkS8jlaW4H57v69RP6zi3OwUBMHvF5FUWreCLGyxsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWuy5q1W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWuy5q1W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EEBDC116D0;
	Wed, 18 Feb 2026 20:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771447005;
	bh=18JDuWxcMloGOppyaobLfukhcGxYe3k28wKDmylYMos=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=aWuy5q1WlWl85iqDe1yJc2m/l89ztz1IHwUovBdgtmPPFGExMpLhnRMhmqrc0GnkQ
	 Zn3nSox1NySTPohasF7zYIxOqrOZTNkxMiVFQJEFjfH9X4hpN80tyH03JCtjxLLYlk
	 u/0pNtiWZm+rRv08/X6Z/VU1egqEj+XHhAx15bM89nhjem0unx307Kc4YoRAyxAfeS
	 hGpxTxaV/5X0BNLuMnAHL4lWRbcbgpIJrl0p0OgaM2vPoBC89ZAZ8ZDok/RhSdq4a4
	 uVQVD3XI3FONoE+cLMMLKPKvS2HKwCVve+HrymNzMrmPHNIDuUm850fIR7CgAehkhg
	 RDRyJZOaoQwog==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 21:36:41 +0100
Message-Id: <DGIDJY65E35T.3K2GTNYGUDABR@kernel.org>
Subject: Re: [PATCH] rust: irq: add `'static` bounds to irq callbacks
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260214092740.3201946-1-lossin@kernel.org>
In-Reply-To: <20260214092740.3201946-1-lossin@kernel.org>

On Sat Feb 14, 2026 at 10:27 AM CET, Benno Lossin wrote:
> These callback functions take a generic `T` that is used in the body as
> the generic argument in `Registration` and `ThreadedRegistration`. Those
> types require `T: 'static`, but due to a compiler bug this requirement
> isn't propagated to the function. Thus add the bound. This was caught in
> the upstream Rust CI [1].
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/rust-lang/rust/pull/149389 [1]

As discussed, this will go through the Rust tree -- thanks Miguel!

Acked-by: Danilo Krummrich <dakr@kernel.org>
