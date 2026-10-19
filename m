Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003A84F55A8;
	Mon, 19 Oct 2026 12:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413346; cv=none; b=kx+PXe/hP5MPdljZtVLInOBdjPJvcH/xH5fdMPHperbrCau15bC7yIcnbS8SJawrxXn/De7H1rEjokCJXRfZQ1YBMMufS38THE6IA77AL0UW39XNIvvwdBgHLiDhqttJRUg/mACBjUizajsDf/Za0WFuYfGrWAILI3u/GIbb1SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413346; c=relaxed/simple;
	bh=jTDFTrPYuRQbYqKu2LIbvW88frf5Yvod2s+ErTdYYC0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mx+tXHTipyAjpE9K1nr6UGL+HcqbAdvbyKH1G4uofw9dxr94zU1VWhV5t1VyRkbQ+ohLSXd/60D9gob+EaMDAH5msKxXyGAwVvF3h8mIrx0Ru7P1ZqoIUizqteiJWPe5+O7zXfzfvUBljqw2TzBiSMe8D0/0fmfdZpHmf5FrgRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cx/BZmH5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cx/BZmH5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B358C1F000C4;
	Mon, 19 Oct 2026 12:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792413328;
	bh=jTDFTrPYuRQbYqKu2LIbvW88frf5Yvod2s+ErTdYYC0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=cx/BZmH5WdaLNa/iTYvb/jn46JxW1B9crTMRHWDxFtnclxRYd5hJxAs00pzG+axvk
	 1tWsq+AaHhLYqY7gCPf0FAJSo8UhkE1NMNOJxpTweKxrccStC+8N3JYuyXoFqipaKL
	 zaubhem0ZGn5tsIdcRyfXw7zfCudt7cjMLqiJKLHQiHOYfXqsLhecQ4HYMViqBxjvn
	 GsNtxB/wIWfAf2lXTiwarPrzXsjXnS86bK6IJXUCkWgXnYbCxxD9azghB90MrxsDGN
	 s9lU4lkKycUDrrgNSIaXEhaIKj9BtlniR0WWHl2mDow4cfZO2BoFN9xi/bmCGeTtWK
	 8+eBeRUk2dGig==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Breno Leitao <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel
 Almeida <daniel.almeida@collabora.com>, Tamir Duberstein
 <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Onur
 =?utf-8?Q?=C3=96zkan?=
 <work@onurozkan.dev>
Cc: Gary Guo <gary@garyguo.net>, Priya Bala Govindasamy <pgovind2@uci.edu>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH] configfs: zero the write buffer on allocation
In-Reply-To: <20261015-b4-configfs_kzalloc-v1-1-17c1ba6db062@debian.org>
References: <20261015-b4-configfs_kzalloc-v1-1-17c1ba6db062@debian.org>
Date: Mon, 19 Oct 2026 14:35:06 +0200
Message-ID: <87cxt5dg1x.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Breno Leitao <leitao@debian.org> writes:

> fill_write_buffer() allocates the per-open buffer page with kmalloc()
> and initializes only the bytes copied from userspace plus the
> terminating NUL. fill_read_buffer() reuses that page if it is already
> allocated.
>
> After a write, a read on the same file descriptor therefore passes
> ->show() a page that still holds stale heap data. A ->show() that
> returns only what it wrote never notices, but one that returns a length
> covering bytes it did not write leaks that data to userspace.
>
> The Rust bindings are exposed more directly: ->show() receives the page
> as an &mut [u8; PAGE_SIZE], so a driver can read the uninitialized
> bytes.
>
> fill_read_buffer() already allocates the same page with kzalloc(). Do
> the same here, so the page is initialized whichever path allocates it.
> The cost is zeroing one page the first time a file is written.
>
> Link: https://lore.kernel.org/r/cover.1790981219.git.pgovind2@uci.edu
> Suggested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


