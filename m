Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A3279EA;
	Thu, 16 Jan 2025 00:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736986903; cv=none; b=DrxzpQVcMwIZq/zNOiFxv83951b/0dBITxDVxvhrFb1QmVjyVaaUS3QYZ15BzzX4L82uRK+19BprDtYrT4DInlSvXORyVYz+zbg4SzfC3ktLEtG4ZLXSf8XsuupKCq3Fs3NjK1sQpdr+4/bs6kxOL9OqxLvl42ZbfPMfvR3SSPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736986903; c=relaxed/simple;
	bh=a4DcDiRTElWBWVGLWT0WV7y8JB7U4aPgJfXO+9gdXl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RM7pHq0CZaW+ea4Zt4KLDM1PFIQVSI0CU2u1HFFkujEuCO/XBHXCPjtKAoohFDlS79c8cyhlpjNbL0CBhGk4p7KsqRQdgn1Ij8ybs+0dK7q7nXtxe5t7/JrCoQAn+XDI7C7740W/z6mjdy1IGNOGtOg0AQN80nRFww5/xy1xyLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLWIbyE8; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLWIbyE8"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30034ad2ca3so3163201fa.1;
        Wed, 15 Jan 2025 16:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736986899; x=1737591699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oED3ozgHy/GOiyTIzXuqCCiUcuTEdpn16Kr0//PAJzY=;
        b=DLWIbyE8Bl8F/s4GSFoV90BSqCOwyNFPsmT70X0P3rPa2HTqpO2BXcrZWJJtPGgeBv
         CCA7F/pSNTYQMWOSsiRmFeQ88RLvFfOhWDmKxPMR+dXrWWTVfqhUVeCI0CNZZjW74hor
         O2FdRlkyeFkzHAYhCdRt2KNuVQ9VXEm7dghMhx5CG4SQyfHGwVbG2YkuBBvUyfbJdkFP
         ig+z/sL2X9w34VEai7g0MtGNEchlsQyC9Q4nODaScoMoqs3VbXgx1L7d8q730m0it62h
         IwRK/EbpVBgxxw9esyNyFJbNzB2FTKTfZuVWocEQxB0k9Q3Zbd6OsoatTICSKUh/xk78
         g9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736986899; x=1737591699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oED3ozgHy/GOiyTIzXuqCCiUcuTEdpn16Kr0//PAJzY=;
        b=P1k0ZQa2PDqHQrQpBdpsoMbEKpRDfzFONLnFF0MrV2DkaDcdCay92GePzCnjVy+z3O
         vIWnMIbs/cg9fVsqZrx2uLf91IsgUrPDqF/dNmOUv/2jgrrlv7K9aaUXSlSVaV+WYxrv
         N6PGxPyZ5pgCKVEl+60ZtQJZENROnSaUQM2SeNAp2zjBnHJ70KFdHFrt+oOCHqcVpOTP
         bTYQQe6IvOerCxHvmhRJJcMDlJEGdou3IY5ovZaHDfruPIM0gmcSdEOKM4uhrA3s7SS4
         BcN3WyjDH/4aQBGDj60+BgOSmQsKh8WGb3Qp5AILITdVfDRQ/tZh2GM+/LVYeWi2GvYV
         1uEg==
X-Forwarded-Encrypted: i=1; AJvYcCVB/85aiE8O71WuEPAWU0VwNeDs1gymrZNGBq8fd0J+knOZ6aaLkyOGloDOBnFAuwKFYfYHUn29gBEgrQs=@vger.kernel.org, AJvYcCXy+Mo03Js0XOz+7nTH3YUEeiIsf6JWrxMOAjaqLzr3gc6zbUkGyfYtIR+GZikcJZNdRAzI1WrWqNC0yBLN78w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx06pkaXJX51lpLKKDJdlu83nUn3MD4lmquCF775sb096rD4bpW
	6e+F9o4RPzCHoTAUDBQcc6v/RWcPYHMBMm8R4GYK7czNYwa6F+pd7OlkHFGvHh3PImtxWFIt1/8
	ppRy/zwA/vxKHbJYJb3fnDdGGOCY=
X-Gm-Gg: ASbGnctTstHedoy+xDU/i/PhoPMcDSacT0a5giNxjxMf2TtkXxwVHKQHKx0KMKXpHhR
	1wmU/lvIGJeKOZMbiP5IRkeiPBVLA4fZeUlDk/0cyGlOzjK124alrc/WgzDZ3sMfYyYEAY6Pj
X-Google-Smtp-Source: AGHT+IFKgpAL+6Ip2b0t8/68uR3LzL0LYq0YUxy7ESgGGhlKB8eJ/mKSJZCMNs8zG8mzt9IRSbaWS2nUuotPXHDTdvQ=
X-Received: by 2002:a2e:a70e:0:b0:302:2c61:a1d3 with SMTP id
 38308e7fff4ca-305f45f4be3mr77136471fa.36.1736986898985; Wed, 15 Jan 2025
 16:21:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110-hrtimer-v3-v6-12-rc2-v6-0-f71d50f16482@kernel.org>
 <20250110-hrtimer-v3-v6-12-rc2-v6-5-f71d50f16482@kernel.org>
 <Qz3-uMYVmDmNuj3wUnPV5wK3iFA5J7TfKSByEYeFChySo0SY1m6hAIvqhxzFUD1Qu1QBmtm5DZffaJ4qKG4Bcg==@protonmail.internalid>
 <CAJ-ks9=0HRjwqqrLZ2QjyjYw6frK=zu5_ZG5Jmb=fCRXefBmLQ@mail.gmail.com> <87y0zccog2.fsf@kernel.org>
In-Reply-To: <87y0zccog2.fsf@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 15 Jan 2025 19:21:02 -0500
X-Gm-Features: AbW1kvYbambiiibm7nqFPStEjUBzV08HgEuAbYzcyBuGCmSxJvZ-fYt3vBB7zJU
Message-ID: <CAJ-ks9=3y9EOjyDfAj6Rx9YUg-vGvm=SrPi2XGOa9Okt5hh6ug@mail.gmail.com>
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

On Wed, Jan 15, 2025 at 6:21=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Tamir Duberstein" <tamird@gmail.com> writes:
>
> > On Fri, Jan 10, 2025 at 3:17=E2=80=AFPM Andreas Hindborg <a.hindborg@ke=
rnel.org> wrote:
> >>
> >> This patch allows timer handlers to report that they want a timer to b=
e
> >> restarted after the timer handler has finished executing.
> >>
> >> Also update the `hrtimer` documentation to showcase the new feature.
> >>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >> ---
> >>  rust/kernel/time/hrtimer.rs     | 37 ++++++++++++++++++++++++++++++++=
++++-
> >>  rust/kernel/time/hrtimer/arc.rs |  4 +---
> >>  2 files changed, 37 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> >> index d0842c7c4c6ddffeef9a79cbf9727819060e4333..50e8c23578b5cf7196893a=
c88d9547fc027f1f04 100644
> >> --- a/rust/kernel/time/hrtimer.rs
> >> +++ b/rust/kernel/time/hrtimer.rs
> >> @@ -167,7 +167,7 @@ pub trait HrTimerCallback {
> >>      type CallbackTargetParameter<'a>;
> >>
> >>      /// Called by the timer logic when the timer fires.
> >> -    fn run(this: Self::CallbackTargetParameter<'_>)
> >> +    fn run(this: Self::CallbackTargetParameter<'_>) -> HrTimerRestart
> >>      where
> >>          Self: Sized;
> >>  }
> >> @@ -262,6 +262,41 @@ unsafe fn start(self_ptr: *const Self, expires: K=
time) {
> >>      }
> >>  }
> >>
> >> +/// Restart policy for timers.
> >> +pub enum HrTimerRestart {
> >> +    /// Timer should not be restarted.
> >> +    NoRestart,
> >> +    /// Timer should be restarted.
> >> +    Restart,
> >> +}
> >> +
> >> +impl From<u32> for HrTimerRestart {
> >> +    fn from(value: u32) -> Self {
> >> +        match value {
> >> +            0 =3D> Self::NoRestart,
> >> +            _ =3D> Self::Restart,
> >> +        }
> >> +    }
> >> +}
> >> +
> >> +impl From<i32> for HrTimerRestart {
> >> +    fn from(value: i32) -> Self {
> >> +        match value {
> >> +            0 =3D> Self::NoRestart,
> >> +            _ =3D> Self::Restart,
> >> +        }
> >> +    }
> >> +}
> >
> > These are for converting from bindings to our enum, right? Why do we
> > need both signed and unsigned,
>
> Depending on kernel (target arch) configuration, the enum type will be
> either signed or unsigned on C side.
>
> I guess I could try to figure out what kernel configs effect the change
> and then do conditional compilation on Rust side, but it seems overkill.

The bindings seem to contain a type alias:

pub const hrtimer_restart_HRTIMER_NORESTART: hrtimer_restart =3D 0;
pub const hrtimer_restart_HRTIMER_RESTART: hrtimer_restart =3D 1;
pub type hrtimer_restart =3D ffi::c_uint;

Perhaps you could impl `From<bindings:: hrtimer_restart>` instead?

Tamir
