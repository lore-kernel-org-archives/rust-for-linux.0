Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D0126E71F
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 15:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767367563; cv=none; b=Mxj2lqqBq/KXjBvVMcgsCiIbzj5Txmz+6r5z9S87PfbjoY6fKXWa8h5tEYc3fFLApzPune3+FyF/z75SC6nJJTxNh4skT+uoMxFSBnyZGL8AUu0TKkz+CHUMHPMyYy72mgynjUaCO+RKGtUPejwpz8fe1ImcZ6AfvX00oXNaMf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767367563; c=relaxed/simple;
	bh=ql8X2bf8Na8pgxFE3XwvGKrgyikwUuYHgmwbqczNoEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q/G8eQoN5h7imAlYixhjlbowypS2oD5d+cuHgO8xT26CEVVzbwkF8zNBZjLvtFMdojG02nEDOaRhmL+3abA/acwWaA9N9WHUO3gH0g6F1GRY2cNqHxWsvryqDmBSR9itJT2V9nwtXktF4wSpWj/E0x5MDVc1dBTJZVr0UpUFN4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h7mz0KtG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h7mz0KtG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF68C116D0
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 15:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767367561;
	bh=ql8X2bf8Na8pgxFE3XwvGKrgyikwUuYHgmwbqczNoEA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h7mz0KtGp7DpQhDy75VFljfpu2GQ9hy+6sH0gjb1rz4edWBAOtjRV6MisdAD9qMUN
	 +LKFdElZ7gqxyCSxQMQFNLauWP5SXqjgY5x1aWwxYTcSXmgK9p7v4+CojXoqVF6tHi
	 TSclVkckTl3GDzMGhpRsc6RZ6ZSMz5NqCpSO76DqgwnNdy3yMSnaMjv/f8eyO9FRwB
	 fk4/4axlzrUo9CPT8af1E0/HUpCDYOS+XfpxEKqELPNL5HVHe5KbbEiRHIehUu9+H4
	 VL1Uzc09q6htuWPpYcOBdwbH7N6n6Z+ipXQ6oGmULSrGMlIBAQFBC/whGAzruOhdKM
	 BB6Oolf7ZB+rQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5942b58ac81so9876774e87.2
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jan 2026 07:26:01 -0800 (PST)
X-Gm-Message-State: AOJu0YxQri+eK+b9TWUCw44lXKPksf1CUP0tnUwiEKpszqKA79b/g2s/
	Q5oMl3RGx9BgFB50clqfGI/3ThfEFTWOplEp9xmfBSIDJ8mx7wr8NUe785qvDIxSDh5GsfgauRs
	RdPDRzuKUn+i1RBoLP5rp8YOpEhoFU8c=
X-Google-Smtp-Source: AGHT+IGuFlcLws2Af82Fm48/jRr/rr8spwkPHyev1SpR3fULj3tWxBu7LKoB62N/lLp8y2xqUR+I+NkdwPubrgeb/Eg=
X-Received: by 2002:a05:6512:3e06:b0:595:9dbc:2ed7 with SMTP id
 2adb3069b0e04-59a17ded9b9mr13773696e87.43.1767367560351; Fri, 02 Jan 2026
 07:26:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723-rust-analyzer-pin-init-v1-0-3c6956173c78@kernel.org>
In-Reply-To: <20250723-rust-analyzer-pin-init-v1-0-3c6956173c78@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 2 Jan 2026 10:25:24 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9nJ149Dt2v5Dn0A3+Qw=TnzE84Lm3Ridrfrc=mdhFt-MA@mail.gmail.com>
X-Gm-Features: AQt7F2r5CbtBOPiXZIVeNtLzaCiq0jKzYb0M7LkyYCyzTRhKlPhsCWWBAy0l_qU
Message-ID: <CAJ-ks9nJ149Dt2v5Dn0A3+Qw=TnzE84Lm3Ridrfrc=mdhFt-MA@mail.gmail.com>
Subject: Re: [PATCH 0/3] scripts: generate_rust_analyzer: match rust/Makefile
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

@Benno would you mind having a look at this series?

On Wed, Jul 23, 2025 at 11:39=E2=80=AFAM Tamir Duberstein <tamird@kernel.or=
g> wrote:
>
> Minor fixes in this series. The main one is fixing navigation in
> pin_init_internal.
>
> This is my first series using tamird@kernel.org; please excude any
> hiccups.
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---
> Tamir Duberstein (3):
>       scripts: generate_rust_analyzer: Add compiler_builtins -> core dep
>       scripts: generate_rust_analyzer: Add pin_init -> compiler_builtins =
dep
>       scripts: generate_rust_analyzer: Add pin_init_internal deps
>
>  scripts/generate_rust_analyzer.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> ---
> base-commit: dff64b072708ffef23c117fa1ee1ea59eb417807
> change-id: 20250723-rust-analyzer-pin-init-925467269001
>
> Best regards,
> --
> Tamir Duberstein <tamird@kernel.org>
>
