Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924B93FF889;
	Mon, 29 Jun 2026 12:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782735830; cv=none; b=CricNT/O3GUlYWh2bhUhjicn7v7Woux6h1I7lWMYfczDAq5fczn1+sUd0xdSyOgM70omuR9lu6k2M4llUDXNVnDOSAItQpK/gUm39ikhO5rN02YMtLmg1wFc6f7fRHrenMZRBOoLdw0ZDVAFPGioEf3DYqTVujzhYCRs6Z1Yxg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782735830; c=relaxed/simple;
	bh=ioYP6W7K7DpPh71VhhIjgROy8wmwkA3rFwuONa9kiqM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=Qx2TxlQXN4xHD4PUYdUpdGOekk+DirWcUIAoh9bkZUEgtLDOENQV1SaFLnA3CpjE74ZFCBdsGYfOA5gKD07ZjrMKK4eODvYVZV/JeiL9Ly31O/3IUAjPpk80zIkDR1xFeiInSnc5N5hUzdqvTBk5UaTYvG1fjmrplP+GF7UECxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6Whcs/P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6Whcs/P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12121F000E9;
	Mon, 29 Jun 2026 12:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782735829;
	bh=N4FA0nvzdM4X0o3aEn3r4fq7sVBVRC8M6+7z+lML0CI=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=X6Whcs/PhJ9DoS1A4NgxnDu9VH00K4k7WLpxxUhmTpG+hVOqFgOmXYfl2q1qdqebc
	 SGw9BbY9n+zQthCy6bgY/Z2sO0nBNK3Y0PUh7YtRElIA4J9dchIkARhXaq4Ete4dTv
	 LLZLr3C7rVHk+t1GFD6AcLQ4Kmak/xAyDRYrC1oBU/VRlOydmsS9hSlFdBXkTVTfRx
	 IAf68Zw6yZHG4gdjkeBJ9R9vUYlQVhEBO5xUCHXXGICz5QDgoUEveIAYFDftnDkJ+w
	 UwrdpgmFbamhf/c1Q4xlzGl2PeeFX/Ejk2qrFvrpzwn/381kuMxLNOONd3LOKs5jsJ
	 UlVn8J5yaeReg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 14:23:42 +0200
Message-Id: <DJLJ3UNHDAU3.14K32FFFAHY8A@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 0/1] rust: introduce abstractions for fwctl
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <jgg@nvidia.com>, <dave.jiang@intel.com>, <saeedm@nvidia.com>,
 <jic23@kernel.org>, <gary@garyguo.net>, <joelagnelf@nvidia.com>,
 <aliceryhl@google.com>, <kwilczynski@kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
 <acourbot@nvidia.com>, <jhubbard@nvidia.com>, <zhiwang@kernel.org>,
 <daniel.almeida@collabora.com>
To: "Zhi Wang" <zhiw@nvidia.com>
References: <20260629103946.3117152-1-zhiw@nvidia.com>
In-Reply-To: <20260629103946.3117152-1-zhiw@nvidia.com>

On Mon Jun 29, 2026 at 12:39 PM CEST, Zhi Wang wrote:
> - Adopt Danilo's higher-ranked lifetime model for callback-visible
>   registration data.

Thanks! Have you seen my subsequent reply in [1], which achieves the same t=
hing
without requiring ForLt, but uses a GAT lifetime instead?
