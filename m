Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782F947A0DD
	for <rust-for-linux@vger.kernel.org>; Mon, 11 May 2026 18:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778523105; cv=none; b=sAgFyB4vN9rQjBjTq5j3VaU/eE9Ow8/kCJDSdxM3OTUWtF6rIWWmJsyVTrP3SlZfNaD67hM2I/qElgpt/bniFGrXEM/XOs+7dljFosw536B4Q27qUj4qn4GQzV1sGQGO7mmveUu589JLlPzZCtM2sSDDGOjqu39+AG/dranJbdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778523105; c=relaxed/simple;
	bh=GdLa/8l9UTjSG8+PZg7ZJA6A/0OkeZy7AHsN3502T7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H5ypzBXh/IY84W/Her0dZUYL5OY4g2R4QvDgv0Z2S/BLD/QVh+Ft3bsUwhfpqJ+FdAFbgirWdBTxjqvPtjzwrN0PwyP+UV+v4XHjeqZ1XS+b426EuV1pkmliNUw3xo3YBl/c8OTaD5TtFxaCqHnNehZ6sCKVHu/SEF6YSznAuvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cxi7c38o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cxi7c38o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5C6C4AF09
	for <rust-for-linux@vger.kernel.org>; Mon, 11 May 2026 18:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778523105;
	bh=GdLa/8l9UTjSG8+PZg7ZJA6A/0OkeZy7AHsN3502T7Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Cxi7c38opGcfQN+GnXeNASTxWt6mfnmMRCIbTKprhiyFmKh+KFcpbplj9NajHLJ15
	 Ec6z7LN3U+NMgj+yS8DuNEy+fTfzRKpvS3IPmsF8V7OJU4sI7FmPydsYx9QGTl4YKL
	 UoRKZzoTHwRwSxjrIaF6MRlt4NKBVFxevNf2e1TTxlZyLeLLfhUAJH29HYy1OP6MU5
	 F+9wxBOk5PyBAMKQ8Mbnp94ef/6mM/0EJvCyVX5tSOT9kOrhEMcVao14A4DkRF1Nln
	 1j0zcFP2h9jMHk3Rmj4CAjNf6qoi6tEhKPF6egQhsqFbbRGiOf0jWO4kBcWma+tXjD
	 Wf+jwA1F/AH/w==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3939d2bd7ecso37408831fa.0
        for <rust-for-linux@vger.kernel.org>; Mon, 11 May 2026 11:11:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9CmmoQ2ZC5ohCJ9Tu/N2rc+qACyloRdD9m2iRuAUrwZi+mrPpGagAUjgeDbUu+Kls1NRjxu5xM/UVYqpH92g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuiy4P8mkw63wQvNq5HVVsOhgzOw7ChiDN30aoSU1yauVEF/We
	2dQHxvBX12gNNdkOdd1Q9a+TAk9cZW1Kl8kyepAOOYEiqqP/J9DvYMAgntK9vV5JzWXNMGsAXTD
	Os4lBJkJBvFJKkD39gLVkYNMS6HdixrY=
X-Received: by 2002:a05:651c:20cc:10b0:38e:7f8b:7f1b with SMTP id
 38308e7fff4ca-3943865f7femr1245431fa.13.1778523103836; Mon, 11 May 2026
 11:11:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-ra-fix-primitive-v7-0-cb8e3791f2b5@gmail.com> <20260507-ra-fix-primitive-v7-2-cb8e3791f2b5@gmail.com>
In-Reply-To: <20260507-ra-fix-primitive-v7-2-cb8e3791f2b5@gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 11 May 2026 14:11:06 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9mgYuiB=0z4nykOBwMLuML=6Eee+n61TyTbRc_OX8LLVw@mail.gmail.com>
X-Gm-Features: AVHnY4LXV5tuIr4VX9tcwUQ8f0sdItak5giPDkMYeeJ41k1dnqyot6bGiOkBQZE
Message-ID: <CAJ-ks9mgYuiB=0z4nykOBwMLuML=6Eee+n61TyTbRc_OX8LLVw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] scripts: generate_rust_analyzer.py: fix IDE
 support for primitive types
To: y.j3ms.n@gmail.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 10:47=E2=80=AFAM Jesung Yang via B4 Relay
<devnull+y.j3ms.n.gmail.com@kernel.org> wrote:
>
> From: Jesung Yang <y.j3ms.n@gmail.com>
>
> Update `generate_rust_analyzer.py` so that the generated
> `rust-project.json` contains the `sysroot_src` field with
> `"crate_attrs": ["no_std"]` specified for relevant crates. This ensures
> that rust-analyzer provides proper IDE support for inherent methods of
> primitive types.
>
> Since commit 50384460c68f ("Rewrite method resolution to follow rustc
> more closely") to rust-analyzer, it no longer provides language server
> features like code completion and go-to-definition for inherent methods
> of primitive types when sysroot crates (e.g., `core`, `std`) are inlined
> in `rust-project.json` [1]. As `generate_rust_analyzer.py` currently
> inlines these crates, our setup is affected by this change.
>
> Specifying the `sysroot_src` field restores this functionality by
> allowing rust-analyzer to locate sysroot crates by itself. However, this
> causes `std` to be treated as a dependency for all local crates by
> default. To align with our compilation settings, provide the `no_std`
> attribute via the `crate_attrs` field, as the `-Zcrate-attr=3Dno_std`
> compiler flag is not visible to rust-analyzer. This combined approach
> removes manual manipulation of sysroot dependencies while preventing
> incorrect symbol resolution against the standard library.
>
> Note that this configuration requires rust-analyzer release 2025-12-22
> (v0.3.2727) or later, which introduced support for the `crate_attrs`
> field.
>
> Link: https://rust-lang.zulipchat.com/#narrow/channel/x/topic/x/near/5616=
07963 [1]
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/x/topic/x/near=
/561607753
> Reviewed-by: Tamir Duberstein <tamird@kernel.org>
> Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>

I think this loses the kernel's custom sysroot crate cfgs. In particular,
rust/Makefile passes --cfgs=3D'core=3D$(core-cfgs)' today, which includes
no_fp_fmt_parse. Once we switch to sysroot_src and stop modeling core
explicitly, rust-analyzer discovers core by itself and no longer sees those
cfgs.

Would sysroot_project be needed here to keep the custom sysroot crate
configuration while still avoiding the primitive-method resolution issue?
