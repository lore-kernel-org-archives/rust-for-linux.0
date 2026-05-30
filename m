Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEFB30F547
	for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 12:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780144268; cv=pass; b=HrHn2+8NBEXlZwwN3mJ9HqxTDeAiS6W2hWnkPuPSc3NKiT2VirtN49XBQbkrQPbUZQK1drxKJWIAbaNs7JviiyansBxxpOnlI6VYLj0yfrGY/6rD92gH2rf2EB4EVx4KTcli3hINg+XcBBpFLG5cXsUOE7b4l8FZrXN8OYhXbTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780144268; c=relaxed/simple;
	bh=5V0JB0seYuuGYGJZkHuPFUN1z102gqlQdDHPXmOEZaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mtln+HvcTd0Xm/pgGFvbppY5Y3mjlJkO4ftMPjUsllDemCAuReKMfG0nzAL9ajWxGS3MFOtNsdlDUeKSu4BesY+0Ra0+ejXitIpQDYu4xDZmxsQ738jdnVXZL6BRyr1pzP62036IGiFQaCAVluapOPGXg6Az52sIdFYyTqL3YxY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oXirhZ4u; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oXirhZ4u"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45eeba68948so1871693f8f.1
        for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 05:31:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780144265; cv=none;
        d=google.com; s=arc-20240605;
        b=f5uSKSFQoQFl/nWl+hA+8bySLtmpk603cQEGHQZWKnYYHBBjY0KQ3DqbBWBbh9p8Nd
         HQlfz+TF4khwQATcNbVAUJs6vNDwn/lSeiUoAyLzn9ek9nKIYI+ZrddgKvDz7qjZOV3H
         uA4syVvSALcj/FkYAOmr32GPi5YqLHizk926tfaDMrSiQKJ671vc5j3Q3oOwF/XTviox
         JEUF4hgX8zOFZSyxObDYt6rjS0JlgeL1/wHOgtm4pe/LK1i7g+q37vhEzBZeYhN1sq20
         /J0XUSjUQECW69PhiW/kODiYxbBxudl0t/B9vSnGv5SnmlJg6TM4w1XLZNYcecAGFLr/
         8JSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tsmJTUGqQ4t1Byuf+9POVmmmU068+8j9SHedukFDssw=;
        fh=IAVhIFOE/ojY1qLK4v9+uKjw1Cri0TQJ0w/3gbCva8g=;
        b=KOmm2Dt6Y+qcqtkdlDuiynL3Yq8LrtE1oxtG6oZu2GizlBuTrH0AyDvOoP1RmT48YO
         7nmhmR/AQNTFTWe83+ht2f70ZKy4AoTA1dZC0uMh0fEUQn7mCF8I5ot3dgt4XYkShlF/
         6a01snhanP04xktGMYiQhYZUJk2QdHFdPedwwKNibBoxoJ9xrDJJ6xRE4+8ZRZQUOcSg
         KK3sCS/2YlBl1rXYNBv6wMdpHVymPw2QiAT+VEekXhyJZC8U0PLKrf7ghZXonUgoGI3B
         dtmFTgzLg8WzxbWXRso81eoZMO+ZqLKhOF9k2JsF4UanVm14YLDUAHmIcZvzQtjQhdLY
         lkBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780144265; x=1780749065; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsmJTUGqQ4t1Byuf+9POVmmmU068+8j9SHedukFDssw=;
        b=oXirhZ4uHIYvsoQv4nCUn8qmukte2Zjw2GrGsDIAfdrh/HUIb7g9BQ1WyC7LDcqnnR
         BJ5Gea5adQUAC2kk/ybl1T/ZIub2oYpB8y/DSg8wGnDMB5DGcVRpLhWn1gTzxjh640gz
         yTRjQCw9pl8/RlkaZO6mBt09DWXH+pOA5BO+JWe46/XwT8s6OiTuhcfSOZEsdH5f6ruB
         JAo8hhgYFMK9bcRT458b/brhNDIxMQwDEulPEG/Y6WUFX+bdXFhDfevJBc8a44pohHWe
         rD4vlgFyqxEA25+irBp1CfrAN3iR1Qq4JUBazijSSUb9Nvr58l60ETn+ulBCe38qrPpf
         Bzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780144265; x=1780749065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tsmJTUGqQ4t1Byuf+9POVmmmU068+8j9SHedukFDssw=;
        b=qeaNG6hhcKEo/FXqOMcTGRbqtpWLTYHAq8/ENDW0YGbQjyIEtupK51XIzvwapmzGym
         54AAVvR+ueu0iiMijgShfPOcCV2iC8Ddx3vhykzQfzBz/LwyTsnwkAZKDfF5y8uEZPpM
         OGGgMJJNJT/niDwbaCmdKDi0dOyn8fkGBVZbLoDdb2OkHLJsbOhIYqPLWA3wEqplFsWf
         qXN4jzZoK/7XHpprITB/JA0HgTobGi2DJ1ve/hnktmmHKWUPEOwFLKMCPkv2IJN+SKr7
         9DNpYmeGkWziY94c/PXpDp5D1Sc1Tqa6wjk8DXsDVz+LdWreRTdoyMDwSuuNzPaKhLQU
         EdLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Hf5GCThWUAOVynIjsR/KdXqUNqtqELES+eetrXmcCXpHBPMGs1AgMoq1BvKJE28U/VvHIrCq4PCVGgVp7dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaol5RWRb01uG293vk4L0qpWFrBT1/HP0DpAGmph4EX0ki5RkD
	tqEgT82kievkMNyAsYQhhkoXPBY/Er6oEKsSIsJQ+e+I2D3RI77/NsLP6T/4khhvIUILodtDm1m
	44a2gqiYHpwJOL1i1C0J8Tg3PPbXRpwuMteQw2jWD
X-Gm-Gg: Acq92OFnjZoMFv/159eQBs5fJcDWeJE1jBM1KY/8F8XRT+HoYBRS2cC1vgZGysxDUip
	EGfBJuJyDSDBCqHHZXNpE65p7S4tFtGbENC9uezHv24yFDriaa5Kn8LFCmnHmBezbGvg6sXGw3+
	T8Sq0vJau77V4L1+IBzlknE03ZIoieI+fo18yb9JelRATB5vFR8dwuIKV57OcZzTJOF/GdSKi8l
	y24HhhslYcfXi2ydV2kgn/lRnSttJ2nQ0A4r4m7sOGLGprBK5qasuFsIbNE4sFrGZJaslzpL/Hw
	rZmcYXSmAl5YdiPCvqoHMHOPEOMT8S7Ue1zGcU05uVKfr29L
X-Received: by 2002:a5d:4387:0:b0:453:e3a1:6580 with SMTP id
 ffacd0b85a97d-45ef6b5af04mr4608951f8f.25.1780144265270; Sat, 30 May 2026
 05:31:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530114925.260754-1-ojeda@kernel.org>
In-Reply-To: <20260530114925.260754-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 30 May 2026 14:30:53 +0200
X-Gm-Features: AVHnY4LccWAtRKrASCOhbKiSp_wJ9_ymIUBVUkcrjZtT13a4agAHvAMnhzm1asI
Message-ID: <CAH5fLgiXzxWD3t09PpiLhqNP_D5L3wX3dtqZC1kqOHupOVednA@mail.gmail.com>
Subject: Re: [PATCH] rust: x86: support Rust >= 1.98.0 target spec
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, 
	Ralf Jung <post@ralfj.de>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 1:49=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with Rust 1.98.0 (expected 2026-08-20), the target spec will not
> support `x86-softfloat` anymore [1]. Instead, `softfloat` should be used,
> which is an alias. Otherwise, one gets:
>
>     error: error loading target specification: rustc-abi: invalid rustc a=
bi: 'x86-softfloat'. allowed values: 'x86-sse2', 'softfloat' at line 3 colu=
mn 32
>       |
>       =3D help: run `rustc --print target-list` for a list of built-in ta=
rgets
>
> Thus conditionally use one or the other depending on the version.
>
> The alias has existed since Rust 1.95.0 (released 2026-04-16) [2], but
> use the newer version instead to avoid changing how the build works for
> existing compilers, at least until more testing takes place.
>
> Cc: Ralf Jung <post@ralfj.de>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://github.com/rust-lang/rust/pull/157151 [1]
> Link: https://github.com/rust-lang/rust/pull/151154 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

With UML updated too:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
