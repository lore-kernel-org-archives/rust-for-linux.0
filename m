Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25EA3ED13E;
	Tue, 20 Jan 2026 10:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768905435; cv=none; b=ju0XjzEEwvEVR10MSft9ux24g3NITLs2mCJGMOyK9bGfTAcdeoEtFuOM3uosq/QzGZWWJ4eJ1uBPqcYyFS+ol4NPpUXWo0D4Ge6bUjHlPZfMXZc6tlUsW2C14qXPDiUsmtU7jw8QOveNYu6xg/CXFqAtgAoKRa4wzxWPappBlwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768905435; c=relaxed/simple;
	bh=ff8PvoLd27xknveeG6tYVL2fNILWoP3zoakHDhwG9Ys=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=P/vrYShM7PW4Wg7Ng7DMzqWwv3YW8fv0LkOHaWnhgaoWz1AWa0V12IHjB+u+YIGzJ0Dz8Vz+xZeQJ/ofsAfTmyMcVOj4Wd8KUlz4NPh4kWs4hnEeEJWBgcjYG8tKvGgNCHv4+SzU2LYDsVYdq8WgePqJWPfhigt9caq0NoEebsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlOSIwXo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlOSIwXo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC49C16AAE;
	Tue, 20 Jan 2026 10:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768905435;
	bh=ff8PvoLd27xknveeG6tYVL2fNILWoP3zoakHDhwG9Ys=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=dlOSIwXodDxENXTQ4oe4XMsP2C6ZFlTtGNI46ZMROnGG+sAWC8YO95xnGVTIHYKTR
	 6BVF341QW9TDTshFp1OomC9KB8OE5iuNMvlOzmcyo3Vw7TqpOFamTFgpMA3BOe2h+s
	 q8XyL6gan0YTUnKr5LCvVuTJk0sE3myDAA+xI9oZX9S0lzt3nod/q61rIYicCULAxk
	 R1lSHa2wgFsFClrENX/zlBoeBI3Mmh2f4wmYHr1uCrERzi+dOvOHepGuN3GXzp/p1E
	 64x/Ta8PgpIqUd3Qn1gpa3zneWtC9OUiOypwCy9/Bq3EdK6BaoSU1K6QuyrGyn3wBK
	 CMe45qn4syJPQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 11:37:12 +0100
Message-Id: <DFTCN53K0NOW.3N95KVYE3Z1JC@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] drm/tyr: rename pad0 to selected_coherency
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Deborah Brouwer"
 <deborah.brouwer@collabora.com>, "Mark Brown" <broonie@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
References: <20260120-tyr-pad0-coherency-v1-1-91f40e56c67a@google.com>
In-Reply-To: <20260120-tyr-pad0-coherency-v1-1-91f40e56c67a@google.com>

On Tue Jan 20, 2026 at 11:34 AM CET, Alice Ryhl wrote:
> This applies the uapi change in commit ea78ec982653 ("drm/panthor:
> Expose the selected coherency protocol to the UMD") to the Tyr driver as
> well.
>
> Once this is merged with drm-rust-next, this kind of change to the uapi
> struct is automatically reflected in the Tyr driver's GpuInfo. [1]
>
> Link: https://lore.kernel.org/r/aW8-oH7dtp-OTAZC@google.com [1]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> For drm-misc rather than drm-rust.
> ---

Acked-by: Danilo Krummrich <dakr@kernel.org>
