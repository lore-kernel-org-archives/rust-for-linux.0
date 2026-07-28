Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D9C3939B6;
	Tue, 28 Jul 2026 09:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785232113; cv=none; b=XAQkLguf4urR2UcZED6Owr03fHz5/uKCPnobjFH8LfUKV47LkG675jD4ZmVCJOgQR9hH/JdeHx0+NjNLy6NfqG3yAeBV67bfTT1Gx3CshTO+qd5QWoD+oxY64kAO3XydZ7GEqGe7GxJ+rziN1nXJrM8CAIV2Ox1Og7dMxmZilGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785232113; c=relaxed/simple;
	bh=ceeaOmqzkhx94yXetJNSJZd0IPoB9RR3EnfOYeW+sVs=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=GDHh0nRLU9lveDLuH//n/M+MC/MNk8Vg7YiVal/G97Jogv3U8jeLr0nOdMF0kAdF/GvuT4YL2LUKCwuOOttrBeVEy8+IXV9K7ydTJqrmieRf2c5hjEQauIRBGrztMgCi1RZo5OfuSVAl9Xt4PSp8vQnpwhPvt4ZcZWDw1VIu7Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NW8P8R8t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NW8P8R8t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AB01F000E9;
	Tue, 28 Jul 2026 09:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785232112;
	bh=vpKhq3J9yvyoQprJhL3ImKybp8EYteMcnslfwlaSUSk=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=NW8P8R8tvLHxjzoN/6kOD8OOryRyD2J6X8ogsbq+ADUjEMbQnJoM+Gv7NZid4jVit
	 7Jscsyzb8Py+niEuUd6w+oPj5pe5ediPJDDGGBX4jIdD3lYUJkz07wp/C1hkRGXJvh
	 hk0CC/COs4JX1DgLA/1A6s4Lg/m/BuAHO8ae0/Fm7Pyty0yVmw0cFN8MHAsGVme4rw
	 0apszy4D6NXD17qVXgmjNWExb9ZUop+oXesHlovXw+jnkso/sxSHCH2iTERyInw6nS
	 B5roTNbRO1QgxNrPRWHJ9gHHWV1jm4u6FNwyU7w67ZL0142muUxuKM34PrCdslxL06
	 v2RHYfbd+KJNQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 11:48:26 +0200
Message-Id: <DKA3YRMZTRJS.3DOGR3ASR178J@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v9 1/7] drm/tyr: add resources to RegistrationData
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <samitolvanen@google.com>, <lyude@redhat.com>,
 <boris.brezillon@collabora.com>, <steven.price@arm.com>,
 <alvin.sun@linux.dev>, <laura.nao@collabora.com>, <beata.michalska@arm.com>
To: "Deborah Brouwer" <deborah.brouwer@collabora.com>
References: <20260722-fw-boot-b4-v9-0-8669d2a02590@collabora.com>
 <20260722-fw-boot-b4-v9-1-8669d2a02590@collabora.com>
In-Reply-To: <20260722-fw-boot-b4-v9-1-8669d2a02590@collabora.com>

On Thu Jul 23, 2026 at 1:54 AM CEST, Deborah Brouwer wrote:
> @@ -53,13 +51,17 @@
> =20
>  #[pin_data(PinnedDrop)]
>  pub(crate) struct TyrPlatformDriverData<'bound> {
> -    _device: ARef<TyrDrmDevice>,
>      _reg: drm::Registration<'bound, TyrDrmDriver>,
>  }
> =20
> +/// Data owned by the DRM [`Registration`].
> +///
> +/// This data can have references tied to the parent platform device bin=
ding scope
> +/// and is accessible only while the DRM device is registered with users=
pace.
>  #[pin_data]
> -pub(crate) struct TyrDrmDeviceData {
> -    pub(crate) pdev: ARef<platform::Device>,
> +pub(crate) struct TyrDrmRegistrationData<'bound> {

Please use a different lifetime name for this, 'bound should only be used f=
or
the bus device private data itself, as its lifetime defines this scope. May=
be
use 'drm instead?

The same is true for a couple of other places in this series, such as
Mmu<'bound>, VmAsData<'bound>, etc.

Please feel free to fix up on apply or in a follow-up patch.
