Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F8F38B154
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 10:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774346721; cv=none; b=Nlp8FUy5HST7cASi6R67IYJFZQqI9y7LfeiXGhxZRTQ4hdymzZ8RPmzf9H6+8Dya7Nw1LbJXQvXUJZeeAkX4SHCSodODIaoZkJR7ejPao5GRFKqNJ3eNXwrqLv5nFddlxG0qSWIg159pi3eXdNbeYIWl4JrIU/paHGE/Lln9CU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774346721; c=relaxed/simple;
	bh=nHpMWAm5i2APybfh67B4LCfdQnnLqamo4esMTNZoB4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bRWmUVbD+CCREZtZ/m3yXmHP/Fn4+1iHVuXUck3+HeYEKZ72p4Lr2jtL8/gSjbFFYtEkmMt8x0TC88pOzo4r9RLDtZ+PVIln8tX60CII6jV/oGtWZqen+oKi+w5xvkf3beoJwld7pS/dOr71TwCqtj485QbeNlO5gSMqH9Ie0GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DU51jTGY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DU51jTGY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774346717;
	bh=nHpMWAm5i2APybfh67B4LCfdQnnLqamo4esMTNZoB4Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DU51jTGY5VkVP/2m0INSH+hneUd9HcV79vB2S/Sf5DglaRPzUavInkOUOvFXmwhOq
	 YYXveCR9I5h3oZR9TZkuV9HKJhNYujNjbgyvuOToEWwUEjXOJBi0H/AZzidFeN3QsZ
	 ahRtz0iP3JmaO04DKZnpAtJ/T1OLhvSHffAsyK0RV+Tmb4Xj+awHAstqxJLuZ5c0IL
	 DGTjBSbWCZLhLTrM8vuuVO/rDNCJVuFJJXOxNgKiXWMzAPzmucqtCP+QIFm7rAs/j2
	 tnOBxCZBFxBz5ZDStTFoF2v3oSDh2Iy22ZR8cHXa+2iuezLilb3U2ACV7Yx6L7j1KT
	 JzZjVgR2UlOIQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 32A3F17E598B;
	Tue, 24 Mar 2026 11:05:17 +0100 (CET)
Date: Tue, 24 Mar 2026 11:05:13 +0100
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
Subject: Re: [PATCH v3 08/12] drm/tyr: Add fields for MEMATTR register
Message-ID: <20260324110513.729067f4@fedora>
In-Reply-To: <20260323-b4-tyr-use-register-macro-v3-v3-8-a87daf9e4701@collabora.com>
References: <20260323-b4-tyr-use-register-macro-v3-v3-0-a87daf9e4701@collabora.com>
	<20260323-b4-tyr-use-register-macro-v3-v3-8-a87daf9e4701@collabora.com>
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

On Mon, 23 Mar 2026 17:18:10 -0700
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> The MEMATTR register allows up to eight memory attributes to be
> defined simultaneously. Add these attribute fields and helpers to
> define them.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/tyr/regs.rs | 162 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 160 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
> index 428b6d8c4d6bfd341713bbb7d79e0556a2d04415..9bf2723ab6412034be9a77930532cc89d0adb128 100644
> --- a/drivers/gpu/drm/tyr/regs.rs
> +++ b/drivers/gpu/drm/tyr/regs.rs
> @@ -857,7 +857,16 @@ pub(crate) mod mmu_control {
>      ///
>      /// This array contains 16 instances of the MMU_AS_CONTROL register page.
>      pub(crate) mod mmu_as_control {
> -        use kernel::register;
> +        use core::convert::TryFrom;
> +
> +        use kernel::{
> +            error::{
> +                code::EINVAL,
> +                Error, //
> +            },
> +            num::Bounded,
> +            register, //
> +        };
>  
>          /// Maximum number of hardware address space slots.
>          /// The actual number of slots available is usually lower.
> @@ -875,12 +884,161 @@ pub(crate) mod mmu_as_control {
>                  /// Base address of the translation table.
>                  63:0    base;
>              }
> +        }
> +
> +        /// Helpers for MEMATTR Register.
> +
> +        #[derive(Copy, Clone, Debug)]
> +        #[repr(u8)]
> +        pub(crate) enum AllocPolicySelect {
> +            /// Ignore ALLOC_R/ALLOC_W fields.
> +            Impl = 2,
> +            /// Use ALLOC_R/ALLOC_W fields for allocation policy.
> +            Alloc = 3,
> +        }
> +
> +        impl TryFrom<Bounded<u8, 2>> for AllocPolicySelect {
> +            type Error = Error;
> +
> +            fn try_from(val: Bounded<u8, 2>) -> Result<Self, Self::Error> {
> +                match val.get() {
> +                    2 => Ok(Self::Impl),
> +                    3 => Ok(Self::Alloc),
> +                    _ => Err(EINVAL),
> +                }
> +            }
> +        }
> +
> +        impl From<AllocPolicySelect> for Bounded<u8, 2> {
> +            fn from(val: AllocPolicySelect) -> Self {
> +                Bounded::try_new(val as u8).unwrap()
> +            }
> +        }
>  
> +        /// Coherency policy for memory attributes. Indicates the shareability of cached accesses.
> +        ///
> +        /// The hardware spec defines different interpretations of these values depending on
> +        /// whether TRANSCFG.MODE is set to IDENTITY or not. IDENTITY mode does not use translation
> +        /// tables (all input addresses map to the same output address); it is deprecated and not used
> +        /// by the driver. This enum assumes that TRANSCFG.MODE is not set to IDENTITY.
> +        #[derive(Copy, Clone, Debug)]
> +        #[repr(u8)]
> +        pub(crate) enum Coherency {
> +            /// Midgard inner domain coherency.
> +            ///
> +            /// Most flexible mode - can map non-coherent, internally coherent, and system/IO
> +            /// coherent memory. Used for non-cacheable memory in MAIR conversion.
> +            MidgardInnerDomain = 0,
> +            /// CPU inner domain coherency.
> +            ///
> +            /// Can map non-coherent and system/IO coherent memory. Used for write-back
> +            /// cacheable memory in MAIR conversion to maintain CPU-GPU cache coherency.
> +            CpuInnerDomain = 1,
> +            /// CPU inner domain with shader coherency.
> +            ///
> +            /// Can map internally coherent and system/IO coherent memory. Used for
> +            /// GPU-internal shared buffers requiring shader coherency.
> +            CpuInnerDomainShaderCoh = 2,
> +        }
> +
> +        impl TryFrom<Bounded<u8, 2>> for Coherency {
> +            type Error = Error;
> +
> +            fn try_from(val: Bounded<u8, 2>) -> Result<Self, Self::Error> {
> +                match val.get() {
> +                    0 => Ok(Self::MidgardInnerDomain),
> +                    1 => Ok(Self::CpuInnerDomain),
> +                    2 => Ok(Self::CpuInnerDomainShaderCoh),
> +                    _ => Err(EINVAL),
> +                }
> +            }
> +        }
> +
> +        impl From<Coherency> for Bounded<u8, 2> {
> +            fn from(val: Coherency) -> Self {
> +                Bounded::try_new(val as u8).unwrap()
> +            }
> +        }
> +
> +        #[derive(Copy, Clone, Debug)]
> +        #[repr(u8)]
> +        pub(crate) enum MemoryType {
> +            /// Normal memory (shared).
> +            Shared = 0,
> +            /// Normal memory, inner/outer non-cacheable.
> +            NonCacheable = 1,
> +            /// Normal memory, inner/outer write-back cacheable.
> +            WriteBack = 2,
> +            /// Triggers MEMORY_ATTRIBUTE_FAULT.
> +            Fault = 3,
> +        }
> +
> +        impl From<Bounded<u8, 2>> for MemoryType {
> +            fn from(val: Bounded<u8, 2>) -> Self {
> +                match val.get() {
> +                    0 => Self::Shared,
> +                    1 => Self::NonCacheable,
> +                    2 => Self::WriteBack,
> +                    3 => Self::Fault,
> +                    _ => unreachable!(),
> +                }
> +            }
> +        }
> +
> +        impl From<MemoryType> for Bounded<u8, 2> {
> +            fn from(val: MemoryType) -> Self {
> +                Bounded::try_new(val as u8).unwrap()
> +            }
> +        }
> +
> +        register! {
> +            /// Stage 1 memory attributes (8-bit bitfield).
> +            ///
> +            /// This is not an actual register, but a bitfield definition used by the MEMATTR
> +            /// register. Each of the 8 bytes in MEMATTR follows this layout.
> +            MMU_MEMATTR_STAGE1(u8) @ 0x0 {
> +                /// Inner cache write allocation policy.
> +                0:0     alloc_w => bool;
> +                /// Inner cache read allocation policy.
> +                1:1     alloc_r => bool;
> +                /// Inner allocation policy select.
> +                3:2     alloc_sel ?=> AllocPolicySelect;
> +                /// Coherency policy.
> +                5:4     coherency ?=> Coherency;
> +                /// Memory type.
> +                7:6     memory_type => MemoryType;
> +            }
> +        }
> +
> +        impl TryFrom<Bounded<u64, 8>> for MMU_MEMATTR_STAGE1 {
> +            type Error = Error;
> +
> +            fn try_from(val: Bounded<u64, 8>) -> Result<Self, Self::Error> {
> +                Ok(Self::from_raw(val.get() as u8))
> +            }
> +        }
> +
> +        impl From<MMU_MEMATTR_STAGE1> for Bounded<u64, 8> {
> +            fn from(val: MMU_MEMATTR_STAGE1) -> Self {
> +                Bounded::try_new(u64::from(val.into_raw())).unwrap()
> +            }
> +        }
> +
> +        register! {
>              /// Memory attributes.
>              ///
>              /// Each address space can configure up to 8 different memory attribute profiles.
>              /// Each attribute profile follows the MMU_MEMATTR_STAGE1 layout.
> -            pub(crate) MEMATTR(u64)[MAX_AS, stride = STRIDE] @ 0x2408 {}
> +            pub(crate) MEMATTR(u64)[MAX_AS, stride = STRIDE] @ 0x2408 {
> +                7:0     attribute0 ?=> MMU_MEMATTR_STAGE1;
> +                15:8    attribute1 ?=> MMU_MEMATTR_STAGE1;
> +                23:16   attribute2 ?=> MMU_MEMATTR_STAGE1;
> +                31:24   attribute3 ?=> MMU_MEMATTR_STAGE1;
> +                39:32   attribute4 ?=> MMU_MEMATTR_STAGE1;
> +                47:40   attribute5 ?=> MMU_MEMATTR_STAGE1;
> +                55:48   attribute6 ?=> MMU_MEMATTR_STAGE1;
> +                63:56   attribute7 ?=> MMU_MEMATTR_STAGE1;
> +            }
>  
>              /// Lock region address for each address space.
>              pub(crate) LOCKADDR(u64)[MAX_AS, stride = STRIDE] @ 0x2410 {
> 

