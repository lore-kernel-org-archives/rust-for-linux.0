Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8832918AFE
	for <rust-for-linux@vger.kernel.org>; Sun, 31 May 2026 13:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780234363; cv=pass; b=mLeKLkB2RI8jnsH4AxstQW/BuwRHatl0/fIOhxsrXNiGTPc6Pqcr39UPxBXErHIaqFim8kAELKHlTjcO8NvsPbNoFJauAVe6nTtzBRzqihV5V1dRzLGeOd3rHo79jz18PhziEEoUHEQ28cAip48rZalqqgJrNbDszhj2QBAZe3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780234363; c=relaxed/simple;
	bh=qAMyTFiFtTC0eh3lc4F6V3JJiXo41Df+HeqxHIXgYe4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=py3RaU3FJljDteJowSRanR6xRdftFPKmYa6oPrDaL0A0AbK/egJmH4juW7+aA3qOfJSRNCtvPSMae0ZD91ucbBbOF/BuCwFKh3dKn3c5Q3bL12ErfqtGsgoBo4UjvesavzzoJ9a2dIGjBXkSwJ9uEYXAm3hVTG/Jp+juZJ6v63k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7aUXPwf; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7aUXPwf"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-304dd3bb7a6so253937eec.0
        for <rust-for-linux@vger.kernel.org>; Sun, 31 May 2026 06:32:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780234361; cv=none;
        d=google.com; s=arc-20240605;
        b=IRoYZmqUfaHqKwyMCYe6qg7t7LYrRGwZypiPxdYjozjv3LVnSup1BlryfEDHDXyCJd
         akH1fBvkKOnBE26Azj57AUGFIrCSXhntIlfe92jI9IMkvrpSnlKQ5XhjbdlKm8LOKTFp
         svlvAAOOOF2oWa9zP5gm9rWO5zHgAdtmWGSdgQhrv+b1YjdfpoPW7MY/uuqAU1kI6GY1
         uK0R9PJKtd+AevWLNezyLM/HhmpFTWHrxJMq0UpBiQa2zJ1odch5QNcparPGtnLuknw6
         c5hR/R/Zyz10UDynVQPkaxATreWlY+qMIICy/FEm9zxNoQ3QtALir0/HdoeUNxprLcpT
         ph9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fWh0gdQbkNaUBMeVhYlkCZO1iRuS2+mRH1lNXIa5o8Y=;
        fh=g8qDlEYl4YzKm50brBFntvV9dgLQZoRuDMtrKQcYKoA=;
        b=A9UZoH5n0Qkb1uxkLvCDEr3pN5x5z1ioRhH/l8+H10y1frDtrq0WegjRekIplzZ8bh
         OAaE/mn4jRYcVghrRyk28TBw2MYQ0/1lCBzz1EKptbvsTQGjwG9hGrwW0fM2hmfpmVPE
         goDYOXRMKBqx4HOCXW1VWr4MA6nQqU8ssiZCWftGFFt4py71XFCjQ2LzmJngvI7R0Q1w
         tTWY1MCjW1PumjF7A2BGkTjDpc28CEIRj8ejG/IADA1h8y1NM/1VWMJVlTSqlj9VKah0
         5n/pw/M1HAYpJAPas5s9SPbC1vgicyQVHOel/+Qts/xJFbY6S56Ia3iDmT2jOpDzIGEz
         Ng6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780234361; x=1780839161; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWh0gdQbkNaUBMeVhYlkCZO1iRuS2+mRH1lNXIa5o8Y=;
        b=k7aUXPwfVCa+A1xV3xg7R1gPGpSGX0amSwRUkU0yHjlJVFntutJT3oYHxdVAHsduYv
         DbW2TcAOpzvLKD6xQk4WTMZNY2aRxYb7HgWW2dRvPmlKO6FV8+4/onBc2FccypuIq2PP
         bIRLcb50YgQmUXP8GJ/K/i1jVeDYx6NjYnJd3dpg+IVWFF6eZAdt7vb2dx6OmaWW2oO4
         7aX7GpqaOvtuvpiCuZavI1WACiWxI+XHP5JAdHoI01CjyReD8OcDl2Ei5EA3J7sYZIZM
         vzqqO9jPrh5nKvmryLV2saNrIH7as1zWrScNjqWwyAHn0Jl6si+KZgnPJkAAdQ37l2NB
         o9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780234361; x=1780839161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fWh0gdQbkNaUBMeVhYlkCZO1iRuS2+mRH1lNXIa5o8Y=;
        b=PUZuyAzw4RXgxANXaWi+cTS/hMMWookyfk7H2ZS+rsBZPxNkbEgARv2V5YEvkBCwAa
         TlmaT6aUSFa0NBFcX+lrhAmESOxdHHOlTITPw1aq7Whua9z4j819QCGU8SLtcxZ7eZcK
         ozfXfU2swb0otL0tyMEyZ48MtZzJj6LIpr3REHON3DZx4oRIGWMEiRxEhWlbE0RlLQCy
         0eO6lcoEPzWtz7ITp5dtw3RUSjfnOdAsHZ9XowS6qNRVXysY6xym7R8pwk0qRwhpZbQD
         YxxRcAkCLwE5HIwc7AZsTWd+VCbjKNv/lxDRYPQFt9ggFwIF7QaWO6P+Pw8vcsOe4vxO
         uXyg==
X-Forwarded-Encrypted: i=1; AFNElJ/TFFfJc++AuSO/OHS8gDulyPzZ7TK+X674wq1A/wpY9iOMPUZD7ohxnK7RB8MZitAs17eRdSIkMamwBfzpaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSU7jjUVF5UeM+KRdAbHCCvMOa4WTEI9mYWclf7Hea4uo0aZ55
	htpTtmisCvjv9pBhr+0gcF53DE3+MF5RMQnA4b1upi1taX48SohYEuOTvR4uE/+h+cJ+xOC2FyB
	znlIDBJJjZKho3zX7eisM2eURStPjYus=
X-Gm-Gg: Acq92OHcY+EAuOnFel+/telC3lneHTVWw5+I6zlxc7a5m9nYauak+EdeMwthby6Za8J
	jWgPa8UIOSNDr+SgytAg5v5BwzT9xrz0PepV7PsAIUMUK+5d4C4cG4DKpVlt60yokhyCEcTH3YK
	Ajdi56DcC5ZEZQPW5dpBhJPKCltAbbvdrGvJiPQi1iAesTAN8/Q6iefc7voIcAZjdlJ3Qvp05lV
	8PvKlYzga8ZyDe8TWJvgw44vRSse2oqVF2hYs1S5m5KKqqCpauGoIWCz2uc5V7uvBQLqT9t1PWK
	r5LSie57HCQDaLmYh+A3FLgqLwmnKaZr4HmIUB9helSg4/fFAC71v6e02pDoE7r2LSFWJWX/0oi
	Xrru2tpAZANy8bsQIxgG06tBuSCWeIDiuUg==
X-Received: by 2002:a05:7301:6785:b0:2d3:4252:b13d with SMTP id
 5a478bee46e88-304fa6815a1mr1660153eec.5.1780234360638; Sun, 31 May 2026
 06:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530114925.260754-1-ojeda@kernel.org>
In-Reply-To: <20260530114925.260754-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 31 May 2026 15:32:26 +0200
X-Gm-Features: AVHnY4LkFossGWgF2BUdrWeoDzVI1qLwed4mxEucX-F3jYH0q0QFqR2HJgvbDJ8
Message-ID: <CANiq72nJP0+FED8MRX9_Jz0WX9ZeTekqE8xE2066VGsQPns-QA@mail.gmail.com>
Subject: Re: [PATCH] rust: x86: support Rust >= 1.98.0 target spec
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
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

Applied to `rust-fixes` early so that we start getting testing
tomorrow -- thanks everyone!

Tags still welcome for a day or so.

(I considered `rust-next`, but to simplify testing for ~2 weeks for
those that want to use nightly, I decided to put it in `rust-fixes`
instead.)

Cheers,
Miguel
