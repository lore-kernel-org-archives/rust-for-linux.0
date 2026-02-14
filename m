Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722412222CB;
	Sat, 14 Feb 2026 10:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771064623; cv=none; b=GQbgLMNrpn/OpGfF+Iv6G3oD0wkSanxH/WfIurv9JzVfvIQnFRdN3H2CfA/7K5HJrRchs7H15AQaIWnGmNfNUa1P0fKcWpX8vjFG08f/4v1s/8Gt3x3EBUPkdgZUxWfGm1tS3rn3RD30fAa3e9CsN2GcM7mM0/fKgFzqY/5KB9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771064623; c=relaxed/simple;
	bh=mFwrINfQcAhiVjT0jCwT7EGGi4XrpV3E2gUY++3dgvg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=Y76w6Tz+kgXbtd5pGI9QYvQWKKqWrhKSnyXBb5NzI+pMU+zxsCRrsqpcI0cHE1+L1ZziEaRdDOozfYC2lsGbtuOXg0d7YOPJfHPqk/ore+XEFEvuJF5JDXo++9Vau2+o90W7tCh3Hdpjs1FrTWc6PjxHA9OEkknOxnMKWQAHhGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aerLPC3M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aerLPC3M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA949C16AAE;
	Sat, 14 Feb 2026 10:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771064623;
	bh=mFwrINfQcAhiVjT0jCwT7EGGi4XrpV3E2gUY++3dgvg=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=aerLPC3MzFtnb6hia+gTcAMeOw39OqBbNczV8MAcmaWKap11fCZ2oOhpblvUzBhny
	 W22PdFW+dhhfZiGPuO2plc+TO/WR4LmqzLucaJhtjcRqkMZZAGFUHjIjwXHye/d4Hz
	 1Wp+zbixi1XMZA5MCqVlYLxiwfPudaGPX6oMr9kQflyub42Abb6tmpwChV+byoxJwZ
	 ZqLKwokNTypp13fIy9LaLZjzlMgbDzN7hNkYYwEuoszJT3MiUFpDQlel/AKsLK5wDr
	 5sIUJb8pl9xR7yLbz27aTRLUW8iYOyvcEH+q7Pt/B28EGAYp1mElLiAWVZyVURLA51
	 u++wdTTS5mtEg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 11:23:39 +0100
Message-Id: <DGEM0E00MCEP.130GP2WIISA3V@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Benno Lossin" <lossin@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust: irq: add `'static` bounds to irq callbacks
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

IIUC, the current code will not compile with a fixed compiler, right?

If this is correct, this needs to be backported; I can add the Fixes: tag a=
nd
Cc: stable when I apply the patch.

- Danilo
