Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFC7347C7
	for <rust-for-linux@vger.kernel.org>; Fri, 22 May 2026 05:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779426576; cv=none; b=iVRqOQi2NJM+EQM1FSYwMkCi+OKd6T6NOuLMAH85cnKtUiW80ruQMVKxz0+ViOE++ZrFD517e8HlZH+w84TYYfhhab1TE0cWYIw2ypBJrkELt9bqPjX59V1WW2gGlQp+yMX9M9YjJYPNIl9YPbc2I926sezb6u0BHzHHTRk7nAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779426576; c=relaxed/simple;
	bh=BvwxU3UcqWc0mYJQ5ibFICogewnaLheLraZ63zCElZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=feqg5tkoDrjWTnqHTeZFM0FYMEE9g3llYauRNmdxO7k69SyB1VicTHEF+ni+bYTutr6hhzd2RVUGHm7pPBlED0XBgl2e0u3Gst8MXRlKl8yomYRHnbcuJyZXLwo4nW/8qM9AEA+HVvxQa08+WMHKuLhPWC4we9lTXXtvJTMx+fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=c+iSO3qY; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="c+iSO3qY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1779426563; x=1779685763;
	bh=u4Lz6un5udPnCSjmepnvJWAdEDKA+LG04n9MleiqGiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=c+iSO3qY+kyoDcYivQ26E3kX/HkHHx1M5SXtHRbhiRFJmPKooy3HMBtAxK0HSOgGc
	 eYxbZXnkWDg2HPzwH6tkWPTtEg8ZVyVNnbTZHQyLDq+6kadm62Zbpo845oUAti+9hZ
	 LhsPxjUT1lUdpJ/9c8/v05ToV9+EF2EFRiVpZT3iOAl1tzGV3MyQyF9Hdw+rCBcfVQ
	 2mReXPuYGWUv/Q9zYFko8Q9kDGofIV9v+cxopLJBrfXsDy9OTnzMhRzKotNlUGwAUc
	 KVlqagjL/S6coqEBYHRzE04OQ+W4eM/BxOPFuzC49iuzmeibGTPpeJabbCVmp/y2Ta
	 MlKva/GfQOacw==
X-Pm-Submission-Id: 4gMCxW36dkz2ScPH
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
Cc: igor.korotin@linux.dev,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH] i2c: rust: mark I2cAdapter methods as inline
Date: Fri, 22 May 2026 08:09:16 +0300
Message-ID: <20260522050918.7528-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260521190937.248904-1-nico.antinori.7@gmail.com>
References: <20260521190937.248904-1-nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 21 May 2026 16:08:50 -0300=0D
Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com> wrote:=0D
=0D
> When building the kernel using llvm-19.1.7-rust-1.85.0-x86_64, the=0D
> following symbols are generated:=0D
> =0D
> $ nm vmlinux | grep ' _R'.*I2cAdapter | rustfilt=0D
> ffffffff817ff380 T <kernel::i2c::I2cAdapter>::get=0D
> ffffffff817ff400 T <kernel::i2c::I2cAdapter as kernel::sync::aref::Always=
RefCounted>::dec_ref=0D
> ffffffff817ff3e0 T <kernel::i2c::I2cAdapter as kernel::sync::aref::Always=
RefCounted>::inc_ref=0D
> =0D
> However, these Rust symbols are trivial wrappers around the=0D
> `i2c_get_adapter` and `i2c_put_adapter` functions. It doesn't make sense=
=0D
> to go through a trivial wrapper for these functions.=0D
> =0D
> Link: https://github.com/Rust-for-Linux/linux/issues/1145=0D
> Suggested-by: Alice Ryhl <aliceryhl@google.com>=0D
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>=0D
=0D
Thanks!=0D
=0D
Reviewed-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
=0D
> ---=0D
>  rust/kernel/i2c.rs | 3 +++=0D
>  1 file changed, 3 insertions(+)=0D
> =0D
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs=0D
> index 7b908f0c5a58..07f9fd53c4e5 100644=0D
> --- a/rust/kernel/i2c.rs=0D
> +++ b/rust/kernel/i2c.rs=0D
> @@ -397,6 +397,7 @@ pub fn index(&self) -> i32 {=0D
>      }=0D
>  =0D
>      /// Gets pointer to an `i2c_adapter` by index.=0D
> +    #[inline]=0D
>      pub fn get(index: i32) -> Result<ARef<Self>> {=0D
>          // SAFETY: `index` must refer to a valid I2C adapter; the kernel=
=0D
>          // guarantees that `i2c_get_adapter(index)` returns either a val=
id=0D
> @@ -416,11 +417,13 @@ pub fn get(index: i32) -> Result<ARef<Self>> {=0D
>  =0D
>  // SAFETY: Instances of `I2cAdapter` are always reference-counted.=0D
>  unsafe impl AlwaysRefCounted for I2cAdapter {=0D
> +    #[inline]=0D
>      fn inc_ref(&self) {=0D
>          // SAFETY: The existence of a shared reference guarantees that t=
he refcount is non-zero.=0D
>          unsafe { bindings::i2c_get_adapter(self.index()) };=0D
>      }=0D
>  =0D
> +    #[inline]=0D
>      unsafe fn dec_ref(obj: NonNull<Self>) {=0D
>          // SAFETY: The safety requirements guarantee that the refcount i=
s non-zero.=0D
>          unsafe { bindings::i2c_put_adapter(obj.as_ref().as_raw()) }=0D
> -- =0D
> 2.53.0=0D
> =0D
