Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9F234253C;
	Mon,  5 Jan 2026 12:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767617771; cv=none; b=HKFPb8PxSNBGoEGIslMMMFfZrAaT/nTGutYZGWy4d4uqWwvDwly1b66bJSEuKC9NpCX2ksBz6D6Ehcs+bdHmdYV2s7H9z1R3kHUFOMhMuvsVgzArT2Ad9NW72W431GQl0/ZNpYSSRJ0m54/JBpsY/fNmT1rDUmgyzw6wAQTz5Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767617771; c=relaxed/simple;
	bh=s5po0zCSErvR1sDPapAuc+orlzs3MGOvE2KUdqifTWQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=DDT3hfwBvF5cIMDIRTVhOtYwaAq99P9zHxniqHipJeNEGlnvVt7JtP4+CTdwSiIdEhQ1KZ02Njp2DUeBXubi0LLzv4ndIPeWSJuUjPbVncIt5h3zslG1BoBGF9uY3MuMjbusiD2mJPDd7brmiWL/yQpT9GNHWAynmbQhKURPT/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1fsJuKx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1fsJuKx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8134C116D0;
	Mon,  5 Jan 2026 12:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767617770;
	bh=s5po0zCSErvR1sDPapAuc+orlzs3MGOvE2KUdqifTWQ=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=f1fsJuKxSiBmmyWL0+dT/uwEWd7spMYqYKNAxusSGx1LDfclGBXXApecMLSXr1ecs
	 3iLN1IUnLpLZHmhEVDPS0gTPZqiYqh7QYzcZNEWAU0+33Hzd+rdQkC6AVdddWUk0MK
	 pNfqlZJBBYYcdabrJl5R3+Jhmg1/NNpr1rxNmTInIJRgsqufCph8sWpi4MhmHctpVI
	 CiK/7XcxxwK1yOGK4y28KkOJyanC21TEg9F4K4O2eA903w1FOFqgMTu3ty8fOWiSZW
	 UI165wBzsOHe/VkW0bqLhPnGndhn8OuHiyFWLAXloS8I1dKQJIxk2sNpTP8bQcNu0Y
	 UITE1jCeJfcMg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jan 2026 13:56:05 +0100
Message-Id: <DFGO7BGCVJF8.3K3G547RK3SVN@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Miguel Ojeda" <ojeda@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 19/27] rust: slab: add __rust_helper to helpers
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>, "Vlastimil
 Babka" <vbabka@suse.cz>, "Christoph Lameter" <cl@gentwo.org>, "David
 Rientjes" <rientjes@google.com>, "Vitaly Wool" <vitaly.wool@konsulko.se>
References: <20260105-define-rust-helper-v2-0-51da5f454a67@google.com>
 <20260105-define-rust-helper-v2-19-51da5f454a67@google.com>
In-Reply-To: <20260105-define-rust-helper-v2-19-51da5f454a67@google.com>

On Mon Jan 5, 2026 at 1:42 PM CET, Alice Ryhl wrote:
> This is needed to inline these helpers into Rust code.
>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Since this file contains the helpers for the alloc module, I assume I shoul=
d
take it through the alloc tree? Maybe we should also add it to the alloc en=
try
in maintainers.

Anyways, so far I do not have anything staged in the alloc tree for this cy=
cle,
so it would probably be easier if either Andrew or Miguel picks it up direc=
tly.

Acked-by: Danilo Krummrich <dakr@kernel.org>
