Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD32E369204;
	Thu, 28 May 2026 22:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780007284; cv=none; b=ZLKip0ZxiTXNAKNlSaWrt7vhtnJlhekkAASOSY+q3b5O1RaF057TtSwUor+Ym6A2ogoKNJKrZQjFaa0FJhDJ/mNdupTqx4tmsWd6MI6wRSFeSptg7VVezTN9Q6ivVcGuxnMqTEkcHqlWd16oiu5//szZ3T/nyqvMSYbHe5luVhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780007284; c=relaxed/simple;
	bh=zO4QtZSDQ1L/UVXvstcDdfyQq8Pwk0YnZ2qZXhnGnrI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=j9mIc3Gl41+JjhOSPZDVaWXCXYnysZ4PpkIfSv6wUn/Ai7GIKJrX0lNoyA35U7gQ9fkP10K7ug8UPAmfCDAnecyWaX2msllvGLlAPdH0vjTRC2X7v1P+aZQddOrePfI6d0xMW3rlrR3FzJECwpkxWS8MD0tXfJCFEo+2lymEXgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=li/1oKA+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="li/1oKA+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31D61F000E9;
	Thu, 28 May 2026 22:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780007283;
	bh=lJodPUarOR8wGQDRsCbfN6impEITQVF2OzJly9uaExc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=li/1oKA+LOrS8vX+EF1yIBouswvrN8EdnPOg3IBLoISANATEr190coNu/wWY3wKeo
	 kd1zNl2ZGCjNyIl0S4R6X5J4ieo4lmBTlfIuojuKwOrAsj+ve2lVcNDbGFhJ4YCUD0
	 lT4iSQH6qNM06LnVJWA5DGXUv6+jKoT6OiR7FaPcJpuwKxZfJ2AugPyxt6VHp3644B
	 WSyTYIseuHryWniR2mbZ8sYn+nUsTnQSwoQpWHx/8IyzgMArBWlOkyKv0uLrDXHoUc
	 z8D6erJ4VmxB+SpM40apIE4ksWlOMjLZiSiN+9QoQglZ1YjTPLv8H7H0m+tb1Zo/fP
	 n3IhA3QMXJZig==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 May 2026 00:27:58 +0200
Message-Id: <DIUNX2Y69INR.HKKUZE3OSEEY@kernel.org>
Subject: Re: [PATCH v3 1/1] rust: drm: add FEAT_RENDER flag for render node
 support
Cc: <aliceryhl@google.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <boris.brezillon@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <kernel@collabora.com>, "Daniel Almeida" <daniel.almeida@collabora.com>
To: "Laura Nao" <laura.nao@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260507080914.95478-1-laura.nao@collabora.com>
 <20260507080914.95478-2-laura.nao@collabora.com>
In-Reply-To: <20260507080914.95478-2-laura.nao@collabora.com>

On Thu May 7, 2026 at 10:09 AM CEST, Laura Nao wrote:
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.r=
s
> index e20a5978eed6..f0c2d6e4db3a 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -186,6 +186,7 @@ impl drm::Driver for TyrDrmDriver {
>      type Object =3D drm::gem::shmem::Object<BoData>;
> =20
>      const INFO: drm::DriverInfo =3D INFO;
> +    const FEAT_RENDER: bool =3D true;

In general this should be two separate patches, one adding the feature and
another one using it in the driver.

But in this case it is minor, so fine to leave it as is.
