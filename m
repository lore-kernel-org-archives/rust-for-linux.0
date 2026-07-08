Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C543F786F
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 08:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783498733; cv=none; b=Ng97G0BCp0fhUMl3RqcOl9PjFNv7kUDl5Sb9Y7pnDUzq0/Hew4gPxPi1UpY4adcTPF89b9sl9M1fIgbDFGUkfTCOCpbg80ZyQKH0JjNDkINLtN7hBRplWNbHIw0OFTe748sCoSavhzsAPFEb7E8IO5nr79FBFW+2QOWiIeoin0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783498733; c=relaxed/simple;
	bh=nXuVdlrE0d05b1rMUSrzol4wnLS7LVrUEegBEgWQ69k=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDmNbdq5mVPvF/kkhctRKqy8AGvbp9E2ktCerwAfUVai1f+MM1swx7vQB8EYYvwy8HXkdSmX4G3oGiy3QuvI41voISGEPgRTd8Yk8qBF1CoZXjM+f6oAptDUDrl2szKTxWo3gqD+1wyE/NvZ7wq8kcSRqE5/rlVhyeEWh2LJ70M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ALUskmLl; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ALUskmLl"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84783bce476so348102b3a.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 01:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783498731; x=1784103531; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=59q6kMti6TEuYkK2zAzI9NhF5BHSzay0sLHoUMAZAzs=;
        b=ALUskmLlB8Zc2vG50jodDL8YttLn6myf3v4VEhwaV562hvjk7KXUoD9r8crWxL3UQm
         tyCFQAaLqrGQtBlSTAfB4+dGCQv6bU5z9jdVKNC/vVCRkOjxkxhSHfsm/rJxvhEG8EVp
         wSDn6yY0SnNmlV8QGD9JeM95J8GKZ0Bs4bMK9tdgzm2lyBEqwnL1uWkCMPqLl9YSsEeX
         v6lhviirwkOTDhynOPleebKv4WD4elubchKqt25TlrOrAr/uX+pW5cvjUedvSnTehtEy
         Y+qtXtOUpRuZKHlRxCNVnGS8LbSut4VMZSiqhYcokoJpPV+WhI01YlmZH0dS7AoZfhqC
         cb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783498731; x=1784103531;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59q6kMti6TEuYkK2zAzI9NhF5BHSzay0sLHoUMAZAzs=;
        b=P87z53KU5yUc0AyVKglY3vk4pI0N2F1F4fJESfAOo4w2GEepU9SN40jewZRZS8fc59
         bWvIGmWuH8lBv5nZqW57wPLbilmKPpNo4/rHlzlbRnJ2pqAbzGh3KQPzsQDGNQllbvzf
         /ySQf8f7iFbn0kweBVWsE7BzfAlLoJntPzaLWES7QXiCW3KOf5TxLwNKRoTZwFljo/Py
         2skgGV/96jpQsloX35Pegb8w8WL+PH1n+TI3k6v7QfnZu8lkJvfvEQo0FcPl2gvMWBwo
         Wq9oon+LpdqMpcgcaVxEMTkkhmQztbaBuRYriZgFvPhRC3ftRhvYjp1beMVxbM9/wsnA
         bhdg==
X-Forwarded-Encrypted: i=1; AHgh+RqWr3LGE0KPMiuXfCMY+bC3TW1OxEhrITvNISGAf20Sy57O//BTVODprCRGn8ErAo1H5YCDtRC7xwVQiItSGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8nXr6FerjyPuvsIsqZCBs53DtwVr2pJ6HaDxTaxUxWOYAnDCe
	HB4TZ1c7WovYxgUqAhv9dvHvHDzDUMkjzvswxyLmPz+Lx9+Efql2cQ/P
X-Gm-Gg: AfdE7cnkHG2ETlrFHP/cv878/elxszLOP3l1ZhPGOQKrnbcud04hJ+IxVejMUarKOZZ
	SzRg71Jy39R0QI/RbS8t6aAM+fqKmW3ZNaZeEYGNbMEihQXAWnKoRHZvgv5yChikBBG/kIuJ0PG
	0MH+1BYrbaXIP4rZwvTi9Twzmm2/cGhcNb9XAp8yg7XsTYzQ2epNVdZYOJ0up3I8ScSC94SLeGM
	o3Wq9aLAVT/Pz5lSWEF1TIg0TZvBg+xLJ4VCKS5yWjlBdQWKnRz9Y7BZ4Ijd7kTtTwRh9Sh/pIr
	rWOKoh04sBgl92rVxjuf0GeKzaTEOyCfO3/YzVL7T8ggt5Mhbr9s13NG/0qahyp0TRm6jQLz7pL
	qEhmgGhpZapx1lc137BjbH8ux0HPEPsjtK8dn3IHX/tgPWvnr6W7CoUfMZFAqEgOvjdrBRDPkOj
	l/i9PrZt8aaDKOWRNZ8DrJ4WC8a1lwnBQNGg1T4wemRoMTNC+Ude6YO6fy+h53
X-Received: by 2002:a05:6a00:ad6:b0:845:c8f9:6ce0 with SMTP id d2e1a72fcca58-84842f2af17mr1578608b3a.21.1783498731120;
        Wed, 08 Jul 2026 01:18:51 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162a49sm2012879a12.15.2026.07.08.01.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:18:50 -0700 (PDT)
Date: Wed, 8 Jul 2026 13:48:35 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, oleg@redhat.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, msuchanek@suse.de, sshegde@linux.ibm.com, mchauras@linux.ibm.com, 
	thuth@redhat.com, segher@kernel.crashing.org, ryan.roberts@arm.com, 
	fujita.tomonori@gmail.com, joelagnelf@nvidia.com, prafulrai522@gmail.com, 
	gregkh@linuxfoundation.org, nsc@kernel.org, japo@linux.ibm.com, lyude@redhat.com, 
	lina+kernel@asahilina.net, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V17 0/8] Rust Support for powerpc
Message-ID: <ak4HwGN_rJ9UN0Rt@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260708081633.1248382-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708081633.1248382-1-mkchauras@gmail.com>

On Wed, Jul 08, 2026 at 01:46:25PM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> Enable experimental rust support for ppc64le and ppc32be. The patch for
> ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been
> merged over it. ppc32 needs some toolchain fixes mentioned in the patch
> `rust: Add PowerPC support` and the discussion for that is done here[1].
> 
> This has been tested on
> - powernv9 hardware
> - pseries P11 hardware
> - pseries(9, 10) qemu
> - powernv(9, 10) qemu
> - rustdoc on x86 and powerpc64le
> - rusttest on x86 and powerpc64le
> 
> We are actively working with our LLVM team to get the target for ppc,
> ppc64 and ppc64le in the rust compiler.
> 
> [1] https://lore.kernel.org/all/20260204030507.8203-1-linkmauve@linkmauve.fr
> [2] https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com
> 
> Changelog:
> V16 -> V17:
> - Rebased to latest v7.2-rc2 
> 
> V15 -> V16:
> - Rebased to latest v7.1-rc4
> V15: https://lore.kernel.org/all/20260426105932.2270364-1-mkchauras@gmail.com/
> 
> V14 -> V15:
> - Fix an issue with rustdoc build on ppc64le
> V14: https://lore.kernel.org/all/20260426085725.2090827-1-mkchauras@gmail.com/
> 
> V13 -> V14:
> - 2nd patch is rewritten (Christian)
> - Fixed a small typo in rust/Makefile (Sashiko)
> - Fixed commit message in Patch 4 (Sashiko)
> V13: https://lore.kernel.org/all/20260424054742.45832-1-mkchauras@gmail.com/
> 
> V12 -> V13:
> - Added a patch for fixing build issue on ppc32 by Link Mauve
> - Added another patch to fix a build issue in dma-buf
> - Added another patch to enforce minimum `rustc` version for powerpc
> V12: https://lore.kernel.org/all/20260421120958.190430-1-mkchauras@gmail.com/
> 
> V11 -> V12:
> - Rebased to mainline (rust/Makefile conflict resolved)
> V11: https://lore.kernel.org/all/20260417152253.2312961-1-mkchauras@gmail.com/
> 
> V10 -> V11:
> - Updated `rust/Makefile`
> - Not all libraries are move to `rust/host` directory now. Only
>   proc_macro2, quote and syn are moved
> - Special handling for pin init is added. Details in commit
> - Removed mkdir for `rust/host`, this is now handled by toolchain.
> V10: https://lore.kernel.org/all/20260406200149.3727922-1-mkchauras@gmail.com/
> 
> V9 -> V10:
> - rust/Makefile updated with review comments from Miguel
> - Patch 1/4 updated with commit message and subject
> V9: https://lore.kernel.org/all/20260404121610.1956528-1-mkchauras@gmail.com/
> 
> V8 -> V9:
> - rust/Makefile updated with a directory instead of abspath
> V8: https://lore.kernel.org/all/20260403145308.1042622-1-mkchauras@gmail.com/
> 
> V7 -> V8:
> - rust/Makefile updated to separate host libraries from target
> V7: https://lore.kernel.org/all/20260329160254.2592207-1-mkchauras@gmail.com/
> 
> Changelog:
> V6 -> V7:
> - Documentation removed as powerpc is still under development
> - Added a fix for race condition in rust/Makefile
> V6: https://lore.kernel.org/all/20260210090023.2587534-1-mkchauras@gmail.com
> 
> V5 -> V6:
> - Added a missing Tested by from Venkat which got missed since V3
> - Support is marked as Maintained instead of experimental
> V5: https://lore.kernel.org/all/20260210053756.2088302-1-mkchauras@gmail.com
> 
> V4 -> V5:
> - Removed a nested ifdef from PPC64 for Little endian toolchain
> V4: https://lore.kernel.org/all/20260209105456.1551677-1-mkchauras@gmail.com
> 
> V3 -> V4:
> - Co-developed-by header added in patch 1
> V3: https://lore.kernel.org/all/20260205180429.3280657-1-mkchauras@gmail.com
> 
> V2 -> V3:
> - Splited HAVE_RUST in 2 lines
> - BINDGEN_TARGET_powerpc initialized before assigning the same to
>   BINDGEN_TARGET
> V2: https://lore.kernel.org/all/20260204210125.613350-1-mkchauras@gmail.com
> 
> V1 -> V2:
> - jump label fix for rust has been moved to a separate patch
> - PPC32 support has been taken
> - rust support has been marked experimental
> - target.json dependency has been removed
> - HAVE_RUST now depends on CPU_LITTLE_ENDIAN for PPC64
> V1: https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com 
> 
> Link Mauve (2):
>   rust: Make __udivdi3() and __umoddi3() panic
>   rust: Add PowerPC support
> 
> Mukesh Kumar Chaurasiya (IBM) (6):
>   powerpc/syscall: Fix syscall skip handling for seccomp and ptrace
>   rust: Fix "multiple candidates for rmeta dependency core" error
>   dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is
>     disabled
>   powerpc/jump_label: adjust inline asm to be consistent
>   rust/powerpc: Set min rustc version for powerpc
>   powerpc: Enable Rust for ppc64le
> 
>  arch/powerpc/Kconfig                   |  2 +
>  arch/powerpc/Makefile                  |  7 ++++
>  arch/powerpc/include/asm/jump_label.h  | 23 ++++++-----
>  arch/powerpc/include/asm/ptrace.h      | 22 +++++++++-
>  arch/powerpc/include/asm/syscall.h     |  6 +++
>  arch/powerpc/include/uapi/asm/ptrace.h |  6 ++-
>  arch/powerpc/kernel/ptrace/ptrace.c    |  2 +
>  arch/powerpc/kernel/syscall.c          | 18 +++++++++
>  rust/Makefile                          | 56 +++++++++++++++++---------
>  rust/compiler_builtins.rs              |  6 +++
>  rust/helpers/helpers.c                 |  2 +
>  scripts/min-tool-version.sh            |  2 +
>  12 files changed, 119 insertions(+), 33 deletions(-)
> 
> -- 
> 2.55.0
> 

Please ignore this.

Regards,
Mukesh
