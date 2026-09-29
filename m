Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342A51624C0;
	Tue, 29 Sep 2026 07:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666765; cv=none; b=gcPiJX7HBXlOjCyW85kuFuqUydwDvxdglGu9O4KD+OoWkSM3AwOMlqJ/dwQ1+z72bOw58EU4PDLapAkVqkT/li/Ee0B2SprYudcgErX8wROD1XOF/y9KzSpIvjejiinBoaupUhoqV0lGnFOLUaFnq1Hx6KQbAGl7EWG6JvQpCf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666765; c=relaxed/simple;
	bh=X7QbO+XbGFyPk5fkCa7IaxSBnkBT8QKtOPrTRZ7q/ys=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=POjDLZbrVf+G/m1qf20dpM1dvdk2aSUShvpJRUAIABcADDE5oV1LtufOwh7EtxW2zuvIFm7zM8GPfeBqqfC/SGA9MSAYgN11vc3VcewYUIouuM0WnmVexv/E7Fo5GRdN2t9+C4KjdiXdmG47q0tqDP7wIH/DSSvneWANcy6r+Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=iB+lxOtM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XVzMClpe; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="iB+lxOtM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XVzMClpe"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id D068E1D00125;
	Tue, 29 Sep 2026 03:23:44 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Tue, 29 Sep 2026 03:23:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790666624;
	 x=1790753024; bh=Mw5W4tvYHaaAUXeMmwvRwuMx0PsQItie+sauG+0Wdec=; b=
	iB+lxOtMrYaDTBYXYWUg56IgWXkDx+IaAEYrCVvrlBfhI9rJfZyi3zHYojmcEVpM
	uuhQfTsnq9aus4UWYnZUDDGLXLg8aSZx/YKAjRbylyz/Fuz/Gj7QR3JHZ8Zm3ipa
	38ONt3GMS7De2A/UQ9fpIp79AWhZ6hVwAqB/lKgMtppu7dfXlvg/wRCctDlgufqg
	v+HR32Q7U2s0vWAjYfWFbsrr9kYdAYta914hhG/6SA85c60jc8dZ0uFAeu4sHvQk
	dYZSqdwBOF5NfUgGKf9BBGTPPzIN6TyjJXAirlNRDxlAf09cEyWfkBxtovVCJM9J
	mqNoUx4OyUsPiMmxGDH4mA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790666624; x=
	1790753024; bh=Mw5W4tvYHaaAUXeMmwvRwuMx0PsQItie+sauG+0Wdec=; b=X
	VzMClpeWXZ6Djy5Oej5shdtYJo/NAhkoLIhOwkCf961PmTZhl6tte/V4wwEedI2g
	6MM6cbOJ7FTE+mOC5uWi3FJVR1x7k75EuPIAUz44KkU6uilaw0tYM/rhYnWaPS4+
	grgQpFTeIJo37Z7tJ3blDxH5nSSwW9qpL4hegF3yUFONJiDSNZYWgsrCMUaz9n/H
	TKXEdfCdZsNdw9fR5tTsKxwEutu+EX9OL3aPjSRavS4+pKEc1abmnJcLddcUF7N0
	dAqC4eTLzTb9OzVWSDiEkzKkTSqftyCi9dWD/hdurlM062K/akPsaskyPonxgKOT
	iTXdOPzVxS2R1BLOPUqoA==
X-ME-Sender: <xms:gGe7aj83RZXnfXWXpt34BXUPOtKXwv5yEWuihqV-2OzIva4xFVJyrQ>
    <xme:gGe7agaO3tyxFq-5T3Kh9xvmILtBsoImZwvKleSulhM5whcFHYGXM_klxjezX_nvZ
    BMEf71PtvVr0XQqYlOfkK_Xf5dsASIsYlL0s2ncvpfMf2RRBwJI7h0g>
X-ME-Received: <xmr:gGe7avOwmGeyzDQYiQo4NiI469DtXvm-0S8yQBg2oz8j7Q1bxakzaSAIWwziot8ozW_VsXmm74s7NrjKrlU9DUg5>
X-ME-Proxy-Cause: dmFkZTFeEgcuu0MMkygexmg/RnOOFu5zAFpnll4c2lZ/TR4HBgafKMmOxMoAPnB2AzMWpQ
    hB1EmRlX4cKCBnvJaSuvfYP59eWFB6yxDrdNR335HGlMVIEa8qTHN+lEK1wjpukgL/nH5t
    5R0u2JMzeK2sqQ0w97PQ23kCzWdmx32OyAecuD+CncOdmra5MmS9TIbC9tiEPWozzgtklx
    W4HQdt1Y/FFlUUXnwoMR1JhMf8nOMWJMoJCPlIGTIBZwsRdxsa/dgcHfGvdOz3HEGDVQxA
    RkMevHyf9dcSTTtEQPgZ1kez4JTFHyFti29Slrcj+SjlHG40OnBSUxY5Hx6I8aEMXwNHnM
    oPx7hspa+eiyw3EbhqTR8kAnSTBU1YN2ivsflsuIY/GpLmuEoYnspiKPJH4gpWsWzmOTWC
    mxFcMm6Wx3NBXMp/QqXysZq6lqcQa+rRMRNZc+5GbdkPT89lOMsMXu/j3MsMKK7U2W2J8d
    m3VvP2edUXWcNccIkULaHklKv1cFm+tEBqIUNMJucH3ktT+zNUr+45BmV0iwPvG71I7yhO
    cbS45UegQtjpy2uR2GfuI+9rV/KiCwNDKxtY2DRNIJJXGPS5FMr3qRUFWMb3Q4M6I9aG6a
    q7UzxzFSqVsYWigLYICmPa2rnEe+MBAdg0U+wWdtcdhy+USJy6+xKyzOPe3g
X-ME-Proxy: <xmx:gGe7akAJT3fWW-hu0r9UDzIiZx_MzE-1I4s_32Y62Te6EbdyZehRgQ>
    <xmx:gGe7auLL0ElF-ebmoam0TE9LcQIFQ8zDhADJ6WIK_dyRcl9ZEJ50Zw>
    <xmx:gGe7alPW1IMan9NyU_ojFuQD1eAkgo7Rf9-a9KbJAm5UgCavsL1Bnw>
    <xmx:gGe7ak6RPnydH5HPKnmJHArzMGxcaCzggAnzVKi_q9tPzRcKZPiAUQ>
    <xmx:gGe7arcDtsBA63rEorSq_XigVlbsCsRbsGl4qUt_htX3fsYWcP78Ss0q>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Sep 2026 03:23:42 -0400 (EDT)
Date: Tue, 29 Sep 2026 16:23:39 +0900 (JST)
Message-Id: <20260929.162339.676745093403858734.tomo@flapping.org>
To: chenhan0017.work@gmail.com
Cc: a.hindborg@kernel.org, ojeda@kernel.org, boqun@kernel.org,
 fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: time: make Delta division and remainder fail
 consistently
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20260928183925.1315274-1-chenhan0017.work@gmail.com>
References: <20260928183925.1315274-1-chenhan0017.work@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 29 Sep 2026 02:39:25 +0800
chenhan <chenhan0017.work@gmail.com> wrote:

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

Do you have other users in mind? If not, each helper has only one
caller, so they could go directly into div() and rem_nanos().

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

Ditto.

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
> +
> +/// # Panics
> +///
> +/// Panics if `rhs` is zero, or if the quotient overflows, i.e. if `self` is
> +/// `Delta::from_nanos(i64::MIN)` and `rhs` is `Delta::from_nanos(-1)`. Both
> +/// cases panic on 32-bit as well as on 64-bit; see `div_s64_or_panic()`.

div_s64_or_panic() is private, so you should not mention it in the
public documentation.

Also, shouldn't the `# Panics` section be right above fn div()?


>  impl ops::Div for Delta {
>      type Output = i64;
>  
>      #[inline]
>      fn div(self, rhs: Self) -> Self::Output {
> -        #[cfg(CONFIG_64BIT)]
> -        {
> -            self.value / rhs.value
> -        }
> -
> -        #[cfg(not(CONFIG_64BIT))]
> -        {
> -            // SAFETY: This function is always safe to call regardless of the input values
> -            unsafe { bindings::div64_s64(self.value, rhs.value) }
> -        }
> +        div_s64_or_panic(self.value, rhs.value)
>      }
>  }
>  
> @@ -554,29 +598,26 @@ pub fn as_millis_ceil(self) -> i64 {
>          }
>      }
>  
> -    /// Return `self % dividend` where `dividend` is in nanoseconds.
> +    /// Return `self % divisor`, where `divisor` is a number of nanoseconds.
> +    ///
> +    /// The result has the sign of `self`, and its magnitude is strictly smaller
> +    /// than that of `divisor`.
>      ///
> -    /// The kernel doesn't have any emulation for `s64 % s64` on 32 bit platforms, so this is
> -    /// limited to 32 bit dividends.
> +    /// `divisor` is a 32-bit integer because the helper called on 32-bit
> +    /// platforms, `div_s64_rem()`, takes an `s32` divisor. The dividend (`self`)
> +    /// is a full `i64` on every architecture, so the width restriction applies
> +    /// to all configurations, not only to 32-bit ones.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if `divisor` is zero, or if the division overflows, i.e. if `self`
> +    /// is `Delta::from_nanos(i64::MIN)` and `divisor` is `-1`. These are the same
> +    /// inputs [`ops::Div`] panics on, and the same ones `i64`'s `%` operator

The inputs are not the same. One takes i64 and the other takes i32.

> +    /// panics on. See `rem_s64_or_panic()`.
>      #[inline]
> -    pub fn rem_nanos(self, dividend: i32) -> Self {
> -        #[cfg(CONFIG_64BIT)]
> -        {
> -            Self {
> -                value: self.as_nanos() % i64::from(dividend),
> -            }
> -        }
> -
> -        #[cfg(not(CONFIG_64BIT))]
> -        {
> -            let mut rem = 0;
> -
> -            // SAFETY: `rem` is in the stack, so we can always provide a valid pointer to it.
> -            unsafe { bindings::div_s64_rem(self.as_nanos(), dividend, &mut rem) };
> -
> -            Self {
> -                value: i64::from(rem),
> -            }
> +    pub fn rem_nanos(self, divisor: i32) -> Self {
> +        Self {
> +            value: rem_s64_or_panic(self.as_nanos(), divisor),
>          }
>      }
>  }
> 
> base-commit: d266640c6c760c9bc215bf5a3ece122ca488b6f5
> -- 
> 2.34.1
> 
> 
