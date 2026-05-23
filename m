Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECA6346AC4
	for <rust-for-linux@vger.kernel.org>; Sat, 23 May 2026 08:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779524666; cv=none; b=bqHvl9atI/fENJR00tBI3yadm27M9gpAa3QXrHzjlgMeeQiZrBfXGmvVHhoAxxza+lrHOv90mJQR/xBIkHOcyoi1rkYadveDmoMRbslbhvFBj3T1sTs3qZGY2hiQ45gZz9DQAttdzh+zJ6cAGOIJZwyS/RbU1OrKpRGPW2eoLcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779524666; c=relaxed/simple;
	bh=VMEou6K+Bv3EIk8PT1WD+Q4Q6deUU1bhfK+Z0TV54i4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSrq4wHsqpAOsPIg2dbwAS9K/jGlTi1A2cmsfSG+OGevLP0cU0mSZdnpC7Xf8DkdusuLGsVJiPtc/ER/bOdAPMlngm4C5QiI1W22G2wqwxqarvBRkRNQBcGMCdRk42ssq2D4fIl15tK2N70WWnvP1H7K2G8Ok0I65eT1+BYZkRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=K45aYi7R; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="K45aYi7R"
Message-ID: <ed5901b7-4446-4aa3-a98c-d8696d6b47fe@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779524661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PjkKJAkoOcJChhSYxNX6F/W7WNUDYwJfTqe6WYUrdwg=;
	b=K45aYi7RlbD0wbVNysrFnTBM6zMwUl5/nKBl1fKEYiiicKioZPMQWIqmIvgL/sjguFmvbd
	J8matP5z4SBP3NQtYgU56RAOvngSUHAfncAqZUaJ/KI/N6g25jPkBAYvEKVPc+EtZO+hbX
	ZW6IUQhgiOhG6KIkxDE1IRoXyy8MfIk=
Date: Sat, 23 May 2026 09:24:00 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] i2c: rust: mark I2cAdapter methods as inline
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: dakr@kernel.org, daniel.almeida@collabora.com, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260521190937.248904-1-nico.antinori.7@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Igor Korotin <igor.korotin@linux.dev>
In-Reply-To: <20260521190937.248904-1-nico.antinori.7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hello Nicolas

On 5/21/2026 8:08 PM, Nicolás Antinori wrote:
> When building the kernel using llvm-19.1.7-rust-1.85.0-x86_64, the
> following symbols are generated:
> 
> $ nm vmlinux | grep ' _R'.*I2cAdapter | rustfilt
> ffffffff817ff380 T <kernel::i2c::I2cAdapter>::get
> ffffffff817ff400 T <kernel::i2c::I2cAdapter as kernel::sync::aref::AlwaysRefCounted>::dec_ref
> ffffffff817ff3e0 T <kernel::i2c::I2cAdapter as kernel::sync::aref::AlwaysRefCounted>::inc_ref
> 
> However, these Rust symbols are trivial wrappers around the
> `i2c_get_adapter` and `i2c_put_adapter` functions. It doesn't make sense
> to go through a trivial wrapper for these functions.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
> ---
>   rust/kernel/i2c.rs | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> index 7b908f0c5a58..07f9fd53c4e5 100644
> --- a/rust/kernel/i2c.rs
> +++ b/rust/kernel/i2c.rs
> @@ -397,6 +397,7 @@ pub fn index(&self) -> i32 {
>       }
>   
>       /// Gets pointer to an `i2c_adapter` by index.
> +    #[inline]
>       pub fn get(index: i32) -> Result<ARef<Self>> {
>           // SAFETY: `index` must refer to a valid I2C adapter; the kernel
>           // guarantees that `i2c_get_adapter(index)` returns either a valid
> @@ -416,11 +417,13 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
>   
>   // SAFETY: Instances of `I2cAdapter` are always reference-counted.
>   unsafe impl AlwaysRefCounted for I2cAdapter {
> +    #[inline]
>       fn inc_ref(&self) {
>           // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
>           unsafe { bindings::i2c_get_adapter(self.index()) };
>       }
>   
> +    #[inline]
>       unsafe fn dec_ref(obj: NonNull<Self>) {
>           // SAFETY: The safety requirements guarantee that the refcount is non-zero.
>           unsafe { bindings::i2c_put_adapter(obj.as_ref().as_raw()) }

Reviewed-by: Igor Korotin <igor.korotin@linux.dev>

I'll take it through Rust I2C next

Thanks
Igor
