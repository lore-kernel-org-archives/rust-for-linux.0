Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB96E2E3386
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Aug 2025 21:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755724048; cv=none; b=D4WThdbBjNsp1lYsYbIF7MgxWeFToRTh9PFEBsoo18fkzALbSL+3IGIvivOb7kr1j0kcdScFqiqU81Wx+xs6QVDBVBw9KVq1r42GOlL5c+DSedhLeQAS3VyGVRZQxNTkBfwtYrStHL0jT9lvI3jVTpT2snTbnM2yTmeWmNl+oJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755724048; c=relaxed/simple;
	bh=jV0bRz7BoPY7TgRB6w3jFn0A07FPvYwFn8vlOIrFB2E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Yfk7qbOoUAzqESgMqJsGhqMgPL7B0vk3F5YcJFKCcSnGbsStB5RNFBC0UNIo42lhSCieH89T9i26xg7KRLTvcMvL9g5h0K/tgRh0+LKQUgBiiLEPxNwdWoUQoBJ9mQTYN5VUOVwcw4LNnzuH8RPj36HHLA+4HJLWDSdYyGeWZCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PaIigNdw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PaIigNdw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1196BC4CEE7;
	Wed, 20 Aug 2025 21:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755724048;
	bh=jV0bRz7BoPY7TgRB6w3jFn0A07FPvYwFn8vlOIrFB2E=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=PaIigNdw319YHXpzdNGmMmeIGKBaHPJBA6oHQwa/9dsCduGCunKjQMZO7B/ynPoVD
	 Gi29zU9N+UFW365yQU34fysCCNiL1VSfWUvJpMt65c4W97LhdkUVnhhOg+hYV6kbB3
	 YxLNaxi2XBkQ0zX5oKL0q/re6A6o2Fznt54lVzTzwQudNPhA21+IScvC1iDlo83lfV
	 UfswynXCzSilBdx9NY3Qeg3Koa5hUwyEJ7cfSqTTu2b0JpyeZewBAquqvrgpOhB0a1
	 7dt7pdi+WbNQXQqmjOP0d4l+JrvN11rikZsxjU3fVQ+k+xvMJxoh4wiPHklZPrHIQx
	 gECTGTDILwuVg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 23:07:23 +0200
Message-Id: <DC7K8B01IN1J.CFOV0Z934HMH@kernel.org>
Subject: Re: [PATCH] Rust associative function
From: "Benno Lossin" <lossin@kernel.org>
To: "Gent Binaku" <binakugent@gmail.com>, <rust-for-linux@vger.kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Benno Lossin"
 <benno.lossin@proton.me>
X-Mailer: aerc 0.20.1
References: <20250820210225.124288-1-binakugent@gmail.com>
In-Reply-To: <20250820210225.124288-1-binakugent@gmail.com>

Hi,

Thanks for the patch!

On Wed Aug 20, 2025 at 11:02 PM CEST, Gent Binaku wrote:
> Currently `AlwaysRefCounted::inc_ref` is implemented as a method
> taking `&self`. However, this function should not be called lightly.
> To prevent accidental usage, convert it into an associated function
> instead of a method.
>
> This aligns with the intended API safety model and makes it clearer
> that `inc_ref` is not part of the usual object manipulation methods.
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>

Please use my <lossin@kernel.org> email instead.

> Link: https://github.com/Rust-for-Linux/linux/issues/1177
> Signed-off-by: Gent Binaku <binakugent@gmail.com>
> ---
>  rust/kernel/auxiliary.rs        | 4 ++--
>  rust/kernel/block/mq/request.rs | 4 ++--
>  rust/kernel/cred.rs             | 4 ++--
>  rust/kernel/device.rs           | 4 ++--
>  rust/kernel/device/property.rs  | 4 ++--
>  rust/kernel/drm/device.rs       | 4 ++--
>  rust/kernel/drm/gem/mod.rs      | 4 ++--
>  rust/kernel/fs/file.rs          | 8 ++++----
>  rust/kernel/mm.rs               | 8 ++++----
>  rust/kernel/mm/mmput_async.rs   | 4 ++--
>  rust/kernel/pci.rs              | 4 ++--
>  rust/kernel/pid_namespace.rs    | 4 ++--
>  rust/kernel/platform.rs         | 4 ++--
>  rust/kernel/sync/aref.rs        | 6 +++---
>  rust/kernel/task.rs             | 4 ++--
>  15 files changed, 35 insertions(+), 35 deletions(-)

We already have someone else working on this, see [1]. Not sure if you
two are coordinating.

You also didn't choose a meaningful commit title.

[1]: https://lore.kernel.org/all/CACvsgUCBk5Dt2yBSy9_NA0z38-wP68vvBX7XDYgJG=
inTURT1kQ@mail.gmail.com

---
Cheers,
Benno
