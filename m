Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7D6286D5C
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 02:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770170823; cv=none; b=NUAOzvs232Vlv9Ehx8zRHrE4r6zV69dLwxllR4L+XlBqaiFwgYOY6TG486oKH/MdQKuXE+LZnoF/C/hvQTvacmU2vzEQbhgMXAmOuBQGu/GD3GxtXTX2UCPsw2RiO+szhuE0BYN4aTAGBaCMeqQYnWSEvBBJhN05CpEAqKEsfhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770170823; c=relaxed/simple;
	bh=OmadtR8LX8+TtK7CAHoBlD5U8CMSVir0JGVYr3z2zKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=diLy8dybqujFNYl368uHj0xY1RVttgaUegCXRW2hzsuApqJ7h+eAaVKV8EZxB8Kt/mCkBpM+pObxaYYomkCJor2WliAd2emGcMqs3mf2BBNfLZeSS2OYn91BfFxDd+QNxjcK/LD0osZEmbWf9JkGw0FZbJp73G9ICMMQgzDSQ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AY+3hqDh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AY+3hqDh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770170821; x=1801706821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OmadtR8LX8+TtK7CAHoBlD5U8CMSVir0JGVYr3z2zKU=;
  b=AY+3hqDhtZZMZ4Oxr1NlKt3ktdQUQGbFxsqucO8T7FY46vbU6HHPaaaO
   8++jnaQhaXABvoyrh6por6eCvo0gEUso8pinNtIpUQUNkaviaz9Tfaplz
   TH71O4Xv2Qp6874Yh8ogkn6vv8PFzOm8Ksc3HxA82pt3JCUpgwhQq9e9a
   Tg7KNTOGyEjsEIQJ7OgWXwdHHYtSUD++qD8z5RVvcNj5cDOtSuBdMjEKF
   eyN/I1qywPpxG4ZzK7hFJ36CugcmYYCwa9fn9dVw+XVkxVzmHk9O7N5cw
   v9pkuMs+EPGqZjdEXNcWJc/DnOLamCg8b5LtBihAq2DM7qM/PIZMLo6JU
   g==;
X-CSE-ConnectionGUID: CBDxf2MKSKmhUsIiSkvjgw==
X-CSE-MsgGUID: zNvNhUE1S0mfsjbst76JTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82465249"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="82465249"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 18:07:00 -0800
X-CSE-ConnectionGUID: k2IXUSdOQUGl1mM2blfv+g==
X-CSE-MsgGUID: 94/gl3siSvqat+fDqmgjvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="214181742"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 03 Feb 2026 18:06:57 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnSIA-000000003Xh-09Br;
	Wed, 04 Feb 2026 02:06:54 +0000
Date: Wed, 4 Feb 2026 03:06:23 +0100
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, mmaurer@google.com,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 2/7] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
Message-ID: <202602040350.sw6i2Sp2-lkp@intel.com>
References: <20260203224757.871729-3-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203224757.871729-3-ttabi@nvidia.com>

Hi Timur,

kernel test robot noticed the following build errors:

[auto build test ERROR on cea7b66a80412e2a5b74627b89ae25f1d0110a4b]

url:    https://github.com/intel-lab-lkp/linux/commits/Timur-Tabi/rust-device-add-device-name-method/20260204-065057
base:   cea7b66a80412e2a5b74627b89ae25f1d0110a4b
patch link:    https://lore.kernel.org/r/20260203224757.871729-3-ttabi%40nvidia.com
patch subject: [PATCH v7 2/7] rust: uaccess: add write_dma() for copying from DMA buffers to userspace
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260204/202602040350.sw6i2Sp2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040350.sw6i2Sp2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040350.sw6i2Sp2-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/uaccess.rs:471:
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
>> Diff in rust/kernel/uaccess.rs:471:
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
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[2]: *** [Makefile:1871: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
