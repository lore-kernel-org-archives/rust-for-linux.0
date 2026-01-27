Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EBB35A954
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 13:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769522035; cv=none; b=OYdR/mFpIabnQz/oxlrbRR6RiPTX1yFl+RXKmAut0PrXrD+heusT8iPNilyXN0XQ7zOTAynZYhfcmQedhD0eBeQkNUzh5tz3axp2/4RHMndb2oohKeMyvaJ+8HlzZrrcZL9Jj0Xi4oUo2D+RuO7QRG8HzDAMl+Ev8mzvQN7ZuQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769522035; c=relaxed/simple;
	bh=D3wR+QL3e8s6K+2o7wnm+jXnQfyNc04L+7SRNlNbec0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=blBDPKsTFpiHRA0B04a3r1n2PBMu/mlEDJAoA2a50X7WdIn1sK0zCJfNhvjzXiMvIL2HkUh0WCrHFgpGjG/REqgoRH5f7Wu6AfnwWvGLFhb+uhTEvPRSHbQv7Cviu5BGyz+aJb2wlEW6BeL2p59PqkyxmQea+SzZtiQGhJsX6n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWHDHtAD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWHDHtAD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9303EC2BC86
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 13:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769522035;
	bh=D3wR+QL3e8s6K+2o7wnm+jXnQfyNc04L+7SRNlNbec0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EWHDHtADPvumvhco5ZO6P1mfedT5G+mD5erodh8xhmVmqkFWAkh0PgmWJsvl+CcEH
	 1fwhvZWyVSm0g+a2pMtpPQi1d7CkTVjJ1GHXbS9q2pRNAXgIrfYy06vNtZsgJwES3Z
	 px5TlrnoPBSL//oALG53E3fdSsl1Zl5tid0jPdEQeFJUgGuqCf9wKNrO8c8HMw9Y6v
	 vw0qgLJ16Ey4prN9tow93P+CMpVX5iv7/+VMYdpRh+EE3EG/T0WUpF9YNrAfd/2FVf
	 oPeRpVHmcZhiXP4AvQvDDHRdEKM7jpQS5bAplCGjhlRN837bpBGDRkAB3BhF1fzhX+
	 aB8uOZTvRv5Hg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59b76844f89so5420616e87.1
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 05:53:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWsBGiEEl3cr4hzwKZMSd0O0EjtUbY4ux6uFefn9MAdDsqt26SfOczpGUTK4nfaJZn8Mhxvml1TdR3s25DcNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxASjfOx+DuPFLvdm4MhtNh1ouqv9P7Gu0a/CUeHU6KL7jPPmhz
	IOUL3T5oJyECKjhApvhGrj+wkq2KaFCFdLbuWlf7/tTvG8eeNo8crRHlTgWN9bk9+LFbQceh0Lw
	PBnpwSylYTo5m0yfMIXpHVt3Iwjvntr4=
X-Received: by 2002:a05:6512:3b99:b0:59e:359:7afd with SMTP id
 2adb3069b0e04-59e0402404cmr836765e87.19.1769522034299; Tue, 27 Jan 2026
 05:53:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-rust-analyzer-scripts-v1-1-ff6ba278170e@kernel.org> <CANiq72kkxS9ACvR52q03AN+WdFV96cK+tvejnnDXKZTKuKZH9g@mail.gmail.com>
In-Reply-To: <CANiq72kkxS9ACvR52q03AN+WdFV96cK+tvejnnDXKZTKuKZH9g@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 27 Jan 2026 08:53:17 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9kiWZr=82sztLfYqtp-fvsQ2QTgTYqNg5hSsZMKCsvjZA@mail.gmail.com>
X-Gm-Features: AZwV_QiIRHv8ebfqJ0OBns2FVWPBjsU2BCs_25E4T3uIoz6fpM04LJsH9Ore_Jg
Message-ID: <CAJ-ks9kiWZr=82sztLfYqtp-fvsQ2QTgTYqNg5hSsZMKCsvjZA@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: define scripts
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Kees Cook <kees@kernel.org>, David Gow <davidgow@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 25, 2026 at 9:09=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Jan 22, 2026 at 5:53=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > Generate rust-project.json entries for scripts written in Rust.
> >
> > Use `Pathlib.path.stem` for consistency.
> >
> > Fixes: 9a8ff24ce584 ("scripts: add `generate_rust_target.rs`")
> > Cc: stable@vger.kernel.org
> > Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> > Reviewed-by: Fiona Behrens <me@kloenk.dev>
> > Reviewed-by: Trevor Gross <tmgross@umich.edu>
> > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
>
> Hmm... This introduces support for scripts, right? i.e. it is a
> feature, or am I misunderstanding the Fixes:/Cc: stable tags?

It depends on your perspective - I framed it as a fix of the commit
that added the first script because that script was added without RA
support. What do you think?

> Also, I don't see the Tested-by from Daniel -- he gave it on the last
> patch in v4, but not this one. Was it because it was assumed that
> testing the last patch meant testing all? Generally that shouldn't be
> assumed, e.g. he gave two Tested-by tags, so I guess he didn't mean to
> give it to all.

It was so long ago, I'm not sure. I'll remove the tag. Thanks for calling o=
ut!

> I would also suggest on apply to give it a bit more details.
>
> Anyway, this seems best suited for rust-analyzer-next after the merge
> window when the above is sorted out.

Will do.

>
> Thanks for reviving these patches and splitting them!
>
> Cheers,
> Miguel
>
