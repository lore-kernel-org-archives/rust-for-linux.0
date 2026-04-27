Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194B140DFCC;
	Mon, 27 Apr 2026 00:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777249080; cv=none; b=GB3xr1CG9A9NQnNQAp3DDX/hGw0iFXna8wVoa/TFodWdpTzdjQ/2Cu/kMwVFebmH7gSwPSo/iP5ceu25zsQXOrMNrUt5EP9fTmgZ0qR2kqTix62WOYmnGIU3G/5sS67lRyB/AUCvcTR9w7Em9YROS2Den4mGArMuWX47Wz2/E7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777249080; c=relaxed/simple;
	bh=/IYygXAoENKbgEqtgqis7Wk6FfD7Ekordvwh+V5T9s8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OUV9s8oIAa0F1Zetxnx2Sz1QqKNlbOJ/RC0ksErhEcoJuC/eM/mapA4sjJVsqrL5rvlziWScC5kzbHvNHFFGTB4W+6/l6j5YFbJdoDb0Kh4U0lxMLivEtB+U/SnjQvbNI1bcMXHw/rJAl3vFm2PEiUGal8Cs9PXYUScVBsQ9oz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jS+NNRL6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jS+NNRL6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28EFC2BCAF;
	Mon, 27 Apr 2026 00:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777249079;
	bh=/IYygXAoENKbgEqtgqis7Wk6FfD7Ekordvwh+V5T9s8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jS+NNRL6OIyFXDcuKX98Ej7+D1O1cRA/ueskRCYRO5jbdQ1rsEw8kDexkLGMiV7Qy
	 US9nYXLTxiwgvLiLImv0q6ui41YAegLfHtEasnBx22dJWkyrLB2WEs3e3yP8QKr42q
	 tGFLu8R2DZgp56sb5x2g2sauMVAhkdXzyfKxhwS8/llIDGZGuO2raTg519KiEtHEbe
	 2CgTfixs9eURqudlcYLkUxKAur+zZJL7s8zb5Xy+h5SyeYACPRIUAeAqMuWRpKzwfy
	 5A6cJY7o4Fm+kq618IPGi10+iqHd5CLrvPWgifCVxNLdZe8Tm6rDBi2FE0BG7xw71O
	 NA2HWz5WIvIqg==
From: Danilo Krummrich <dakr@kernel.org>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
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
	daniel.almeida@collabora.com,
	lina+kernel@asahilina.net,
	lyude@redhat.com,
	j@jananu.net,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 0/1] Rust DRM build fix
Date: Mon, 27 Apr 2026 02:17:50 +0200
Message-ID: <20260427001750.1559562-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426094725.2188668-1-mkchauras@gmail.com>
References: <20260426094725.2188668-1-mkchauras@gmail.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 26 Apr 2026 15:17:24 +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> [PATCH V2 0/1] Rust DRM build fix

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/1] rust/drm: import ARef from sync crate
      commit: 5f69165b7e42

      [ Add missing Fixes: tag. - Danilo ]

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
