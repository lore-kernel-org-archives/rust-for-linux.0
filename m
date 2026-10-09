Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA58643CEDD;
	Fri,  9 Oct 2026 19:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791574493; cv=none; b=DWmj6NJLywqLZDwB5JlszXXXTa3ct05ZEGrCpWEbXB9PgcZi7eGzgr2fMWrscpGxg0uqv88rfnU3qr9x0W17xOZllDGirxVPxH8PJIbkPrDohUJ2OeHu0usHfbPhWqyX6y8c22EfIBoa4acVJ/c4VreQ0N+2WOHC3g/ATzEU374=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791574493; c=relaxed/simple;
	bh=xPURyNdFSfb421m1pw6nhyfVuEtp/+L8oN534sBMm2A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NnC2nqMOy2IPS9K+G/x9dRXYdO5nLy3cSqd5rnhe7a8WS4S8FKACs8ZQD1Jkbsl1Nm93HVctDxJ8TmOvvjp0hjWE1wSrHdxJi+nAg/3D8fmkToboOm8vChmgEl3G0jQjcQV8DX14unPh0MdD1kNkF6HYjvxWhT0a1NPhqepgGg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mOMI8/Ao; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mOMI8/Ao"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD5F11F000FF;
	Fri,  9 Oct 2026 19:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791574484;
	bh=hUw/Elx6ForPoWbMyVNIYtBgt+BnWDkl7+HuvNo8Lpg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mOMI8/AoJH8X1W3gwl6td7zt6gSdUyjxYy+s3+PD4hOkcIz/HffZUzMcgJWJj/N9r
	 BlrdcetGLMNqIgzJlyv8KURUuTdHrq28l0n2rN+Zdvl+S7lECJSdjKcqy+NhmDpaDM
	 2hvFlR+tFQBuEN9zPWCj7MLEfR50W9rNN7Eg3OheO6nJOd/uoLzbv1tv1KB70uClu5
	 O9gRzkCBkebq0ZANskxrm3pRsCi2YdCgHGBNuKXy7dlKv7VeeaEuTZ/GUGsJ7mEVSp
	 24rMlbGP9zbwPJRxdJtY/ZCwtHuIMociJk6YKKy5ZxjKvb8ZaXgNBX7IlroR1cy144
	 sSCaAc1+6vmng==
Date: Fri, 9 Oct 2026 21:33:25 +0200
From: Daniel Gomez <da.gomez@kernel.org>
To: Matthew Wilcox <willy@infradead.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Björn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Onur Özkan <work@onurozkan.dev>, Andrew Morton <akpm@linux-foundation.org>, Julia Lawall <Julia.Lawall@inria.fr>, Corinn Tiffany <corinn.tiffany@inria.fr>, Liam R. Howlett <liam@infradead.org>, Philipp Stanner <pstanner@redhat.com>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Samsung GOST <gost.dev@samsung.com>, Daniel Gomez <da.gomez@samsung.com>
Subject: Re: [PATCH RFC v2] rust: rxarray: add rust xarray support
Message-ID: <20261009212431.0-da.gomez@kernel.org>
In-Reply-To: <asT5inptTPITu2j1@casper.infradead.org>
References: <20261005-rxarray-next-v2-1-187f689b52e4@samsung.com> <asT5inptTPITu2j1@casper.infradead.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-Mailer: lorebird



On 2026-10-06T14:37:14+01:00, Matthew Wilcox <willy@infradead.org> wrote:
> On Mon, Oct 05, 2026 at 03:37:30PM +0200, Daniel Gomez wrote:
> > From: Daniel Gomez <da.gomez@samsung.com>
> > 
> > Add Rust XArray support.
> > 
> > This is the Rust implementation of the XArray lib/xarray.c. As of now,
> > it supports basic functionality: store, load, load_mut and erase.
> > 
> > Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> > ---
> > As discussed at LPC26, this is the version of the Rust XArray that is
> > ready to merge for testing and evaluating purposes following the Rust
> > reference implementation rule (experimental) [1]. Next, we will make
> > progress following the roadmap suggested in v1.
> > 
> > For the motivation, see v1 link below in the changelog.
> > 
> > A branch with the patches can be found here [2].
> > 
> > Link: https://rust-for-linux.com/rust-reference-drivers [1]
> > Link: https://git.kernel.org/pub/scm/linux/kernel/git/da.gomez/linux.git/log/?h=rxarray-next [2]
>
> Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
>

Thanks, Matthew.

Following our discussion with Miguel at LPC, I'll send PRs for the
Rust XArray to you, ie. the "PRs from their Rust sub-maintainer" option
in [1] using my tree at kernel.org [2]. If that ever doesn't fit your
schedule, the Rust for Linux tree takes them as fallback [3]. Note that
the Rust tree follows its key cycle dates, i.e. the last version of a
series should reach the list before -rc5 [4]. We have passed that date,
(for R4L tree) but I'll send the PR anyway so you can pick up when
ready.

And as I mentioned, I'm happy to take on more of the work if it helps.

[1] https://rust-for-linux.com/rust-kernel-policy#how-is-rust-introduced-in-a-subsystem
[2] https://git.kernel.org/pub/scm/linux/kernel/git/da.gomez/linux.git/log/?h=rxarray-next
[3] https://rust-for-linux.com/rust-kernel-policy#who-maintains-rust-code-in-the-kernel
[4] https://rust-for-linux.com/contributing#key-cycle-dates


