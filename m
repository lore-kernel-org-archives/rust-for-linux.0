Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFF529AB02;
	Tue, 17 Feb 2026 20:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771359042; cv=none; b=TeaEO7FZ9LYlrt4fMbxnJGCqCkwNIZD7r8iA6t5/OXkVfwAFLUTZiH4r+N1GXbiu/upJ4zHgQxBNwbgH4giVHVVaR1Xjf6GzsAI4D+y7gJAOiw/JCkvoFsU1cX1KuFteDp7CkQGQ02MITxZvyTVFqeWm+RwoP0C2JjZwXZtCJ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771359042; c=relaxed/simple;
	bh=hhJyxdITsuAc8HGC+58wCKGZpudvl+qghZAFN0MeYLs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=EIxr6saut97lCCRCl6guGgO8c880P7zvVWiiRrFwwBgjusqwmyTGuV+QmetNJIHeVMQrksw3s2kM803GrA0CJSDDsFzrlBC41PmPsYGHjN4jMYnrfDSJMMvJ+EJSG+zTuGRugBwE/sQ2SKXSKx10P5ocyRf8RP5p6kWR9wLm4rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eo5O0/fo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eo5O0/fo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87FBC19421;
	Tue, 17 Feb 2026 20:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771359041;
	bh=hhJyxdITsuAc8HGC+58wCKGZpudvl+qghZAFN0MeYLs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=eo5O0/foh6J8gcreiJcZzKO/jN6p2mDW9f5JJTvRPlZRv+Jnqsbq1maQnR9E+XDPl
	 WwDsaLKlPp8Lq77wEYEzfYRhPn0V5bUSRO//feyay0ExncysMnLRIoewjWP5BLGKnb
	 F4vNdfT3/27/bHovlSCDJ5BC4JAc1e2+p3zRyWXqlOgg+6ufNDg5MKQCoiDgggCPK5
	 9t4cgvXSf429OOhGlBnUlyRYxVUJ+PTt8XD0pSwvMCBbzjqUccZN8c998pGy4nEMxA
	 Mz+/lGwD1cDD4u6VVyLU9Uw67fWR5yqKk8y5K6EyGAGT3aE8oNn89dIYvlxeutB8OR
	 rVYKvkQTVfBow==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 21:10:36 +0100
Message-Id: <DGHIDF706REU.3PF025P56DMS2@kernel.org>
Subject: Re: [PATCH v4 27/33] gpu: nova-core: Hopper/Blackwell: larger WPR2
 (GSP) heap
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
 <20260210024601.593248-28-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-28-jhubbard@nvidia.com>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> @@ -74,7 +94,7 @@ fn management_overhead(fb_size: u64) -> u64 {
>          u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
>              .saturating_mul(fb_size_gb)
>              .align_up(GSP_HEAP_ALIGNMENT)
> -            .unwrap_or(u64::MAX)
> +            .expect("management_overhead alignment overflow")

Ultimately, the relevant value for this calculation (fb_size) comes from th=
e
hardware through a register read if I'm not mistaken, we shouldn't panic on
that, but rather handle is as an error if the read value is not plausible.
