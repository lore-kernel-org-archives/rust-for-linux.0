Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DE1246BCD
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Jul 2026 20:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784320312; cv=none; b=HstAw/defSHuF2uF4QnTZOgz0jWrZVFNwfxC7CVBQfaepBqSn7lohyzayxeWyulwQHYl7g6DidJnPgFHy5yelgAEO3lFEQnQE3HTl51rRLjkaSA7BS2YBFEEtvj1OH6nFzKCEBodgY6D8IF7sYyhqeX5aTT+O2Xwz7cRv/tYDCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784320312; c=relaxed/simple;
	bh=A6Wo54h7aA/q5dNpBpmr8zM1B2DQhlJE3d4IGWU43os=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fDhv6iCkO078723kzMrLTq0R5NaGIQMN/7GqOQQzw/dkpbJAmuv+ELkrJqZ93K00MfqqexgnMu/OgHdYDHegeW7a3b5M4kDubOoqJp1nVv7Otc/JlEotxFUK2U/5MG3c2WMpfc2c61+XVMFQ2NIH348Wg1pmC6twjpXIhvU0Z04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nPfLpCPz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nPfLpCPz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F62E1F00A3A;
	Fri, 17 Jul 2026 20:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784320311;
	bh=A6Wo54h7aA/q5dNpBpmr8zM1B2DQhlJE3d4IGWU43os=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=nPfLpCPz0KMWhgV+0ddgwspFN4OOLQBEXY/+19uMqOQ4tlwzU1h9MCIC/orFbA7zJ
	 m4A0tVUdLlDa82Sv+5KkzcSUuJOYdjpE80Ox24iadXYOdtJ8XNX4ImdwpXUqkCv4ka
	 htuOb1fxJIsIsRWs+xo4AzjRZTL/1H8cAdQTwaUaDU/8/3JUMwQpjzwgWdIbpIAy+Y
	 FXRaovkgUXR9CBmA3H7Y9CXQqgeZ3qx2u4E5GxFgW1uSUL85xM5AohPt5OhHkRr/cn
	 iPNdEfOtMKZEwBCHPZ1+0Redw/NjidLAIEraTUacsF7LkgxxhMM811MadZ/dIfP5s0
	 ZIl7X/+mYaAfw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, ojeda@kernel.org
Cc: acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, gary@garyguo.net,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1] rust: time: fix as_micros_ceil() to round correctly
 for negative Delta
In-Reply-To: <20260713225235.3243480-1-tomo@flapping.org>
References: <N3Mcf328j6hi7HCJTp14HUC6-cxRUNgQLjvAdkFhIuZM-yYM91SYBYsW7kEVHRkqTzm1B3zgl5Bat4dpSIfXtA==@protonmail.internalid>
 <20260713225235.3243480-1-tomo@flapping.org>
Date: Fri, 17 Jul 2026 22:26:33 +0200
Message-ID: <877bmtgy6e.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> The ceiling-division idiom `(n + d - 1) / d` only produces the
> correct result when `n` is non-negative.
>
> For example, if n = -1000 (exactly -1us), the old code computed (-1000
> + 999) / 1000 == 0 instead of -1.
>
> For negative n, truncating division already rounds towards positive
> infinity, so no bias is needed in that case.
>
> Fixes: fae0cdc12340 ("rust: time: Introduce Delta type")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Acked-by: Andreas Hindborg <a.hindborg@kernel.org>

@Miguel, can you take this with rust fixes?

Best regards,
Andreas Hindborg


