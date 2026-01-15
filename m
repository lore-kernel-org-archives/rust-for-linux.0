Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6973B8BA3
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 15:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768492293; cv=pass; b=uZQ62ONvH55Lce87pyoBZTimsS5w21RppJ29qX+VJyY3TdeYlDDwQMbakcJW71wy4VzwY9jopbmXup3qRbjJIeMDGiZLwuzh+ZeeZ8G4ChIkaSaiMgiYUz6OkzgXgBzQEtHoyeiXYEYnPMkswFluVYiIH6vIDltmgFiHTpvnVRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768492293; c=relaxed/simple;
	bh=5jZOHI7cz/tFkCcOhP8OROvIBT3DGTiFcQeywBuUSmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aJAx1wDEdq0jWBotLjq4j+N5RvOWQFmdWEwTSBfr39BiTbxhwhzIIo6+KRo2NKJVsJHRdwHxmevyAENI6KlOR0mJh0Ryrtvn8nZZQwPtuq++OxAfT3AImXwTQpAUqEo2s7TqUJweJhyovg76K52Gk5eDRE7nzrPB4Bia1KfPvQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=On7bqg4n; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="On7bqg4n"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59b672f8ec4so1253447e87.1
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 07:51:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768492289; cv=none;
        d=google.com; s=arc-20240605;
        b=UgEY1Wtwpeu7dmbRw5fCXH9BcyxPSlbhG6CIOTcolV9oYKI6tbKkW6V2lYhXm7jr+z
         lWwrx3rFmscltQW0f/ZBMkA3sz/9DyL71mfm6gbCuC0a8SxVH5ZDTvjFDfZVq50xzmF3
         fpbeBtH5zspeHLuojvBb7SVz62MD+In4isF9msCH1ib0alTF9EHCmsgNejSAk91wsfNL
         W0ugdNf2CQW8Nh4hZjeTU0STOCbm0X5BZdtYm5SCLnnA61EQI+0Cnq3cl3hauSlFqwTU
         bamP+3DXqLstYctf258Qp5Ox0fUsNXEDiR4PvZzDxl5Ky+Jf7pR/FKFBzwDPSDXc4C2y
         fxJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BLbV8wG5kDIJ8frOLw6GPwE++FJ1Hb8KJgZ7vb66YeM=;
        fh=NCxnxvLnMvLP/OMkNtabubwX8+S5gKg5mC0HPT68OvQ=;
        b=WVd8gqAkb+ZAo2uRuWs0K+F9QCUToYbarKrNO1q3aaPWBRc7/7fObViVX+FnPNMkC5
         rcmeiC+N+vt8J4v0YUk5qKJa5K/mGI2M5VYigST6YA/NQTSRN89OkY4tdqwf3nuhfIJs
         //p16HTW5OY2x/CakdJBI2NA5rEHb2MJ0p+2yg14ssPRpBPObaqPcd9zqxYILUqO17KS
         hZ05iEB6ckJ699BzHswLlfUC7XYsCVAM/Q6Dw1fhIf5X+8tq8c3/39uySCtsIQkvPV1J
         MfuoL1/w2nylnciOei+t7cRZmPBDjUNZD8rGPB2D3aO/5m6FCA2vsc2hLgeuiZ9fyshD
         J+hA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768492289; x=1769097089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLbV8wG5kDIJ8frOLw6GPwE++FJ1Hb8KJgZ7vb66YeM=;
        b=On7bqg4nFaVRC5n/YT04mltNUNXUk7sqOTpnl1nmKxvoQAC+/+WR7ZP1ejzWOyKVQv
         XQc770ejj2kvZvXmhHT3Yg+uFnkOurB+gKxr3Mhdh7itkQXDrDWeNhcLmFhMw+RnHyQD
         3oc42JoWdt3F0ZZ6KQnZmwgyElLZ2urdRplcIyOITA3188grVNJw1qOK4o/a57ERnpDT
         Ulh/qfq68D9G2uE68UGt5M8Wixenjj77ai/fmaWm2E2PzAop0lAKW/LBfncTJ//1xIo/
         mTHkqOIsQlCU+TlHHHvih09VRxFZTxwyOnw8NO0qLni0RGYCTnWHApuuSeZSdnKYb1wI
         20lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768492289; x=1769097089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BLbV8wG5kDIJ8frOLw6GPwE++FJ1Hb8KJgZ7vb66YeM=;
        b=ukiQnk2YeNgkRchaabx32+qD/wNP+4vDp6r3duZY0Vq8FvJCEYSGm3rgG65TSbvA7p
         a7RM5/kvRetpDis2L55DG0Pu3ybRQtBQn30BFDD/z6M41TE0XpTOA6cEeN2MgDO3vPbe
         8yDMeEEy+eJ4aK+o4VX+KLhs/McTSmU2LiVn8jpyqqYZ/t4yzMldth/kTia1teQzgwbx
         kYgs/7t4HXAsJ4XGhKGfRpMzbHUHkloSgVrTah3Dr/bfutgQp6cMQ8EPnxZUIXM13SsE
         XS4qRIe+SFwEuKKDfhyR4sskP1+eLwDL9Rav79d2eHAdHmT2e50VUgcv+g7pvGkQmFgy
         klCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8QBLwd2iwvZuRR3R4VUZuk1Vl9Fkh9BNt/hLDIfkvVqKkImsWKIxWmFxadyDvG/KjqDAdG4i4fU5ZDSxYAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmaNA4Z3VXB2GsCPTUsDkywmbSG8+Itkr7Yhn+IpsIeXw3vv1o
	4TPzbPIWcIag3RRFYm2LHozq5yzu7ODmH7Ql04wVsYvo2woQOEacvWMhbGvGGEH+3VygrKt5AW9
	osKq2aLd+m9NI9cH0rdQORqDVpOsrb3k=
X-Gm-Gg: AY/fxX4/4bDnCGoMb0pzNoTdH/usbZ1GDjHPxUdN/lgt/Z5XNmQYuWMH+ceHxZmuOzA
	lhQKuiWzcSQxMkCj0c5qdyZ0OmmlfSGMZi+S2s2p+XoPSudRFSZMJJy5cGfUII9hzFl7xxpc0yE
	4TO/73aMxGJtILQ7r1eGRqP98JTyb8npoMjzcoVdWseNhFSVDFs3+xZ/SOALvkLgqjQjp/k5e2R
	hyJDruS0/QaNvKycS28SWIUgLzwvNYm4LQKe4NjVqf+QcEoWWKx6ZnTJo10g4XMiVINMueJHwaj
	X9NAGUH2WHdq6bcJk5/5JsPVy9PE8rOygN27e06j/HorL/z8oxGABaBXm2kOZ8Cc+Q/wLig2NYh
	saQoWeg==
X-Received: by 2002:a2e:b8c8:0:b0:383:5a4f:2603 with SMTP id
 38308e7fff4ca-383841a426dmr659501fa.10.1768492288482; Thu, 15 Jan 2026
 07:51:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517085600.2857460-1-gary@garyguo.net> <CANiq72neLdtGORQ=GMsJ-mVgWscrAw4CB+_2cfbR4gtju4+azw@mail.gmail.com>
In-Reply-To: <CANiq72neLdtGORQ=GMsJ-mVgWscrAw4CB+_2cfbR4gtju4+azw@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 15 Jan 2026 10:50:52 -0500
X-Gm-Features: AZwV_QgmS5MREKIO5CYv0cuexmqdXCEp7abbRQSIGNVpHXpWKf3VbWEU7Y4RQYE
Message-ID: <CAJ-ks9n2pXZWUePZVNbR_dtvtdjZ0uW2NknkA69UsFeUiCV_gQ@mail.gmail.com>
Subject: Re: [PATCH] rust: compile libcore with edition 2024 for 1.87+
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, stable@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, est31@protonmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 25, 2025 at 5:26=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, May 17, 2025 at 10:56=E2=80=AFAM Gary Guo <gary@garyguo.net> wrot=
e:
> >
> > Rust 1.87 (released on 2025-05-15) compiles core library with edition
> > 2024 instead of 2021 [1]. Ensure that the edition matches libcore's
> > expectation to avoid potential breakage.
> >
> > Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned=
 in older LTSs).
> > Link: https://github.com/rust-lang/rust/pull/138162 [1]
> > Closes: https://github.com/Rust-for-Linux/linux/issues/1163
> > Signed-off-by: Gary Guo <gary@garyguo.net>
>
> Applied to `rust-next` -- thanks everyone!
>
> (I actually applied a couple days ago in advance of Monday's -next,
> which explains the following report)
>
>     [ J3m3 reported in Zulip [2] that the `rust-analyzer` target was
>       broken after this patch -- indeed, we need to avoid `core-cfgs`
>       since those are passed to the `rust-analyzer` target.
>
>       So, instead, I tweaked the patch to create a new `core-edition`
>       variable and explicitly mention the `--edition` flag instead of
>       reusing `core-cfg`s.
>
>       In addition, pass a new argument using this new variable to
>       `generate_rust_analyzer.py` so that we set the right edition there.
>
>       By the way, for future reference: the `filter-out` change is needed
>       for Rust < 1.87, since otherwise we would skip the `--edition=3D202=
1`
>       we just added, ending up with no edition flag, and thus the compile=
r
>       would default to the 2015 one.
>
>       [2] https://rust-for-linux.zulipchat.com/#narrow/channel/291565/top=
ic/x/near/520206547
>
>         - Miguel ]
>
> I also added:
>
>     Reported-by: est31 <est31@protonmail.com>
>
> since est31 told Gary in RustWeek, and we discussed the patch there.
>
> @Gary: I hope the changes are OK with you (I can put the
> `generate_rust_analyzer` ones in a different commit if you prefer).
> Thanks!
>
> Cheers,
> Miguel
>

Hey Miguel, regarding the rust-analyzer changes:

I see only core was changed to use `core_edition`, but other sysroot
crates (alloc, std, and proc_macro) still compile with edition 2021
despite all having been updated in the same upstream PR. Was this
intentional, or just an omission?
