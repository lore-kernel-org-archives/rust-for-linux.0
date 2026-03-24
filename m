Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824153E51F3
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 11:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774351440; cv=none; b=ghre7F8LmK15jmMhDr02nNGI20Ctelkk3AjoDCwBZcy99QxKWzTmgmAGrBmGiy9DqkPZewOelilrqk3HR6OENxnFQDzWk+fULZHXA/6fx8KYVN094IiuQbVkdzNJwEAnga+BNRDgHD2XfT70Fj3r+a2tHPoUc7Vhxs7Rgwg/Vf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774351440; c=relaxed/simple;
	bh=jkSgQ0k3gtHnCBhH7lha3CHXwIcOO/0T5Q8w+r82dvI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=DZMmE40PPGyMZt2ONBHtLy1/bpSq7Np8tNXLSB/4OS2todq5rJrnMvEY7rsc29FA3uQYkoFb2eAyr3GqWTgxocNEL6zQp02R/2j6ykCvUz5B33J3VDNe4dNIL0Gb6tAuSibXKetSten6L44PV2gByjwGvmXe/nx03Eixae+JUpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJHAqGFQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJHAqGFQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EEF1C19424;
	Tue, 24 Mar 2026 11:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774351440;
	bh=jkSgQ0k3gtHnCBhH7lha3CHXwIcOO/0T5Q8w+r82dvI=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=nJHAqGFQl0aak+Tk7Na/PlCKYrLyGZ7gM2tbH4UMDPdQORaBuLuOJ7WrLTN3pNQau
	 QSUZ+QPHbcXhNwd5Gdk2RbactyTJ+FJPSdL5lYcWbejcpehH/TC4aBkT/Zyv0GpGuG
	 TX2M8KVCt9+qwEIOn4MTOzypbmvw0aYW8TVKIxHpIrgFI12YHtdIhM23lRbKzJzp87
	 B8FYlMmswRjRTg5mVHdObT40MG/yqVYQNYxTM1QC8XOqF+lnib6iOg8hKcfWnH644p
	 LGeYHkD8WKGLCBsG+E+3SSBi5sWfqOZdpuy3qv9er1MY2Ay71qmLhGpY9eCUFkr0+3
	 sLBT6EiPJI0uQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Mar 2026 12:23:54 +0100
Message-Id: <DHAZ380DRB8A.19SI1OUABRWTP@kernel.org>
Cc: <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Steven Price" <steven.price@arm.com>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, "Dirk Behme"
 <dirk.behme@gmail.com>, "Alexandre Courbot" <acourbot@nvidia.com>
To: "Deborah Brouwer" <deborah.brouwer@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 01/12] drm/tyr: Use register! macro for GPU_CONTROL
References: <20260323-b4-tyr-use-register-macro-v3-v3-0-a87daf9e4701@collabora.com> <20260323-b4-tyr-use-register-macro-v3-v3-1-a87daf9e4701@collabora.com>
In-Reply-To: <20260323-b4-tyr-use-register-macro-v3-v3-1-a87daf9e4701@collabora.com>

On Tue Mar 24, 2026 at 1:18 AM CET, Deborah Brouwer wrote:
> +    register! {
> +        /// GPU identification register.
> +        pub(crate) GPU_ID(u32) @ 0x0 {
> +            /// Status of the GPU release.
> +            3:0     ver_status;
> +            /// Minor release version number.
> +            11:4    ver_minor;
> +            /// Major release version number.
> +            15:12   ver_major;
> +            /// Product identifier.
> +            19:16   prod_major;
> +            /// Architecture patch revision.
> +            23:20   arch_rev;
> +            /// Architecture minor revision.
> +            27:24   arch_minor;
> +            /// Architecture major revision.
> +            31:28   arch_major;
> +        }

Are you sure that this is the field order you want to choose for Tyr? nova-=
core
had this order in the past (we're changing this currently), as it came from
OpenRM headers, but it is pretty unusual for datasheets and TRMs, which is =
also
why the register!() macro examples use the typical and recommended order, i=
.e.

	pub(crate) GPU_ID(u32) @ 0x0 {
	    /// Architecture major revision.
	    31:28   arch_major;
	    /// Architecture minor revision.
	    27:24   arch_minor;
	    /// Architecture patch revision.
	    23:20   arch_rev;
	    /// Product identifier.
	    19:16   prod_major;
	    /// Major release version number.
	    15:12   ver_major;
	    /// Minor release version number.
	    11:4    ver_minor;
	    /// Status of the GPU release.
	    3:0     ver_status;
	}
