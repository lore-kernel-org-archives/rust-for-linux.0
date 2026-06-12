Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84B8357CFB;
	Fri, 12 Jun 2026 20:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781297736; cv=none; b=GtovHnmWEHzYdEDfWGNAEzPk/QAZ+1Lzhu4UjR8vqwRu6i217sQ6cUjaVuaGKYwruPzBE3y+xh90xcEF5WoysY1jfKna3cRh+2BMh37D08s886bT00JmPPNjv2KhsHlg1o77LgeYzRL1VslFwjC2yvaOSUm2L3KAkQvSRJVWFRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781297736; c=relaxed/simple;
	bh=l2Y9NEbOiRuAP0cuhagytwoFh1WiJiVWcHnwSBCZC5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dV9IO4odG0408rGzaSpaolMdXr/IGP1Ds83y2bdn+qjm7yMEsNvO24hpihxaoLF9lKsRiZ7zrPg0yZjuiOKezlZmt3AzRd159894K2/ThnDbWw3efkZ5/NGw1IoOfveSiJqddH2jCF+c4BVE9PdAUCHUbEFJna377b0+EY4Ab74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GwfR6cu3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GwfR6cu3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0431F000E9;
	Fri, 12 Jun 2026 20:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781297735;
	bh=yqWg3ylmi4Zxh9izaVfot+h+usLj7PAF0qm0lQ4XtrU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GwfR6cu3URoizczM2Bg5gXkGyOdGNrhS8X7QZf3X062rm5zzxctJCXviv6yfsA0Iv
	 QwTFY8Qr0KQzvQOZZWeyHyQnda4CQJiwqYLTmTPeHYlXQYs0Pc1nWq/XRxqvabdpUK
	 B9lygZZuCcjBAwuOMS+dcdNzwr7anm7rrZc+0G229Z2hA7FhCONJIAwYxT95aiJFtQ
	 e/N02HiHvMNtZxkEqGrOvOGDpYn0HDPxwIwO5TDl+Bl5mPHMEVYQbWqRnh0HWYLrqM
	 zqW5R1DJVRvhjPaKPCB2HxP8GNGRPbUaoaR1oXxvsJ8CiLq0fLnMWmH7Yp690Aux5P
	 aSMFpY6nm1byw==
From: Danilo Krummrich <dakr@kernel.org>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	laura.nao@collabora.com,
	samitolvanen@google.com,
	boris.brezillon@collabora.com
Subject: Re: [PATCH] rust: drm: gpuvm: add SmContext lifetime bound
Date: Fri, 12 Jun 2026 22:55:25 +0200
Message-ID: <20260612205524.836204-2-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610-gpuvm_smcontext_lifetime_bound_v1-v1-1-531e7d2ee7b4@collabora.com>
References: <20260610-gpuvm_smcontext_lifetime_bound_v1-v1-1-531e7d2ee7b4@collabora.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Jun 2026 17:04:31 -0700, Deborah Brouwer wrote:=0D
> [PATCH] rust: drm: gpuvm: add SmContext lifetime bound=0D
=0D
Applied, thanks!=0D
=0D
  Branch: drm-rust-next=0D
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git=0D
=0D
[1/1] rust: drm: gpuvm: add SmContext lifetime bound=0D
      commit: 5f7410aa2652=0D
