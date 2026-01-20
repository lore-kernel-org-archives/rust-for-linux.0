Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894AD3ECBCD;
	Tue, 20 Jan 2026 11:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907608; cv=none; b=objniUb13FuzXu/vMOc2aFGLWN6Mw5LYq0zaUp6tMrE68jYPi1wO6Vs8IMLUmJZTQQ8g6UEfjY4u5BWtpg0vnvVpiSSXF9Zw+Iyoz2tjOGpka2zoAbGmnwKpVgR6NnxP2TI9mMGvIgmJgkwroflreFwEsZOuqMcmImTCsUmNAvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907608; c=relaxed/simple;
	bh=kIXzeKf0e4CbSc5xLvJoptrjAYgLuZH0QYeII1ZTp0I=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=bzJ+ot6jGp752zeI4gpiCojaioUQlS4At0BclzC7kty7B/gKCNbvbjpoIPt2VRPs561P4FmVArSOusEzKH2zEJb0YlJD2xtRbsGsTFDSnrQBHDqgwxerQn19ujA+/uZP/Y2YHqUT7BsgAe7CxFMoA4DWm958Ay+3oogymXfpPcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIXJv2G3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIXJv2G3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B0EC19421;
	Tue, 20 Jan 2026 11:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768907608;
	bh=kIXzeKf0e4CbSc5xLvJoptrjAYgLuZH0QYeII1ZTp0I=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=DIXJv2G3a7V8+oS0nvqYnQLoJ82aVbNFFWCSBMPvujnekxGSfJSmFXLY8IoBliZ0B
	 Y2WxnSP2yrIx84iss3Hz/suhl4VLpfONAvZJYkY8xwu03yGK0M/4aHk+d54JLKBMup
	 TKPzQUpsiSkyMapXAxH3NltRYPbVaKNz4RWf5LTwQP0/jdpPLd7udOr7bG8FNHplxf
	 OWY3S8rkQNxC5tG+c2nDqwHsK/CPstCLk5g9H+H+2RVECBTpiKKlt9/2cFLs2iMfD8
	 ZH16F1iRlrq/qu84gPnhtmOF5hRHmnMfQVG7xgEH85/xfaam8EbHLG1HpOkPt/7ea+
	 ejvoj4O3YbYBg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 12:13:23 +0100
Message-Id: <DFTDEUP7QD1H.KXCX4WWPZUNY@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 2/4] rust: drm: dispatch work items to the private data
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
References: <20260115-aref-workitem-v1-0-9883e00f0509@collabora.com>
 <20260115-aref-workitem-v1-2-9883e00f0509@collabora.com>
In-Reply-To: <20260115-aref-workitem-v1-2-9883e00f0509@collabora.com>

On Fri Jan 16, 2026 at 1:35 AM CET, Daniel Almeida wrote:
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index 3ce8f62a0056..c760a743e1df 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -6,13 +6,13 @@
> =20
>  use crate::{
>      alloc::allocator::Kmalloc,
> -    bindings, device, drm,
> -    drm::driver::AllocImpl,
> -    error::from_err_ptr,
> -    error::Result,
> +    bindings, device,
> +    drm::{self, driver::AllocImpl},
> +    error::{from_err_ptr, Result},
>      prelude::*,
>      sync::aref::{ARef, AlwaysRefCounted},
>      types::Opaque,
> +    workqueue::{HasWork, Work, WorkItem},
>  };

Please use the kernel's import style when making changes.
