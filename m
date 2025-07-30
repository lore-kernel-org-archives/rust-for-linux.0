Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E962D46BC
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Jul 2025 13:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753882774; cv=none; b=p0EH00nUJUsQb90R5oEgJwQRp353pOC3cmZFknuDEZu/rX95b4LWlhpJ2PRXbptWZj100CehO2QbHtzDyqNOBkN91/EzaQlgonSzzf311fAqmCC7bU95O27af6LWysagba26bV9HcxvJ2KJjdl6ON17Y3Bp0U1NR2QO+u3WbkCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753882774; c=relaxed/simple;
	bh=8msNZxV4vzYZHV5zdjpoumhb4VdGCiYWL1hPZvJX9ZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cnREWXyh6T7z+9bAAjWGxUQCILHzNElSzdG2DdsEVVajvh8Ja+LAs9pdAM7RJN8+CCrN7Wc18WsDNTv+ocB9SYvjIrRxS+s3wp58+ogjDTUbzm3NRX3F8gs1X4zGNha01/99N3kSjwqg4eL8bkyx+yFDPVZ6L63/dq3V618CplI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pFZmi5Gq; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pFZmi5Gq"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b785a69454so2418136f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Jul 2025 06:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753882771; x=1754487571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItEELH3cRLVD+iAArrenHRjEW7ZVw4L4zIbc9jOQ2nI=;
        b=pFZmi5GqnR6GCsyM7o5Av0AxoSdCeD7pPeOmwSCVKPQplZBdXensaOdktyKZ1qdsa+
         9AFPFuxDmgPN4meywZDgABDdxhK9uP6cugI6sFD+cELkcoRoJW4m1JJE8ziFdQHYfBJP
         jwHbG1n5xbsTb++splsKifgnu1aBlavrAjoWI9QDlP49P7W1rYSDvHOjrBR78Ilsecap
         mfzAVOoGiX9L/a3iYTBA6gnYPJfXzSoW3lEgMa/410Pz6XhKhNw+YiXC+uImFs1ZdAZ3
         xeKgfuJhiAxowTu4nyIv9YBIuUrf+yB+ATSXWfcJjmQ76lUZf+N2MrOmKK+aHICjluyu
         xR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753882771; x=1754487571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItEELH3cRLVD+iAArrenHRjEW7ZVw4L4zIbc9jOQ2nI=;
        b=clSSbkhvZw26qj3kyZfRBJo41UP/Y8t27PnHPuKtlw7vzgJ8Piupkw20nALQreVQVh
         VLSQ6RX+9bNz8tMqS+i+1VRsiBM8jiYSHMrAqZN3sveyETiLTn/UPGnlRAqcvmlcr0B5
         kWqdEX4WuDKzvSGNw/Fn2OFMS1blKQLXb6kLDlIjQ1YqLYX6MtJLg6sfPr3g+f69TL96
         v9ayxWYk6Qi+1SRfLXrhrMOPujIGDfCw+TiEoKVWqFOyFI6QmanYYEMqQ/bsS0PFJb5M
         EW6f3InE+YPv0fVD4g6MUNcArcx7Bpru+pyq9b2LldrSqUTDUibbNxvnUJuczxLZtYcX
         CWRA==
X-Forwarded-Encrypted: i=1; AJvYcCWVfUzFME+eTpQC2XoM5nTOGkyD3VX0qYG34n5PwDNNpRvoxfwTFAj3yVEBTFElC17WthU58EMu4tEUSiewyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGUWNdJIEGSIkj383lKMQNbjlfgzjK9RfVMSCp3ObuNBkFeMuz
	PVDqPA1+o98tmeSQI9GnaigaR4TRN+8td6WoOYuKzbMqezbGCy5SF8dkC1sevK7H27T9J+ZrQ8g
	aPG+h6IDw86v63TGBZlJVLdV4hkrdve07qtvEOyfb
X-Gm-Gg: ASbGncuuByS1LM9rppQ4qhxNZguLtgecuL339Je0uDoIL2NKsrr6dUv4w14ZABUl9BZ
	a29KqpnyO4YEJgB/Q2PGP1/5QjO0S3CnuEYwbW3BAAuw800lysNT9Lr6b4BpXyg3A+HBGYRKd1U
	AWaOqt/j4OB7VUR1/e4N0Ap3Nnj42yD/KxGQ24ti6MHTMaqlR7o73CrJk0SQ23pBZ9XdE0thDJ1
	7PA62MZ
X-Google-Smtp-Source: AGHT+IEyr2t9aHif2RFUX92J/+mKbiL5ER5m1V7hwBgTcdhRVH7lV6emYSvc7TOE1oUP0faIrNPGeGeGOw3MAShGOAw=
X-Received: by 2002:a05:6000:288c:b0:3a4:eae1:a79f with SMTP id
 ffacd0b85a97d-3b794ffd043mr2795662f8f.33.1753882770587; Wed, 30 Jul 2025
 06:39:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250729-clk-type-state-v1-1-896b53816f7b@collabora.com>
 <fc26c393-5c4b-48a8-a7ac-12558f79b140@sedlak.dev> <DBP8RFDV59PF.1OV46P0UYKOGM@kernel.org>
 <07575756-58EA-4245-B837-AEC4DDCD0DB5@collabora.com> <20cc8581-0af2-47b3-9fdd-584ff0ef36ab@sedlak.dev>
In-Reply-To: <20cc8581-0af2-47b3-9fdd-584ff0ef36ab@sedlak.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 30 Jul 2025 15:39:18 +0200
X-Gm-Features: Ac12FXzumko90MY33tXnHyIvT1ML5t_t7BouF-ETji09Sr887Pkg4SW4INEXrAY
Message-ID: <CAH5fLgjBQF+AGWQ-rKowViiL1kK47FZ80QfEa58Cx9bk11cjAw@mail.gmail.com>
Subject: Re: [PATCH] rust: clk: use the type-state pattern
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Benno Lossin <lossin@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 3:27=E2=80=AFPM Daniel Sedlak <daniel@sedlak.dev> w=
rote:
>
>
> On 7/30/25 2:59 PM, Daniel Almeida wrote:
> > [=E2=80=A6]
> >
> >> We essentially would like to have a `#[sealed]` attribute that we can
> >> put on a trait to avoid the `mod private { pub trait Sealed }` dance.
> >> (so a trait that cannot be implemented outside of the module declaring
> >> it)
> >>
> >> ---
> >> Cheers,
> >> Benno
> >
> > This is not exactly what you said, but how about a declarative macro? e=
.g.:
> >
> > macro_rules! sealed {
> >      ($($ty:ident),* $(,)?) =3D> {
> >          mod private {
> >              pub trait Sealed {}
> >              $(impl Sealed for super::$ty {})*
> >          }
> >          use private::Sealed;
> >      };
> > }
> >
> > sealed!(Unprepared, Prepared, Enabled)
> >
> > Note that I am just brainstorming the general idea here, I did not test=
 it yet.
>
> I think that API-wise it would be better to have a proc-macro #[sealed],
> something similar to [1], as it may provide better error messages, when
> used incorrectly. So the outcome could look like.
>
>         #[sealed]
>         pub trait ClkState {
>         =E2=80=A6
>         }
>
> And then
>
>         #[sealed]
>         impl ClkState for XXX {
>         =E2=80=A6
>         }
>
> If you are interested, I can try to look into that.
>
> Link: https://crates.io/crates/sealed [1]

It seems a bit much to have macros for everything.
