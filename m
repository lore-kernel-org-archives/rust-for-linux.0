Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2771A23EAA4;
	Sun,  5 Apr 2026 09:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775382733; cv=none; b=D/tLnyxyRXFJxEJDZoWdO40yqwOo3ImveLlc/29zbA7Lv8Eoiziwe07cmzCYkatHsSmoLZ3n+eDLHOE9vo+XaD4C54fa5O5xelEmGLk54KhZKE9SLsOfYVXBXEqxiSkGq+DUK4TvZmA8IC1jgBDHm74vhjPyDeypaRzWlj6EBcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775382733; c=relaxed/simple;
	bh=xheOJZ2Y0lkt23J9cH+x8+rDQMGMq3kINBbaB7EJ4FE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJeR00unxxPKLVMea9hnICy+pxuUZiAwihxPVg/Q7859Sa6L1U4IBAVNOtcwC2Sbn2b3DeOrsZiCpPXK5+6aW02HRNBapmoRKX/2uy6MVtFtoKVJQlkNvRzl1n5K+lqRD9K9G9SSPqj/k1l8YqcnjPQdSV96qbHPExHvDyp74vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DtnoQVjZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DtnoQVjZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775382730; x=1806918730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xheOJZ2Y0lkt23J9cH+x8+rDQMGMq3kINBbaB7EJ4FE=;
  b=DtnoQVjZFKKOQc+j0zMMVmIXEiJdaJehlY0yWVzrb54l9iySeMMOb2Bx
   docTAHCoBjLIEKEaOiG5jByHGDHTcQhygl8LKz0585gGnvzXa3C8Kf02h
   6sSoGMj2JrWmUYgXyw2zGqRuyoKhe85ELRTEdG3KVb+5cyio3+tPIPY/z
   +qjW0OBuA1MhS8K+KSgxUDf3eTcePOwEp7nYoOHdM3mPcIahYIqGZ5mzM
   7EOenQd4OWzvTY9LCbWC8db3GpIkGfRKLNWCtolJuoFW5dGIdLlCvgzhP
   IwNLvGn1frcwIDW/jqbv08fB2+YURwS2+ZYLXl1U3DRz9UGIzUODVlxN0
   A==;
X-CSE-ConnectionGUID: Tu0I90FZT3eLg1hMfZ+Blw==
X-CSE-MsgGUID: GK1xErqdR5CFezv0rh+3dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="76491173"
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="76491173"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2026 02:52:10 -0700
X-CSE-ConnectionGUID: t7nrAmNPRwSUjyjneNbuIg==
X-CSE-MsgGUID: 2u9ONBGdSY69Vacb+A1lGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,161,1770624000"; 
   d="scan'208";a="223319131"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 05 Apr 2026 02:52:06 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9K9D-000000009nB-3A2x;
	Sun, 05 Apr 2026 09:52:03 +0000
Date: Sun, 5 Apr 2026 11:51:34 +0200
From: kernel test robot <lkp@intel.com>
To: Aditya Rajan <adi.dev.github@gmail.com>, dakr@kernel.org,
	ojeda@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com, robin.murphy@arm.com,
	a.hindborg@kernel.org, boqun@kernel.org, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Aditya Rajan <adi.dev.github@gmail.com>
Subject: Re: [PATCH] rust: dma: return EOVERFLOW instead of ENOMEM on size
 overflow
Message-ID: <202604051110.OC0tBUnh-lkp@intel.com>
References: <20260403212822.294288-1-adi.dev.github@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403212822.294288-1-adi.dev.github@gmail.com>

Hi Aditya,

kernel test robot noticed the following build errors:

[auto build test ERROR on linux-next/master]
[cannot apply to linus/master v7.0-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aditya-Rajan/rust-dma-return-EOVERFLOW-instead-of-ENOMEM-on-size-overflow/20260405-094049
base:   linux-next/master
patch link:    https://lore.kernel.org/r/20260403212822.294288-1-adi.dev.github%40gmail.com
patch subject: [PATCH] rust: dma: return EOVERFLOW instead of ENOMEM on size overflow
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260405/202604051110.OC0tBUnh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051110.OC0tBUnh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604051110.OC0tBUnh-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/dma.rs:832:
                Err(EINVAL)?;
            }
    
   -        let size = core::mem::size_of::<T>().checked_mul(len).ok_or(EOVERFLOW)?;
   +        let size = core::mem::size_of::<T>()
   +            .checked_mul(len)
   +            .ok_or(EOVERFLOW)?;
            let mut dma_handle = 0;
            // SAFETY: Device pointer is guaranteed as valid by the type invariant on `Device`.
            let addr = unsafe {
>> Diff in rust/kernel/dma.rs:832:
                Err(EINVAL)?;
            }
    
   -        let size = core::mem::size_of::<T>().checked_mul(len).ok_or(EOVERFLOW)?;
   +        let size = core::mem::size_of::<T>()
   +            .checked_mul(len)
   +            .ok_or(EOVERFLOW)?;
            let mut dma_handle = 0;
            // SAFETY: Device pointer is guaranteed as valid by the type invariant on `Device`.
            let addr = unsafe {
   make[2]: *** [Makefile:1932: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
