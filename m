Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82DB3B52EE;
	Fri, 20 Mar 2026 12:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774010744; cv=none; b=k5ymOo8+WHpC7kYMAtAQGfso7uOeeQsJQqcE2Q+3MElPQC3GnkVyGO49NqXzQ0OPFmTklpjiPlW3oteVAoIbxy0Hod5PrqG0XhnF20kA1fGtyWzzEW+2RHHMtJ1EvpJWoIJ32SStNEsbscOWCQZ5bg/hzQOiaqCI2hhE5kLcfSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774010744; c=relaxed/simple;
	bh=DIVRo4pf9YQUx5O/1lAbqeDjeGJvDIX5h8Lg31+I4IE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=tmyJ26T95TUSdbt7gAGNna9kuU+7NzrNCDyVhb57uLyf6yTpYc2/zlkkXCqatR+OmeayDm9I5fLVz2cXcr/b3GM9Ue6nPgc8lYZLzCSva8Py8JMWXP5YEZACBhGP0rizTWyxYpnu4f4EaiyT/GIBuC0LHaJhJfVCvTScSFidcwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxySD56j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxySD56j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82CAAC4CEF7;
	Fri, 20 Mar 2026 12:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774010743;
	bh=DIVRo4pf9YQUx5O/1lAbqeDjeGJvDIX5h8Lg31+I4IE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=mxySD56jeCO+XeyDMoM3S0orTZ/jgbZIsdw3ZKPl8yHhi1To5LLOWrL8PDA3nH4PL
	 HH0LUFkbQw326oUPKK84FeJA8m6oE0/xHCTEo2mYtRG++ZJXMYMS9e7TTdyhjxa4gs
	 wUEWv99T5EepqiPa0CYcFrQyM0GVoTk4g3GxJ2viAKMClj6lUU/0edZiks+CnfG/6N
	 ivsDGlqGilLuaZdKm5oOhyo8BotJaY52WV7UV7KaT6AoEyaXfEMlHJymxjfyc5YW9W
	 FXJLTofP+v4aWIZ7WSRKylWsSm8ihT0sIbCEPEcVGpbS7Qu73dRt0Xr/xnA9Mg5vSZ
	 JthjwrvqVadeQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 13:45:38 +0100
Message-Id: <DH7MBMNV5WPI.E9TXUC279THZ@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: gsp: move Cmdq's DMA handle to a struct
 member
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260319-b4-cmdq-dma-handle-v1-1-57840b4a4f90@nvidia.com>
In-Reply-To: <20260319-b4-cmdq-dma-handle-v1-1-57840b4a4f90@nvidia.com>

On Thu Mar 19, 2026 at 7:00 AM CET, Alexandre Courbot wrote:
> The command-queue structure has a `dma_handle` method that returns the
> DMA handle to the memory segment shared with the GSP. This works, but is
> not ideal for the following reasons:
>
> - That method is effectively only ever called once, and is technically
>   an accessor method since the handle doesn't change over time,
> - It feels a bit out-of-place with the other methods of `Cmdq` which
>   only deal with the sending or receiving of messages,
> - The method has `pub(crate)` visibility, allowing other driver code to
>   access this highly-sensitive handle.
>
> Address all these issues by turning `dma_handle` into a struct member
> with `pub(super)` visibility. This keeps the method space focused, and
> also ensures the member is not visible outside of the modules that need
> it.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Linking my note from the original patch series [1].

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

[1] https://lore.kernel.org/all/DH60S91O053Z.1DDUJSL0D6NQQ@kernel.org/
