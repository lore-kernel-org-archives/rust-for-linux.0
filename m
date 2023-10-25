Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EFC2510F;
	Wed, 25 Oct 2023 10:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrAXUVV+"
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8235EDD;
	Wed, 25 Oct 2023 03:13:03 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3add37de892so3212982b6e.1;
        Wed, 25 Oct 2023 03:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698228783; x=1698833583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6sBwVBt8OxRl40mrORA03RRhCm4IDWP2fYbv2hXwz8=;
        b=DrAXUVV+HetekIYy4BhQtpBzj4CmK/ypIeJCX3upEo2f6U2M8PNA0QzlviapzdvBb/
         bN363txQrBLneJgaMhKSPCNKEOWZMV1g0CBMtAnFzaBSFLgrTv25Ck/Ugi6UT92LkhOK
         2ABdGoW9rfL6zl4iB8S4M5H3toFZ7lYwMfZNEtJR6deBZCIVF65zb0UnEoq9JY5xFV8m
         tGXMiRJjqdcmXyVlkmAbplPFYbzTge6oDmpqRK5VZ14BQrsY1dbkoElWwTz0C48qNRHG
         OUX9mCwDdpmoFoyQm3wBq4SGi/yL1W2BYKOH3bl+AxOXbXx8Ins/kPYwZutjaGeny2bo
         /ktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698228783; x=1698833583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6sBwVBt8OxRl40mrORA03RRhCm4IDWP2fYbv2hXwz8=;
        b=vwC3Q1sfbbRd/rEIj9NlMm39DwgBBFIpkd7p28chff2MUMwxwe35eN8BPonSKxCKLo
         r6DZXfoPp5537NI5/hPJ9brkBHxOZ2Ht+oYJsrc/wcM7LX9HmBbHY97gyvYhDjk02ePu
         JQyuq9s3orgP7H72xQ3LM1tgJcqwERl27skxXkgKsoJuD4MU/sGiP3uZMXi2IrgaWboW
         /JfXGgTVKS+1Z5852dwshNq8OzgPFqaS8rytild06M0aQtH2y1RhcI7Blz+W4DIvXJiJ
         Dhe9MRR6om2TB4Lk7fLTFRAZsTSFmixcVODMRGf7XyWijLPFY7Tiqyz/bJWrI4ApCL+W
         6svA==
X-Gm-Message-State: AOJu0YyBqxZRIcJ2TlId8AHOL7YZ8TCY7xn227pvG5+gZt5JYWBHUnjn
	BARQlhYyWNQK2nSiClOe2t8LMW2evK9HjCtQA6U=
X-Google-Smtp-Source: AGHT+IGdPmbTgUijRvTiwVeUamc6sPEBS/RzZl71q6s9s7fFlZ1Uy8nbWtq0fhT33/wRwFselXnTZPMPUwXcZT7qz78=
X-Received: by 2002:a05:6808:14d6:b0:3b2:e56d:b335 with SMTP id
 f22-20020a05680814d600b003b2e56db335mr15826575oiw.4.1698228782693; Wed, 25
 Oct 2023 03:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231018160922.1018962-1-ojeda@kernel.org>
In-Reply-To: <20231018160922.1018962-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Oct 2023 12:12:51 +0200
Message-ID: <CANiq72m2s1SUa2DVSRZ+B+1v_Y4Cpa0Hz8cjRjHacGWh586+3w@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: add "The Rust experiment" section
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Lunn <andrew@lunn.ch>, linux-doc@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 18, 2023 at 6:09=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Clarify that the Rust experiment is still going on to avoid
> confusion for both kernel maintainers and end users.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next`, with the new paragraph -- thanks everyone!

Cheers,
Miguel
