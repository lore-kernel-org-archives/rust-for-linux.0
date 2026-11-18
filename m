Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018666;
	b=TYionNW4NGu6CwAkpRjMcYua5Amrh176awwsKzWSsZOBQZWYDVZAlh+r46SaeZ4BSfu/
	 ccxqXUmpNSGGgilyf2Z+Og2/SLnZiRCvzVBdKKdy0dbhaT+D9pyQeorcSWHENegjdgXfU
	 J0GHTbxrzOW5XGDaDsXsYppIH08SInTDxJdK2FEMSNSR8PNVNR5Uy7wy73GBo2LHISWtq
	 Rr8JahT0Qs+r2sXDkcQF/uQBSIqfZuqLwsX85sbFujulQcb6fT1xKTJN6igFpUH+TIHB7
	 /DcomM4Bn36qMHYnZ14XV61AHAYn09szuhWcryi8HcZ4nHxg/Omtw4OLsK65jde3woQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018666;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:To:From:Subject:Cc:References:
	 In-Reply-To;
	bh=I3euMsr0R3jsztb6tBx9FVmWbLkOv+l5VRxL2+eRjeE=;
	b=Viv7DN1dWmsA4970LIka6rAFRJYrHNVVSLj+91eDEdk1uz9l4XsaiIK1wY2UxRMS/oVE
	 GfhmxSkfrhUNF+6+9XWWpHNXGk+mi6fuwF34BQz2yJ3wpy/SJSipTKXIiCUlfvkwrmaUI
	 m5zNrJoYTu8YeC+7mRtBHiwrt2s80Kw6JOmerD9R0apEEjDgF54u7PvP4zCAajSfY/30M
	 wZbK4wLicYY9Ghii0olq5txwegDcXO3fEHxbwLUHg32l2nqdWm2MsPyuj2STe/3VEUvT8
	 KPDc15XCrQCdI+eAL2QiHiHdJ2frbXpfYrz2lD8043OxZZFFmU5gWd3CUBejJ5O+QCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f8PZYMun;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BDB606A31C;
	Wed, 18 Nov 2026 16:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f8PZYMun
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF10D1F000C5;
	Wed, 18 Nov 2026 16:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795018666;
	bh=I3euMsr0R3jsztb6tBx9FVmWbLkOv+l5VRxL2+eRjeE=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=f8PZYMunuilXaJTcx8ZrhLeWaXNaLQTyX35hbHY7pCCKA2Twh6JKaXBTb664lnEtK
	 WZiRgXI5eYvyj6uEQS3ldceWXYXAB8DXU4dLpF1lw/VrmuqJfil64tbS/Tdjhk3iQm
	 GDrk4Nqxl/xyO6Rfq/VXvCezB57ny7QdymCvlgWXvxd1z4ZoZlXQf+I0LRDGPvbMhP
	 GagWO7vKstIVbcPAgEGfo9W8Ty4P2jKHP8oAZCiFG6IDK9XntLugEV48XLpuRqVTjv
	 x6CvGQ21JzXWXxt6tZ1AmfJlNIfu8ODWussVNXSZwuJZCaC0chRrECTwuFUSa6h1ct
	 0YeX5gjxMt/Jw==
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 17:17:41 +0100
Message-Id: <DMYH0CXPUTMP.J3AKN619TL34@kernel.org>
To: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] rust: drm: ioctl: fix call to unsafe function
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Asahi Lina" <lina+kernel@asahilina.net>, "Lyude
 Paul" <lyude@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261118133232.48603-1-vishal.moola@gmail.com>
In-Reply-To: <20261118133232.48603-1-vishal.moola@gmail.com>

On Wed Nov 18, 2026 at 2:32 PM CET, Vishal Moola (Fractile) wrote:
> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
> index 64af9eacc306..5a2e2f4f0e91 100644
> --- a/rust/kernel/drm/ioctl.rs
> +++ b/rust/kernel/drm/ioctl.rs
> @@ -152,7 +152,7 @@ macro_rules! declare_drm_ioctls {
>                              // dev/file match the current driver these i=
octls are being declared
>                              // for, and it's not clear how to enforce th=
is within the type system.
>                              let dev: &$crate::drm::device::Device<_, $cr=
ate::drm::Ioctl> =3D
> -                                $crate::drm::device::Device::from_raw(ra=
w_dev);
> +                                unsafe { $crate::drm::device::Device::fr=
om_raw(raw_dev) };

I remember there has been at least one compiler version in the supported ra=
nge
that complained when the safety comment isn't directly above the unsafe blo=
ck.
Has this been fixed in the meantime?
