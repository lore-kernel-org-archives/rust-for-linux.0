Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DDC29AB02;
	Tue, 17 Feb 2026 20:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771358688; cv=none; b=iZgiYOM89RPIsoZE6xD+iXexYwuDGWLTZVa1pyZ+225rfnuYaj8nJDJubJjyzs1Zo4oiysQW7oy4UdTjQhJi28YM/MFwmwdCfGqbRgpH4sOQwMh4myqaCAKy1YnKM9eJp8vMUP1LbUPC9tkFQXcavE3aFt0w27brhlsjwiKKfh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771358688; c=relaxed/simple;
	bh=FWGqfACWR6qxzYLdlPeV/jH89j6hrb85/7pyBBauRuk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=UMNiioIBO7/xcF3ZVYWBlySwsr1XVhQ5iPPy9n1/c440LKImgbCq/+Tw4qK9TmTOc01zqEjvC2QIYvrEPpaBXJKBfaoFbAIlgztYBQlswan1jnefFIefqi7h0XgCNf/NXdU6mqkotBHXPf9Kc2o66u5VF/mbRWQNO+of0qLi+lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=elz53fhM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="elz53fhM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E247C4CEF7;
	Tue, 17 Feb 2026 20:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771358688;
	bh=FWGqfACWR6qxzYLdlPeV/jH89j6hrb85/7pyBBauRuk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=elz53fhMadoUxaf0yucK7cWE8T0yYDyexu+ECKKT5miva2MTZ6o0PJllwOv3HLMJx
	 53NKM3gZOiRIs4/9SzgoD9CoLPPVdI9IDkexqk51bRHTNDHpnlSPerMHFtuKMgeH0n
	 kNc219PUvBf4BVDlqT6lSIedY7ZpEMpjxhguFlIyUhiNpVeQB3VkxafVDIN+vNDvTt
	 NBsfoCn/oyCZmMHXVaIqXPbyeoXigz1Amyhd2BvLoQojjMzF3cehe3HRbid5RZCFsI
	 yZttD0J5Z/NJ7Ppa/JLRNHS4+i/y6SCYzeYcwb1WaHJWbhAxfP33ltH3ZbV3gqhywF
	 TX63THKEM3GsQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 21:04:42 +0100
Message-Id: <DGHI8WRKBQS9.38910L6FIIZTE@kernel.org>
Subject: Re: [PATCH v4 25/33] gpu: nova-core: Hopper/Blackwell: larger
 non-WPR heap
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-26-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-26-jhubbard@nvidia.com>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> Hopper, Blackwell and later require more space for the non-WPR heap.
>
> Add a new FbHal method to return the non-WPR heap size, and create a new
> GH100 HAL for Hopper and GB100 HAL for Blackwell that return the
> appropriate value for each GPU architecture.
>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/fb.rs           | 14 +++++++---
>  drivers/gpu/nova-core/fb/hal.rs       |  7 +++--
>  drivers/gpu/nova-core/fb/hal/ga102.rs |  2 +-
>  drivers/gpu/nova-core/fb/hal/gb100.rs | 37 +++++++++++++++++++++++++++
>  drivers/gpu/nova-core/fb/hal/gh100.rs | 37 +++++++++++++++++++++++++++
>  5 files changed, 91 insertions(+), 6 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/fb/hal/gb100.rs
>  create mode 100644 drivers/gpu/nova-core/fb/hal/gh100.rs
>
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index 3a2b79a5c107..7c502f15622c 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -98,6 +98,15 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
>      }
>  }
> =20
> +/// Calculate non-WPR heap size based on chipset architecture.
> +/// This matches the logic used in FSP for consistency.
> +pub(crate) fn calc_non_wpr_heap_size(chipset: Chipset) -> u64 {
> +    hal::fb_hal(chipset)
> +        .non_wpr_heap_size()
> +        .map(u64::from)
> +        .unwrap_or(SZ_1M as u64)

This should use u64::from_safe_cast().

Also, I already brought this up in the context of GPU buddy, I wonder if we
should just add SZ_* constants for 64-bit devices. Shouldn't be too hard to
generate the corresponding code.

I think it is a repeating pattern, and having to use u64::from_safe_cast() =
all
the time seems cumbersome.
