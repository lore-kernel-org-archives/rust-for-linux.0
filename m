Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793979917;
	b=cyJn5Jd9QnIsGsGDqRbFyksqCPO4ct0uSPyt60Q+qOoZHf0qsBF/6Xq3lC4DmaY5289q
	 EvqS/UImlsh8fCQgBuhMTyVSVFcLyTjaAjkKQsi1oNbbiNjFPTsnNgmr2x/xlvUlQ9i98
	 56/y0M0SLGd85xNLMsU8tTjywhQXWGg/mEaawZFFGE6ds1WpFDq4fMlsneOtru+eA5176
	 Y/Y5osWLyuUarWIqcacUF9PkmXFnJmYx+pSykAmGG2hE7N7gCL1Ca/9fY5CLDwR6UQiNJ
	 GlIghrUErAW3eOlEAiWoQrGWnKx0d58jA+JOGb/hthqqA0Waz03TAsJHfho3yVGubog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=l5tSVn8Mj/CO6j1uR03XuID6rPx5lFsALyBs+/EQOlk=;
	b=eHvDTO5lIEFxh3rpJc1HXs0K6JKK3iLILzSvpFLK5drl6eqvvyJUR9UsISk+rnV6vhSZ
	 Edsnwu2tLSnpnVFpDsW7wbXjrFh1JticRBx0V9fgkDrxyyY/q/Yrf0He3MZoyJ05GkuD3
	 UQpCHJ+JarE3hEZyCVgJlwwG0IVHcEoD7sPJ1YGI0WXueX7w+UZ7ycl05mHBBbzWGmCeM
	 J7veKxAVOJ6ZqnUaEfhwQYsqsCJwPMV9uhqS6JoUBBFXUqyAccG5Q8ZT+JT1cH7dSttgV
	 Tf2oaFCLodbeR7UXqic2vaQC/uLZ+K7wdfc1tdkFOd+2ssR7x/cLzywPqiyjvdpfphQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PVCIfsqA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CC0606D80C
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Nov 2026 15:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05CC0606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PVCIfsqA
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ace304021eso5451081fa.2
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Nov 2026 07:45:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793979915; cv=none;
        d=google.com; s=arc-20260327;
        b=o1zoXP8Bb8VIegc0w3Ak9v7v3U8yrrMnB5LvzZhkHxavHMK/jykkE/MP5mf2W72J8t
         mYiF1dqa4LxIkSU1L+kK5zWtPKDcEIAbMMXJZen8RWIy6x0N5NGbxQBUe3u+8WZxedS7
         XzUbFzcxlhvHvuJFblF3WeKsFkwuC79P9AX2lZEX6nZTj3EklOnRbzlh6pTiNZKBHLOn
         iLwearsEEWNPGqARwXD4j0XxKhoGw39T3EUi9HOarcP8zTgfgZPtZ0Hew56xaToI630v
         uJbCE6JbDZ2pMVRKTpzBpOr06yegy3/+1uSIUHKdR1giTh9dQageSk/Hh+tj4lzfUM6/
         UJTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l5tSVn8Mj/CO6j1uR03XuID6rPx5lFsALyBs+/EQOlk=;
        fh=ytrarl5h6Ji35uAzZETgftNMNqEuNHg5IR7DQwFcquE=;
        b=lHBngn/EFizyyrVRQBtPN3tT0iiQiTTietq0UmDutIncxkJJA/KVALVtBoIo/Fj3AD
         7mPngrMYuqbQlY5vsYqLfAPoyF6fNGCaYMFu8vzK8fUlzOopf2DSF5/vggRHlC/6bGkO
         5YYVGYmpuf6PBcnwVR6EWheO9/xcGTFBiTmiQuuka8mj8f6ojskZai6Ht2Ta1K9DjaGk
         xlxrZiW9mk0pvEtvpnE8llTxdZ5I16cw4KPW2hlKp2F4ALJBmGPNChWrhSQRjt/qK4VA
         m4oGTlIYBZP6vEu32zVso0ixfYHNrRMd23b0FtNaiyBGaU4hzIl+gHenftwkZVIX6oNx
         9ryw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793979915; x=1794584715; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l5tSVn8Mj/CO6j1uR03XuID6rPx5lFsALyBs+/EQOlk=;
        b=PVCIfsqAf5aued+4UX32Kej7j7opbHVpjVXl5FZhp8j7wmRx+DasE0lzqCRuCo3clz
         qpbZownOonc5iRdpEU++sYYh99mbKPzkdcUIBKSCWol08MUuBedGLqibNKlos7VlUh8r
         7A8x1Glzqk56FB6vNv9Ay8IAYUnQcclrwpbPUNZyW2agundbnQWocEB+qhdWhxiy0Ggk
         OlnGvRba4fyzYD+DqcHCtBwKjxZ+t+hgEhg38kUVvHd2alHoa4rKFCAGAJ6as4EvXDZb
         MrDVN32K6YE4CsqwBhQfmd3ez5azKL4hFjGjVZyDnPpHWxOysMEkGFCjyPG47s4ObB3R
         evmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979915; x=1794584715;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l5tSVn8Mj/CO6j1uR03XuID6rPx5lFsALyBs+/EQOlk=;
        b=1TB4ZW5Mz7ZvzwvfQMRGpF9MaPDy2jOhKBN50WdD1jtbPAE3Af4gCt4O4+VvvM6T0S
         t0AzCeceG6YrBEkcujMhmNtdNlc8VpeumCX2D91rbl0TjPsCmcRJRR/g04FHr+1uxyI9
         S8hXN6QlDMasxDqoL3SGKFqq0GhbvxYtr2Hr3M2r8aGOdwKaDgFcFCkQz+QZ3pgzUOFj
         P4u5EplTkGH3gMaYDn2y6X4lBN26HxXV8rmhENOCCuK/eXNbDOf/LY5+2fX7uAFDAt56
         MZ2bum3XNCuEK/2vw4G32LjrcIVi0yekHHthacKk0CZASgSou+tX5UxsL1HwSpKQk0U8
         eN4w==
X-Forwarded-Encrypted: i=1; AKwUvBwoDjr/7EkeT7e6Q6kCKqNtEz2J5cYH2+lNvD/Bb3lrv69WvGbPZTGef6TW2ZzJaYbWDEY4QOHXqvTnMx3oSw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8O8bbcwO6dcPwDuniB5FF1wAKtKxUrHSWw/+2ocEoER7vbc1zG
	6ih8oQ5p2HpSvdEKeo2TdasGR73O7H34BcA/GUQ5gv5ZdER3j706/kUlMiPnv8vAgp+GMAmopsh
	yHQklbQYNaHWPTp8YprMn0SfLhXEpVBQ=
X-Gm-Gg: AYBFou2dO3Q8oMojxBUbxskNgTOKpj0XlgN36Ylqtd//tmyqPW18J0Pc2rg6uzKzUV8
	KjC81KzRNNXJtFpISuEMrA1806yR0+41VI2S/VU8k2PLiz951kkrxAogNMhOwkZHLaqNa5SGwUl
	U7WlpQe9j+wzgw1oRtlkom7ZDRd4eTYrDT+Y0gagNNrdRr4CQxOtPBL6VYe/9WJ0FHYKfl1PwqP
	3vAN/Zxn1D50hqaZE7B7NP1oZ9ABSJgo9cp7Qg833gZHBGgie/hA2MS45uzjuYX73//Q0G6H65c
	CI2OxZlhNbSUDlntK6expmPaAV0dZ/eKhju2YNxrFgfsqpC4ZIdhTBDBhF9jKeOcg3/Pl4VLiDt
	n4K0xXwr/4+pHzJoO+sXYHC6rNuLxE5clrc1KxB4=
X-Received: by 2002:a05:651c:1612:b0:3ab:2a19:8624 with SMTP id
 38308e7fff4ca-3acf3a11804mr5879131fa.5.1793979914945; Fri, 06 Nov 2026
 07:45:14 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com> <tencent_173B7731E90B9624F9F82613DC3031B70907@qq.com>
In-Reply-To: <tencent_173B7731E90B9624F9F82613DC3031B70907@qq.com>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Fri, 6 Nov 2026 22:45:02 +0700
X-Gm-Features: AclHuK-XTflrXNbXUwnG9Gy_4IC-jvOmhlr3UlYx53CWnDfOKCsQP4T4U6VaP7U
Message-ID: <CAO26r3TMHb=YxzwS7DYDUTS9U454zrq05yC-b8ojva-pAdCsRg@mail.gmail.com>
Subject: Re: [RFC PATCH v6 0/4] iio: position: add Rust driver for ams AS5600
To: Shuai Liu <847807867@qq.com>
Cc: Igor Korotin <igor.korotin@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Mark Brown <broonie@kernel.org>, Brandon StJohn <branstj@gmail.com>, 
	linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 at 16:53, Shuai Liu <847807867@qq.com> wrote:

> 1. clippy warnings
>
> `make LLVM=1 CLIPPY=1` reports four warnings on this series, which the
> Rust CI gates on. Three are `clippy::ptr_as_ptr` in the IIO abstraction
> and one is `clippy::useless_conversion` in the driver:
>
>     --- a/rust/kernel/iio.rs
>     +++ b/rust/kernel/iio.rs
>     @@ -202,1 +202,1 @@
>     -    let priv_ptr = unsafe { (*indio_dev).priv_ as *mut T };
>     +    let priv_ptr = unsafe { (*indio_dev).priv_.cast::<T>() };
>
>     (the same pattern at lines 334 and 397; line 334 is already inside
>     an unsafe block and just needs `.cast::<T>()`)
>
>     --- a/drivers/iio/position/as5600.rs
>     +++ b/drivers/iio/position/as5600.rs
>     @@ -133,1 +133,1 @@
>     -                Ok(IioVal::Int(angle as i32))
>     +                Ok(IioVal::Int(i32::from(angle)))

Hi Shuai

Thanks for catching the Clippy warnings. I reproduced and fixed them,
and the Clippy build now completes without warnings. I also replaced
the ignored, AS5600-specific example with a generic `no_run` example,
which is now compile-checked without being run.

> 2. ignored doctest in the SMBus word helper
>
> The example on `smbus_read_word_swapped()` (rust/kernel/i2c.rs:841) is
> marked "ignore" and references driver-specific facts (the AS5600).
> Ignored examples are not compiled or run by rusttest, so the helper
> currently ships with no tested usage. A generic, compilable example
> works here:
>
>     --- a/rust/kernel/i2c.rs
>     +++ b/rust/kernel/i2c.rs
>     @@ -841,8 +841,15 @@
>      /// ```
>     -/// // AS5600 stores the 12-bit raw angle at command byte 0x0C with its
>     -/// // high byte first, so the SMBus (low byte first) word result must
>     -/// // be swapped.
>     -/// let raw = client.smbus_read_word_swapped(0x0C)?;
>     -/// # Ok::<(), Error>(())
>     +/// use kernel::{i2c::I2cClient, prelude::*};
>     +///
>     +/// fn read_hi_first_register(client: &I2cClient<kernel::device::Bound>) -> Result<u16> {
>     +///     // A device whose 16-bit register selected by command byte 0x0C
>     +///     // transmits the high byte first needs the SMBus (low byte first)
>     +///     // word swapped.
>     +///     client.smbus_read_word_swapped(0x0C)
>     +/// }
>      /// ```
>
> 3. repeated unsafe blocks in the SMBus access helpers
>
> Patch 2 implements the `FallibleIoCapable` impls for `u8`/`u16` with
> five near-identical unsafe blocks wrapping `bindings::i2c_smbus_*`
> calls plus error conversion. Extracting four small safe helpers would
> put the safety argument in one place and turn each call site into a
> one-liner:
>
>     fn smbus_read_byte(client: &I2cClient<device::Bound>, reg: u8)
>         -> Result<u8>;
>     fn smbus_write_byte(client: &I2cClient<device::Bound>, reg: u8, value: u8)
>         -> Result;
>     fn smbus_read_word_data(client: &I2cClient<device::Bound>, reg: u8)
>         -> Result<u16>;
>     fn smbus_write_word_data(client: &I2cClient<device::Bound>, reg: u8, value: u16)
>         -> Result;
>
> For example, `io_try_write` for `u8` then reduces to
> `smbus_write_byte(client, reg, value)`. Happy to send the full diff if
> that is useful as a starting point.
>
> With 1 and 2 applied (and 3 sketched on top), `make LLVM=1 CLIPPY=1
> drivers/iio/position/as5600.o` builds with no warnings and the rusttest
> doctests pass.

I also followed your I2C refactoring suggestion and added the four safe
helpers as methods on `I2cClient<device::Bound>`.

Thanks for taking the time to review this. I'll Cc you when I send v7.

Thanks,
Coirul

> Thanks,
> Shuai Liu
>
