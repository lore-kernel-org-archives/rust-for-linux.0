Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D1B3F6C26;
	Wed,  8 Jul 2026 07:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496272; cv=none; b=my1Rs6CEaPFwbVKxbBxKgfsOkUsf3BmZkB4wgI34JK80EosstmJ6gighNni4PsvhoMCY4XcxTacYji7CSg3mPHL2geSngod/PJgmgBsXFCs6V8PCS/f6jwmBMKn3w01PPk/g+iX/I3yXIA6NwpXI8Ndu3U3YP07m4HxIjVWD9AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496272; c=relaxed/simple;
	bh=42gw/j8fnRePva9BK3enJ9N6JrHeKP9THWH/uUJHaEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EaIAAE/QRlEMyIUCJCTewcHGvoIPnL0NM7vt6LpTqHpnbG7ZuMY++iylLlpzsTT35xN/RiccBS/b/NRH1wj444fsn8gxdEK38A88fkztlaXLJJ9mUVSqemO6IDrmPpWK6PoJcfH2FJ/AH2kYe1zBjjYGST0a0KWs6b8sWnKcuUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 74DBBF40CC8; Wed, 08 Jul 2026 09:37:33 +0200 (CEST)
Date: Wed, 8 Jul 2026 09:37:33 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Guru Das Srinagesh <linux@gurudas.dev>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] samples: rust_dma: use vertical import style
Message-ID: <ak3-PbQ-PdeEWVo4@luna>
References: <20260705-rfl-vert-imp-v1-1-2f07946a905f@gurudas.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260705-rfl-vert-imp-v1-1-2f07946a905f@gurudas.dev>
Jabber-ID: linkmauve@linkmauve.fr

Hi,

On Sun, Jul 05, 2026 at 06:25:37PM -0700, Guru Das Srinagesh wrote:
> Convert `use` imports to vertical layout for better readability and
> maintainability.
> 
> Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
> ---
> Came across a recent commit bc58905eb07 ("samples: rust_misc_device: use
> vertical import style") and found a few more locations that could
> benefit from this cleanup. No functional changes.
> 
> Separating out patches per-subsystem as per the review feedback in [0].
> 
> Tested via:
> 
> 	$ make LLVM=1 rustfmtcheck || echo "fail"
> 	$
> 
> [0]: https://lore.kernel.org/lkml/20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev/
> ---
>  samples/rust/rust_dma.rs | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
> index 5046b4628d0e..c46af109f4aa 100644
> --- a/samples/rust/rust_dma.rs
> +++ b/samples/rust/rust_dma.rs
> @@ -12,9 +12,13 @@
>          Device,
>          DmaMask, //
>      },
> -    page, pci,
> +    page,
> +    pci, //

Usually we put the empty comment at the very end of the imports, not in
the middle.

>      prelude::*,
> -    scatterlist::{Owned, SGTable},
> +    scatterlist::{
> +        Owned,
> +        SGTable, //
> +    },
>      sync::aref::ARef,

So here:                 ↑

>  };
>  
> 
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260705-rfl-vert-imp-d12bdbe397c7
> 
> Best regards,
> --  
> Guru Das Srinagesh <linux@gurudas.dev>
> 
> 

Thanks,

-- 
Link Mauve
