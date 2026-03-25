Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434963CA483
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 11:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774437096; cv=none; b=Pn+dsAkC//u940rYIBJv5Wey4F2ZLA4hcOLeW+k8CGImeNEOWtdwqFhfzmnJ5emwbmLamMI0DKPZJ3Nc0RydrB6EHYrRNd7hhR3m1vVUSgjRewCHQQOXPxiAezj9RmJiXNrBFnXiC57TiCIyslPsxfde+NKL/QqvaEid/eGb6Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774437096; c=relaxed/simple;
	bh=WQ3Iqc5Yt/SqARFP0HFWXjCfEA+H9jyehM14QOGjeAM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=alLOI3i6JSJvMietPuxH+3+D00lws//+ASjoUfJoRaEE5lGQHbvbktO/zpklkvJ+M9hmjbPoW4KGCx6GfJzjs7yNcDMepyH0clO65MAPN91MZWXgeVl+cTGwqzePYI55QkmpwzSkIOorXSucaDSArn28ccjtP669hX20Ecenep0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XBm0+tyQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XBm0+tyQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEAEC4CEF7;
	Wed, 25 Mar 2026 11:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774437095;
	bh=WQ3Iqc5Yt/SqARFP0HFWXjCfEA+H9jyehM14QOGjeAM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XBm0+tyQfZ+FxKgOcw//Q2mbdZqv/m6EGy/cszDl2wgO/DDsTjbKLCxeplRUdwxWO
	 eGKd4G+Pif6Vqvj0KyEDr6f10EW/bP7Uqq4EzfQd+SRTT7H4Y31RpYOMY5RS4AzEMC
	 k65AqIVrnOdHfNU4k/V3TIFC1CXaAcSJKt+4pDB+vB7mpqQoRwXWQ1SKUGSZrqDSDL
	 //ovSPXrNOGkyAYPSnZyp7OYcjUmPsDcrN3NwY68orvYI/8reRnwqvxAGjK/CC0Ure
	 TcYodD1T0jXSTRbfCyxrJiGR8f7Wv8MpUj5gFG5kQptso69ud/kT+VhCSAO3VvYFOj
	 pMXesTY1cMumw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/8] I/O type generalization and projection
In-Reply-To: <20260323153807.1360705-1-gary@kernel.org>
References: <OxgMwl1EcYLh4AqdBa-FaFap0ODNxpID-Hnns6odQVjvPTXqh6VoXM01bZmoVkAOF_5udNfKuCP8YJoW4UE5Fg==@protonmail.internalid>
 <20260323153807.1360705-1-gary@kernel.org>
Date: Wed, 25 Mar 2026 12:11:27 +0100
Message-ID: <87v7ekxixs.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Gary,

"Gary Guo" <gary@kernel.org> writes:

> From: Gary Guo <gary@garyguo.net>
>
> This series generalize `Mmio`/`MmioRaw` type from just an untyped region
> to typed representations (so `MmioRaw<T>` is `__iomem *T`). This allows
> us to remove the `IoKnownSize` trait; the information is sourced from
> just the pointer from the `KnownSize` trait instead.
>
> This enables us to implement `Io` trait for `Coherent<T>`, enabling
> unified handling of MMIO and DMA coherent memory. It also paves the way
> to uniformly support shared system memory, which Tyr will likely need
> [1].
>
> Built on this generalization, this series also add a `io::View` type
> which represents a subview of a bigger I/O region, and a `io_project!()`
> macro that provides a safe way to perform this. Some Nova code has been
> converted in this series to demonstrate cleanups possible with this
> addition.
>
> This series depend on the Coherent API rework series [2].
>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Generic.20I.2FO.20backends/near/572377073 [1]
> Link: https://lore.kernel.org/rust-for-linux/DH87CCNRR5EC.2SK3IT6N6Q8V5@nvidia.com/ [2]
>
> Gary Guo (8):
>   rust: io: generalize `MmioRaw` to pointer to arbitrary type
>   rust: io: generalize `Mmio` to arbitrary type
>   rust: io: use pointer types instead of address
>   rust: io: add view type
>   rust: dma: add methods to unsafely create reference from subview
>   rust: io: add `read_val` and `write_val` function on I/O view
>   gpu: nova-core: use I/O projection for cleaner encapsulation
>   rust: dma: drop `dma_read!` and `dma_write!` API
>
>  drivers/gpu/nova-core/gsp.rs      |  42 ++-
>  drivers/gpu/nova-core/gsp/cmdq.rs |  69 +++--
>  drivers/gpu/nova-core/gsp/fw.rs   |  84 ++---
>  rust/kernel/devres.rs             |  11 +-
>  rust/kernel/dma.rs                | 217 ++++++-------
>  rust/kernel/io.rs                 | 498 +++++++++++++++++++++++-------
>  rust/kernel/io/mem.rs             |  10 +-
>  rust/kernel/io/poll.rs            |   6 +-
>  rust/kernel/io/register.rs        |  19 +-
>  rust/kernel/pci/io.rs             |  88 ++++--
>  rust/kernel/ptr.rs                |   7 +
>  samples/rust/rust_dma.rs          |  21 +-
>  12 files changed, 681 insertions(+), 391 deletions(-)
>
>
> base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e

What did you base this on? I can't find this commit.


Best regards,
Andreas Hindborg



