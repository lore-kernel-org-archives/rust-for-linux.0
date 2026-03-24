Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2163D649F
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 10:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774346988; cv=none; b=NybGrLUZwFgGG9JvgpUklHnGKNFHHNwY2OnOMxRgqZ9m/Xzvcgc9Nnco5lW/v4v0GKtDDTbtCUKao6J0CdEHkbynclr3EukDjpufHTROwmkzKfzIs7AavVF+0IlKHzLuwHhxgggIxvQADh2LI6FRZpdJyN/fAri6VomqXDyhcO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774346988; c=relaxed/simple;
	bh=EmSK1NmODGPTmWsvl2Dg9Urj+SEymU4OA3hU/sFRKrI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XlcI+1mTCno466N4zjONWwx6Zbf331154u/ABCmipH6K+NIVkh5pYK0s45EYc+YdyhT/SpOqD9L6yhkwttZ+ah/D/9wgz5RNyimvG8T2wnquXkTayf++TqZu7xIGv6OTyZZmsReSahtZeDzCPXMV01449FMYtk436X369NTaEAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cFcLr+WM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cFcLr+WM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774346985;
	bh=EmSK1NmODGPTmWsvl2Dg9Urj+SEymU4OA3hU/sFRKrI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cFcLr+WMGQlg+lshHwi0TQDl/mtB3kwNqDWqebTgVn1nT3INsiiUhBc7/shweQryQ
	 lgGA8ghDyPCxGKhCOkzjC4ZhPDcwnqxUSh0Ap3EQKXeA+3WQF3LQug2xkt3TOXHhz2
	 AaMcRyUyc9Cqeb4xwEwzn0KE48WT7KGyAOMv6huXcFKTLhp/hV2Qz+8u7Mw2mlDGnb
	 bmMJr6/kzxCZZQ7M0aS+0RiPJ2cap3E0I2SBKYfmf8r1lt2WdtVIMoWA/V4rT/v3lo
	 UqVCbpj+WtS9oUBW+RMvvPNYzG3F6U2N4hgLIITM2slFIIrPVnSHzgLQmiwPPLTG+I
	 bugaWfDq/bg9A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3EDD917E59A9;
	Tue, 24 Mar 2026 11:09:44 +0100 (CET)
Date: Tue, 24 Mar 2026 11:09:40 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Boqun
 Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Steven
 Price <steven.price@arm.com>, Dirk Behme <dirk.behme@gmail.com>, Alexandre
 Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v3 09/12] drm/tyr: Add fields for COMMAND register
Message-ID: <20260324110940.7076a26b@fedora>
In-Reply-To: <20260323-b4-tyr-use-register-macro-v3-v3-9-a87daf9e4701@collabora.com>
References: <20260323-b4-tyr-use-register-macro-v3-v3-0-a87daf9e4701@collabora.com>
	<20260323-b4-tyr-use-register-macro-v3-v3-9-a87daf9e4701@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Mar 2026 17:18:11 -0700
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> The MMU COMMAND register accepts specific commands. Enumerate those
> commands and use the register! macro to ensure that only those commands
> can be written to the MMU COMMAND register.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Though I'm wondering why we do that in multiple steps. I'd rather have
a single commit defining everything MMU related (basically patches 5 and
7-11 merged into a single commit).

> ---
>  drivers/gpu/drm/tyr/regs.rs | 47 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
> index 9bf2723ab6412034be9a77930532cc89d0adb128..6fbd6268724eb6b2ea8d76c5d991353dcbe87068 100644
> --- a/drivers/gpu/drm/tyr/regs.rs
> +++ b/drivers/gpu/drm/tyr/regs.rs
> @@ -1048,8 +1048,53 @@ fn from(val: MMU_MEMATTR_STAGE1) -> Self {
>                  63:12   base;
>              }
>  

nit: do we need an extra blank line here?

> +        }
> +
> +        /// Helpers for MMU COMMAND register.
> +        #[derive(Copy, Clone, Debug)]
> +        #[repr(u8)]
> +        pub(crate) enum MmuCommand {
> +            /// No operation, nothing happens.
> +            Nop = 0,
> +            /// Propagate settings to the MMU.
> +            Update = 1,
> +            /// Lock an address region.
> +            Lock = 2,
> +            /// Unlock an address region.
> +            Unlock = 3,
> +            /// Clean and invalidate the L2 cache, then unlock.
> +            FlushPt = 4,
> +            /// Clean and invalidate all caches, then unlock.
> +            FlushMem = 5,
> +        }
> +
> +        impl TryFrom<Bounded<u32, 8>> for MmuCommand {
> +            type Error = Error;
> +
> +            fn try_from(val: Bounded<u32, 8>) -> Result<Self, Self::Error> {
> +                match val.get() {
> +                    0 => Ok(MmuCommand::Nop),
> +                    1 => Ok(MmuCommand::Update),
> +                    2 => Ok(MmuCommand::Lock),
> +                    3 => Ok(MmuCommand::Unlock),
> +                    4 => Ok(MmuCommand::FlushPt),
> +                    5 => Ok(MmuCommand::FlushMem),
> +                    _ => Err(EINVAL),
> +                }
> +            }
> +        }
> +
> +        impl From<MmuCommand> for Bounded<u32, 8> {
> +            fn from(cmd: MmuCommand) -> Self {
> +                (cmd as u8).into()
> +            }
> +        }
> +
> +        register! {
>              /// MMU command register for each address space. Write only.
> -            pub(crate) COMMAND(u32)[MAX_AS, stride = STRIDE] @ 0x2418 {}
> +            pub(crate) COMMAND(u32)[MAX_AS, stride = STRIDE] @ 0x2418 {
> +                7:0     command ?=> MmuCommand;
> +            }
>  
>              /// Fault status register for each address space. Read only.
>              pub(crate) FAULTSTATUS(u32)[MAX_AS, stride = STRIDE] @ 0x241c {}
> 

