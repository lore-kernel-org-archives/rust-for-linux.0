Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D20283FDF
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 20:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766520699; cv=none; b=Dqw26dcYj3YL98fcEzRK93oXYuoSmduY2yXuhHTalRIZZJ8++K7PNX+5i8QZ8DifWd0FNdQG+H0sDaFFLNsGItU05mwlqMq2+FXcFv8rbZCtMomDVouLuS3+o5Fdemb8vz7Ym4KKA5eDfeE5JbjT2XnhHh6RWhfzU8QqVgCKePY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766520699; c=relaxed/simple;
	bh=0lN7vWYq46IlRuow/qy6yXcoWMg8gDx9Z3ZPDRYqS2A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=BDIrzghj1ZsmeK51o34Ns/1YV1trNZTmedyIlItNDFvGqzeNDKAevoUJ0Sb561uFFzHO1wpktZdqnAM0fo8bkpFtG1SpHPM/Yvn0cmb/UL58nZoG+x7fu+3zeqFNcP5zUAqm1K67wbqlVEWdZQHfeUy0ngsMYF07GxpWs0diBs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJ2xcI9i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJ2xcI9i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90841C113D0;
	Tue, 23 Dec 2025 20:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766520698;
	bh=0lN7vWYq46IlRuow/qy6yXcoWMg8gDx9Z3ZPDRYqS2A=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=EJ2xcI9iSqN9afEDPOK3ZBCbtQg8sA/Lm0jmxBOGybtiCeBc7vAd/gMADukz0PEa6
	 4dLEGn5YolY8n1ci0FbYUOt7ZUtLmof1sAFwVoIZPvooxsXW3lUAR913aUjWu9rFnj
	 +Ls47Xg6HeDv3LPlnV+N97ZgtJa8z1SVAy0eAjl+LU+lDXkAr6GTXrQAV1EQFgfmVX
	 sM9ggGNG8zCZkPI771aoma5xK4mYwMGIZMTD/5+HCfRaYPTMrQZwXYCCiWPaNFYqT5
	 nnBc1FEW6BkUxG6QXxk4fyWEQZ4dhvYijQqoKH+3wEwIit46RQqqk/iquecfuv/bd2
	 Ts8cGhgWmDvtA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 21:11:36 +0100
Message-Id: <DF5VBOI4LSTZ.5O2XJRIFMK3S@kernel.org>
Subject: Re: [PATCH v5] drm/nova: Align GEM memory allocation to system page
 size
Cc: <acourbot@nvidia.com>, <aliceryhl@google.com>, <joelagnelf@nvidia.com>,
 <airlied@redhat.com>, <rust-for-linux@vger.kernel.org>
To: "Brendan Shephard" <bshephar@bne-home.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251223135902.35767-1-bshephar@bne-home.net>
In-Reply-To: <20251223135902.35767-1-bshephar@bne-home.net>

On Tue Dec 23, 2025 at 2:59 PM CET, Brendan Shephard wrote:
> diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
> index a07e922e25ef..e1b57609b8f7 100644
> --- a/drivers/gpu/drm/nova/gem.rs
> +++ b/drivers/gpu/drm/nova/gem.rs
> @@ -3,10 +3,7 @@
>  use kernel::{
>      drm,
>      drm::{gem, gem::BaseObject},
> -    page::{
> -        page_align,
> -        PAGE_SIZE, //
> -    },
> +    page::page_align,
>      prelude::*,
>      sync::aref::ARef,
>  };
> @@ -31,14 +28,12 @@ fn new(_dev: &NovaDevice, _size: usize) -> impl PinIn=
it<Self, Error> {
>  impl NovaObject {
>      /// Create a new DRM GEM object.
>      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem:=
:Object<Self>>> {
> -        // Check for 0 size or potential usize overflow before calling p=
age_align
> -        if size =3D=3D 0 || size > usize::MAX - PAGE_SIZE + 1 {
> +        if size =3D=3D 0 {
>              return Err(EINVAL);
>          }
> -
> -        let aligned_size =3D page_align(size);
> -
> -        gem::Object::new(dev, aligned_size)
> +        page_align(size)
> +            .ok_or(EINVAL)
> +            .and_then(|size| gem::Object::new(dev, size))
>      }
> =20
>      /// Look up a GEM object handle for a `File` and return an `ObjectRe=
f` for it.
>
> base-commit: b927546677c876e26eba308550207c2ddf812a43
> prerequisite-patch-id: 7154ef17c3e40275152c90eff07bffcb5ef5e5cb

This looks like this is an incremental patch on top of some previous versio=
n of
this one.

However, in this case I don't think there is a need to resend, since I pref=
er v4
over this one. Eventually we will need to use size (or aligned_size) outsid=
e of
the closure for further calculations.

I will pick up v4 of this patch, no need to resend, thanks!
