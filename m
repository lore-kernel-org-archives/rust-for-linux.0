Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC44C1BBBE5
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Mar 2025 14:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743172945; cv=none; b=L1G9liu4H5P8o2jgxpIjvLl7N9smPGP3nJ9+imqpMDDwEOVjv0hULb32ePWev6ILpBzcuuVnEc06CZOdm63Oqof6TGpe4zxUbdSd08tguIoOdYMPbguTK4PEGyR67llMPTVJ7hD565ah3BtB3BK1nIPO219d66Tbm9nl+ucE/oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743172945; c=relaxed/simple;
	bh=+zPTZBmyIEAoaSW++4iG9w8dxUKOISHbMHDdQn6vQpE=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=MGXlf+B6pibQ2qvcj7KsZjTzui98brzZnKjGhN+JwqhUI7lTTCH9R8gMQ7eJE1O81A0r74yjHlKKotr8l0TFZ2PYgkVvk9lC5iOkoxnIqMIvM/232EtrLQd4ENW3nKNFyh3Ig/UIZKc8MOgnGUpsoWmghVCk8+7Tbgw4bp3cdxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uNve0Z0O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uNve0Z0O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8EBC4CEE4;
	Fri, 28 Mar 2025 14:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743172944;
	bh=+zPTZBmyIEAoaSW++4iG9w8dxUKOISHbMHDdQn6vQpE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=uNve0Z0OC8fr2iOSBZeNLlyXVaJ+/OlT7lmoLw4dMUE0hPCAwvc3svkM8QiA0KF+r
	 20kkHT8Xt/wHdUcq2MOFx1lMUNzKnSCrdBjz/qJJpn8t0OOl16A8rHEuWqdb3K/ZOi
	 QBRCxH5PebTopMSvTYShH06l/XUoJBLMLeYfnq8GHS3SKVs9I/gIA7XBHJey5KNJ9s
	 2CJnrepU00pI6AtL3Pkn3SajQmZwfXnlM7Dd5K8TJhEPwrz1nGhzn6q3wdqNMdKC9L
	 a7MjioMqaUA7erSFeloHkoaHE8u+cg4UOHPs8YWAhU+KPip2TZHxmpfGD2GlN0sHVl
	 Z8RPEPP737CSg==
Message-ID: <f3f8c1b43675e821e48cf9268fd15b05@kernel.org>
Date: Fri, 28 Mar 2025 14:42:22 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 6/8] rust: drm: file: Add File abstraction
In-Reply-To: <20250325235522.3992-7-dakr@kernel.org>
References: <20250325235522.3992-7-dakr@kernel.org>
Cc: a.hindborg@kernel.org, acurrid@nvidia.com, airlied@gmail.com, alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, daniel.almeida@collabora.com, dri-devel@lists.freedesktop.org, gary@garyguo.net, j@jannau.net, lina@asahilina.net, lyude@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, simona@ffwll.ch, tmgross@umich.edu, tzimmermann@suse.de, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

On Wed, 26 Mar 2025 00:54:33 +0100, Danilo Krummrich wrote:
> A DRM File is the DRM counterpart to a kernel file structure,
> representing an open DRM file descriptor.
>=20
> Add a Rust abstraction to allow drivers to implement their own File types
> that implement the DriverFile trait.
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
