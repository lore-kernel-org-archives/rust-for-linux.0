Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150723D9540;
	Mon, 28 Sep 2026 19:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790622736; cv=none; b=cisRut7JJOem/gpH+iS6nztcMmrULjOGKRTUZnEqfE/SUizY94XZMMuo3INNzO8YJW/aX/PktLwIQBB288nn/QA4tKz0zsSUm3B5YhJAqBj/lfDvNCd+m+M+mssuQ3MXPNH1zH0T+oYsOe3/ExqQqev1Qp7AP3SVCwGJbRWM/8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790622736; c=relaxed/simple;
	bh=UDe1ev+VlarU4eURYiU+Fb8rHe0uCwojbx7hz7J1g7s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MdN/eQgM2ZOrD9pMjo/SdKWSBfQjQS0On++QCQJlrE8Uxzurml5c4zQ0NhhEUgGbkL423XVQgriqy4Qfm7EFOcBzFdFcGnYOLhPiOIdW6WnkVhoBLIOOS8xVyJyfmI/yyS40WtjVyHrLh1lHmR/PS/dAa6ukt1zgcQgAxpc1eps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVitjNm1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVitjNm1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA0971F000FF;
	Mon, 28 Sep 2026 19:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790622734;
	bh=0qdQO8UFr1vKyq+5eWRIAPV7IK0gMPFajZw/n7BRN78=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=PVitjNm1XpSJo2Q448uXbRmskKoGxKn/oXjw+2ValSL/svqizzzMrSyjxjVGUFhky
	 o61BMbl4g3gmA24aWJjb72rcri7ouWTA33K+QsHtRlfgB2/gjQIzJytBRTAxp3QDip
	 VMOSWF/aE3qEf5un2aq7QV1lAYvKVyVlby4ApsTJ0mcErjHmtus1XBZF9Cf7y+BxIl
	 eshVD+TtUj+6xSmbJxeu/ursm4lPvW3y1KAFC+FYyDc/qB2olqP40UaG+HFVXGxmtO
	 GPScSnwGW9Ztl5GsyE9MF6O3XWG3FttEzk83UsMzZ7S9apbBHSka8DoAzw3W1Krj7y
	 plkPMl+3mCNOw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: chenhan <chenhan0017.work@gmail.com>
Cc: ojeda@kernel.org, boqun@kernel.org, fujita.tomonori@gmail.com,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: time: make Delta division and remainder fail
 consistently
In-Reply-To: <20260928183925.1315274-1-chenhan0017.work@gmail.com>
References: <GrS88TFpjifccsmrblR3hAxYF6f4xInMyFabclrH0IMtQKZWF3-tOTg-CWN-ZFKrgHY8G2kAArtkzeGOx2k-OQ==@protonmail.internalid>
 <20260928183925.1315274-1-chenhan0017.work@gmail.com>
Date: Mon, 28 Sep 2026 21:11:55 +0200
Message-ID: <87bj9htclg.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"chenhan" <chenhan0017.work@gmail.com> writes:

> On 64-bit, Delta division and remainder use Rust operators, which panic
> for a zero divisor and for the i64::MIN / -1 overflow case. On 32-bit,
> the C helpers do not provide the same behavior, so the same API calls can
> return architecture-dependent values or emit a divide-by-zero diagnostic.
>
> Check both invalid inputs before selecting the architecture-specific
> implementation. This gives both APIs the same panic conditions as i64's
> `/` and `%` operators and documents them in the public API.
>
> Tested on x86-64 and ARMv7 QEMU with CONFIG_SAMPLE_RUST_REPRO=y: zero
> divisors and i64::MIN / -1 panic for both APIs, while 10 / 3 returns 3
> and 10 % 3 returns 1 on both architectures.
>
> Fixes: 4521438fb076 ("rust: time: Implement basic arithmetic operations for Delta")
> Closes: https://github.com/Rust-for-Linux/linux/issues/1254
> Assisted-by: LLM
> Signed-off-by: chenhan <chenhan0017.work@gmail.com>
> ---
>  rust/kernel/time.rs | 103 +++++++++++++++++++++++++++++++-------------
>  1 file changed, 72 insertions(+), 31 deletions(-)
>
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index 6c0a5e8090d0..55c90365ba73 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -405,21 +405,65 @@ fn mul_assign(&mut self, rhs: i64) {
>      }
>  }
>
> +#[inline]
> +fn div_s64_or_panic(dividend: i64, divisor: i64) -> i64 {
> +    if divisor == 0 {
> +        panic!("attempt to divide by zero");
> +    }
> +
> +    if dividend == i64::MIN && divisor == -1 {
> +        panic!("attempt to divide with overflow");
> +    }
> +
> +    #[cfg(CONFIG_64BIT)]
> +    {
> +        dividend / divisor
> +    }
> +
> +    #[cfg(not(CONFIG_64BIT))]
> +    {
> +        // SAFETY: `divisor` is non-zero, and both operands are passed by value.
> +        unsafe { bindings::div64_s64(dividend, divisor) }
> +    }
> +}
> +
> +#[inline]
> +fn rem_s64_or_panic(dividend: i64, divisor: i32) -> i64 {
> +    if divisor == 0 {
> +        panic!("attempt to calculate the remainder with a divisor of zero");
> +    }
> +
> +    if dividend == i64::MIN && divisor == -1 {
> +        panic!("attempt to calculate the remainder with overflow");
> +    }
> +
> +    #[cfg(CONFIG_64BIT)]
> +    {
> +        dividend % i64::from(divisor)
> +    }
> +
> +    #[cfg(not(CONFIG_64BIT))]
> +    {
> +        let mut rem = 0;
> +
> +        // SAFETY: `rem` points to a local variable and `divisor` is non-zero.
> +        unsafe { bindings::div_s64_rem(dividend, divisor, &mut rem) };
> +
> +        i64::from(rem)
> +    }
> +}

We should probably find a better place for these. How about
rust/kernel/math.rs? Opinions?


Best regards,
Andreas Hindborg


