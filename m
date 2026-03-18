Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07D9263C8C;
	Wed, 18 Mar 2026 17:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773853400; cv=none; b=QyNWxZdYxOXVf7rbDsyxZleiPIyY2P/gGxQn0ZTp0paobH/kUZCjmFrXLaRQtGi+JWQWaOL7jetrQNkIq47Z0EPvzTpMmL8/jEaVKlZyAIeBt4j81AHGtoFwqc/nEE9KwDuR9YX1gNyP6JMuoCAm8mtCqwQeUjPQVTRNhOaMUP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773853400; c=relaxed/simple;
	bh=h6va8XtKBzQL2vlEY5YzNSa8SITPL3KWgeo2RIbgQOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMtqwjg74o6UZ25hJ6xyV+Ru1DutKaejpGrebN+/yAXjnEvj28dPitUE2qMYj6IFYiwlI2udBX8E02+z+1zF07gGHjtVJEZtC1kgdaBFLCtVyJQItRr2xsDIiCqOkik7yRXSg6ihXxjYgJqu+b/2MFpmxTnhqkog4+5nBS+yRkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jnfe1RCk; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jnfe1RCk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773853398; x=1805389398;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h6va8XtKBzQL2vlEY5YzNSa8SITPL3KWgeo2RIbgQOs=;
  b=jnfe1RCk5h8xPjvlGONZGTcLHLiVYb6eVa7ZBz8Vr5PG7gGnQ3AevlYn
   7EeW725qPQxo7jg0T7SjJZuayADT9RJWITmecCmOoRVYGxyqJvmmRJPx2
   aZ+Ula2NaaRRQughLqcVqhIu0piJZbedCelyfKNyyaHGAmoSyMMDIKN63
   Xby4nNBRnV+1Ow+i6Vw121g+GH6qecLqcoDJlSVqoLXNMbJi2kp74iQ0Y
   gkaRRsfO/UbjPNI2lDfJsiNcCLumFMW9j+DD6qDXQlaqv/ZrORi4wclkB
   Ecz52+Uzs0AYhN7GIO02Ok3eW6Gi2/o4J5Hw8xJJ6Tt1yr1A4ekFA7oTI
   w==;
X-CSE-ConnectionGUID: 3kmEr535TvesXEBFKYGmGA==
X-CSE-MsgGUID: on45otcqTxuAwxGqRgrl8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75097142"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="75097142"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 10:03:17 -0700
X-CSE-ConnectionGUID: 2XOcOvgsRp6ma5fnm7N1Lw==
X-CSE-MsgGUID: rWKEjp2wTn6WROM7Mk/epQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="227384169"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 18 Mar 2026 10:03:11 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2uIX-000000004h3-1NH9;
	Wed, 18 Mar 2026 17:03:09 +0000
Date: Wed, 18 Mar 2026 18:02:54 +0100
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
Subject: Re: [PATCH v7 31/31] gpu: nova-core: Hopper/Blackwell: integrate FSP
 boot path into boot()
Message-ID: <202603181705.C57qvOSk-lkp@intel.com>
References: <20260317225355.549853-32-jhubbard@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317225355.549853-32-jhubbard@nvidia.com>

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on d19ab42867ae7c68be84ed957d95712b7934773f]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Hubbard/gpu-nova-core-Hopper-Blackwell-basic-GPU-identification/20260318-203344
base:   d19ab42867ae7c68be84ed957d95712b7934773f
patch link:    https://lore.kernel.org/r/20260317225355.549853-32-jhubbard%40nvidia.com
patch subject: [PATCH v7 31/31] gpu: nova-core: Hopper/Blackwell: integrate FSP boot path into boot()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260318/202603181705.C57qvOSk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181705.C57qvOSk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181705.C57qvOSk-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/gsp/boot.rs:359:
                    &wpr_meta,
                )?;
            } else {
   -            Self::boot_via_fsp(
   -                dev,
   -                bar,
   -                chipset,
   -                gsp_falcon,
   -                &wpr_meta,
   -                &self.libos,
   -            )?;
   +            Self::boot_via_fsp(dev, bar, chipset, gsp_falcon, &wpr_meta, &self.libos)?;
            }
    
            // Common post-boot initialization
   Diff in drivers/gpu/nova-core/gsp/fw.rs:139:
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
>> Diff in drivers/gpu/nova-core/gsp/boot.rs:359:
                    &wpr_meta,
                )?;
            } else {
   -            Self::boot_via_fsp(
   -                dev,
   -                bar,
   -                chipset,
   -                gsp_falcon,
   -                &wpr_meta,
   -                &self.libos,
   -            )?;
   +            Self::boot_via_fsp(dev, bar, chipset, gsp_falcon, &wpr_meta, &self.libos)?;
            }
    
            // Common post-boot initialization
   Diff in drivers/gpu/nova-core/gsp/fw.rs:139:
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
>> Diff in drivers/gpu/nova-core/gsp/boot.rs:359:
                    &wpr_meta,
                )?;
            } else {
   -            Self::boot_via_fsp(
   -                dev,
   -                bar,
   -                chipset,
   -                gsp_falcon,
   -                &wpr_meta,
   -                &self.libos,
   -            )?;
   +            Self::boot_via_fsp(dev, bar, chipset, gsp_falcon, &wpr_meta, &self.libos)?;
            }
    
            // Common post-boot initialization
   Diff in drivers/gpu/nova-core/gsp/fw.rs:139:
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
