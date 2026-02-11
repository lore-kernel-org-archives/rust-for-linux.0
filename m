Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACCA23D2B1;
	Wed, 11 Feb 2026 11:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770808749; cv=none; b=nMa4ct0g5hdL0X1pDFCwnSKXefkQVcHyiRJa8okMtkvIeVRYbsGfpf3qS4M67R++vbkU2RCP18s8GEwNsVve298txxrS8orJ89dMm1Fub91TJCPtqQGxfNFlEnsKyocj/NLF3/v346gP6byxIhATODE0rlkDXnDOVcidFr3nOAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770808749; c=relaxed/simple;
	bh=qtxCyNgeZ05m263Dy1FBKMUpBgiseOelYdUHJ0n9q+E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Sit0BXZfjOoqslLOw10S03LxbTuaPV5cphar+Q77fTzjFRT/WCDcrrA9sGDXVG4j5DeMdUeVFJ5FCdZdg/Fpow2cKs/YiKFEbzvzsEnHN4AAaYQE05lib6KaUO1Qq9t/b3zVWkE5L2q63VSKZURahECYD2xjU+asjl8kFb5KEBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7nIuy2K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7nIuy2K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1F1C4CEF7;
	Wed, 11 Feb 2026 11:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770808749;
	bh=qtxCyNgeZ05m263Dy1FBKMUpBgiseOelYdUHJ0n9q+E=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Z7nIuy2KkHqyMoZsjQDn6ZqCnVTuhrUg1n9YyzSb1ldWM4yhzC07HCnYNs5fcxvY1
	 df5ybHPo9ITgImZlKzYjMQ8VHat7snd5Q0hXrHPZhoxVQtU3MHPi4cyLqjqJ/St2wr
	 v+SqApBISXsTyjZLRq7XdwVowfIwW6j7WSBnnYJUgUymTXVtUJH0OkOAG5oUYWFecq
	 2fOI3gp3JQRJAqQhk52BNp/lW1+R66aETitjVi9+BaqM5Fe23RUVfB1DQYUSmO8lZO
	 rLrM+TTBSl3niNLIXHZmkVAXsKZ7ay39IdFtkTiDaawy0ZJ1syuCi2oWOO00u49pV2
	 V21r/zWNhkNPA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 12:19:04 +0100
Message-Id: <DGC3B6XIY3DW.M3CRU3IAUKOJ@kernel.org>
Subject: Re: [RFC PATCH 3/4] rust/drm: Add DRM Jobqueue
Cc: "Philipp Stanner" <phasta@mailbox.org>, <phasta@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alice
 Ryhl" <aliceryhl@google.com>, "Gary Guo" <gary@garyguo.net>, "Benno Lossin"
 <lossin@kernel.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Boris Brezillon" <boris.brezillon@collabora.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260203081403.68733-2-phasta@kernel.org>
 <20260203081403.68733-5-phasta@kernel.org> <20260210155750.5cdbe6cc@fedora>
 <8ea48ce49f2c7b6fd715dd54c24e755e8ac3262c.camel@mailbox.org>
 <20260211120742.0e9e7122@fedora>
In-Reply-To: <20260211120742.0e9e7122@fedora>

On Wed Feb 11, 2026 at 12:07 PM CET, Boris Brezillon wrote:
> I try to avoid using concepts the language I rely on is not friendly
> with.

It's not really a language limitation. For instance, you can implement list=
s the
exact same way as they can be implemented in C. It's more that a memory saf=
e
list implementation is quite tricky in general.

Lists clearly do have their place. In this specific case, it probably doesn=
't
matter too much, but in general I'd abstain from not using a list (where it=
 is
the best fit) just because they are tricky in getting them implemented in a
memory safe way.
