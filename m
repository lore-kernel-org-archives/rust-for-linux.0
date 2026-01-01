Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380F1234984;
	Thu,  1 Jan 2026 08:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767256985; cv=none; b=YJMSDn0tGYkkBBojCotle0uPkMakFi3eiVA1YxFkpsbI4zbEhtC3eUNz3WBajVOV3iPh/6TX0Y43Q+qqnJb9vbzErofkP/qyMv7d3+1wA5T3JZtDF46/i4bCFSVAmWA5tHz1F+qoL7EUz5C9ei5sHJ4FtjSEp73YPmHn0ijtCCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767256985; c=relaxed/simple;
	bh=ieUt7pqL3M0cxqtfDP5HcO19kjSX1X005ga5kEuTXB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAkVJkIZzLqg0jGjuR78kMdm295CLGvf2fMr7NqbD0BNrhWidTOPNgkli9zQIOhY9frY/ov7NMEM7mXdTCj6G4Xhukfhxb+jyBBt1zhIl+G5K1YTFgP8C7CO9Q4r0UYzRGlzU0tuIqvInQpbOTypoOXbrnHjZEqSAL2N2m7amSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kjy+qP51; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kjy+qP51"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767256983; x=1798792983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ieUt7pqL3M0cxqtfDP5HcO19kjSX1X005ga5kEuTXB0=;
  b=kjy+qP51g6/Bv6r9QLVY0zM52JpJftiDmttTPK5GXDToYpCwhKagOwWF
   jdQfhzwRUTHYeMy/T1P9gE8g8y6v7wQ3EXTet73q263c44YvsCukvp1lt
   /U6xo6bPHyzdHOKd/u20xxvrXTe2YT+PNSQ4RCVT12QU+bko6wA76gGdb
   LNjtbopuaC6UECztSUHF/uHCGFcT+l0QtKFI0Aq/mqczmV+w3qgd/UpK6
   zfOIfxA1ro1RkcWY4bA2sFcdJ4iYdCFXPtdcWg6ivEu0rqPPmYZBThjvF
   dIXUx5Bwkfr7G9DiYN2t5YTFJ8cB8XB9shHSISJFn4SzQQBkcIpvWxcYV
   A==;
X-CSE-ConnectionGUID: lU0/85YlT2CfzDE9/eLr2w==
X-CSE-MsgGUID: O7tTomKGTe6521wyCzyXEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="71375259"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="71375259"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2026 00:43:02 -0800
X-CSE-ConnectionGUID: 09Yz4ukfTiKIlzHoSM7nJw==
X-CSE-MsgGUID: d3GmED39QPCdGUb8PwZ7gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="206118660"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 01 Jan 2026 00:42:58 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbEGk-000000000Ej-3qSn;
	Thu, 01 Jan 2026 08:42:54 +0000
Date: Thu, 1 Jan 2026 09:42:32 +0100
From: kernel test robot <lkp@intel.com>
To: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Alexandre Courbot <acourbot@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	Edwin Peer <epeer@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <helgaas@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: bitfield: use &mut self setters instead
 of builder pattern
Message-ID: <202601010949.aupX8V1f-lkp@intel.com>
References: <20251231214727.448776-1-jhubbard@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231214727.448776-1-jhubbard@nvidia.com>

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7acc70476f14661149774ab88d3fe23d83ba4249]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Hubbard/gpu-nova-core-bitfield-use-mut-self-setters-instead-of-builder-pattern/20260101-054823
base:   7acc70476f14661149774ab88d3fe23d83ba4249
patch link:    https://lore.kernel.org/r/20251231214727.448776-1-jhubbard%40nvidia.com
patch subject: [PATCH] gpu: nova-core: bitfield: use &mut self setters instead of builder pattern
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260101/202601010949.aupX8V1f-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601010949.aupX8V1f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601010949.aupX8V1f-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/gpu/nova-core/falcon.rs:413:
                Delta::from_micros(150),
            );
    
   -        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| { v.set_reset(true); });
   +        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| {
   +            v.set_reset(true);
   +        });
    
            // TIMEOUT: falcon engine should not take more than 10us to reset.
            fsleep(Delta::from_micros(10));
   Diff in drivers/gpu/nova-core/falcon.rs:420:
    
   -        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| { v.set_reset(false); });
   +        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| {
   +            v.set_reset(false);
   +        });
    
            self.reset_wait_mem_scrubbing(bar)?;
    
>> Diff in drivers/gpu/nova-core/falcon.rs:413:
                Delta::from_micros(150),
            );
    
   -        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| { v.set_reset(true); });
   +        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| {
   +            v.set_reset(true);
   +        });
    
            // TIMEOUT: falcon engine should not take more than 10us to reset.
            fsleep(Delta::from_micros(10));
   Diff in drivers/gpu/nova-core/falcon.rs:420:
    
   -        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| { v.set_reset(false); });
   +        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| {
   +            v.set_reset(false);
   +        });
    
            self.reset_wait_mem_scrubbing(bar)?;
    
   make[2]: *** [Makefile:1871: rustfmt] Error 123
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
