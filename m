Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C6120C038
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Jan 2026 18:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767377315; cv=none; b=HWD0zXFUjlPU0hSt+OAXJAmxXril1MXL2FPEo0jtG9UppICigxP1YIxfQ7tKJp2dp13djKLNy7NEZouFYdCzAlbrzmI79Euo+fAjXQNz1VY7Dz8yBD4Qb4qayXKMUmTrmWc72GbwJ2GCs987DnRXqBi1+Ve530lCot/Gfsjfd00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767377315; c=relaxed/simple;
	bh=wLoDbSl5FgK/aO3C0KmF2Ek6viRqKszFv5pxKBZuxuA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=hr/dzwPutHN980Xbz6I0Br4BkSC6XwhoJQQBE9wloaIGtxNxskIsQr2oFzEZMYC8cZW1DzZ0HkUMCHzxOrbs6NpwnPH5zEiVEjGX6tlzs9aks/MmWxk3b/NhwX8gmOS2y1sNijAcWn+8JqcD3pJZz1Wuos2w9Bn55gF5/YMzkjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqeR4OOv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqeR4OOv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C57C116B1;
	Fri,  2 Jan 2026 18:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767377314;
	bh=wLoDbSl5FgK/aO3C0KmF2Ek6viRqKszFv5pxKBZuxuA=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=iqeR4OOviYRlVslgBhEkOQ0JGbYnm40VMNj7eIpUbTD/O/VdnYY5Q+y6regLxoNeu
	 tnUj9ZGk3P5fvC/XGAUAk3Wgf8cDMTgrgJBspz7+nvTIUkXL9CgWksYTMQ46OD2oUD
	 oCt446FlFlGJnzYIEAMISk63M17tjNdTw1wvqvdyheToXlmpakzHlyAHlwb3yLxy+i
	 jn8Th1YVTyOgPiOlsnjujt6CJFHdGFExYQ+vgzt4Gfl9dW0R0WEpu90Q2agAIghvAN
	 mrX5CEsi11MCv0QWGr+MkprIW6F1D9N85rhY+v4BL2lQrJjZEkkZTdL5Y+8wO73KbP
	 mxIJptx0jMgbw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Jan 2026 19:08:30 +0100
Message-Id: <DFEAYVOFWITO.PZZWUJNNHX60@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v1 1/2] rust: dma: fix broken intra-doc links
Cc: <gregkh@linuxfoundation.org>, <ojeda@kernel.org>, <rafael@kernel.org>,
 <aliceryhl@google.com>, <a.hindborg@kernel.org>,
 <abdiel.janulgue@gmail.com>, <bjorn3_gh@protonmail.com>,
 <boqun.feng@gmail.com>, <daniel.almeida@collabora.com>, <gary@garyguo.net>,
 <lossin@kernel.org>, <robin.murphy@arm.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
References: <20251231045728.1912024-1-fujita.tomonori@gmail.com>
In-Reply-To: <20251231045728.1912024-1-fujita.tomonori@gmail.com>

On Wed Dec 31, 2025 at 5:57 AM CET, FUJITA Tomonori wrote:
> The `pci` module is conditional on CONFIG_PCI. When it's disabled, the
> intra-doc like to `pci::Device` cause rustdoc warnings:
>
> warning: unresolved link to `::kernel::pci::Device`
>   --> rust/kernel/dma.rs:30:70
>    |
> 30 | /// where the underlying bus is DMA capable, such as [`pci::Device`]=
(::kernel::pci::Device) or
>    |                                                                     =
 ^^^^^^^^^^^^^^^^^^^^^ no item named `pci` in module `kernel`
>
> Fix this by making the documentation conditional on CONFIG_PCI.
>
> Fixes: d06d5f66f549 ("rust: dma: implement `dma::Device` trait")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Applied to driver-core-linus, thanks!

    [ Keep the "such as" part indicating a list of examples; fix typos in
      commit message. - Danilo ]
