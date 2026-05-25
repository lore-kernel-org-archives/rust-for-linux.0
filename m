Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5492D061D;
	Mon, 25 May 2026 02:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779677792; cv=none; b=DmZLaKT/U8JPHqFNuVL2nLMfdDN5vcPpNoPkF9g9+Q57ieC8Vlh2YlRVBbFFLAfHdV9F0CXb52CHSzWzPUREuQNxpjWMvUtmN7rJedz2l2uKlqFjRTtpIHvJhhv9YzL3QbwuqxcT28pl0dw0XxWNfxCn2tSuaWW+qLigVpPRAW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779677792; c=relaxed/simple;
	bh=p1JDcU2fKREp0BjhkWLs1lyNUI4TF8aWkyj9tAVm7Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BD5LJV7p+8+yGna12Z65FSVjm7E0qSrsES+u12qcSNqhvhdlndUZ3rSwsDUeBXG4Hhf8ZVOqmIiilmWUV3O+WSxOos5GB87IKNwG9MwxuFABHeYFkw8dNXW/dyyavzOepuMsRbWXenm1elTy6JXqZw/vS+hfu1u9pRtfOto5ZCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=SHf7KzXw; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="SHf7KzXw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1779677778; x=1779936978;
	bh=e7ByQ8YE8C+nCfUiGrjaMZuOWp0nOxTjj1d9gwLkctU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=SHf7KzXwCDjl1u4uE3Yn5/rfjbHu/CbiLrhv6x7vu56zr0UjbBZcBGDX2Gqbuysr0
	 QQwvfHqxthGttMBwGdHiMfSnV96FuYY9vk+OupkqoCy2Zs5R1OzOjG2MN/rkm9DhyC
	 b60nEs/Vk2NF1b8NI+9Tjk3f16nOdCaNMuK16mfJvv3IZsXhsERw1DaJQYJ2a4fv2Z
	 WEPvSpw4eazxShv5zzGbFp/wydVaLk35f/246RcAwpYhPzW/cUKCn/ErDgJ/5tBseP
	 Y5yGAOQ+sOJnhS9DtQgx6JuuFrRuLpI+MHsRHDTSdE82k5j9HQ/g+ZMn0R85Oma5bF
	 ZjKs5VcOE+jbA==
X-Pm-Submission-Id: 4gP0rb4q4wz1DF7B
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
Cc: Igor Korotin <igor.korotin@linux.dev>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] i2c: rust: fix I2cAdapter refcounts double increment
Date: Mon, 25 May 2026 05:56:12 +0300
Message-ID: <20260525025614.16352-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260524181151.24988-1-nico.antinori.7@gmail.com>
References: <20260524181151.24988-1-nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Nicol=C3=A1s=0D
=0D
On Sun, 24 May 2026 15:11:50 -0300=0D
Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com> wrote:=0D
=0D
> When `I2cAdapter::get` executes, it first calls=0D
> `bindings::i2c_get_adapter()` which increments the device and module=0D
> reference counts. It then takes a reference to the raw pointer and=0D
> converts it to an `ARef` via `.into()`.=0D
> =0D
> The implementation of `From<&T> for ARef<T>` where `T: AlwaysRefCounted`=
=0D
> unconditionally calls `T::inc_ref()`. This leads to a second call to=0D
> `bindings::i2c_get_adapter()` inside `I2cAdapter::inc_ref()`.=0D
> =0D
> Since the returned `ARef` will only release a single reference when=0D
> dropped via `dec_ref()`, this leaks one device and module reference count=
=0D
> on every call.=0D
> =0D
> This fix was suggested by sashiko.dev.=0D
=0D
Including the link tag would be great.=0D
=0D
> =0D
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>=0D
> ---=0D
>  rust/kernel/i2c.rs | 6 +++++-=0D
>  1 file changed, 5 insertions(+), 1 deletion(-)=0D
> =0D
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs=0D
> index 7b908f0c5a58..ca6476cf4399 100644=0D
> --- a/rust/kernel/i2c.rs=0D
> +++ b/rust/kernel/i2c.rs=0D
> @@ -405,7 +405,11 @@ pub fn get(index: i32) -> Result<ARef<Self>> {=0D
>  =0D
>          // SAFETY: `adapter` is non-null and points to a live `i2c_adapt=
er`.=0D
>          // `I2cAdapter` is #[repr(transparent)], so this cast is valid.=
=0D
> -        Ok(unsafe { (&*adapter.as_ptr().cast::<I2cAdapter<device::Normal=
>>()).into() })=0D
> +        Ok(unsafe {=0D
> +            ARef::from_raw(NonNull::new_unchecked(=0D
> +                adapter.as_ptr().cast::<I2cAdapter<device::Normal>>(),=0D
> +            ))=0D
> +        })=0D
>      }=0D
>  }=0D
>  =0D
> -- =0D
> 2.53.0=0D
> =0D
