Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E98368D7B;
	Thu, 28 May 2026 22:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780007341; cv=none; b=Tshy8aXsMLP8NCY/yQeHkFOilF7SUSC70F/yVeMTLvl7VNUEX+Pcb8MB5b64AmCGyb0iqo9rMfOfVAlM8G8NgWfQlg38F7ktwBYXREu+5H6fQKsh3eMjpv6cOjqIQa6Dvj/4JoxbdHcPwxOsZ8tR0U1+GAxj/EQYZQJLcmp3Grs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780007341; c=relaxed/simple;
	bh=XvjktOief/Wyh2XnJUlybsabmEdf/5FkayL4lYGYb2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CakAo2/VPqcQoPlIMy3WiwiSKKK2WAUcb56P5lKHwqB2+SPwO9A3aO/g7rjGELSIJ3p4267DXQ0ztbLMVGOxDAquoG2mOtewPkDG0LwOR/IF8rjJVE0poN1kYZfilRN7kdYKcPDYNHvJQMaIXxovEUZPxKSUZoHynck2ejnXPlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FW2IwTF5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FW2IwTF5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118821F000E9;
	Thu, 28 May 2026 22:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780007340;
	bh=AcmcKtW66rkEfNJaPB3hjWA/qrjMeNxbkC1G44RKtHU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FW2IwTF5y9ZTJHIUsJ2SS3nGEQy5vUaaBxX8bfIoe4NiHEvLjMAxJFtWijE0kOL0o
	 DlwBmtz+uBzA+RYuar+B2CvYv8buHUqFwQj+JZIOQy6zbxLfoqW2IdVyNMJ3hkb6zz
	 0GHVni9rBrJj14wdOuxBYq95Zhqp/5ceCowk8iHappxHh7uO/rAjH88BmivtumwsrW
	 GcnH9kRUukwlWWGw+pxf7uXqS5BrU4h7+BTIznifQeucJw50GDkycao+ZC3AueXhn8
	 p8RDOQ81JPE2Xty24VUsG+khyywa/ya162f3Se7MTc4RD1qGqGsM1rJutYosnTUu7Q
	 mCWFeH29qG2LA==
From: Danilo Krummrich <dakr@kernel.org>
To: Laura Nao <laura.nao@collabora.com>
Cc: dakr@kernel.org,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	boris.brezillon@collabora.com,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v3 0/1] DRM 'feature' support for DRM drivers
Date: Fri, 29 May 2026 00:28:54 +0200
Message-ID: <20260528222854.2129473-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507080914.95478-1-laura.nao@collabora.com>
References: <20260507080914.95478-1-laura.nao@collabora.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu,  7 May 2026 10:09:13 +0200, Laura Nao wrote:
> [PATCH v3 0/1] DRM 'feature' support for DRM drivers

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] rust: drm: add FEAT_RENDER flag for render node support
      commit: 9c81596851a3

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
