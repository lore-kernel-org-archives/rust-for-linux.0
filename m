Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94973C1094
	for <rust-for-linux@vger.kernel.org>; Fri, 25 Sep 2026 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790323231; cv=none; b=l+iN/rZemkq+kNe2qUaC1KLlaAkQy2nj8489CqepIibts7SB/0YxKV32p/2kyIsMn1oyYI2V2+o6kdnNAWPFpfGEMHtUxLDqP6eKS2josSuZdcrKRyCk8op+iW3D4tqzYfto1yrdIO0hoxw1ItxiWWhgRs46b7AE55nyfu5MKk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790323231; c=relaxed/simple;
	bh=l93v5ZjQlwhn5zWRTUOQTk4YP3IA2Zg6LGn23m20el4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DDx44x5drBjxvyfkEMeaPKN3/W5gbW0ClqGaKa193Dtt5zIZ0kWsqXSRfNZDdi9kP+6fiMcQ/gSC3jdW+4Lc8SdFT/dbZA56tOSQq2jE7fm9HJ40z4K4+mHS6nH9NacxdXosFUTFLBlEf0zfTmM8GhEreCL9tFanaq/7TxolBqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ih+B2A0g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ih+B2A0g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF111F000FF;
	Fri, 25 Sep 2026 08:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790323230;
	bh=TruTDWhu8uht2bWLPtYdcwD3sl/0D/uUokxSYQyR1bE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ih+B2A0gAsHIkkeb+tc7AE3DLI9UVAOj9dP26J3eGqMCXv08oSPIxCIlgtmXgI1dh
	 PB456ESqb/4IJi50jy4qbZLvKlUM3OFtizLRqnm4k+G/ZP/9eKR2N8mUNnRg3ga28F
	 v2m2WIjCSfhWb3QNOeAglslizixkhatGftQUuvH0/6gyOXjKr3xvZ6j8s97x4mxjzb
	 UDE8iJ9qlBV1/vinXPFe7FKaarBEtM+FaCBqZV5x7uG9Jwc6Qwtcp5/yDcYg8MeM0J
	 8Bu/spD2WR/slx517KwkKYhxUE0oGAI0vprlb5AAC17Fu7UNyZ7tZrg0zdZcTccteg
	 a9jCWTR7EwhIw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, gary@garyguo.net, ojeda@kernel.org
Cc: acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v4 2/2] rust: time: add Delta::to_jiffies_timeout() for
 timeout conversion
In-Reply-To: <20260924232530.446588-3-tomo@flapping.org>
References: <20260924232530.446588-1-tomo@flapping.org>
 <N-9g7-JCEv-O-X7-hryv99BRSZvftBvpmaAmWdwRp9b9Gi64FWr6GAtnUToRHlX86lCBJgEKPQine1a1NsJcUg==@protonmail.internalid>
 <20260924232530.446588-3-tomo@flapping.org>
Date: Fri, 25 Sep 2026 10:00:19 +0200
Message-ID: <87zex52224.fsf@t14s.mail-host-address-is-not-set>
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
> The boundaries of __msecs_to_jiffies() and nsecs_to_jiffies64() depend
> on which HZ branch is compiled. With CONFIG_HZ_300
> nsecs_to_jiffies64() overflows after 64.99 years, which is less than
> the 292 years a Delta can hold. With HZ=1000 a jiffy is a millisecond,
> so __msecs_to_jiffies() returns its argument unchanged and never caps
> it at MAX_JIFFY_OFFSET.
>
> Compute the conversion in Rust with mul_u64_add_u64_div_u64() instead. It
> returns (a * b + c) / d, computing a * b internally in 128 bits, so
> ceil(nanos * HZ / NSEC_PER_SEC) needs no input clamp and rounds once. The
> bound then follows from the arithmetic: with HZ <= NSEC_PER_SEC, which a
> static_assert() checks, the result is at most the nanosecond count.
>
> Unless the result saturates, the value is rounded up, so the timeout is
> never shorter than the requested span. It saturates at zero jiffies for a
> negative span, i.e. an immediate timeout, and at MAX_JIFFY_OFFSET, the
> upper bound the kernel uses for a jiffies span. Since MAX_JIFFY_OFFSET is
> derived from long, only 32 bit can reach it, and a saturated timeout there
> is finite, so it can be shorter than the requested span.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/helpers/helpers.c   |   1 +
>  rust/helpers/math.c      |   8 +++
>  rust/kernel/Kconfig.test |  10 ++++
>  rust/kernel/time.rs      | 105 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 124 insertions(+)
>  create mode 100644 rust/helpers/math.c
>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 440fb7638e3c..08374b163774 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -73,6 +73,7 @@
>  #include "kunit.c"
>  #include "list.c"
>  #include "maple_tree.c"
> +#include "math.c"
>  #include "mm.c"
>  #include "mutex.c"
>  #include "net/genetlink.c"
> diff --git a/rust/helpers/math.c b/rust/helpers/math.c
> new file mode 100644
> index 000000000000..e2ee29bcce0f
> --- /dev/null
> +++ b/rust/helpers/math.c
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/math64.h>
> +
> +__rust_helper u64 rust_helper_mul_u64_add_u64_div_u64(u64 a, u64 b, u64 c, u64 d)
> +{
> +	return mul_u64_add_u64_div_u64(a, b, c, d);
> +}
> diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
> index e6a5c7a795f0..0087749995d2 100644
> --- a/rust/kernel/Kconfig.test
> +++ b/rust/kernel/Kconfig.test
> @@ -83,4 +83,14 @@ config RUST_BITFIELD_KUNIT_TEST
>
>  	  If unsure, say N.
>
> +config RUST_TIME_KUNIT_TEST
> +	bool "KUnit tests for the Rust time API" if !KUNIT_ALL_TESTS
> +	default KUNIT_ALL_TESTS
> +	help
> +	  This option enables KUnit tests for the Rust time API.
> +	  These are only for development and testing, not for regular
> +	  kernel use cases.
> +
> +	  If unsure, say N.

Why would you gate out the tests? They do not look like they take long
to run or anything.


Best regards,
Andreas Hindborg


