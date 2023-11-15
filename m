Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="rlisbuqD"
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1384D2688
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Nov 2023 13:05:17 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-dafe04717baso48910276.1
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Nov 2023 13:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1700082316; x=1700687116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPpuvgZ0XIB7c2UqYKmSyE7HFxzt7DHa43Az68jrdWU=;
        b=rlisbuqDIYtfDSasUoKF1/Prz15bhYHwV+COaBbkELFnER8jMyQvqsKb+0pyXyUAP4
         HL83CLq5Erks4nwfm/PyvsMdguBKUuY44dVvAxpNEJxVI9vx4YDHRT9zuauBzwUt70Gp
         bxAgktwciTK8N+VlyY7I0OlRGTeFAIcB+dJtsAh3gqNRVQLNTnfetYsBZN4e/BthRQQI
         RZ5Y6wHj6Lfo4vr9q4M/aJNzwbaq5aMZUJbt9KJhjRHeahBeXL/pp3V0ulb82Hpp4Axs
         qjxDU1D5UlQVRt0ANgDSUTDL70Ty053L0oVSXFq25ImSFrYnYdZ/1Tr/YzOvSR6NL1cV
         82Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700082316; x=1700687116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPpuvgZ0XIB7c2UqYKmSyE7HFxzt7DHa43Az68jrdWU=;
        b=qQXMV6HUZO2FrWN/wHRHhz/EcBPnnc0rkMicK/Gse8of6Q3hfQE4sD4UFSOx0F9kQD
         tPHgMcnjl1/rub2thzY/EpYDXwwa//p2Pv8CXpn9dZzFpYDLIp4ig98zpXPIVqySgyIN
         v6/vS3eRLvQyy8QQ/ltsXEFIfqBl7A0pYpLy6tApRFg6kCUkax1YHHx0s09bJlD3LmnU
         0hWvGmthpyaE0fHfjByce+efsZ1qR8uUq2ahj5v4uqVe1/0LWzElRv+UaEUb88rxwL4X
         MA0DtyL73A6uez59eKaSjJ2Zk3VGGCyd0zcwlVQiRM68IemrIHOp7ve8+yFWntJVngfp
         bpCQ==
X-Gm-Message-State: AOJu0Yz6io314g8uLrgSC6nWEkBr4+TShsTMeNKoTHDmaUrAA4HDkn/w
	RJjY+kxXPRWnTv63PESoDtD5Y/+wqiJCckrXxX5F+w==
X-Google-Smtp-Source: AGHT+IG7P6m5Ea+O6SAbz0w0inJIy8DNY3iO6EqSyKSZiXryWnlEgyUpybzWOE93V/l+Y/I+3sw6TdX2HtTFYRoQeZs=
X-Received: by 2002:a25:3624:0:b0:da0:6a55:b4d5 with SMTP id
 d36-20020a253624000000b00da06a55b4d5mr14522230yba.46.1700082316205; Wed, 15
 Nov 2023 13:05:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115185858.2110875-1-mmaurer@google.com>
In-Reply-To: <20231115185858.2110875-1-mmaurer@google.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 15 Nov 2023 16:05:04 -0500
Message-ID: <CALNs47vtOJ8WcykEtXn==Fn77sqRt9nzPDek-c+625HPfWSx2A@mail.gmail.com>
Subject: Re: [PATCH 0/3] MODVERSIONS + RUST Redux
To: Matthew Maurer <mmaurer@google.com>
Cc: gary@garyguo.net, masahiroy@kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 1:59=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Support both MODVERSIONS and RUST by making symbol version information ex=
tensible. This works by having a separate section per field, and allowing i=
teration to work differently per field. The old module information remains =
available to allow existing kmod tools to continue to work on new modules i=
f they are only looking for C information.
>
> This also gives us the ability to attach additional information to symbol=
 versioning (e.g. namespacing) should it become necessary in the future wit=
hout breaking backwards compatibility - new sections will be added, but exi=
sting tools will still find all their information and keep the existing for=
mat.
>
> PPC has a hack around removing leading dots in symvers. I have
> replicated this hack for the new format, but without context for why
> this was being done, I can't test that it works as expected.
>
> This was inspired by Masahiro Yamada's suggestion[1] when discussing the =
previous attempt.
> Link: https://lore.kernel.org/lkml/CAK7LNATsuszFR7JB5ZkqVS1W=3DhWr9=3DE7b=
Tf+MvgJ+NXT3aZNwg@mail.gmail.com/
>
> Matthew Maurer (3):
>   export_report.pl: Rehabilitate script
>   modpost: Extended modversion support
>   export_report: Use new version info format
>
>  arch/powerpc/kernel/module_64.c | 24 +++++++++-
>  init/Kconfig                    |  1 -
>  kernel/module/internal.h        | 16 ++++++-
>  kernel/module/main.c            |  9 +++-
>  kernel/module/version.c         | 77 +++++++++++++++++++++++++++++++++
>  scripts/export_report.pl        | 17 +++++---
>  scripts/mod/modpost.c           | 33 ++++++++++++--
>  7 files changed, 161 insertions(+), 16 deletions(-)
>
> --
> 2.43.0.rc0.421.g78406f8d94-goog

Hi Matthew,

You may want to resend this patch. For whatever reason, the RFL list
only received 0/3 and 2/3 [1], and it looks like the other relevant
lists only received 2/3 [2].

Also seems like text wrapping is off for 0/3 :)

- Trevor

[1]: https://lore.kernel.org/rust-for-linux/20231115185858.2110875-1-mmaure=
r@google.com/T/#t
[2]: https://lore.kernel.org/linux-modules/20231115185858.2110875-3-mmaurer=
@google.com/T/#u
