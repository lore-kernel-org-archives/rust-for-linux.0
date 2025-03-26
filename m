Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF3915E5AE
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Mar 2025 09:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742980326; cv=none; b=riNYmdOtPqqwBpAqtv8YnI2xdHemRexIfkmxlN8mdSlnH8b9hZrxZ0BPupTNi8909wG/cXgESdvzV0xk9GOaNsX7EFz6CcsD3EKrpEH69iNSeRtquuTEH/5+uBLhk0kihvpNh4JP0vmS1DVvANJiVFI7Qj7SPhvmM6V4Qh1fyKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742980326; c=relaxed/simple;
	bh=Iiecn4yi6aAWiL3bXi2wBDDnJZawsPTL/Ynk29ROg+8=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=ZxpMcY4x4MrKYudXauRcI2E3lUQ1HzY2P7Zcbm2oOqo1qh0cf0N1ND18u+5iqXp+D+HQyqAriTAF6FnCGGJV8SoeMcMAE9rhu7ojkS3rM6oqHNpa+Ww1eNrtOnGXxkaKS09PrC7z/DRyzk1FvbRsWUhMHYrDtmu4qY9qyWHfXCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EkXuG9bY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EkXuG9bY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2343C4CEE2;
	Wed, 26 Mar 2025 09:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742980325;
	bh=Iiecn4yi6aAWiL3bXi2wBDDnJZawsPTL/Ynk29ROg+8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=EkXuG9bYYyR1bE+lhTm2EBEUniJ35vxS3V2bI4gP2PyBA3DKd8UTUXxCVkvCtRWQV
	 FE5r2Quk8AsBatLS8nHs3Dj0psIxc4j6nvVGyxSb48G+WfxiNO1R6UDagHWoZkUpMf
	 ex7lmNT6iBhRTJ0a5hXm1kdTEh6Tq3ECfpxAINstJDqp/trb1eLH3VKsx8UbdAZ/42
	 HFDmjRMoiZhIBIkxR8IuxCqcmJ+4MIVX0xZ/+yf8QSmfpp6om/t9nh1Ei75dr1gc1h
	 Cs6jh5odkS8RMonSo0dNL0rU29u+czGJ+TeqhC7NWnceZlaBJQT48a3cg95uMvJQdL
	 tx+5pkxTZY4EQ==
Message-ID: <708aa17798df41f8a6b206eb48212217@kernel.org>
Date: Wed, 26 Mar 2025 09:12:02 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 4/8] rust: drm: add device abstraction
In-Reply-To: <20250325235522.3992-5-dakr@kernel.org>
References: <20250325235522.3992-5-dakr@kernel.org>
Cc: a.hindborg@kernel.org, acurrid@nvidia.com, airlied@gmail.com, alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, daniel.almeida@collabora.com, dri-devel@lists.freedesktop.org, gary@garyguo.net, j@jannau.net, lina@asahilina.net, lyude@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, simona@ffwll.ch, tmgross@umich.edu, tzimmermann@suse.de, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>

On Wed, 26 Mar 2025 00:54:31 +0100, Danilo Krummrich wrote:
> Implement the abstraction for a `struct drm_device`.
>=20
> A `drm::device::Device` creates a static const `struct drm_driver` filled
> with the data from the `drm::drv::Driver` trait implementation of the
> actual driver creating the `drm::device::Device`.
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
