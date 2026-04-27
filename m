Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8B53191D0
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 14:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777301520; cv=none; b=DxG/r84Uu7eXAv/PkWhq4y8xE57RNsk04Pr5BM/xvWg3P5BAj7imcNXDuUlMNn+r7TeguUSppiLJQDfAR3MBHT3W9XmC1HgiTdU03SYdopMz//mknoUzxgUluQxpyHZKGvjO7D2S4KTP9rqxR5BSZ8sdaUSz/+KT4CogBOAxvDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777301520; c=relaxed/simple;
	bh=YMj0cLTFxN9KZLeHU9BEih4rmUm/lUQl+xFIrkshnSE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=avTVwq9UDIpTZU8Ieee/5FbC+y6XqkrQ76nZsiSiWqNVoLSRrtObhGC3dT9uv76m5s35SXxSUvCo65CwUUiLnrTg+7NP6yQ0yHvooj8FyjXir5tdwwevii1dT/uie1SuXuKdcSHKJxdBuh77Lvv9VmfxgLUe4FgaHgl3DYhIVHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dWWtM2aB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dWWtM2aB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFAD0C2BCB5
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 14:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777301519;
	bh=YMj0cLTFxN9KZLeHU9BEih4rmUm/lUQl+xFIrkshnSE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dWWtM2aBYZXnfQQfLjhokXwPFRc109hSHlYMCZeNWOyI4FvZbMZEh2lDrl6NKk5B1
	 htOK1EUVahm85qsf9xQXkiQ3NA9lQJmYJeZzEyNvBWY6IbyoozETFVKXNOwWDyhTSJ
	 Mcqve0/EjYcNv6td6SFdo4QycDAGO5smQclyYG7/tkXZ6vnAl2uws3daTvlg64e+QP
	 G7tHP6C7QMWNsZ4He4gHDgDhPi3tMeWIgEM99PzvL07SE8ToDeBEB3eNm/xCGD6y3h
	 15l5vLxrxvCQ8//PkovDj+874+8AXerhroIH3VhfFOyBa92asIqb5l8NqeYeJvH57C
	 XE4o5lYSKL8UQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38e7d983f50so113865321fa.1
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 07:51:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ZE9XkIfKq1jjY8udRddWNeAtLtzHSov6IZOe5Qa8MfZnzrEW0ZAF9czLA2Qduh6A85uksRshV+PIbAGizRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh4bqY8RSkAqM8st5jYFl7a2N7y/YIGwRTR64uhiayJvsBuK7r
	aCCp7kkAuJewXS+vBaVG61uJhey76uNeakQHKVNMqv0t5QVjUGDnbOCcTpc3XFkNHUFGMDL1kae
	N30p1K1zSnJ0vpyOs5GqRkZ7k8ukRnZY=
X-Received: by 2002:a05:651c:f04:b0:38e:203f:bbb6 with SMTP id
 38308e7fff4ca-38ec77f44f4mr122088351fa.4.1777301518604; Mon, 27 Apr 2026
 07:51:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-rust-analyzer-import-typing-as-t-v1-1-5bb33ad12396@kernel.org>
 <ae907fWOUEoIl18K@luna>
In-Reply-To: <ae907fWOUEoIl18K@luna>
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 27 Apr 2026 07:51:20 -0700
X-Gmail-Original-Message-ID: <CAJ-ks9mUHw57S0b3Zg4WWa9yDYaD-DtRpj4PwD_X30+A4iQWOQ@mail.gmail.com>
X-Gm-Features: AVHnY4Loli9Ia07TXvJ2Qsr0RsbK8r2Dh9BIRb3sm0zLmwiAhO4cOSsvcLFQ1qs
Message-ID: <CAJ-ks9mUHw57S0b3Zg4WWa9yDYaD-DtRpj4PwD_X30+A4iQWOQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: generate_rust_analyzer.py: reduce import noise
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 10:38=E2=80=AFAM Link Mauve <linkmauve@linkmauve.fr=
> wrote:
>
> Hi Tamir,
>
> On Mon, Apr 27, 2026 at 10:23:44AM -0400, Tamir Duberstein wrote:
> > Use `import typing as t` to avoid having to list each imported symbol
> > whenever it is added.
>
> This isn=E2=80=99t really idiomatic Python though, every other Python pro=
ject
> I=E2=80=99ve worked on listed all types they import from typing the way t=
his was
> done previously.
>
> I think the reasoning is that it=E2=80=99s more important to keep the loc=
ation
> directly in the code more readable, at the cost of making the import
> lines slightly longer.
>
> But if this is a regular kernel practice, please disregard my comment!

Thanks for taking a look. I'm not aware of regular kernel practice in
this area. This patch is motivated by the discussion in
https://lore.kernel.org/all/CAJ-ks9=3Dp3i5xbnDojJ7QopmUanec0ZPZ_x3_zD0Csyad=
5L7FEA@mail.gmail.com/
where symbols used from `typing` may become conditional, which would
complicate declaring all the imports at the top.
