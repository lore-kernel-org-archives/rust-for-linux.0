Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E858F3ED3CE;
	Sun, 11 Oct 2026 11:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719215; cv=none; b=DqBq6mm98XZAEMrE6kDHJ0JZNKPXXiDJgg2GHNhTW6lPaBw7guyXqCs06hyJhn9CSSH0WOcarHRFvzA+5tleeGVzQs1p1WrIGu0quqQNlKuJYNBLithiikYYN/2xGZGCQGu9/ZiQb07DJJUCUyd04+gWz/dG3KhC5HlTDnufzOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719215; c=relaxed/simple;
	bh=if83QpuxXD2wuvygk4m8ZjtnKJ1SJ8PN3cLrf5hIdM4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=s27Nrwpp6m3yjG1kGPfim45NcObS3mL/IYhqsIxyDj+8e1cAFGN8uQgCaqV7MQLZRevk9R1wTJKP6oOZLnitu79cikYHo4sqx21aa6ERcZFvdUiY1S1Y0IJKnQMZTm4lEGsHG/MlFJQeZsfecwxPQxpZxNxLBXcxXoHZyFRFyeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rs9RtDmA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rs9RtDmA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A051F0089B;
	Sun, 11 Oct 2026 11:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791719213;
	bh=EksMomUM0XvjMupNdRmeLnH/WvpmBF/A4W5NiyrgMMw=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=Rs9RtDmAxVjAknicAd0vXc2Fz+yH219Fh1x/o4cjAr6SDakRkuMsmakDcOZeav9FH
	 4oPg9zThwRv2GMWvgyywOfc+sL6lVAskEmt8l7OLNKF0R4OvtTbTdxuE7YJMmaHJeF
	 u7YdEsubDO9mDAoESBG5H7e2zK/7zYTJGzaocKyBplY2jIrljbD9FQqI7eJ61lspPT
	 L+bvKgH6O5JFOjQUDEXsQ6K2JQWxv4eCQwBfrDXdL0wTvaJMZuBxR/UXxJsL5vauMz
	 tCxNL+gyoDOdknbB2aCN5GBJKYyr2eNR2HEoziY5KhIdOYsTJ7GtARl++ElKWBOeXk
	 tMoOh6yPWgjqQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 Oct 2026 13:46:47 +0200
Message-Id: <DM1ZG8WZJOE7.C6W4AHB6H2CX@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] drm/gpuvm: skip setting kernel_alloc_node range on
 overflow
Cc: "Matthew Brost" <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
References: <20261011-gpuvm-reserve-overflow-v1-1-9c0cb23d7409@google.com>
In-Reply-To: <20261011-gpuvm-reserve-overflow-v1-1-9c0cb23d7409@google.com>

On Sun Oct 11, 2026 at 9:22 AM CEST, Alice Ryhl wrote:
> When the reserved VA range overflows in drm_gpuvm_init(), insertion of
> kernel_alloc_node is skipped, leaving its vm pointer NULL. However,
> va.range is still set to a non-zero value, which causes drm_gpuvm_fini()
> to dereference the NULL vm pointer when removing the node. Thus, only
> initialize kernel_alloc_node's address and range when the overflow check
> succeeds.
>
> Note that this fixes unsoundness in the Rust GpuVm::new() abstraction:
> passing a backwards reserve_range (start > end) when overflow checks are
> disabled causes `end - start` to wrap around, triggering the overflow in
> drm_gpuvm_init() and dereferencing NULL when the GpuVm is dropped.
>
> Fixes: e6303f323b1a ("drm: manager to keep track of GPUs VA mappings")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Good catch! Please also add Cc: stable.

> @@ -1127,12 +1127,12 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const cha=
r *name,
> =20
>  	memset(&gpuvm->kernel_alloc_node, 0, sizeof(struct drm_gpuva));
>  	if (reserve_range) {
> -		gpuvm->kernel_alloc_node.va.addr =3D reserve_offset;
> -		gpuvm->kernel_alloc_node.va.range =3D reserve_range;
> -
>  		if (likely(!drm_gpuvm_warn_check_overflow(gpuvm, reserve_offset,
> -							  reserve_range)))
> +							  reserve_range))) {
> +			gpuvm->kernel_alloc_node.va.addr =3D reserve_offset;
> +			gpuvm->kernel_alloc_node.va.range =3D reserve_range;
>  			__drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
> +		}
>  	}

Please collapse this to a single if statement.

Thanks,
Danilo
