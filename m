Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF6918871F
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 05:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773208137; cv=none; b=RdtiGhfE2IX8v3Qb7seX4CjdWwNkYxH/kbRngtncaPTOFj9xUW54hbTk0Th2wyEwXMu00MxZHx/l7v+j53bAGM3gGHCM1OqZHA88OH/XL2NbZ1e9aSIfpIBfGJVh4Z/J0xHp96nbea5l5iVAJJFiHU+TWd8+8K7k9CDIYTTIVV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773208137; c=relaxed/simple;
	bh=n9kI5ag5IOmp1ujdK0LROBmTbPkDFRZ0u8T9y7QYHsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jV5xCloSantOuMz0DBhyv35yr1YUxCwgIEJGGmwR7QnLoBjhrQ7736ILJgIiWJxuYJ3S3QpojHDXxIV+fT3Zz4hcu+lqPKZziNQJV40pWmV7NYVpAHQCJ2yMdT+NjB/BtfOSFZrRRV7uAR+QiB8rrin2mBPuALF4FI5d5qYvskk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WG5ZrNsX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WG5ZrNsX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773208135; x=1804744135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n9kI5ag5IOmp1ujdK0LROBmTbPkDFRZ0u8T9y7QYHsQ=;
  b=WG5ZrNsXZOJZLYlKkhBJ+7dkpd1Ho2h1houxueK0i/rIF4ifPGOvRmVr
   ipYJeV8W9NLrflGZWsO0xQa2MAu1jOj3rOyU+7jlBHn6Ofq56ZWGwGYzU
   ZhqmH1kk/VhlADQLImKiHk4nhtbGbhW9ww/R4NjqrLPpsa+szbTpqI88m
   rLIQRLibv53iVEcuM6gcKGqCutZetPZmcwwflLemLd266OmadzuPmNPVu
   leJz4mI7XnK229pKau/SlWQq1TuJA+EdTn4uBjv4nP7UNGjZLTJ4NS2jB
   +9shoEFQhgankiO8c1rveHAU5Vmp0Qa/RgDDC831NsTfv/F9lEYZ07ktM
   Q==;
X-CSE-ConnectionGUID: UtsHrO9IRTym6vY/vvMsDg==
X-CSE-MsgGUID: UxGt0MdRT2GJAiDFbdVo8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="84974225"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="84974225"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 22:48:54 -0700
X-CSE-ConnectionGUID: SEuEcAvnQhK4pn9hS8vh0Q==
X-CSE-MsgGUID: cVxmsNidT0q7qt8tOhRmWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="250857250"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 10 Mar 2026 22:48:51 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0CR6-000000003Gr-3iOm;
	Wed, 11 Mar 2026 05:48:48 +0000
Date: Wed, 11 Mar 2026 06:48:34 +0100
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, mmaurer@google.com,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
Message-ID: <202603110649.PeH4YNQx-lkp@intel.com>
References: <20260310220000.1897166-3-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310220000.1897166-3-ttabi@nvidia.com>

Hi Timur,

kernel test robot noticed the following build errors:

[auto build test ERROR on a544873ce0575b2fd8285a1364d3e09929d9a3ba]

url:    https://github.com/intel-lab-lkp/linux/commits/Timur-Tabi/rust-device-add-device-name-method/20260311-060450
base:   a544873ce0575b2fd8285a1364d3e09929d9a3ba
patch link:    https://lore.kernel.org/r/20260310220000.1897166-3-ttabi%40nvidia.com
patch subject: [PATCH v8 2/7] rust: uaccess: add write_dma() for copying from DMA buffers to userspace
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260311/202603110649.PeH4YNQx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603110649.PeH4YNQx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603110649.PeH4YNQx-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/uaccess.rs:476:
            // - `ptr` is valid for reading `len` bytes as required by this function's safety contract.
            // - `copy_to_user` validates the userspace address at runtime and returns non-zero on
            //   failure (e.g., bad address or unmapped memory).
   -        let res = unsafe {
   -            bindings::copy_to_user(self.ptr.as_mut_ptr(), ptr.cast::<c_void>(), len)
   -        };
   +        let res =
   +            unsafe { bindings::copy_to_user(self.ptr.as_mut_ptr(), ptr.cast::<c_void>(), len) };
            if res != 0 {
                return Err(EFAULT);
            }
>> Diff in rust/kernel/uaccess.rs:476:
            // - `ptr` is valid for reading `len` bytes as required by this function's safety contract.
            // - `copy_to_user` validates the userspace address at runtime and returns non-zero on
            //   failure (e.g., bad address or unmapped memory).
   -        let res = unsafe {
   -            bindings::copy_to_user(self.ptr.as_mut_ptr(), ptr.cast::<c_void>(), len)
   -        };
   +        let res =
   +            unsafe { bindings::copy_to_user(self.ptr.as_mut_ptr(), ptr.cast::<c_void>(), len) };
            if res != 0 {
                return Err(EFAULT);
            }
   make[2]: *** [Makefile:1912: rustfmt] Error 123
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
