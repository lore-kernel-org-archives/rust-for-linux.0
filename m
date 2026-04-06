Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE281BD9C9
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Apr 2026 15:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775489463; cv=none; b=an5rpeeEjf+za9gg3L4UAIU8+3YOrag63wuM5S2A2zdfHErbeJcdPYq6lJkAK/PPYvcuuwyvhqlH0oo7QUmi9hNq74mqWKKiNqdxxmN0k4KZzOgXWViIko65eIsrwoxXFcrxPEVir5+9it8z4TbLKdsBeieyF4gIPcDCMOIYTA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775489463; c=relaxed/simple;
	bh=upOPgQrKow7ScyuKD1WfCKj6976lQXmqW8HddZVDJoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ct0I//9vRMB7dM9R5u/DBvDGZDoCDPPs1/Ip46Z+SfypQhXnvD6R0ArFl0zfFe/bx9pJEke1dhM0Zhyd+zyHtW6OzbKfzHRKhAYJtZUvMqtTcOXx58Wjm1J2w2+daQm3Ey9H61BcCJZVXVTy+agziljHmwRbF4oMt6ql5mdH5pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nz1Rh1Kc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nz1Rh1Kc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89885C4CEF7
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Apr 2026 15:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775489463;
	bh=upOPgQrKow7ScyuKD1WfCKj6976lQXmqW8HddZVDJoo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nz1Rh1KcyfBmOA0LZp9VrJQ/BYnS/7p2hMbcFpEOG8VKVFYg/j1PW3qm3srSjHmhj
	 NJVicCHTHMtboyOwJZfRECfmpZ5+DFrT5FP9Eq2hAqwny42NV/4sFyqAv60tm5Vpm5
	 6Ysh0MMg/3FaRG+HKDHo2y5ur/2yw0A4IPAd76XczLyFWNM2d/7TgJS6u30KP/bCa8
	 F9YjZH9zPeObsU9M9MY95LohYIRNeRKABSzwk0/FtB0kEc1wkzDUCIIEkJmkx+CwfC
	 FDlZLKrTAnEzIGFXgaGZsXniT2zCMwavFBX811nBLGCCfEgBOi1seqO2oq0E37xZJN
	 yc+wjJttP9PNA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38e0ef48ac0so2763581fa.3
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Apr 2026 08:31:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUKIXnsEG445ulKbyGp4YYeMchKr2Og/5SNclPs3nIMSlB4ucd8goCBYz4nlTJJ1BqhNJhusHJ4BcnYReMGhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yya4zsX4rBAXNWZSTMRzoVA9DnlVSFkb8P47BDEBLd1GVfPKsVI
	yvpnw37Y/1NoLmDY1a1VXy4UyPNAPIG5Jo3q8rdb/bAAo1jIaUA+TMWCNKCfWY4iOtcrA/MyzDB
	gUiQfxJ/72365E+ISu8MUkmz2jJj323k=
X-Received: by 2002:a2e:80d3:0:b0:38a:f5a6:9173 with SMTP id
 38308e7fff4ca-38d91c092bamr32802941fa.27.1775489462303; Mon, 06 Apr 2026
 08:31:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <20260405235309.418950-8-ojeda@kernel.org>
 <177548573697.95472.13544191227699996309.b4-review@b4> <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
In-Reply-To: <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 6 Apr 2026 11:30:26 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com>
X-Gm-Features: AQROBzB1MuYM_2_U32IZvjJjOPHSscckixukkJGDNua3mGMOgh49W4AabPzp8YM
Message-ID: <CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com>
Subject: Re: [PATCH v2 07/33] rust: allow globally `clippy::incompatible_msrv`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 10:38=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Apr 6, 2026 at 4:29=E2=80=AFPM Tamir Duberstein <tamird@kernel.or=
g> wrote:
> >
> > Could you add a reference to the upstream bug report [0] here?
>
> Of course, thanks for the tags!

You're welcome! Actually it seems the lint was already improved
upstream, starting with 1.90.0.

Link: https://github.com/rust-lang/rust-clippy/commit/c0dc3b61 [0]
