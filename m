Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417FD35F18D
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Mar 2026 08:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513441; cv=none; b=DWk34pGQ4qx6ZBiLrr43IjQyDdK1VzwgW5kndjn5xJSbepyhx0EVB7q2xqjwo9s+PDyoxLW1q0tUbMXQWW6Kx+BzoWvvFCGTpdmRI+9mqZ3u06t45TMx95Mvdmsgb7D6uhHmc9u/C14r3uLJgIdWlFeDRaex9PYklV+N3YfmVU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513441; c=relaxed/simple;
	bh=cq1+DJlatf7zjxmJeOwuAU6XdbZQA7lhIOdA3t6HQb4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LZgZQ2fMbuCNRLc876l1WtGaN2Aj3HBZArTsIpAAyGfODE6e4NuA6SnZjlGbx8pwgDTi9jPr1tIZSi68HuoVJx+REEBaWcpigJg8hFAdIRKeBwzFh+MwBLraeSwHc0MyNxM9dwsbf2Z2/gLvx/3jXpGN7+NFyc1QUtqO/cYSe3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=faa1+IbE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="faa1+IbE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF64AC116C6;
	Thu, 26 Mar 2026 08:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774513440;
	bh=cq1+DJlatf7zjxmJeOwuAU6XdbZQA7lhIOdA3t6HQb4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=faa1+IbESFvsxw6Vqr3yCdsrBwZwvXQXFzagIuf1J/vTWs+pT0d6VxCA19gqgxJqZ
	 y+solNkpZIonwawQkmnESnfGq4tcIzwpZ12VBhBx6dB1Ug4vsz7nV7b/kuSYXhrB6V
	 vz/rOi/0kE4bATLWUeHd3gMVp4dpiZvfDugpkYv1cyqOqkmEnOIT7KMoH0ul884mw9
	 vr1TEj0HNuAhiB98kolxO4ArMs0qkcKnLNoQRdsYGP+MTzKmjY1DfTL3yyZ8E4AWSi
	 Hb4fimVmx56ENtgMv3VhvGS3WYAbLUl3kjdQ0p/1kjjECFDuMbZ+aj5nrL0R5halyv
	 bH7FTvLrQ6qpg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 09:23:56 +0100
Message-Id: <DHCKIIWSKQKQ.3TO9CKIQ7016Z@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 0/5] pin-init upstream sync for v7.0
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
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

Applied to pin-init-next yesterday, thanks everyone for contributing!

Cheers,
Benno

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

