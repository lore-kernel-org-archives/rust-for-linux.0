Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729DD2B9B7;
	Wed, 11 Feb 2026 10:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770804971; cv=none; b=a9swLotBIckM3yBr2pKmp0HO9aMeafm+y6cfxNeAG84eSTdqPWHt0B/+M/NG72QiaX3D9Xbjj8jG3qTcZUCUL9qWutK9dLBhr1TWTKkX0P+CnUz/TtY6MC8kiuO1wKTFF0Sk+zIwx/Yxw3+jlnNXXaREFaeSlIbUFXA+HDO6dCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770804971; c=relaxed/simple;
	bh=/ptKmBy7kspACRVtX9kbf2ZmQcL19HctAf/KjpLPts0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=dHH/dJsInRHYQ+YPLGGiWTrMSeySQmHIqBzSFdMT0yRhuXBrQWrzXLsar9MpMOL0tUcuvLNJsVxapiIel+jdDUWVd18uR5bHKRc0R66VYYHxRYfCGG/zlGkPqgIsLp2G+GEB53BGMnKZ/TTcCaqmlE9qLOJ0b4qIoR48nV9ZvCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ip8Ufoey; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ip8Ufoey"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32C4C4CEF7;
	Wed, 11 Feb 2026 10:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770804971;
	bh=/ptKmBy7kspACRVtX9kbf2ZmQcL19HctAf/KjpLPts0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Ip8Ufoeyby11wAsjwYyvFDjNYqcI8kJO7NhL15LOyxWYhM563UAUktV7Q7RF9gzWR
	 14FuH7SLoYie5I3eEKi8d98d3Y85Pg+Ornkxdt9iVw8f6majr9bAktffe7CT4X+Lgj
	 ORgzBzTYoNVyo2AX+xCugSvD1EL0Z+eTqY8DYuVjZHPwvOLpHkvtZkpCp5Y9tonoEz
	 YpkR9Af7qfCvntVTtMHKdrIFVxKj2e8LCei4LXzQqEx9G73RsLKuiR/Yo0Fb6Ky1hl
	 tqLP6tIUPIg/Lrr7ZAVa5/8vUcSCnWp/bwU5Tr2P0wX6kUpEDl+nSNLZD4jNxPcFxb
	 4/fsIgVnsCNGA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 11:16:05 +0100
Message-Id: <DGC1YYNXOV10.3P1P49DNY20K7@kernel.org>
Subject: Re: [PATCH v4 05/33] gpu: nova-core: factor .fwsignature* selection
 into a new get_gsp_sigs_section()
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-6-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-6-jhubbard@nvidia.com>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> Keep Gsp::new() from getting too cluttered, by factoring out the
> selection of .fwsignature* items. This will continue to grow as we add
> GPUs.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/gsp.rs | 60 ++++++++++++++-------------
>  1 file changed, 31 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-cor=
e/firmware/gsp.rs
> index bc2243450989..10761716ed93 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -146,6 +146,36 @@ pub(crate) struct GspFirmware {
>  }
> =20
>  impl GspFirmware {
> +    fn get_gsp_sigs_section(chipset: Chipset) -> Option<&'static str> {

Please don't use the 'get' prefix, as it commonly indicates taking a refere=
nce
count.

Let's use something like find_gsp_sigs_section().
