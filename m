Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E7920AF7E;
	Mon, 13 Jan 2025 16:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736784740; cv=none; b=CM9ew6jngnT5kPz6xkHnP43/ZyYFqWnUDBEIF1Lc4KP1CNyofumEkR654NqgLKap94a2s4xIrVxsdIoZim89jnleQHYKOlICIDId6yUmUIZN8ME6WFEhJQPUEjj2kBEaQ6mAbb6WiX08hYmMyQT3aMB6gI82dil0n5kgkJxUT4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736784740; c=relaxed/simple;
	bh=oNGJKradZWTQyrlZo5GhD4IcMEK8uDwOJWcsPvlnQ58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HFYlsUqVrgP+YDUdmPEQS7lwOq/+Ov4Hn8CnqC9/gYOweFDWoedXPXHLDti2bR93WlDS40B9DmHdrqzoTPqCo6Gjkev1KZm/u03In/81d+TQ89xqzVylzJr6OrZSnFChNJKFHg2gr+0uAzhezNw/TEqnpVXm9tO1gLRa+UE73+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VqYtolVI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqYtolVI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3875BC4CED6;
	Mon, 13 Jan 2025 16:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736784739;
	bh=oNGJKradZWTQyrlZo5GhD4IcMEK8uDwOJWcsPvlnQ58=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VqYtolVIh+baKMCbVocMI+gVKb9AS/UxYcrNOGiTUlW9/LN1N/2aniwHeGJXHRpBx
	 6ogU6/kuPoCwxbKFPEC/UfT2sy+Ncpys1HIIJnJMX1WtABHbaSXVBUGabWm5T/h/Pq
	 Kngi9rABWvdEK5gkSj4V/EPu4WYF9wx8Kx0ly0C9xilEaCffFyXdYyDKrjxeDVWQFu
	 UKIXgDSMINhiNWavp824w6yGIg7AjKu4JERMTVDG7i+5ODtF+C5hj9h0SZkSdOvhkY
	 xwEd4klYGICruPX0r+x7q+LicJgGZF3llYJsx0eqHOWEC2v+fI0gmZPpDYL+YH65cV
	 7Ft6I0D3bzupw==
Message-ID: <ad12f08b-3710-4cee-bf7a-c582d2004d62@kernel.org>
Date: Mon, 13 Jan 2025 17:12:15 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/14] rust: alloc: add `Box::into_pin`
Content-Language: en-US
To: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Lyude Paul <lyude@redhat.com>, Guangbo Cui <2407018371@qq.com>,
 Dirk Behme <dirk.behme@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
 <20250110-hrtimer-v3-v6-12-rc2-v6-10-f71d50f16482@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <20250110-hrtimer-v3-v6-12-rc2-v6-10-f71d50f16482@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.01.2025 21:15, Andreas Hindborg wrote:
> Add an associated function to convert a `Box<T>` into a `Pin<Box<T>>`.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/alloc/kbox.rs | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> index 9ce414361c2c6dd8eea09b11041f6c307cbc7864..76f29e2ac085e19871f18653cfddf11d2594682c 100644
> --- a/rust/kernel/alloc/kbox.rs
> +++ b/rust/kernel/alloc/kbox.rs
> @@ -245,6 +245,12 @@ pub fn pin(x: T, flags: Flags) -> Result<Pin<Box<T, A>>, AllocError>
>          Ok(Self::new(x, flags)?.into())
>      }
>  
> +    /// Convert a [`Box<T,A>`] to a [`Pin<Box<T,A>>`]. If `T` does not implement
> +    /// [`Unpin`], then `x` will be pinned in memory and can't be moved.
> +    pub fn into_pin(boxed: Self) -> Pin<Self> {

Personally, I prefer `this`, as below. But I don't think it really matters.

Acked-by: Danilo Krummrich <dakr@kernel.org>

> +        boxed.into()
> +    }
> +
>      /// Forgets the contents (does not run the destructor), but keeps the allocation.
>      fn forget_contents(this: Self) -> Box<MaybeUninit<T>, A> {
>          let ptr = Self::into_raw(this);
> 

