Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC608285CBC
	for <rust-for-linux@vger.kernel.org>; Sun, 21 Dec 2025 10:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766311562; cv=none; b=ZOssrs86WOQkqRGe+FeQfXJXVFxW9uDpFGq7NJ069eJEgM6T6b+BouuC7oQYYgNzlkqL29HYoHam0rhk0Xcpwwivl2dQqqM9k8u2jHmpSBXBChCG/icGjbYG7AH7P/03Hc8U81rfiOqkPxMcJXBcj5GWxQ7PBpr0kuBrMwnrtPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766311562; c=relaxed/simple;
	bh=cV+GHpTGrrwmoaSg/9bIgLvAKQ7H+KiJlZ1VTLWlF/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lcrqLaX6Tfvk4OCLH6dB1lP0kbRUmzeGlUJDD4tk3ac3wuVbiL/1VafmMkI13qyFhcRHBfXaHQO2hu78irm4LcWeujq5F9cxIWNjc1iF0hUkHIC/Hj4p/20wcX18k1YUYQJ/yeufq+6In8w+2kG098j1ujhdIkg86JJYOgT8hf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KADYRJAJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KADYRJAJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766311561; x=1797847561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cV+GHpTGrrwmoaSg/9bIgLvAKQ7H+KiJlZ1VTLWlF/U=;
  b=KADYRJAJzTMFShd7/j5u7y9PY5sBDiolIcXRioH4ir649O30pspoTVPA
   wB/LQk/WV6Y34Rk54k6M5PW88VCfY7dyFPnLuz6Mt1QCHhkkKuSpKYC6F
   RRckM3olkikX0OA2Yql8HsvF+UYot+7o8TAuj4yPrNgKM8WAurECvBoDf
   O1cwI4aB/DETC0oQs5FAp0Vwv0a27T9Xy12N/NXKl4U2dkcd0PJIzXsC5
   2jtRyjC7s+TPmh4j7ti6+ljBIcCFHLrqSHSWBrfcyErdX5y0W8RpIU0wG
   HsStNCCZCeA7rtRIu0bfH3HV6HqZG3krILxQdqAZJyD+xy0Fn8GCQnElI
   Q==;
X-CSE-ConnectionGUID: sRvWaZS6Qma6E4CoZ78SEA==
X-CSE-MsgGUID: /P9B1rKDSl6Ix4jh8Qr3/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78520854"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78520854"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 02:06:00 -0800
X-CSE-ConnectionGUID: nflT/EZyRHC2O+klgEorOg==
X-CSE-MsgGUID: FEZ3aVxdQYmwUT8gB9f+6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199244550"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 21 Dec 2025 02:05:58 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXGK3-0000000050O-26rW;
	Sun, 21 Dec 2025 10:05:55 +0000
Date: Sun, 21 Dec 2025 11:05:32 +0100
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>, Gary Guo <gary@garyguo.net>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	John Hubbard <jhubbard@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 9/9] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
Message-ID: <202512211136.RZfacOxt-lkp@intel.com>
References: <20251218013910.459045-10-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218013910.459045-10-ttabi@nvidia.com>

Hi Timur,

kernel test robot noticed the following build errors:

[auto build test ERROR on ea1013c1539270e372fc99854bc6e4d94eaeff66]

url:    https://github.com/intel-lab-lkp/linux/commits/Timur-Tabi/rust-pci-add-PCI-device-name-method/20251218-121537
base:   ea1013c1539270e372fc99854bc6e4d94eaeff66
patch link:    https://lore.kernel.org/r/20251218013910.459045-10-ttabi%40nvidia.com
patch subject: [PATCH v3 9/9] gpu: nova-core: create GSP-RM logging buffers debugfs entries
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251221/202512211136.RZfacOxt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211136.RZfacOxt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211136.RZfacOxt-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   Diff in drivers/gpu/nova-core/gsp/boot.rs:164:
    
            let this = self.as_mut().project();
    
   -        this.cmdq.send_command(bar, commands::SetSystemInfo::new(pdev))?;
   +        this.cmdq
   +            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
            this.cmdq.send_command(bar, commands::SetRegistry::new())?;
    
            gsp_falcon.reset(bar)?;
   Diff in drivers/gpu/nova-core/gsp/boot.rs:164:
    
            let this = self.as_mut().project();
    
   -        this.cmdq.send_command(bar, commands::SetSystemInfo::new(pdev))?;
   +        this.cmdq
   +            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
            this.cmdq.send_command(bar, commands::SetRegistry::new())?;
    
            gsp_falcon.reset(bar)?;
>> Diff in drivers/gpu/nova-core/gsp.rs:192:
            // Look up nova_core debugfs directory - only create entries if it exists.
            // If nova_core doesn't exist, debugfs_dir will be empty and file creation
            // becomes a no-op (data is still stored, just not exposed via debugfs).
   -        let debugfs_dir = debugfs::Dir::lookup(c_str!("nova_core"), None)
   -            .unwrap_or_else(debugfs::Dir::empty);
   +        let debugfs_dir =
   +            debugfs::Dir::lookup(c_str!("nova_core"), None).unwrap_or_else(debugfs::Dir::empty);
    
            let logs = debugfs_dir.scope(log_buffers, pdev.name(), |logs, dir| {
                dir.read_binary_file(c_str!("loginit"), &logs.loginit);
   Diff in drivers/gpu/nova-core/gsp/boot.rs:164:
    
            let this = self.as_mut().project();
    
   -        this.cmdq.send_command(bar, commands::SetSystemInfo::new(pdev))?;
   +        this.cmdq
   +            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
            this.cmdq.send_command(bar, commands::SetRegistry::new())?;
    
            gsp_falcon.reset(bar)?;
>> Diff in drivers/gpu/nova-core/gsp.rs:192:
            // Look up nova_core debugfs directory - only create entries if it exists.
            // If nova_core doesn't exist, debugfs_dir will be empty and file creation
            // becomes a no-op (data is still stored, just not exposed via debugfs).
   -        let debugfs_dir = debugfs::Dir::lookup(c_str!("nova_core"), None)
   -            .unwrap_or_else(debugfs::Dir::empty);
   +        let debugfs_dir =
   +            debugfs::Dir::lookup(c_str!("nova_core"), None).unwrap_or_else(debugfs::Dir::empty);
    
            let logs = debugfs_dir.scope(log_buffers, pdev.name(), |logs, dir| {
                dir.read_binary_file(c_str!("loginit"), &logs.loginit);
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[2]: *** [Makefile:1871: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
