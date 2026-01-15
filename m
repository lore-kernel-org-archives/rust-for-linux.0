Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697FE2E9EAC
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 21:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768512988; cv=none; b=qn6xRM1F1XoPZOTGaGge20qN0lLdS87YiXvEjwG+68uPhabD0qeOvDPzy4XVmhTx5ZzM7gDqbLs/1ZjLQ24n36bERQLuf3k+txZ+/x8OjhL1IAEbla5Jr7Q/4dujUPkxogFbsj2u20SDaldHYxMNLNPuIKc57wdgf+sOWOaUBDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768512988; c=relaxed/simple;
	bh=h/TQdir1+Ed9i5rLIX3H0A84UyD6ogNOJ2gy+TPnCWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uz7/2PZK/wJKbpOMWiIYMpkUEgycS+i55XfF4EK7vsLFYUOnUoHJtECef45CkOBIM320Uc63vc7gZaZy/HrA1QjoGO0PxNruh9xCaKk9bXjlRsW1I1lmRVJ8itorQjAgKDH7+vxQnXUsPQObaQAyCxksp+IWv9g+Q6SdcngUrZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ddwmIWB2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ddwmIWB2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002B7C19424
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 21:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768512988;
	bh=h/TQdir1+Ed9i5rLIX3H0A84UyD6ogNOJ2gy+TPnCWo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ddwmIWB29WNknQBis7de/rdEwkCgYtTpnESS9iqBUtK8cBLU5KOfZK0S/JgLO6Kbp
	 06PIJrJd9VUGYTc8foxREv47tsEZoFAQBmTqQ4McvzOCcqxOFDW1GJtRQ4wjG0ybQ8
	 UgHd9Y8N754qHcm5Tbvuy1YnHl1GvoA4reQjyv60cea0iLG0n+VKFrsIrTO/sL7E/y
	 Bw3Cdj5zdD16t2pAH5XKPbbezbITaQ5mLBJYs8wWKYI3wqSqVyF1s/6UG891InNfcC
	 O7+vbFAGW1s/I6IHIFmH8lmaBdJ7n8uvwP5/I3GsnYcRJDP/62BCY37HdkhBIBWmcW
	 GfDwinWW0DTNw==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38310ee9d40so11589171fa.1
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 13:36:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVy/3MtNuVtU2sgvlEoIjicGYmlc6S/R+dFQmCpuugHvNOl8Ni1CVYKVxrE+CuS8Zn4NpRSEYsPfxjOlORrUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmfV3FEO+NtIPIw0YiclRL/zd/yC3czF/IWUkw9iMgLZBdcjn/
	pvSKRT5REKgmwqYF01KO295zkCf02NNME9gyxav7/yY8ekXvNMBQ5P0qqFDy97nKZFyir29Ydva
	RfFG+si8WuVAmfQTKXI2PaOG5G+QXZ08=
X-Received: by 2002:a05:651c:221b:b0:37b:96e5:dc40 with SMTP id
 38308e7fff4ca-38384176332mr2763931fa.8.1768512986658; Thu, 15 Jan 2026
 13:36:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-rust-analyzer-sysroot-v1-1-4de831df234a@gmail.com> <CANiq72kd9bHdKaAm=8xCUhSHMy2csyVed69bOc4dXyFAW4sfuw@mail.gmail.com>
In-Reply-To: <CANiq72kd9bHdKaAm=8xCUhSHMy2csyVed69bOc4dXyFAW4sfuw@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 15 Jan 2026 16:35:50 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9mSoDV-b5Rj+G1DrKNJoK5B-x+Sr7cWjbBPrTX8fEinXQ@mail.gmail.com>
X-Gm-Features: AZwV_QhifRfyk9Gg_NUSPFd9cRKQF1ri5EUjpO_h0hyvhGZKCGbITrCkau4jJK0
Message-ID: <CAJ-ks9mSoDV-b5Rj+G1DrKNJoK5B-x+Sr7cWjbBPrTX8fEinXQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer: compile sysroot with
 correct edition
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 4:23=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Jan 15, 2026 at 5:35=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > Rename `core-edition` to `sysroot-edition` to align with the naming use=
d
> > to refer to standard library crates in `generate_rust_analyzer.py` and
> > apply it to all standard library crates rather than just core.
>
> I think, in principle, even the sysroot crates may have different
> editions, which I think I used that variable name.
>
> For instance, in the move to 2024, it seems all happened at once in
> 1.87.0 in these upstream commits, so that seems OK:
>
>     0e071c2c6a58 ("Migrate core to Rust 2024")
>     f505d4e8e380 ("Migrate alloc to Rust 2024")
>     0b2489c226c3 ("Migrate proc_macro to Rust 2024")
>     993359e70112 ("Migrate std to Rust 2024")
>
> But in the previous move to 2021, `std` moved in 1.59.0, while the
> others in 1.60.0:
>
>     b656384d8398 ("Update stdlib to the 2021 edition")
>     06a1c14d52a8 ("Switch all libraries to the 2021 edition")

Good point, I hadn't considered that (nor did I do that archaeology).

> Hmm... I guess the new name is fine, but we may need to go back to
> separate naming eventually if they get updated at different times next
> time.

=F0=9F=91=8D

> By the way, it says `sysroot-edition` in the message -- I guess you
> then later used underscore because it is now not attached to a
> particular crate? In that case, I can update the message.

Ah, I think I wrote that when I was under the impression that
`--sysroot-edition` was a named argument to the script but it turned
out to be positional. So: you are right that the message should be
updated.

>
> > Note that backporting this will conflict unless commit 46e58a9637ec ("r=
ust:
> > kbuild: introduce `core-flags` and `core-skip_flags`") is also backport=
ed.
>
> This normally is solved on backporting time providing a resolved patch
> or, if you think it is worth backporting the other one too, as a
> prerequisite in the Cc: stable lines (see
> Documentation/process/stable-kernel-rules.rst).

Ah, thanks. If the prerequisite isn't backported, who provides the
resolved patch?

>
> > Fixes: f4daa80d6be7 ("rust: compile libcore with edition 2024 for 1.87+=
")
>
> Since this commit is previous to existing kernel branches and you
> mention it above, please consider adding Cc: stable.

Ack, I guess that will have to happen at apply time for this one?

> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
>
> Cc'ing Jesung who is becoming a reviewer for rust-analyzer.
>
> Thanks!
>
> Cheers,
> Miguel

Thanks Miguel.
