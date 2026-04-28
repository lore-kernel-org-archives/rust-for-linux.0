Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28B72701C4;
	Tue, 28 Apr 2026 23:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777417421; cv=none; b=B361271eDE5w54w466X4j1a/0qF+ZuaHCh2anWNFMOGbPMldDlpIxUq8WZCDm5fWz7U+y/x4nr3wIKsY+d7vjVJrnxdUPYYs6E90R6sQ/8xM9vt/tjKoO1JZJtWI15jFCmI4Nqh+Alyk+49si85fb4lkZlzKgdhvQc3VrbQ5j4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777417421; c=relaxed/simple;
	bh=8gopDQcos6f8fLqhGjGyTy9Ri5Y6rItQXBzktye3Wkk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=oOrSwbOmOcTqonzKwDmXXzXkB8e1VklnGiUUomkyHirnj1Z4rybc2CPHlNu3H8EtP0gqqEWiEs414aNixDmpL1IButSWgI9fbiLR7ydppxRfMw+COgXoRV8uWLx6qs8rgl8NJDBKDv1BJw5vNiAVscgy1GSqNB8nvOUIWTbUrHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ok9eKK9j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ok9eKK9j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DDFDC2BCAF;
	Tue, 28 Apr 2026 23:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777417421;
	bh=8gopDQcos6f8fLqhGjGyTy9Ri5Y6rItQXBzktye3Wkk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Ok9eKK9jTLJKfYUpVKJN6WlTFvChZFsbeFRJ16TTqcLaWg/q12G67D6G4qiOkbA7U
	 qzMwKUe3kmPPTlO/BxnQNMutgm4rFVdZI7kwb/bnaW4aCmYLXdy7Cx5BAnYjdji4z2
	 VDElf8L122G13Yi+2ZOwK29fGzwQeJJ44nvlX4PKFjRxhPXyTB1Qe689owcdPTKael
	 jqSYfclwQlNt8EQVFxwyQ4v3Flb+1lodm8cldp/y3iJ+49hM6KGYOc9iO6xZVxc3lc
	 ftIX8FnftTXgmHvMfY73l/MEcM6pSW8gITJceqdwYkYySZnRuumYmSqyb/y9O8UkHO
	 tj471put1JgLw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 01:03:35 +0200
Message-Id: <DI55W0G421RI.3CS1EABQ73TCV@kernel.org>
Subject: Re: [PATCH v6 2/2] gpu: nova-core: add task for device address type
 wrappers
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260411024118.471294-1-jhubbard@nvidia.com>
 <20260411024118.471294-3-jhubbard@nvidia.com>
In-Reply-To: <20260411024118.471294-3-jhubbard@nvidia.com>

On Sat Apr 11, 2026 at 4:41 AM CEST, John Hubbard wrote:
> Add a todo.rst entry for creating newtype wrappers around integer types
> for device addresses and sizes, with a marker trait that generic DRM
> APIs can use as a bound.
>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  Documentation/gpu/nova/core/todo.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nov=
a/core/todo.rst
> index d5130b2b08fb..595a94e9ee2e 100644
> --- a/Documentation/gpu/nova/core/todo.rst
> +++ b/Documentation/gpu/nova/core/todo.rst

I think this fits better in Documentation/gpu/todo.rst and the Rust for Lin=
ux
issue tracker.

> @@ -88,6 +88,20 @@ SR-IOV [1] is work in progress.
>  | Complexity: Beginner
>  | Link: https://lore.kernel.org/all/20251119-rust-pci-sriov-v1-0-883a945=
99a97@redhat.com/ [1]
> =20
> +Device address type wrappers
> +----------------------------
> +
> +The ``SizeConstants`` trait provides ``SZ_*`` constants as associated co=
nstants
> +on ``u32``, ``u64``, and ``usize``. Device-centric APIs such as GPU VM
> +management and buddy allocators could benefit from newtype wrappers arou=
nd these
> +integer types to represent device addresses and sizes. A separate marker=
 trait
> +could then serve as a generic bound for those wrappers.
> +
> +| Complexity: Intermediate
> +| Link: https://lore.kernel.org/all/DHJJJNP5T5FZ.2HWBMOEEKH9ZR@kernel.or=
g/
> +| Contact: Danilo Krummrich
> +
> +
>  GPU (general)
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> --=20
> 2.53.0

