Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5983B3BFE
	for <rust-for-linux@vger.kernel.org>; Sat,  6 Jun 2026 13:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780753140; cv=none; b=WR+wtrunxiViCQqhL/ArTBnBK4w18R+e9zya7+eUxUbCYLh4+I2p5huNvB7MVX9PA7SrKLWaYooOsQZ7c6DDW1Bhms79BGD7tjNYuSCSvVx3R2a2NIAfOL+O1Y+IBWeuTegmcuNGCWyaQC8tpGN+VQ/RkTfa7KmTwSUGriC02xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780753140; c=relaxed/simple;
	bh=pEDmj3SEILGcxeJONFmnZmYsKsITSXE2ZrM2ghPME1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ew7dSs53Z/za7Wcxsktj2TZojIOhe9B5AFyW0U8HpOMz69y6EQXVG2R3mepCeHFH5OpfK+LWs/OBIW2qcxClxYseIKgxUjHRFRfcIbgc1/0FaZxhM0KOZCPN8rrmZDJFNT6JLwiydqo23xNUVO+Brdy0JEALWGaQpQmOok+UDCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KJfYIP+v; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KJfYIP+v"
Message-ID: <37ead39b-6b02-4871-afdd-aafce4398175@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780753135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GphkXsxzxI8/ZUUpZNdX/mNnkxReGKZ9d5RKyC86MA0=;
	b=KJfYIP+vK1dxKBbscwbQvvIzIPV3MD6yM4j+G7tHkpl3QBCr6NEqcDYCIdS3mVLwF/wqrN
	/bVaqdyBuLfkZri/2E17B4hzhqV/ogeBqZqqRwJ5dUf7yF0dTTYCzPw5x0AtXUczopwK2J
	+8qXc5TYujlOxJ0Mf/5a3XMCy+QJ7xQ=
Date: Sat, 6 Jun 2026 14:38:04 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3] i2c: rust: fix I2cAdapter refcounts double increment
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Boqun Feng <boqun@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>,
 Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260531182319.21777-1-nico.antinori.7@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Igor Korotin <igor.korotin@linux.dev>
In-Reply-To: <20260531182319.21777-1-nico.antinori.7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hello Nicolás

On 5/31/2026 7:23 PM, Nicolás Antinori wrote:
> When `I2cAdapter::get` executes, it first calls
> `bindings::i2c_get_adapter()` which increments the device and module
> reference counts. It then takes a reference to the raw pointer and
> converts it to an `ARef` via `.into()`.
> 
> The implementation of `From<&T> for ARef<T>` where `T: AlwaysRefCounted`
> unconditionally calls `T::inc_ref()`. This leads to a second increment
> to the reference counts.
> 
> Since the returned `ARef` will only release a single reference when
> dropped via `dec_ref()`, this leaks one device and module reference count
> on every call.
> 
> This fix was suggested by sashiko.dev.
> 
> Link: https://sashiko.dev/#/patchset/20260521190937.248904-1-nico.antinori.7@gmail.com
> Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
> ---
> v3:
>   - Remove unnecessary `.as_ptr()` and `NonNull` rewrap.
>   - Add SAFETY comment for `ARef::from_raw`.
>   - Small change in commit message to make it clearer.
> v2:
>   - Add missing Link tag to commit message.
>   - https://lore.kernel.org/rust-for-linux/20260526194734.14378-1-nico.antinori.7@gmail.com
> v1: https://lore.kernel.org/rust-for-linux/20260524181151.24988-1-nico.antinori.7@gmail.com
> 
>   rust/kernel/i2c.rs | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> index 7b908f0c5a58..c084a45b1916 100644
> --- a/rust/kernel/i2c.rs
> +++ b/rust/kernel/i2c.rs
> @@ -405,7 +405,9 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
> 
>           // SAFETY: `adapter` is non-null and points to a live `i2c_adapter`.
>           // `I2cAdapter` is #[repr(transparent)], so this cast is valid.
> -        Ok(unsafe { (&*adapter.as_ptr().cast::<I2cAdapter<device::Normal>>()).into() })
> +        // `i2c_get_adapter` returned the adapter with an incremented refcount, which we pass to
> +        // the `ARef`.
> +        Ok(unsafe { ARef::from_raw(adapter.cast::<I2cAdapter<device::Normal>>()) })
>       }
>   }
> 
> --
> 2.53.0
> 

Reviewed-by: Igor Korotin <igor.korotin@linux.dev>

Cheers
Igor
