Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D46277CA0
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 08:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750755513; cv=none; b=nRLcXOwfqc8kXQv0p6GRNTcvNfhJnf9xXAoZRjO/kaAHeJ7Mm4JgFMvr3QSSp08RG3cm1zenATXZqOgPsPsZ4IlQMegYeLMqtz6qQiHh9zwjSsJnWt2u7qVl5lphMcV8PDAfh/UPp59vY2n3PBmGG1Z4ZOnM5aWPMhWkmuwCZYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750755513; c=relaxed/simple;
	bh=Vyuh9o3MSdiA3DQ2MljvJ9yeTRiF6byorS0o4NPplFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qhbQCLY3xIrKW0TcIZv05t/gFnFeVtbr6K8Q5WkMMY6Xoc5e7f5Ca+0uwpbU0wnXYTS101Pz2FL+B5z14WH2F9tSKniniVEWv6L/zNK0rD6UfnB/36LQtBPxnuoeIpK5arMa7G35Mb+VS8yoKO0nXQ+tNBrjh40Rzm8yWYGRd1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOPFYRHn; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOPFYRHn"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23602481460so1724685ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 01:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750755511; x=1751360311; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXxIon3QtmY19zl0Xo4viBP81LxYo9vk6mT3Cd6f+xI=;
        b=iOPFYRHn9/cR92R0D+XoESGQzH5bF+vhjV+FNiVQfj7hWNNvt9TpbZ2PzmvdCoPCkR
         NgP5PN01ccT5X+/kxQIH0598grGi0ZeghShO9FDpq6sf8hf6rWkr7gZLnjIljWS4kXqv
         +epHe0xA+3+s8k49uq8tGh3tiSRJTdLr8+UCgQii+4Za4/S8cSjj+ZnDWITdh+9lEVQ/
         ZDozDINk7fEfiSdwpgAEQLDss1SF9Q3zaDOAbG6y3RlM89ldM+008uMcADzuEdr1Tzcw
         FWVaKslvUzX3vnNpz9VIzMrPKFaqjDcEEyfqWWjtLQLewnVC2dFmINenkdq3cppzH6WP
         591g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750755511; x=1751360311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXxIon3QtmY19zl0Xo4viBP81LxYo9vk6mT3Cd6f+xI=;
        b=ey+qr4QzeCpscqENf6G3luTqoMu8ALH8ECdTakJcHOHzE/JNTFH7ze59sv6/ogAotL
         i7dZ7OEe17Nn5X5pT5L6inlu1KKpI0XbyRsHBgzQ8NJPwz+uc1MGA5t3I+R6aBeYpLo+
         aVZTMqZ+6nYM4GMWLy4gE5PDlvNqDgfcgp+/XxJDFahRW8orma+3wzOFS6hF/n/lR9rO
         ZpBeVadxb0F2D1bire9nr2PXRR5NH2gDEEeeRucdtbGDBa4G74l1viTQYxLj3KC9t4IN
         91bs4KcCBZM5FW77xIhXjI9ACzQiedo5gTi4XeDogxI7UL2PM1e0d3EgxG8b6LCjJyHY
         ufag==
X-Gm-Message-State: AOJu0YxKtI/3SN7QyU6TnWOwbcjH5D3zNLq40P5N+DCmaW9BXoyurPDD
	Hu30M0d354FWgr8pHEgjk+1sD3ZCN8EIG1inssrisQvCgoXF0wJGuYUbHqvjE5jzP1yhw2mcTjJ
	uwQzkSy+jklYWkk0Dx5YyT7G2VeYvRcHN88YcbyY=
X-Gm-Gg: ASbGncs7xdMR6EcaRdSHvSz9euRSPH3sa7F+dApAOkI3GSuK0h6MYJM8eI7P05CjO2v
	y0UvlW5d++PdiW47Hi95v0Lz965NRO7j9mnQNkgQriqCLmVutaSE/fUpmBElGtmvqB2eH1erxFJ
	w6dXB0r/FIwAF2v75UnArXLj9+MMQHt9ojErtgTw56PqClmj0jGiSuwVJ7UmvUlcnphWbwozYkE
	PDwSA==
X-Google-Smtp-Source: AGHT+IG/AvjueT/cE4o8c0BzAGx7KkuOayOHhkdW/lOCdgIk0uzGFzvvBmGUItEySHhg3vEnJpe0ENUFtaDX1w9vbfA=
X-Received: by 2002:a17:903:41c1:b0:224:26fd:82e5 with SMTP id
 d9443c01a7336-237d9b57a79mr261183605ad.48.1750755510980; Tue, 24 Jun 2025
 01:58:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623192530.266103-1-shankari.ak0208@gmail.com> <DAUAUTGMKB4Y.2NS5D54LX5JIA@kernel.org>
In-Reply-To: <DAUAUTGMKB4Y.2NS5D54LX5JIA@kernel.org>
From: Shankari Anand <shankari.ak0208@gmail.com>
Date: Tue, 24 Jun 2025 14:28:19 +0530
X-Gm-Features: AX0GCFsHtD1yAUpxEhsJLBuxcqTYPsZmk2mKHVWHvS6yWzxpisNn0GhU2HGTO6g
Message-ID: <CAPRMd3mwU9f5+d-oGGisqs056A4hRx0+jk-K6Gkr4=UxQrsRtQ@mail.gmail.com>
Subject: Re: [PATCH] rust: move ARef and AlwaysRefCounted to sync::aref
To: Benno Lossin <lossin@kernel.org>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Ah, I meant that you can just send the two patches in a single series.
> No need to wait for anything (it's easier to review the two distinct
> changes, that's why I thought it's a good idea to split them).

Apologies for the misunderstanding on my part regarding the split. I
now understand that both patches should be sent as a single series for
ease of review. Thanks for the clarification!

> This doesn't apply to `rust-next` or `v6.16-rc3`, what base did you use?
> When creating `.patch` files for sending, please use `--base` to make
> git add your base at the bottom.

Regarding the patch not applying cleanly: I had tested it on rust-next
at the time, but it=E2=80=99s possible that a new commit has landed upstrea=
m
since then which is causing the conflict. I=E2=80=99ll rebase both patches =
on
the latest rust-next, re-test, and resend them together as a patch
series with --base included as well.

Thanks again for your feedback!


On Tue, Jun 24, 2025 at 4:56=E2=80=AFAM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Mon Jun 23, 2025 at 9:25 PM CEST, Shankari Anand wrote:
> > Move the definitions of `ARef` and `AlwaysRefCounted` from `types.rs`
> > to a new file `sync/aref.rs`.
> > Define the corresponding `aref` module under `rust/kernel/sync.rs`.
> > These types are better grouped in `sync` with other synchronization pri=
mitives.
> >
> > To avoid breaking existing imports, they are re-exported from `types.rs=
`.
> > Drop unused imports `mem::ManuallyDrop`, `ptr::NonNull` from `types.rs`=
,
> > they are now only used in `sync/aref.rs`, where they are already import=
ed.
> >
> > Suggested-by: Benno Lossin <lossin@kernel.org>
> > Link: https://github.com/Rust-for-Linux/linux/issues/1173
> > Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> > ---
> >
> > The moving patch and updating patch are split as discussed in https://g=
ithub.com/Rust-for-Linux/linux/issues/1173
> > A follow-up patch will update all the call sites to import `ARef` and `=
AlwaysRefCounted`
> > directly from `sync::aref` instead of `types`.
>
> Ah, I meant that you can just send the two patches in a single series.
> No need to wait for anything (it's easier to review the two distinct
> changes, that's why I thought it's a good idea to split them).
>
> > Fixes were also made to intra-doc links: unresolved references to `inc_=
ref` and `dec_ref`
> > were updated to use `AlwaysRefCounted::inc_ref` and `AlwaysRefCounted::=
dec_ref`.
> >
> > ---
> >  rust/kernel/sync.rs      |   1 +
> >  rust/kernel/sync/aref.rs | 170 +++++++++++++++++++++++++++++++++++++++
> >  rust/kernel/types.rs     | 156 ++---------------------------------
> >  3 files changed, 176 insertions(+), 151 deletions(-)
> >  create mode 100644 rust/kernel/sync/aref.rs
>
> This doesn't apply to `rust-next` or `v6.16-rc3`, what base did you use?
> When creating `.patch` files for sending, please use `--base` to make
> git add your base at the bottom.
>
> ---
> Cheers,
> Benno
