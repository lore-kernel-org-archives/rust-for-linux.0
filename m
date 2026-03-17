Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC54B367F28;
	Tue, 17 Mar 2026 10:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773744596; cv=none; b=Wr72tCD5FnyCySoesEnfwflXm96YMg3YlnxZIohaH5m8jhz/gsFneCHCZU+75NMicu9i4Bn4bD08doDENM9zrct1030QRhmFYGmB71OPGgiOn2QrKxjSCpc9MK0z0fu3za+BGiTpiAdpvdN8u+LwkMyo4b4KT4uKyOu3D9NY/jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773744596; c=relaxed/simple;
	bh=zIXYt4MiSYtrZ/ljb1b2PTErSHLZeJRlzjd8rOa85Wg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=WJkJw2RitMe8+vjqEzWOuOIvadAXcoKI/z7MWn65+8edr7vh+CJXiX6Fb5+yp4Y+K+svjfxgCeVG1AcwRSCzc6TNFmdCM0htZ2ToENh3srn4NEW3R+/PTcXrg9FWuDuis8XEPmRe/4FsUzbMU2txQ5bEir5mt6GyMUzq0Q8J7EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEuFQVpp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEuFQVpp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6534BC4CEF7;
	Tue, 17 Mar 2026 10:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773744596;
	bh=zIXYt4MiSYtrZ/ljb1b2PTErSHLZeJRlzjd8rOa85Wg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=GEuFQVppox1B2Wla3Jmq+DSI1wc+jSic+ZFpjguH/c0Y6jc/xEAAvM9W9lDReDO6n
	 NaV0/NQZVi9MTci/Pas8fUNCManAhUactuZSJn6qPbaKpymRdyOWbpzNUdXfheg5hv
	 9ZF9ntagjKViTR70j5YWJQtq0UqriEHQtEz5+vKMeId9wLJuY9k2TBMI6YanzhhfmR
	 C7c6VfHqh1S64pcT6Po9NoiUAV/pnh+lKhWzJUgR3gdpqxOFG+U/sZs5iHf5eeZjLO
	 L/FMR3W68MDybsNM7j7aF5sUZKn4pkpcmg7UwTD+xfZ5D4kCH7c2/jemFHvP/JDsen
	 VEcw+34dTequA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 11:49:53 +0100
Message-Id: <DH4ZZD12V0R6.2G7IIL87QTK0S@kernel.org>
Subject: Re: [PATCH 6/9] gpu: nova-core: generalize `flush_into_kvec` to
 `flush_into_vec`
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>, "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
 <20260227-rmcontrol-v1-6-86648e4869f9@nvidia.com>
 <093ca23e-7081-42db-a202-0a42c51741a3@kernel.org>
 <DGYL9FS1Z00X.2HEJ96J8R3OK4@kernel.org>
 <DH46IKESDQ3B.2GEUC479WDK3N@nvidia.com>
 <DH47AVPEKN06.3BERUSJIB4M1R@kernel.org>
 <DH4OM17DJ47V.3NJG7G02O7P1L@nvidia.com>
In-Reply-To: <DH4OM17DJ47V.3NJG7G02O7P1L@nvidia.com>

On Tue Mar 17, 2026 at 2:55 AM CET, Alexandre Courbot wrote:
> We shouldn't be doing that - I think we are limited by the current
> CoherentAllocation API though. But IIUC this is something that I/O
> projections will allow us to handle properly?

Why do we need projections to avoid UB here? driver_read_area() already eve=
n
peeks into the firmware abstraction layer, which is where MsgqData technica=
lly
belongs into (despite being trivial).

	let gsp_mem =3D &unsafe { self.0.as_slice(0, 1) }.unwrap()[0];
	let data =3D &gsp_mem.gspq.msgq.data;

Why do we need I/O projections to do raw pointer arithmetic where creating =
a
reference is UB?

(Eventually, we want to use IoView of course, as this is a textbook example=
 of
what I proposed IoSlice for.)

Another option in the meantime would be / have been to use dma_read!() and
extract (copy) the data right away in driver_read_area(), which I'd probabl=
y
prefer over raw pointer arithmetic.

But in any case, this can (and should) be fixed even without IoView.

Besides that, nothing prevents us doing the same thing I did for gsp_write_=
ptr()
in the meantime to not break out of the firmware abstraction layer.

> This is guaranteed by the inability to update the CPU read pointer for
> as long as the slices exists.

Fair enough.

> Unless we decide to not trust the GSP, but that would be opening a whole
> new can of worms.

I thought about this as well, and I think it's fine. The safety comment wit=
hin
the function has to justify why the device won't access the memory. If the
device does so regardless, it's simply a bug.

>> I don't want to merge any code that builds on top of this before we have=
 sorted
>> this out.
>
> If what I have written above is correct, then the fix should simply be
> to use I/O projections to create properly-bounded references.

I still don't think we need I/O projections for a reasonable fix and I also
don't agree that we should keep UB until new features land.
