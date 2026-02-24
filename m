Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEF3376BE4;
	Tue, 24 Feb 2026 11:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771932806; cv=none; b=Z5otRGHfpvoJ1/uL5CHDeto2jQoHpm6xrqu1EP55ukn5ThPkTChSsU4g/QyS943lHu3MlpofxooXV9jUSHR2Nyy8yjzyNSZBIR54To2r1RPmRIN+30ZUIMbIod4gVbE3PWa2r7snpFqvCLZupMqlNMsdcCUvN3VydDIskPQnU7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771932806; c=relaxed/simple;
	bh=QzfzcxJBOsCJcXxy0t7zbre83Q4iZh8xCkUGtLitrB4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Z/s1unb3DX0fj27/1nsrxTbZGhZc5NWCTwHI/BiHgulILn6KhhU4qGY4Rmc0Rd2U3WRtY3oQY7JEQ0G8yPNt5UQ4p04yfP1rmuVPnejj85fN0WRZ87E7KEmziaGOtoNq13QCgCT2LwiUgVHLt/2LN+DdT0A19r66qmbmjBvBYao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8bfJJXf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8bfJJXf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BE9C19422;
	Tue, 24 Feb 2026 11:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771932806;
	bh=QzfzcxJBOsCJcXxy0t7zbre83Q4iZh8xCkUGtLitrB4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=P8bfJJXfWLBfo22HBXBGNGsgK5jxiY46jyTy3olbNwWWffjbxwJfb4ett9ZUCSGpJ
	 Tgy8HSLWAWYhbxvUc4NF6zcEtUZ24xxznTMXbwVwmf4YKJ2XmFho3ChYN4KFp8wc8E
	 wlis9RCorX+EGy84mvKEgK1fSO/Gr10JYi+hsiY6vxAjU1HAXFCJe7Zm+Uws96ayeG
	 VYH2cOJMFUAnWVCA2ggVFnLpQWbpLn5IdIlevkcDhv5AJrAgPS3jzXCeb4eWvu+qAK
	 O6VtbEs+5VkcAjrmJQSH3BjxFB7PW739IoV3rPqCcQrPVqKXzzwTmb4XJwi/ddr69O
	 tcUG2qPQ3Ucnw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
 <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jens Axboe
 <axboe@kernel.dk>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre
 Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH] rust: str: make NullTerminatedFormatter public
In-Reply-To: <20260224-nullterminatedformatter-v1-1-5bef7b9b3d4c@nvidia.com>
References: <EtyJ8MYDqiz1ox6T4ZRavP9CrRbItP-Amr9lr4bIMYdJq3DEPwSFGGLjwNCgqZs5qP630NK5VwyiJzOt37PAjQ==@protonmail.internalid>
 <20260224-nullterminatedformatter-v1-1-5bef7b9b3d4c@nvidia.com>
Date: Tue, 24 Feb 2026 12:33:13 +0100
Message-ID: <877bs22x6u.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alexandre Courbot" <acourbot@nvidia.com> writes:

> If `CONFIG_BLOCK` is disabled, the following warnings are displayed
> during build:
>
>   warning: struct `NullTerminatedFormatter` is never constructed
>     --> ../rust/kernel/str.rs:667:19
>       |
>   667 | pub(crate) struct NullTerminatedFormatter<'a> {
>       |                   ^^^^^^^^^^^^^^^^^^^^^^^
>       |
>       = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
>
>   warning: associated function `new` is never used
>     --> ../rust/kernel/str.rs:673:19
>       |
>   671 | impl<'a> NullTerminatedFormatter<'a> {
>       | ------------------------------------ associated function in this implementation
>   672 |     /// Create a new [`Self`] instance.
>   673 |     pub(crate) fn new(buffer: &'a mut [u8]) -> Option<NullTerminatedFormatter<'a>> {
>
> Fix them by making `NullTerminatedFormatter` public, as it could be
> useful for drivers anyway.
>
> Fixes: cdde7a1951ff ("rust: str: introduce `NullTerminatedFormatter`")
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Best regards,
Andreas Hindborg



