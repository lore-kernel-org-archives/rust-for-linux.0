Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2735C3A1E69
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 02:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767493837; cv=none; b=UH08x+OxDnRx4UXopbDAwRMnyYyhbLFUgcbxkPdomwGW//gtSNRGWuA+VYmPvHG9ftsniSbV6O6ufkwipN3LXdm0l+vEV9QqXcn6illY6yChfaGKiBHB1WheazdCL7Jd79Cx187/ILJb+ScSGB/s7q7kgU0R7Z/xxj5h0y6F/WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767493837; c=relaxed/simple;
	bh=DlvFdaYcgS6BsgkwyRXsWgdKt6YfqaxoNOvxoPmtE6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EDgtGoVOhWSmTmGiIV6tIz2SjQt6ibasiyIhxkbbIiRccnlPtg7RN5/wA7lhB2OhZzrlGFUZEEhjLxSccthNByFOaHP2OT3O3iZ98hjloQwrtyHr6zVr2AhbfAZLAXs7IzjDNKjwYFYtd6dXPD0PLprLWE8ZFubNFH9nLKrA0Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cA+vT6AY; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cA+vT6AY"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5959187c5a9so11276639e87.1
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Jan 2026 18:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767493834; x=1768098634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAb7Y2d/CNC20RUajmwVdxtej01XI7Qcxiae7kFT2aQ=;
        b=cA+vT6AYhzBC77qF88JJdxCwEfxL5qFToNEO6XBylCHDZa2hdv7Rw1fXqEiFjN+5xa
         rXmwOzVWsJ1Us+ubewRN2c2YgO7aBTr9AREprNQ09SHcS5ceFvhmMF6bh3PeiQSAMZ3Y
         6fwJm4wIihCyYkOvLPdIBov5R6cmq8KOMrI1LWVnQTV/Cf6H+kj0pyROtR3M4wDshw1Q
         N+Doa14PMza3ed0YQjX8ueJETt3fLfOJSIEov8oPchPEuojHXoW8+k0AoauMOtSKt7+S
         g1Kdb1jczAo84ft99NWQQJXf2hZp906naJ6+sxW6SoznE6NtOD6XcofhD/dKsrD5lpYF
         2+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767493834; x=1768098634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wAb7Y2d/CNC20RUajmwVdxtej01XI7Qcxiae7kFT2aQ=;
        b=nW0oZetNI9F53QyauKJ7ruagDJt8KKoEYIjCntuPsazZFLJT0AKtIi8fPYgdHg7Xmn
         dCvN8AUC8IAjbdpBthHrOIt8c1gtBfvQonsdhhdn4vp7koitFiEfpTMcBFKwxj+T1Osk
         pUid3tbekhM5PvRDJ13Ai2NIDy1OW0pFE13PIkVoTYFQUPeWAx60rd4Jnw0FNzgkACPF
         ZsMCQUxqudRHtbDiy8WmQyAvaskIbOOvHbfSGhtKLFFvBQ1JIZmloX47wGlgYf6oIuXN
         aFnHDBHmb6DQuYEydrSPfvSMxaehMemx8FLXwhC7EWKHD9XjIW5SkGzOtjZ3K1GDKwU2
         q8zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeaG3YKXqojT/0ZR6Q3kw78wNJFGYKrEq6Fo3+ETcTcvEDbJv6O6pl+GDEKZaCFWYOX2s4gguJqryVpMavSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YynO7+F08iLJR1fS07/PbPpxTvxhbtyjWZUywhsrHx/65pDZSHL
	7APYV0dIUnEfaqnxuaRkmiaGhbYw5/jAQKOSF24VOGuLK66eRFxVhtQZlyvG7MUj4KGqVtzhqwO
	LjpYaSXLL0W2FScE/PijaQU38y9lNtbQ=
X-Gm-Gg: AY/fxX7grjoxomzkuoFOjumQoXOgwlBx1DuaaLLysirgPTHbHkpIqDFJm1RNwzKokn5
	cdxWVq+hLHJOXJNqO48+0fyugULrGyO3TVATcPbmD9ahEws+yCnrdjbMBkkhfnCiEz2/vXwbqPg
	L8wED+1DQBV18N0tscEqGQl2SguH6dCJT8sNc/dgeDXsjeLOgEIs3CJP1WC7O6GkxN9SbRaGu1v
	U9A+LZvb97W6EV8O3YtWNIqmAb6Ro51K012pbu1qeXz2bcQMEhWlYT9lHuvth7t1dydvghAFZVR
	YoUGgBZ3fhutuoFBI9g4NUeXUkvDqSS6xmvWy/v8R1u8v54bojf4Q3qw99o5O1MYv7WVaI/osdd
	6d/Dr8RE5jrEoruTY41/4RzyX39t9i7gGrADlRPU3iA==
X-Google-Smtp-Source: AGHT+IEcHkXfCVSN9NSSZ24rasJq8edRgueT2UH4kaFUqTRZLzj4M5TZS5QUbg08PW1poxCCe9WkjMVLSCQi7hbJc8A=
X-Received: by 2002:a05:6512:3f26:b0:577:318a:a1c6 with SMTP id
 2adb3069b0e04-59a17d6521cmr13569645e87.23.1767493834050; Sat, 03 Jan 2026
 18:30:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-clk-v1-1-ef0687717aa1@gmail.com>
In-Reply-To: <20251222-cstr-clk-v1-1-ef0687717aa1@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 3 Jan 2026 21:29:57 -0500
X-Gm-Features: AQt7F2r7n9Xs0cRif1ZHf3PmV71z-bkOeEDKkEDT7FB3UNkC76XgQQjhdM64nBE
Message-ID: <CAJ-ks9mjBY7x1s_4wqMC8xqWsX2+aCM6NHn0j7yh_+daKiyS1Q@mail.gmail.com>
Subject: Re: [PATCH] rust: clk: replace `kernel::c_str!` with C-Strings
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 7:17=E2=80=AFAM Tamir Duberstein <tamird@kernel.org=
> wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  rust/kernel/clk.rs | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
> index c1cfaeaa36a2..68a0c2f4e318 100644
> --- a/rust/kernel/clk.rs
> +++ b/rust/kernel/clk.rs
> @@ -104,13 +104,12 @@ mod common_clk {
>      /// The following example demonstrates how to obtain and configure a=
 clock for a device.
>      ///
>      /// ```
> -    /// use kernel::c_str;
>      /// use kernel::clk::{Clk, Hertz};
>      /// use kernel::device::Device;
>      /// use kernel::error::Result;
>      ///
>      /// fn configure_clk(dev: &Device) -> Result {
> -    ///     let clk =3D Clk::get(dev, Some(c_str!("apb_clk")))?;
> +    ///     let clk =3D Clk::get(dev, Some(c"apb_clk"))?;
>      ///
>      ///     clk.prepare_enable()?;
>      ///
> @@ -272,13 +271,12 @@ fn drop(&mut self) {
>      /// device. The code functions correctly whether or not the clock is=
 available.
>      ///
>      /// ```
> -    /// use kernel::c_str;
>      /// use kernel::clk::{OptionalClk, Hertz};
>      /// use kernel::device::Device;
>      /// use kernel::error::Result;
>      ///
>      /// fn configure_clk(dev: &Device) -> Result {
> -    ///     let clk =3D OptionalClk::get(dev, Some(c_str!("apb_clk")))?;
> +    ///     let clk =3D OptionalClk::get(dev, Some(c"apb_clk"))?;
>      ///
>      ///     clk.prepare_enable()?;
>      ///
>
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-cstr-clk-122a1428b919
>
> Best regards,
> --
> Tamir Duberstein <tamird@gmail.com>
>

@Stephen could you please have a look?

Cheers.
Tamir
