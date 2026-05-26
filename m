Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE2F3911A8
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 08:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779783459; cv=pass; b=tKPRn7lhS93YEHPxnk1XbJo0ddSK/LQSlwoezJX9iGCUD9BFbP1kljW6iwRaBPkwuyTavvHOV7LAw1YrQ410f4MbMxowEesI0RCeQ3QhrcmyxRhZhYsCHdYrS69gbWnLo96B0whi1xJnG5QjkxR8Tr0DVXDf2KC55UaPH57e09E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779783459; c=relaxed/simple;
	bh=Sp5ZKqrzcRrafJjgXXSBE8mJRX044NCbQJ+kvz66LME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rUpBIvBR88uL4hFvk9IQ4EeeeGUyie4qN0blfbDz2S6LZjv5zN8rSMmr/VyDE08m2EPhBR7Jy9KiZ0azrTmSNfzy7bAUsTel7nvxLaEsip5YIpVWsU6qkG3PTiKB7ZLhxnNfIDFjj4FXPxqz4gR+BkCXTb0IIE+ayq5A5cYP79g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpBsoIYV; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpBsoIYV"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2f13ae64db1so730510eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 01:17:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779783457; cv=none;
        d=google.com; s=arc-20240605;
        b=WCTBIIUB5B0ens7lq1YdzamlHbiLYHJBVA2Fn+3eKsKoKA4X0qvK0oAInLskZoXp2M
         lsOdmwrEQZRY3zBRTvKE/IvdQ1W+02QA3rszuxZNSQYyr+kp0WWC5UY6K0uWkQI1OTBn
         4QlgRfuuVOZdLqZLJ5MuhuwBf9WV+rxVHuXLH+Yw5JkD2eymvyDre9xzZhWX1NQpVXka
         RUiErjW/F8zdfLfJmoQRr4qa3/15XkTNhYh83DRDcO9tpJkxm/Sm/6nyDCCoHdBAwe7a
         z5wr3oZLxZEWxNY8Tht9PezpBoXUOLCe1n/E91vkJphaSAFJq3Ba4G3BocWPFecdIRhZ
         k6Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FuPU8upLRbELTBqt0oNJ1IC9teTLP5/yLZLMTN/L9oA=;
        fh=8AaYcslpijG2zwAG4Aut1DWjw2kBLOxfkWxi88Iw8Rc=;
        b=PlPSXzwMh8Yqu+78Uz6Y/pk6GpF0fQr+OonQ0B0qg5u8TyFlmE+sIbz6yRzqv1zpra
         yv7DIIK30H2kB7bKx6PdSv4k7pAXsCDkzJvXAFhUIwMnN1f/8jwPo1gfoLZPz5rmYCUB
         iB/NDGe55xdUbSL9JwlHZWtBDlUUtmhr+us8DP87xVdaPyVaLcr0RCXOUNwQ5dYrm/Px
         9fsJ9MCwB2dt/CUratKnpOFqv7Gt5AIPjL+L/7LLS36TSzGo9nq/EfS79sSmWXm91JWw
         jV5FiBUkU3bu++v1jV1kq1JMSpFh4Y8ilTz0BaP3L3GHxevb/y0cVYhBzMfQ8pCLujnP
         r2BQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779783457; x=1780388257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuPU8upLRbELTBqt0oNJ1IC9teTLP5/yLZLMTN/L9oA=;
        b=JpBsoIYV+rmSJBF05BOs5dLpAYIs9vVBA6D8B6qrSWbFI84QDvTRes00yGFRUcWvgz
         8t61C7bnl2VNr3k2JUeXIl30cGYt/igU9yn/gBAfc24ACvxtN+JNm9zWiF237ywfIBvE
         UEvEx+aJl7iSKEzG3B6zHG1CYv04mXD3HSLR7P7SW565Lf77kl4wTcTcBlQJWNptSkZs
         Rt1WElG8mmYLtXfd/bhf1iWfunwUkA2xI9e4bKDki5wby9pM1vCFn+Kg0XZZrGwlKF2Y
         JO7/PAlEjza5bPGaJYC8PcoE3AeSWFK88fCiMe2M9HyQrE1uJ+UhMfWiQEz/EJdUzwi9
         a7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779783457; x=1780388257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FuPU8upLRbELTBqt0oNJ1IC9teTLP5/yLZLMTN/L9oA=;
        b=pQwxyE17i2DbN36+Z0PfxtcbMoWqdtSyXiujeLU/fFfiIZzdw9uQEAC7A3LMJbpWua
         5eqTmc97BKxlK4ibCg2TccXjOwJxTByPmiPyvOAUU3lFIhJHz5r8gadkRYilSjUztn9+
         YYC/0Gwhn3p/5w+E6xXhwB56HiV9KBw1NIuj1B18EcBQ2bfPxZAcNk6JaDJ3jQ7QnV0X
         6M0CbvX45hG88kf6VV7siwfCXWt+TjnS/9wS+35OvhfZp9GQY7MmeSZFKEzm/1QrRfvZ
         3wGP8bOgE9GwvOUz7SsPSK7yJa0tyiWq+xblcoqQKUUGh/Ec8uXqL1z76EFlzQf6/497
         z+ew==
X-Forwarded-Encrypted: i=1; AFNElJ/xMmtXUWHNog6YZ50wIHEXVbFr02m/IB9En/d3QNSmA3azZPoNKKKwGB1lF4pdthdcfsgSYDTGTxu67Hu4Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWHKb8HL8Pq4eoqzcy5M21UFumJ5luTp9sPMWQqLh0duwXjXRQ
	mwVQvN3R2pnWCv8M9MpSf890P7mRsiWmFcsA4ZhdGI9Z4yacYsQx7Z666omoe6n4lScYE89kH70
	s6KtlGKvUBj4RfXsy4HQezh1FYNJ3B+I=
X-Gm-Gg: Acq92OHaaRoO8Ft/lFM8/PF3c5PmNY4miRSpv4tbYlv+M363Jp2GNG9fmm7l7YquTc9
	Stx5JABwK3SHsIjiBVkdS3t1p4hyTzgtDHREbZdL1KN1VHID9qThuisRDr0mzNEiUfFGcPS86yx
	76ZoIRFvGZbkqBUj8SFEeWb6Sk9ImY8tYwYVYDHINqbLeuSK5IMrVpAsxeus5bzaxsHfWL7dp3+
	ynOVcrzZjS/yHsIKlXaOw5UZjj+liofDNtpBbQghGMkvHJ0szWCiRVPS950kM4kK0HU36gR3JI5
	9BnPtFn885sFHEyaZxLXQmKCup4CWPKtIMzUWpVABmyqRmzKRJJnPDAZF/JKtPmHcMnkw9o7jyq
	TcYbkGvEUsU+KjvTUO3bIB/H+0O9BkGQDqnz5sDeg7KrH
X-Received: by 2002:a05:7301:2092:b0:304:4f23:4823 with SMTP id
 5a478bee46e88-3044f23c523mr2417160eec.7.1779783456513; Tue, 26 May 2026
 01:17:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-rustc-option-cross-v2-1-2f650a49c2b5@google.com>
In-Reply-To: <20260507-rustc-option-cross-v2-1-2f650a49c2b5@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 May 2026 10:17:24 +0200
X-Gm-Features: AVHnY4IuYyKvBZXvx8VWYwO2htqI4qYv-jYYqkX5aPD8vSpj7I2To7c2OoxiNes
Message-ID: <CANiq72kQKRoM4ATAYhP+-UHiqPr0tg67dr4EDYT+ptPUshH2ew@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kasan/kbuild: fix rustc-option when cross-compiling
To: Alice Ryhl <aliceryhl@google.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 1:14=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> The Makefile version of rustc-option currently checks whether the option
> exists for the host target instead of the target actually being compiled
> for. It was done this way in commit 46e24a545cdb ("rust: kasan/kbuild:
> fix missing flags on first build") to avoid a circular dependency on
> target.json. However, because of this, rustc-option currently does not
> function when cross-compiling from x86_64 to aarch64 if
> CONFIG_SHADOW_CALL_STACK is enabled. This is because KBUILD_RUSTFLAGS
> contains -Zfixed-x18 under this configuration. Since that flag does not
> exist on the host target, rustc-option runs into a compilation failure
> every time, leading to all flags being rejected as unsupported.
>
> To fix this, update rustc-option to pass a --target parameter so that
> the host target is not used. For targets using target.json, use a
> built-in target that is as close as possible to the target created with
> target.json to avoid the circular dependency on target.json.
>
> One scenario where this causes a boot failure:
> * Cross-compiled from x86_64 to aarch64.
> * With CONFIG_SHADOW_CALL_STACK=3Dy
> * With CONFIG_KASAN_SW_TAGS=3Dy
> * With CONFIG_KASAN_INLINE=3Dn
> Then the resulting kernel image will fail to boot when it first calls
> into Rust code with a crash along the lines of "Unable to handle kernel
> paging request at virtual address 0ffffffc08541796". This is because the
> call threshold is not specified, so rustc will inline kasan operations,
> but the kasan shadow offset is not specified, which leads to the inlined
> kasan instructions being incorrect.
>
> Note that the -Zsanitizer=3Dkernel-hwaddress parameter itself does not
> lead to a rustc-option failure despite being aarch64-specific because
> RUSTFLAGS_KASAN has not yet been added to KBUILD_RUSTFLAGS when
> rustc-option is evaluated by the kasan Makefile.
>
> Cc: stable@vger.kernel.org
> Fixes: 46e24a545cdb ("rust: kasan/kbuild: fix missing flags on first buil=
d")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-fixes` -- thanks!

    [ Edited slightly:
        - Reset variable to avoid using the environment.
        - Use a simply expanded variable flavor for simplicity.
        - Export variable so that behavior in sub-`make`s is consistent.

      This matches other variables. - Miguel ]

Sashiko points out the Kconfig case, but there we only have LLVM flags
that were the expected, original use case of these, so it is OK, at
least for now.

Any further tests and Acked-by's are appreciated of course.

Cheers,
Miguel
