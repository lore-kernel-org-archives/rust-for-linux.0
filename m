Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85587224AE0
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 19:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769803024; cv=none; b=Rp8AYPH193HJM4bbEG4xnoNbEAwjMl8otNWQGgMoiFItv3w/MMUx1aoLvp+/k2Ypkmsl1YqzESeU8fpF2LpPKFCClHgUKqyqSpXhFL5/OAkso8eWNL0FCPqm1E/t6O4jdhpRPD3ZSm2Cruy2KRtytmb39pKwSHmvZlFpn1byamA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769803024; c=relaxed/simple;
	bh=Qkl7NHbf6z3X87eFKdKOE6tkALCCrxkghxcKni7Fre4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ncf8yDzKO7nYgz+PqHZ5/MA9DpcxvF8AVgTJ4O/d1JxLnmrdo9wfHQ/Dqp0CpocoYs5qLqN/XqS7HF85Q3U66sVBe+rr9lBz8xSzEP5+g21zxXehgnYX7eFLt2MAZjJU2pgKV6Uc+dqxVVcbFoV4RDsseC23a74uxvNgJTQeiGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nzfpNV5Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzfpNV5Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ECEAC4AF09
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 19:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769803024;
	bh=Qkl7NHbf6z3X87eFKdKOE6tkALCCrxkghxcKni7Fre4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nzfpNV5YTTJ6serZEoxqY14YLcERf56/giAFuypcTztBzK1q9VDDmkr+tVNsZJPjY
	 fyJiKGYZoAi9swlPaZghDWikg6rRvoKSNvczMgy1EG6efFZP0jVx43V8RjF+QOX7OT
	 ORxyZo+SyVj4SvMHfk8VbVD7GzHteIBMjvfL1pM5/rFIc0DRMwA7cbTRBQlziuiggR
	 JotzQrxIlpwyAeIShFGHwKNSJMC0h6PKql0QnEmMJ3i0NNXFi+sw0+Xwc0YHYtK1PK
	 yAg3del+g9P2KG5/aa3h3nUhkDM9hPvhnN0yevDHj+9OCsH2+nGBiJ+25vYj/5T+iN
	 K7a/ttQgcwLdw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-382fa663249so20976161fa.0
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 11:57:04 -0800 (PST)
X-Gm-Message-State: AOJu0YzJ3XeHBjK5TbC0Da9Ou8aRqtYqKB8I7TkdndDPuETwa4FTaKQ5
	StbiCmOdBXpU6aY5BZsv+xR16JocT699tIpLr3WkrVICq1x5/Hd9z1kBiryV762n4MfbHaMv5Tm
	pCl1vwdXcfQZwMREsQsD3MB+LyjFm0jI=
X-Received: by 2002:a2e:a984:0:b0:383:1b4b:c2b7 with SMTP id
 38308e7fff4ca-386465412d9mr12961911fa.19.1769803022799; Fri, 30 Jan 2026
 11:57:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-rust-analyzer-types-v1-0-29cc2e91dcd5@kernel.org>
In-Reply-To: <20260122-rust-analyzer-types-v1-0-29cc2e91dcd5@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 30 Jan 2026 14:56:26 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9nbegTw9hEqo+vgJnU4OzMG-gwegA74FysB9D+TV-Xz+A@mail.gmail.com>
X-Gm-Features: AZwV_QgCUteA4UV1zpaTIXNS1Yr6xZxpgxAeM3UJ7Vau4LqoUEmrFMOMY8xcFFI
Message-ID: <CAJ-ks9nbegTw9hEqo+vgJnU4OzMG-gwegA74FysB9D+TV-Xz+A@mail.gmail.com>
Subject: Re: [PATCH 0/4] scripts: generate_rust_analyzer.py: tidy and add type hints
To: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>, Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 12:30=E2=80=AFPM Tamir Duberstein <tamird@kernel.or=
g> wrote:
>
> This series adds type annotations to generate_rust_analyzer.py. It is a
> subset of an earlier series[0] with formatting-only and drive-by patches
> removed (I sent some of these as separate single-patch series).
>
> The final commit leverages type hints to tidy the implementation. It
> could be done separately from this series, but serves as a nice
> demonstration.
>
> Link: https://lore.kernel.org/all/20250424-rust-analyzer-host-v6-0-40e67f=
e5c38a@gmail.com/ [0]
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Applied to rust-analyzer-next, thanks all!
