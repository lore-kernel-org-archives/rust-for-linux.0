Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538592AEE4
	for <rust-for-linux@vger.kernel.org>; Sun, 18 May 2025 07:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747553600; cv=none; b=f4ae7OEctUZNH9acZ4VSyEj2zyONv7M5UTRMb2471PQF+ejAOv5DsfHQRedez63kVxVNDio2YZyBfh3rovb17ZmQ7rFUgh0ry9Zw3h4PaXDj/G6Pjmun6iqkQX5BSV7KB8dr/9cjufQFxUQ2wqGVr2H/adEu7eCUXW45IDyUE0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747553600; c=relaxed/simple;
	bh=LJyvCwFYKgmQkmpKDNVDrc82wn/ZRzqtVtWAdfbIcYc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=FNyrCru5vJLlB2OTy+f1YJiF07mseu/B5scTvu3VrLCWc/T6XKTfIacPjejtit/U7fFptiAKt+2kORIUGv2GFNt8WZGwVBSMPoSC0O8j1ESlbILNdHHBDk4A8nec5ywju0s8TxmPKXXktszr1bdvK5DApms6BEzyC2Q53XqFOmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EtioRlGa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EtioRlGa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994C3C4CEE7;
	Sun, 18 May 2025 07:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747553598;
	bh=LJyvCwFYKgmQkmpKDNVDrc82wn/ZRzqtVtWAdfbIcYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EtioRlGadxLwQpGwZOe+wFNVspkAEb9w4o0EN07EOh/irugSNUJAGMII9XSLi6O2+
	 jANbSwzY+DaONdoiD64713q/PzsH6DXXE0dyfxynS+3j9kQpiO/rBm2AtSvxkicCZ7
	 dtD/Q8iJp7wp9hMUxe2xkWGt+hOdP3h1NgeqnoNzdHC5qsC7XKMuOXDd/C56BgJRV8
	 H3K30DWCyr+mkIo7HCSs68Uknl1K6SNtZTqSnPUZfToMOfF2zaVEe/uQUePl5ydNN5
	 M+5eAoYttNkhrkolBBkzIF/YZcH/H6FGi0BD2QqKkySjNA+B280C8NbXIeUAmKp2ab
	 jfpWiCqUU5SJA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 May 2025 09:33:08 +0200
Message-Id: <D9Z41NMNT28E.50YJYE4DC9M7@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Igor Korotin" <igor.korotin@yahoo.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4] rust: macros: Fix macro referencing core and kernel
 crates
X-Mailer: aerc 0.20.1
References: <20250516122349.1944895-1-igor.korotin.ref@yahoo.com>
 <20250516122349.1944895-1-igor.korotin@yahoo.com>
In-Reply-To: <20250516122349.1944895-1-igor.korotin@yahoo.com>

On Fri May 16, 2025 at 2:23 PM CEST, Igor Korotin wrote:
> Fix macros and auto-generated code to use absolute paths, `::core::...`
> and `::kernel::...`, for core and kernel references. This prevents issues
> where user-defined modules named `core` or `kernel` could be picked up
> instead of the `core` or `kernel` crates.
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1150
> Signed-off-by: Igor Korotin <igor.korotin@yahoo.com>
> ---
>
> Changes since v3:
>  - rebased changes on top of the branch rust-next
>  - added one fix in auto-generated code in file rust/macros/module.rs
>  - link to v3: https://lore.kernel.org/rust-for-linux/20250331102451.2362=
415-1-igor.korotin@yahoo.com/
> Changes since v2:
>  - rewrote commit message
>  - link to v2: https://lore.kernel.org/lkml/20250328180312.2025317-2-igor=
.korotin@yahoo.com/
> Changes since v1:
>  - rewrote commit message
>  - Added fixes in auto-generated code in files rust/macros/kunit.rs,=20
>    rust/macros/module.rs, scripts/rustdoc_test_builder.rs,
>    scripts/rustdoc_test_gen.rs thanks to Benno
>  - link to v1: https://lore.kernel.org/lkml/20250326182302.5650-1-igor.ko=
rotin@yahoo.com/
>
>  rust/ffi.rs                     |  2 +-
>  rust/kernel/device.rs           |  2 +-
>  rust/kernel/device_id.rs        |  4 ++--
>  rust/kernel/kunit.rs            |  8 ++++----
>  rust/kernel/static_assert.rs    |  4 ++--
>  rust/kernel/str.rs              |  4 ++--
>  rust/macros/kunit.rs            | 22 +++++++++++-----------
>  rust/macros/lib.rs              |  6 +++---
>  rust/macros/module.rs           | 31 ++++++++++++++++---------------
>  scripts/rustdoc_test_builder.rs |  6 +++---
>  scripts/rustdoc_test_gen.rs     | 16 ++++++++++------
>  11 files changed, 55 insertions(+), 50 deletions(-)

The changes look good, there is one rustfmt issue the bot detected, but
Miguel can take care of that when picking the patch, so no need to send
a new version just for that.

I tried to find any instances that you might have overlooked, but
couldn't find any :) I didn't write a script to find them all though, so
I might also have missed some. Would be great if someone else also could
try to find any missing ones.

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno
