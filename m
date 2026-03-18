Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5B23E714F;
	Wed, 18 Mar 2026 16:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773850344; cv=none; b=EnPfGtV2KGMmRJWzBleSrOy/2dFHkTGP9bWpMkTVtP66bIa/F1AbnZV18/JzxltwaIvHtEvvHfuVnQIJgCcEY08FZlO/MaENutcuMSB3KfA7Qsm2SBr3s7OSUKuSYWATGNoJPPyYWaOE1hTFOyrPLYevnFknbOnnpdcFWfRVat4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773850344; c=relaxed/simple;
	bh=7ct3WBOq4xnUKscBP5Qh5mWsek+6xk0BrHITChI6ImQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRYX6kbjmVtXswToc2MFJyyDT94vmLyzLziHQKIlarSwJRotDjIv8wCk+wfrG397nLfWND/KayNBeoxZpjrpC6cBfOuWsraYGwFH7oOGQJXAMhw9AOOGJJLWXAFSSTyjOHplcRHdXICLbHBEH20ajo1e0jcyjN6ENprYKwtY4Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aO6d0avU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aO6d0avU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773850337; x=1805386337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7ct3WBOq4xnUKscBP5Qh5mWsek+6xk0BrHITChI6ImQ=;
  b=aO6d0avUMMWFLqmltE2nQswPe+YZkaaYDoGy4GGeKxpXydBkuYASZQ53
   p/drL81UyAZbwlLeq16CQEYU40WzLMv6GkDylsCErMWOKDVvYwEXgB9ww
   8vwYarKzKangx9F+V+J22FayDcQNZ3+SybeY8iRjCuIwi7nWG+0Y2THS+
   Tp5PGvEYyYiRtJa24Xn4lwI/v8PXz9mYuYdroqAyqYqXOwmT55jSPzPz8
   //BeYSAa0w0AN5O5isMOIe/LbmPmdGuFtgmeEzezazC7hEsEmNBn+sTga
   4ZF1vDcFfigCXUFmQErGtL0NUoLeNF7A6/aAy9GgMkJcGQPgCZwOLI56o
   Q==;
X-CSE-ConnectionGUID: 9mppD6svQnyQmvbrWG8Mlg==
X-CSE-MsgGUID: aHn2YSfTSwandgg691Xr6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85988566"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="85988566"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 09:12:16 -0700
X-CSE-ConnectionGUID: qQpeMVRESyi3UlXFmREIaQ==
X-CSE-MsgGUID: roXu6wa+RDGYJJ9S5o/Gkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="222640916"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 18 Mar 2026 09:12:11 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2tVA-000000004gT-39Ya;
	Wed, 18 Mar 2026 16:12:08 +0000
Date: Wed, 18 Mar 2026 17:12:08 +0100
From: kernel test robot <lkp@intel.com>
To: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <helgaas@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v7 27/31] gpu: nova-core: Hopper/Blackwell: larger WPR2
 (GSP) heap
Message-ID: <202603181742.8HLcTchk-lkp@intel.com>
References: <20260317225355.549853-28-jhubbard@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317225355.549853-28-jhubbard@nvidia.com>

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on d19ab42867ae7c68be84ed957d95712b7934773f]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Hubbard/gpu-nova-core-Hopper-Blackwell-basic-GPU-identification/20260318-203344
base:   d19ab42867ae7c68be84ed957d95712b7934773f
patch link:    https://lore.kernel.org/r/20260317225355.549853-28-jhubbard%40nvidia.com
patch subject: [PATCH v7 27/31] gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260318/202603181742.8HLcTchk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181742.8HLcTchk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181742.8HLcTchk-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/gsp/fw.rs:139:
        fn base_rm_size(chipset: Chipset) -> u64 {
            use crate::gpu::Architecture;
            match chipset.arch() {
   -            Architecture::Hopper | Architecture::Blackwell => {
   -                GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100
   -            }
   +            Architecture::Hopper | Architecture::Blackwell => GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100,
                _ => u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X),
            }
        }
>> Diff in drivers/gpu/nova-core/gsp/fw.rs:139:
        fn base_rm_size(chipset: Chipset) -> u64 {
            use crate::gpu::Architecture;
            match chipset.arch() {
   -            Architecture::Hopper | Architecture::Blackwell => {
   -                GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100
   -            }
   +            Architecture::Hopper | Architecture::Blackwell => GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100,
                _ => u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X),
            }
        }
>> Diff in drivers/gpu/nova-core/gsp/fw.rs:139:
        fn base_rm_size(chipset: Chipset) -> u64 {
            use crate::gpu::Architecture;
            match chipset.arch() {
   -            Architecture::Hopper | Architecture::Blackwell => {
   -                GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100
   -            }
   +            Architecture::Hopper | Architecture::Blackwell => GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100,
                _ => u64::from(bindings::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X),
            }
        }
   make[2]: *** [Makefile:1916: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
