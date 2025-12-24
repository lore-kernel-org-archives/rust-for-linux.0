Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE213A55
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 20:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766609944; cv=none; b=T7V2ulWR7RuluevNUaRGQ+XhdXMf5KY7V6PpYaRgVP5bnBtY+M8BeYWedIyhr/fCNRIGMEPTc/d0/QT0K+6Aq57LtX5/TCTFdGr2oH12srIne47TUtSaLo+HQ9GBl3vfwd4lCI+4Us/2EBIi3BikP3xxZ5Wfc8s6dYuMiJLDd14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766609944; c=relaxed/simple;
	bh=I+aYQvpk/IQ3Z2qc6j/++GXIx14TlmKjZimxO+89TP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjgIDUGSbTSDo3f+M8+Va8BvrBVhJwyd65kC5TVUQiIE3x14us4vD0Ah0dpQmQjJvgPUxwXm5ls2PppiWcrToUACrOsyKwWTe9UMjCzgk2ovSDRJTV7DU12Y+fgL5njPgHZE3M0OrrAKPqpyviQfZCyztpfb858PMoPO/CKS4lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avfM+XUo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avfM+XUo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766609943; x=1798145943;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I+aYQvpk/IQ3Z2qc6j/++GXIx14TlmKjZimxO+89TP4=;
  b=avfM+XUoEgIvKg8e9B8HxAK2kvqUXCTHGLlSBozZ6fXvfxNqLWRekaEs
   whUBkTmbKZ5SxG0wxmDkMNZq1UTFXa3wYlAcOxuZjhlypSlHatTQp1rpU
   u6O45hwCCPh8sKLSQMjqw4AakhG2tB9eoay4fRS9HGJ2NfiGGTpbvaN/A
   DKBHPXut8aEqiW83aANKuOyF+nxZ7wlP275GuyWxnKjb4LEOX5w6keFBx
   nXsDNnzJae1X3yMbcYvyZQJvJ9prpSDgQMtmmXVpIGpVp6yBx7LerQat2
   CDrCRobJ2jzBkEsW0jPSkUBBKgPz32ARVq8jl3yok+Igkk+OgBLQ6eH1n
   A==;
X-CSE-ConnectionGUID: S7+P6JnWSL2Vadgr7NSdMQ==
X-CSE-MsgGUID: NzFAMA1qT5OZDEM2/fpYcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="91095213"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="91095213"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 12:59:03 -0800
X-CSE-ConnectionGUID: LN1m8mLsTeS1a+hrB2lUkQ==
X-CSE-MsgGUID: HWb7SWV2TfaY/OJ4xKUFqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="199997472"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 24 Dec 2025 12:58:58 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYVwe-000000006L2-3j9m;
	Wed, 24 Dec 2025 20:58:56 +0000
Date: Wed, 24 Dec 2025 21:58:34 +0100
From: kernel test robot <lkp@intel.com>
To: Ke Sun <sunke@kylinos.cn>, Miguel Ojeda <ojeda@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: Re: [PATCH v3 3/4] rust: fmt: Default raw pointer formatting to
 HashedPtr
Message-ID: <202512242153.r68Pb25u-lkp@intel.com>
References: <20251224081315.729684-4-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224081315.729684-4-sunke@kylinos.cn>

Hi Ke,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9448598b22c50c8a5bb77a9103e2d49f134c9578]

url:    https://github.com/intel-lab-lkp/linux/commits/Ke-Sun/lib-vsprintf-Export-ptr_to_hashval-for-Rust-use/20251224-161946
base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
patch link:    https://lore.kernel.org/r/20251224081315.729684-4-sunke%40kylinos.cn
patch subject: [PATCH v3 3/4] rust: fmt: Default raw pointer formatting to HashedPtr
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251224/202512242153.r68Pb25u-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512242153.r68Pb25u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512242153.r68Pb25u-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/fmt.rs:30:
    use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
    impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
    
   -use crate::ptr::{HashedPtr, RestrictedPtr, RawPtr};
   +use crate::ptr::{HashedPtr, RawPtr, RestrictedPtr};
    // Special handling for Pointer: default to HashedPtr for raw pointers.
    // This overrides the default Pointer implementation for raw pointers to use hashing,
    // which is the safe default behavior for kernel pointers.
>> Diff in rust/kernel/fmt.rs:30:
    use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
    impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
    
   -use crate::ptr::{HashedPtr, RestrictedPtr, RawPtr};
   +use crate::ptr::{HashedPtr, RawPtr, RestrictedPtr};
    // Special handling for Pointer: default to HashedPtr for raw pointers.
    // This overrides the default Pointer implementation for raw pointers to use hashing,
    // which is the safe default behavior for kernel pointers.
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
