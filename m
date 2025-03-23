Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED80718D65F
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Mar 2025 10:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742726740; cv=none; b=FvmnD9Rm+37qlT+yj6PiHyVIZC4hTstPEiVS0zgnltx/WjB2cuIue+9eZsSGiaxLuSdRbfLEq0INaWBq6S83f2+yAOA8hsm/l0Af8+eENz+/vcblOL+sRkUPKQFCYaVNq9wAQGejYgDk06zQl6hQ+z4yRBG3t+wTsnBFthohOzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742726740; c=relaxed/simple;
	bh=t7seGj/8iRdZjFgZVLRuU4txUrDvdMsUsU2TeufHYAw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=csEesmH/Hywjyae3hzmmsMGRcMifIpWuVMVBEVnZV+oceS6uZp6UrkGxFtsSXUVQEQw0KL/VYppbRaT2B4e2MVmH2HJ9woHGTttD6j96qWG6lywgLow/P/1bptl+i/E+jGLj9MJvMqsOphsjjYLkRSUWlLoE4fwyOlEq9P4++JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=g2e2tH6K; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="g2e2tH6K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742726737; x=1742985937;
	bh=t7seGj/8iRdZjFgZVLRuU4txUrDvdMsUsU2TeufHYAw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=g2e2tH6Ksl2g/rN86nmr3cVFHezD7lAiKLN5DvXboCz8ICnpdpSyo541zOHHr8udq
	 g047J3c7jgY0yWhu16G4ZZeakdt8KPP2ZiuaFM7RqPGwOJd7t68L82/3DXeWn9rbNW
	 3QFsL9ZpmqZRJOxzAv/UjyPNt/foYjNH3t9lofxWYXKRQaYOPp60gz5WAEx85MaaGH
	 rYCX1ovk3UPjVs+JUZVrE8emOy970EmVg4uzSfbcNGkBvmzNwFLjXX9dQDQPzNJDRi
	 qvhOjbiWLSee4vEbXpCVHFn+J0qTb12yZ2xFKDyluMFVuRZvTweU+vfSNEBWjbHmsc
	 gcbdNSJjPtkYg==
Date: Sun, 23 Mar 2025 10:45:33 +0000
To: Antonio Hickey <contact@antoniohickey.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 00/17] refactor to utilize `&raw [const|mut]`
Message-ID: <D8NL2FYJMGLJ.3DAF43L0TKNMW@proton.me>
In-Reply-To: <20250320020740.1631171-1-contact@antoniohickey.com>
References: <20250320020740.1631171-1-contact@antoniohickey.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: e181025f1fe4cbead6f091ca1c55bc8a4626fa38
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu Mar 20, 2025 at 3:07 AM CET, Antonio Hickey wrote:
> This patch set enables the `raw_ref_op` feature, which became stable=20
> in Rust 1.82.
>
> It then replaces all occurences of `addr_of!(place)` and
> `addr_of_mut!(place)` with `&raw const place` and `&raw mut place`.
>
> Finally it adds the previous macros `addr_of!` and `addr_of_mut!` to
> the disallowed macros in `.clippy.toml`.

Thanks for this series! I think you probably should send a new version,
since I did find several (very small) things and we shouldn't make
Miguel fix them all when picking the patches. I would wait at least
until one week has passed, since other people might still want to give
you some other feedback. Please also pick up my RBs (Reviewed-by: tags),
but only if you don't make big changes/only do the changes that I
requested. Also don't forget the rebase :)

---
Cheers,
Benno

