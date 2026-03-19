Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1979F2DB7BB
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 09:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773913368; cv=none; b=ZTg2YiJbDuLTFTAydzSdFKvFYoR/6gilAFcuxAr6zXxlXvCXSplabFzEQwPzAX4YuzlJq79RMhOsrJh3Jrq/UQhGTTD3VvBxGdXnn8P2Oc+YXwK2sWziJVFgmC29Rvhjg07DHXJxkFKUiPvOhj7Rf9pU+kdZFe/Dic31RNlT08I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773913368; c=relaxed/simple;
	bh=iaVvvOTzpvUutL2sPe79vsP4ApnQwXM5zydC5DUCA7o=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=LmHS65RsmKGF7idZ4qWcm8eBhQsChcszYOwbh4kpuvK2DaInkcpCAk3cElCW6lHgk3AHEH0toLUfsH7dYg07A5f6CMsdHWUTz5MRlwMag+2FSBsCS1vOWmiaHhoj27YkG/NN4pemwAPliXGBG2K218cqy0lORLALJqby+jOcQok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knXBDdac; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knXBDdac"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A44AC2BC87;
	Thu, 19 Mar 2026 09:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773913367;
	bh=iaVvvOTzpvUutL2sPe79vsP4ApnQwXM5zydC5DUCA7o=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=knXBDdacIhmdE9lJG6YYNB0zDZVWw1an0b9ZxpaApQUJTWqP9qsbMTdt6XdHyC98I
	 49rK0bRxOXHgYESGMpoZpUpJR2k51rVBJRQaaBMaFKmwcrcNz4YE8vev8zPIgaIW+Z
	 2a3X+lhYeyMemsWjsYE0gNBaFkm14peFYhxMPUzlUCvfvKcQo62IxKFALRNUFwBtaz
	 oA+cDMugkZQJGA18eQRWsFgE+MHHrpfG4vfI86uUBivkMj2OAmoQ1YlWqMEtHtJK34
	 DWv6Cqj4vC+MCLulZip9ZMa5yNinCemxvOJ14rmJgT/hVTbaJkPkRut0/mNILxqMxz
	 +tLlZJ+PSHv6g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 10:42:43 +0100
Message-Id: <DH6NT15UYD86.3UIUPXB6LB91Z@kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 0/5] pin-init upstream sync for v7.0
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260319093542.3756606-1-lossin@kernel.org>
In-Reply-To: <20260319093542.3756606-1-lossin@kernel.org>

On Thu Mar 19, 2026 at 10:35 AM CET, Benno Lossin wrote:
> This cycle we have no big changes in pin-init. This series is a
> collection of smaller improvements already merged upstream:
>
> - https://github.com/Rust-for-Linux/pin-init/pull/105
> - https://github.com/Rust-for-Linux/pin-init/pull/110
> - https://github.com/Rust-for-Linux/pin-init/pull/101
> - https://github.com/Rust-for-Linux/pin-init/pull/102
> - https://github.com/Rust-for-Linux/pin-init/pull/108
>
> Next cycle might contain bigger changes, mainly support for tuple
> structs. And I'm also thinking of already starting with integrating
> zerocopy.
>
> While testing for the kernel, I noticed the following issue (already
> fixed in the patch in this series):
>
> - https://github.com/Rust-for-Linux/pin-init/pull/123
>
> This cycle we also had some unsoundness fixes that are already in rc4:
>
> - https://github.com/Rust-for-Linux/pin-init/pull/111
> - https://github.com/Rust-for-Linux/pin-init/pull/117
>
> Lastly, there were some upstream-only changes:
>
> - https://github.com/Rust-for-Linux/pin-init/pull/114
> - https://github.com/Rust-for-Linux/pin-init/pull/109
>
> Cheers,
> Benno
>
>
> Antonio Hickey (1):
>   rust: pin-init: replace `addr_of_mut!` with `&raw mut`
>
> Benno Lossin (1):
>   rust: pin-init: properly document let binding workaround
>
> Gary Guo (2):
>   rust: pin-init: build: simplify use of nightly features
>   rust: pin-init: doc: de-clutter documentation with fake-variadics
>
> Hamdan-Khan (1):
>   rust: pin-init: implement ZeroableOption for NonZero* integer types
>
>  rust/Makefile                                 |  4 +-
>  rust/pin-init/README.md                       |  3 +-
>  rust/pin-init/examples/big_struct_in_place.rs |  3 +
>  rust/pin-init/examples/linked_list.rs         |  3 +-
>  rust/pin-init/examples/mutex.rs               |  3 +-
>  rust/pin-init/examples/pthread_mutex.rs       |  3 +-
>  rust/pin-init/examples/static_init.rs         |  3 +-
>  rust/pin-init/internal/src/init.rs            | 14 +++-
>  rust/pin-init/internal/src/lib.rs             |  2 +-
>  rust/pin-init/src/lib.rs                      | 73 +++++++++++++------
>  10 files changed, 75 insertions(+), 36 deletions(-)
>
>
> base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c

The title is of course wrong, it's supposed to be v7.1.

Cheers,
Benno
