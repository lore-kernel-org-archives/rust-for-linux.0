Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D4F232456;
	Tue, 14 Jan 2025 17:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736876006; cv=none; b=iTNnqD+6GqkAkWpDbhMy2jZvvYyGvSSmnlwStf9raNmDYFiZKLM14C3Zxg1j+TkeQLn1PX9QRcrzgFiAGRsVdlWjdDb7h9J9ErR6SMgokjyS8fW318Fkpt2PbUPi1F0SQsiKG48SWUq0KcQLG26vITnf51mfHWiLMSNwPaOsy5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736876006; c=relaxed/simple;
	bh=Go+HPsqAkrd7V4BZPxEq7qnamGXMmpNB9QPBtK4Q5ms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pRhKUIeSQhSuvKsy9bB8dMppVozg3864AVciSDaxQqk6bBQaivuYHF08uZuXpOy6SW0+0v5mBDpWEVp5CW5ccXlJtTbL1p3UNgNX5ys3G8HqVWflssfl0Z6cB7L29bwZILsoJd/gxfEJt41Wdj1VTw2dWDNE/Cv0GpW1/iacExE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXDQVzE1; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXDQVzE1"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30167f4c1e3so50337251fa.3;
        Tue, 14 Jan 2025 09:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736876003; x=1737480803; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4Y+Vd+wqvusM5jGu3HnrPWM0LbLyq4kOrjb+M22BsI=;
        b=hXDQVzE1oua/jb8Khblk2bT1P2a9a7o38R/tbm8m7jx6KAD8M2PGBMCgZeTZWXqeuV
         JcQRAB3S/ckuK/Ixh7MJfGSj6GugYGX7etpnbbaA/JnWmYtsk10W/p/ewroeaoW4jbfH
         GdXQWEZI4oWYmOef+PKjOWJzTVib+6jDDa8G1y8h2WEDSKTpj+GHwWUVT0CrA7slFd5R
         qwdB246g9CXxHGeS18qNnDnsMxV/uHxRaAwQd/XkJiJw6trvpeknRyP6LDf5kyIs1E3I
         XN3Nf7ci/SXTRSkHFCDaTho7FvuJfVdg+BXsryZGRsBol10Dy4O6XWqhsa2qhCzjaI6v
         L69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736876003; x=1737480803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4Y+Vd+wqvusM5jGu3HnrPWM0LbLyq4kOrjb+M22BsI=;
        b=rMVnY3LZkmY05moopZxqwzuAIwBz7k+Fs3+ll7e868nrQef01mtNDriev0Zz2n4nWC
         YF3dvqLIq3q93DfctauimSDR25GZ/e5Jr6szbDbUSgMHPRY2s05uqAmHYTWWzGwluzxH
         sFXKmoadlWRfX/nZZgUMygcCB+WmRyjHcnztVadlleJoLxvMpUiQHJGoH8IcpyfTzLUA
         I1M+L+ZAmBcFnlVS+MeGXvJCCSE533HJYVD/tKJln0GIkVVL/pmEFF/H44RbhAgb0ysn
         h0tsJJVznjXflUxTdaS4eseGy8md7oxeKRdH09jz8/7XbxdbTuYy/NQkYztSqN7Mvqw6
         avcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyRxoZcgb3Pc6fZGWlFtcJQ0mhEXpko18U/QTbCZMbh+LggHFE+r2I0KG2+IjAnOZNOqaiBRXvIGTyODdp5w8=@vger.kernel.org, AJvYcCXxSfmfwGMdBz/436Tf+2kP8WbRzDnQloMj0XSusHogelL2mGQd+Qj+00LuUTV72WMIjD0YY1nRF3B19Pc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZWEHvcMkaGJaBEnBZvD/7i51OStI88ScsFKSthdrD3/2EuvHd
	+ewWSAaTgJaxFMDrB08uY/P6bze19Fg14tQs8bBw+u6A2dbDvTYUaqC5S7FZtmSl6+luHkcoHXm
	I277QNjNNZ24UdFT0Rl9bVB6D5OY=
X-Gm-Gg: ASbGncurtMIMGc2WruPNz8BU7PaLjYKU9q0hzFXsVZeRIvHFad790XpHa49ahy/Gtqb
	xnG814vKfQ0H6crY9hfK2KU3vI+vcIEYBK0Ed3/4KTbWD95cC8yfxRSaNsvRDB+h7mqfEp0E=
X-Google-Smtp-Source: AGHT+IHlsRTmsZKIlvCMUdFfWGCoBKyVnJ234IMfduOJ4+2Pue+UMuctdOklwTfM4/BiMvTCRJFShFnK7NxJzlheaP4=
X-Received: by 2002:a05:651c:1a0c:b0:2fc:9622:794b with SMTP id
 38308e7fff4ca-305f45a4294mr81782431fa.24.1736876001696; Tue, 14 Jan 2025
 09:33:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org> <20250110-hrtimer-v3-v6-12-rc2-v6-5-f71d50f16482@kernel.org>
In-Reply-To: <20250110-hrtimer-v3-v6-12-rc2-v6-5-f71d50f16482@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 14 Jan 2025 12:32:45 -0500
X-Gm-Features: AbW1kvZDvBNZF_8W4CaKyr31Wy894Gd1rSWv3n3_FCzTYf8xjFWQQ3LOSNPWfgM
Message-ID: <CAJ-ks9=0HRjwqqrLZ2QjyjYw6frK=zu5_ZG5Jmb=fCRXefBmLQ@mail.gmail.com>
Subject: Re: [PATCH v6 05/14] rust: hrtimer: allow timer restart from timer handler
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>, Guangbo Cui <2407018371@qq.com>, 
	Dirk Behme <dirk.behme@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 3:17=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> This patch allows timer handlers to report that they want a timer to be
> restarted after the timer handler has finished executing.
>
> Also update the `hrtimer` documentation to showcase the new feature.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/time/hrtimer.rs     | 37 +++++++++++++++++++++++++++++++++++=
+-
>  rust/kernel/time/hrtimer/arc.rs |  4 +---
>  2 files changed, 37 insertions(+), 4 deletions(-)
>
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index d0842c7c4c6ddffeef9a79cbf9727819060e4333..50e8c23578b5cf7196893ac88=
d9547fc027f1f04 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -167,7 +167,7 @@ pub trait HrTimerCallback {
>      type CallbackTargetParameter<'a>;
>
>      /// Called by the timer logic when the timer fires.
> -    fn run(this: Self::CallbackTargetParameter<'_>)
> +    fn run(this: Self::CallbackTargetParameter<'_>) -> HrTimerRestart
>      where
>          Self: Sized;
>  }
> @@ -262,6 +262,41 @@ unsafe fn start(self_ptr: *const Self, expires: Ktim=
e) {
>      }
>  }
>
> +/// Restart policy for timers.
> +pub enum HrTimerRestart {
> +    /// Timer should not be restarted.
> +    NoRestart,
> +    /// Timer should be restarted.
> +    Restart,
> +}
> +
> +impl From<u32> for HrTimerRestart {
> +    fn from(value: u32) -> Self {
> +        match value {
> +            0 =3D> Self::NoRestart,
> +            _ =3D> Self::Restart,
> +        }
> +    }
> +}
> +
> +impl From<i32> for HrTimerRestart {
> +    fn from(value: i32) -> Self {
> +        match value {
> +            0 =3D> Self::NoRestart,
> +            _ =3D> Self::Restart,
> +        }
> +    }
> +}

These are for converting from bindings to our enum, right? Why do we
need both signed and unsigned, and why do we hardcode 0 rather than
using the generated constants?

> +
> +impl From<HrTimerRestart> for bindings::hrtimer_restart {
> +    fn from(value: HrTimerRestart) -> Self {
> +        match value {
> +            HrTimerRestart::NoRestart =3D> bindings::hrtimer_restart_HRT=
IMER_NORESTART,
> +            HrTimerRestart::Restart =3D> bindings::hrtimer_restart_HRTIM=
ER_RESTART,
> +        }
> +    }
> +}
> +
>  /// Use to implement the [`HasHrTimer<T>`] trait.
>  ///
>  /// See [`module`] documentation for an example.
> diff --git a/rust/kernel/time/hrtimer/arc.rs b/rust/kernel/time/hrtimer/a=
rc.rs
> index 4c1812f190bc7a9e0b2fcd5ea2e320f45ba584bc..cee143b04aa21fa6c60c3363c=
d95f7a67360cbf8 100644
> --- a/rust/kernel/time/hrtimer/arc.rs
> +++ b/rust/kernel/time/hrtimer/arc.rs
> @@ -82,8 +82,6 @@ impl<U> RawHrTimerCallback for Arc<U>
>          // timer. This `U` is contained in an `Arc`.
>          let receiver =3D unsafe { ArcBorrow::from_raw(data_ptr) };
>
> -        U::run(receiver);
> -
> -        bindings::hrtimer_restart_HRTIMER_NORESTART
> +        U::run(receiver).into()
>      }
>  }
>
> --
> 2.47.0
>
>
>
