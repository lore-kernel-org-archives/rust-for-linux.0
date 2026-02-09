Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA6F34D93C;
	Mon,  9 Feb 2026 11:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770635832; cv=none; b=DcJf0gvfgmYHzyuJx6M2eP5pBn0lCT6BCgTg95pFfTffJ6fKxVjV+sL+TlgkIwNbMiwSiIJdVB2iVojCVNcguEG3L1YFTlaqmKaiISveFAGZjIyvyZRM48/t7bUD3oG/ozCbf6V2MdqwDmyHjO4WIpiNmsFVo2KPs1+m4jvRqd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770635832; c=relaxed/simple;
	bh=rkjWDYmA+Gv4imCPiiPARsynkjj0DK/cDi4XGUpA6Ms=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ZTkMyoLbVd+3/+h6uq0gF/zLpXo3fLeclKVWbvPZUn4v4UbRuAXoIRhbHZVYR8SAYxg3RxUHaKcj7a7s8E75fg3A99EIyJo+x9hGPNPbPaO77cLfn/PzOBhzcteSstVSwRY5VHEe40ResEizLOjl2K5JYVBWEfxmuUAIeCr8OGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQRjsVLj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQRjsVLj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4607CC116C6;
	Mon,  9 Feb 2026 11:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770635832;
	bh=rkjWDYmA+Gv4imCPiiPARsynkjj0DK/cDi4XGUpA6Ms=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=VQRjsVLjLWT1MrF1DBlVdjjWR6ga2Wp+NvD/EvTo8QihVuxkXVa0xYQXZQf5ntODl
	 aI4IQ1KP67cTrRkYwbZmUHlQ/m8i3A/TsTB8dKV6p2eGJu1ydQ+pa8xuU9wjG8DPVs
	 qsB1f6jk4rJJpmaNFylLSsuTQCBA4fUeJ2NRd/zuAbjH2gaU6wNtY/1Xgg4qIB9A2q
	 ROQiA1j//1vQK6AUMjJGKB0oLZYMbIDmj0OvKXRu4iKk3EOR2B02yGBFL3Xp8zgDgX
	 cz6pjeA2TdjFpA8Fobu8O7w30a4wcxDCL+oHMcpB/9I4mM/8buOxn7hQUo4rM9749S
	 ATD+qcWiAUaJw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Feb 2026 12:17:08 +0100
Message-Id: <DGAE0M87A8X8.3OWL23XSZF7I6@kernel.org>
Subject: Re: [PATCH v7 6/7] rust: Introduce iosys_map bindings
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Gary Guo" <gary@garyguo.net>,
 "Benno Lossin" <lossin@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Janne Grunau" <j@jannau.net>
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260206223431.693765-1-lyude@redhat.com>
 <20260206223431.693765-7-lyude@redhat.com>
In-Reply-To: <20260206223431.693765-7-lyude@redhat.com>

On Fri Feb 6, 2026 at 11:34 PM CET, Lyude Paul wrote:
> +/// Raw unsized representation of a `struct iosys_map`.
> +///
> +/// This struct is a transparent wrapper around `struct iosys_map`. The =
C API does not provide the
> +/// size of the mapping by default, and thus this type also does not inc=
lude the size of the
> +/// mapping. As such, it cannot be used for actually accessing the under=
lying data pointed to by the
> +/// mapping.
> +///
> +/// With the exception of kernel crates which may provide their own wrap=
pers around `RawIoSysMap`,
> +/// users will typically not interact with this type directly.
> +#[repr(transparent)]
> +pub struct RawIoSysMap<const SIZE: usize =3D 0>(bindings::iosys_map);

I'm still against using struct iosys_map as a common frontend for I/O memor=
y and
system memory.

Exposing this as another I/O backend instead of just having a Rust structur=
e as
frontend for a "real" abstraction around the Rust backends has various
downsides.

  (1) We are limited to the features of struct iosys_map. The corresponding=
 Rust
      backends may provide additional functionality, which we can't access =
with
      struct iosys_map. For instance, they Mmio will provide a relaxed() me=
thod
      providing access to a borrowed backend providing relaxed ordering
      accessors.

  (2) We loose out on the capability to consider compile time checks regard=
ing
      the guaranteed minimum size of the mapping. (To be fair this could be
      implemented on `IoSysMap` itself as well, but it would duplicate code=
 that
      we already have in the corresponding backends.)

  (3) You have to duplicate the safety requirements of the backends that st=
ruct
      iosys_map wraps. In fact, this series ignores that if the backend is =
I/O
      memory we have to guarantee the it is revoked when the device this I/=
O
      memory originates from is unbound.

Having a look at patch 7, it should be possible to read `is_iomem` and `vad=
dr` /
`vaddr_iomem` from the struct iosys_map and just construct the "real" `Mmio=
`
backend from it. We also have to create a backend for normal system memory,=
 but
that should be trivial. :)
