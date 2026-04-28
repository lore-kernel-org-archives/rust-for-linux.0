Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D36043C07E;
	Tue, 28 Apr 2026 12:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777380195; cv=none; b=Il5W5HYVH2FcB/uUjK7TNP6690x/k6DMdB8UdfjtUAfdvt8oHCpnUhx0loGwUxlpeidNDyyJ25sxrG1cOKU6vHNpm4VssKVzjOSEQJq4ipASxTdR1jxmUk8whz58NtjJ9/7QjQuBVsLx1SilgvT3D0zXrCLM51ePtO7poyfgd0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777380195; c=relaxed/simple;
	bh=sGu6CTVPzirUUCc5JiSYDfSxPlZrDUgh6IQwgRUcA1s=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=qzcpTaiLXMiWN/8nvmd95fuBWc7BfGnqoYJIPgM7q3R4Ogw7v8iw/60qbVbrDSiDed38LH9Hv7TFkYuDns2ph0Q31eDs0Vqy4AxJ+LVNZn+MC6zBjUG9z30BNb+En4LcpGlC3OAGTJjWEKjgKd09Xo7+Ksrovzqi2JbqHtW4XUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FavAcvIf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FavAcvIf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648BEC2BCAF;
	Tue, 28 Apr 2026 12:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777380192;
	bh=sGu6CTVPzirUUCc5JiSYDfSxPlZrDUgh6IQwgRUcA1s=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=FavAcvIf1v39Fa3H+MhGLDIwHiad8KyT/IuwaU29YVyCH+PwI7HR26iuG28qlkWIz
	 s7gujzWFLJIXvhini36L92rLeQfZ/AaL+ZHDpSTD2Bje/Myl377MepZWR7iYmdWLJx
	 8Qb3msQIX3y13qSSb0VGDTUBAHkYE6P+6WjbbFXQTxGTdzqfesh4d6xJoJWU02APwI
	 GLhicsSuJy24MOvQkU6m+O98FFh7FRTaFWUCEKU/48uuro7nOzaLjR8+1iUkD7Vxsl
	 DTd5ypfoP/98T8D0iey+zmN4/lFH6ppTDWy8v/y1usPh1QjqtBfodhYRrqCCMjM8//
	 uSFivjANtNPwg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 14:43:07 +0200
Message-Id: <DI4SOY5IQR77.1D97MMFEQEOCW@kernel.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust: drm: fix unsound initialization in
 drm::Device::new
Cc: "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Alexandre Courbot" <acourbot@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20260428-fix-drm-1-v1-1-755057178066@nvidia.com>
In-Reply-To: <20260428-fix-drm-1-v1-1-755057178066@nvidia.com>

On Tue Apr 28, 2026 at 2:20 PM CEST, Eliot Courtney wrote:
> If pinned initialization of drm::Device::Data fails, it calls
> drm::Device::release via drm_dev_put. This materializes a reference to
> &drm::Device, but it's not fully constructed yet, because initializing
> `data` failed. It should not be dropped either. Instead, if pinned
> initialization fails, make sure drm::Device::release isn't called.
>
> Fixes: 2e9fdbe5ec7a ("rust: drm: device: drop_in_place() the drm::Device =
in release()")
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

There's already a patch from Lyude for this [1].

That said, I like the approach with the ALLOC_VTABLE.

@Lyude: Do you mind if we pick Eliot's patch?

Thanks,
Danilo

[1] https://lore.kernel.org/lkml/20260320233645.950190-2-lyude@redhat.com/
