Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA88173;
	Wed, 11 Feb 2026 15:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770822985; cv=none; b=sowigI+5+h2TcaULVETHoTznPOQLnHkhBYxo2XyJy4Np6t3WkudhjmmGcQHLxG7uGHvvjAgzAZuoQPwNf0fuN+2+kUASLk8n9wVRikFtFQrn0pSzcrkWE1adQXyEhUumbzsROphaBE4srphrlGWz6gjSPpaYj+RSgwqyjOlnNo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770822985; c=relaxed/simple;
	bh=hZJ5H7P+c7sLl4niQJXf9CZ5lH2NB8YyuYiSe4B/q9s=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=HWiwvi4rmAZNQkASkpI54uF0PHe2ncA5BoDqiCVK9W5usjxOxAoVMs8TAXR2I7i3ODbk28/4zpPoim/mWyD274VhZt0TmONhlNBKSRvyepM+9eHzkxJ06DHIIYDgOY0b2+UeY+TwnThlWA5oda3YbNH/E514E/Jy03QZZGEW1s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qb0jaNmb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qb0jaNmb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754D3C4CEF7;
	Wed, 11 Feb 2026 15:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770822985;
	bh=hZJ5H7P+c7sLl4niQJXf9CZ5lH2NB8YyuYiSe4B/q9s=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=Qb0jaNmbX+5NERHoK1/3NX97zwiyUKtLreH96hzA5/gN+dn65EnMmpICHmFfvKtN5
	 vdCLPYHpR4kaCqVsK+lstfcjT2NQjihQR9pA9YcXKnsb1q03G9z3rPK1OSWQWMSnlV
	 s2N+Uus0LI/k/czsGLHjTUInBapAnMfFw9iVdqYSYEFe4vBDGnGPgHPXJXj+tqCuPx
	 tNsuKzjPdIUmw14A/NpLZv8FK8EZagrAaH62aiDL1UvbPl4tU9Bg8ROUDv6Plm1evk
	 3KTRkxkaaorcGLw08YSsUYlawYYCOQx4NKawxoaIWBRzgQ0MjMelqWzzr49kZr5hJO
	 CmQkVPgaqTUwg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 16:16:20 +0100
Message-Id: <DGC8CUUJCDKJ.5XVHXB6I6V5F@kernel.org>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
Cc: "Alice Ryhl" <aliceryhl@google.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Philipp Stanner" <phasta@mailbox.org>,
 <phasta@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Gary Guo" <gary@garyguo.net>, "Benno Lossin"
 <lossin@kernel.org>, "Daniel Almeida" <daniel.almeida@collabora.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <rodrigo.vivi@intel.com>
References: <20260205095727.4c3e2941@fedora>
 <DG7SZND1GWR4.3C5NLKY4SYC0M@kernel.org>
 <bb57b6837aa8044e679dad5f2589c2e0ba84c221.camel@mailbox.org>
 <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com>
 <aYruaIxn8sMXVI0r@google.com> <20260210101525.7fb85f25@fedora>
 <aYsFKOVrsMQeAHoi@google.com> <DGB7RWKMPJQZ.2PHB127O6MVVN@kernel.org>
 <4e84306c-5cec-4048-a7eb-a364788baa89@amd.com>
 <aYsZHhX2IVO2kOSm@google.com> <DGC1KP1DT6YV.3LQWZXMA22L5A@kernel.org>
 <20260211112049.089b2656@fedora> <DGC2WYUT80B4.3D4QKYP8FVVQJ@kernel.org>
 <20260211121223.78674f22@fedora> <DGC7JWOL70HH.2AMUEI3M10I9J@kernel.org>
 <20260211160059.6e0d3b60@fedora> <DGC84SJI67NG.5QGAR13XBM75@kernel.org>
 <20260211161444.3d170ea1@fedora>
In-Reply-To: <20260211161444.3d170ea1@fedora>

On Wed Feb 11, 2026 at 4:14 PM CET, Boris Brezillon wrote:
> Okay, that would be one DmaFenceWorkqueue only used for the driver
> JobQueue instances (or one per-instance if the driver wants that)
> wrapped into some object that doesn't expose it as a generic workqueue,
> so only JobQueue instances can use it. And then drivers are free to
> instantiate their own DmaFenceWorkqueue for anything else that's
> still in the DMA-signalling path, but not directly related to
> JobQueues. I think I'd be fine with that.

Yes, that sounds good to me.
