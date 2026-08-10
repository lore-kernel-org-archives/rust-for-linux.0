Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67B637F330
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 19:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390203; cv=none; b=h5TAljuTg0JqJQfuTB3VgQ5xpYcV9vhkWGyjWfz62YWcMEJKAdF/xGgpxPY2tF50QllgBCbM9J4dN11rBKTmb69t2SGpQO+CRUJceocmsvbSBK7pULFQeKt+C9BtsVHICCwSI1JeLVqNMG0VxZ8CxLtgp7dqL/TH2/Fxum1AvbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390203; c=relaxed/simple;
	bh=qwHMcZhX0XK9+92pxtlJFYdkI7ZtwZ3nCUvb7Za9iio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5olYrLrX9V2GKAydheAVfIyM+5VYm1dOFs7gXAJwBUxB4okA1MTOdiq+l7CQCD35dhDPV9eLLkr5deCFNUxYqHlhRCvCqJDS+Z9EUVIVPhNwzeu9fE5htSvCVDtiHypJOlzEF6vXBJF8B9AdxwSSlJeCB4zx5gwHlkgi/3H9qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gm7cb0hN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gm7cb0hN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786390201; x=1817926201;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qwHMcZhX0XK9+92pxtlJFYdkI7ZtwZ3nCUvb7Za9iio=;
  b=Gm7cb0hNfnXdtSioLLa4uzafU/eOHSFXWAzbpq3s5dp/DquMRtaFMHoq
   tNiX2eP6ERDtk3RYHjqcwPUZpkL0MaGocn97RMGsilQJGP1jB8rzczSv3
   FlLR5qiBOI7ZRay0TEIbYaxn+epvVszFfM2lvc7XJ8ycs5TXhJxxFsS8w
   KE2WkfKdrdE+m5h4a7am3yIUCzZ/nu868G16/Pg/myMXSTRkvvLrZ6tUE
   sXiLz1TWct1lRR/HW1qvkm2ItOBLV6gIYyw25QUy5WefAqTZaNjqkRBu3
   gKWLhImCGeGX+r3XWrUODhMw10ODkEPGJkj30rHkgf9OI/HDzWIb1HKbc
   Q==;
X-CSE-ConnectionGUID: 4KqDRhL7SUuS//tM2Sxjug==
X-CSE-MsgGUID: oCC2jeLXQKOLUZqv1D+ssQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="89440884"
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="89440884"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 12:30:00 -0700
X-CSE-ConnectionGUID: GmAhXK9nTFWGx+9bY0/w5g==
X-CSE-MsgGUID: DrgpNPGOTombrWAQav5T6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,216,1779174000"; 
   d="scan'208";a="301351096"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 10 Aug 2026 12:29:59 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtVh6-000000005Uo-03T1;
	Mon, 10 Aug 2026 19:29:56 +0000
Date: Mon, 10 Aug 2026 21:29:00 +0200
From: kernel test robot <lkp@intel.com>
To: Rafael Passos <rafael@rcpassos.me>, rust-for-linux@vger.kernel.org,
	aliceryhl@google.com, gregkh@linuxfoundation.org, arve@android.com,
	tkjos@android.com, Christian Brauner <brauner@kernel.org>,
	cmllamas@google.com
Cc: oe-kbuild-all@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Rafael Passos <rafael@rcpassos.me>
Subject: Re: [PATCH v2] rust_binder: speed up get_node_debug_info using
 lower_bound iter
Message-ID: <202608102134.Dygd1Kx3-lkp@intel.com>
References: <20260731133253.661634-1-rafael@rcpassos.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731133253.661634-1-rafael@rcpassos.me>

Hi Rafael,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]
[also build test ERROR on staging/staging-next staging/staging-linus linus/master v7.2-rc7 next-20260810]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rafael-Passos/rust_binder-speed-up-get_node_debug_info-using-lower_bound-iter/20260806-233902
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260731133253.661634-1-rafael%40rcpassos.me
patch subject: [PATCH v2] rust_binder: speed up get_node_debug_info using lower_bound iter
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260810/202608102134.Dygd1Kx3-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260810/202608102134.Dygd1Kx3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608102134.Dygd1Kx3-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/android/binder/process.rs:1175:
            {
                let inner = self.inner.lock();
                // cursor_lower_bound retrieves the "key" passed or the next existing larger key
   -            if let Some(cursor) = inner.nodes.cursor_lower_bound(&(ptr+1)){
   +            if let Some(cursor) = inner.nodes.cursor_lower_bound(&(ptr + 1)) {
                    let (_, node) = cursor.current();
                    node.populate_debug_info(&mut out, &inner);
                }
>> Diff in drivers/android/binder/process.rs:1175:
            {
                let inner = self.inner.lock();
                // cursor_lower_bound retrieves the "key" passed or the next existing larger key
   -            if let Some(cursor) = inner.nodes.cursor_lower_bound(&(ptr+1)){
   +            if let Some(cursor) = inner.nodes.cursor_lower_bound(&(ptr + 1)) {
                    let (_, node) = cursor.current();
                    node.populate_debug_info(&mut out, &inner);
                }
   make[2]: *** [Makefile:1998: rustfmt] Error 123
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
