Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D353B8BAA;
	Thu, 22 Jan 2026 10:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079462; cv=none; b=YQp7v8vKDc8aK5XlZ1srNf+0NAnAuwKwVYGoXdqZzQsgak1DMqBR6pvgdmRPaFZSU8973AgQNVxOYh/lsGaFnctwPKyZ6tWZUTwmUBTFmo0zcFN4BCPNGNBsjWR1DYq5fAy42F5f+Bhs5oyIVFCHiJlT2Y0kiawhenqJeeZT+G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079462; c=relaxed/simple;
	bh=E5pv2JVOr+aY/M5Z9iZiwRHSTATRUurhZ4oTJDBaJMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMN41C3zv5lM6SVKCAVfzBWhCywLRZOceUzA/hoBytnALx0uka90wBxqloKGk9zzs17FevIldn7MJ+yQ6TAOATjDNo4oQ6pxTvorcAoGofkLu4gJL6hvAmWkpXc6kE7P1AC40YRB53Rbd+IJ1R+5c4P7Pt7hdJDb/NH6cdZYVyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NnLo1BwE; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NnLo1BwE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769079459; x=1800615459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E5pv2JVOr+aY/M5Z9iZiwRHSTATRUurhZ4oTJDBaJMc=;
  b=NnLo1BwEnePnZkcnvTV1bk+TCflP+B2yFCG+li60SgQsbozN/Dfosfc8
   a4gTkdSU0PDlU8Ylhdk5sUwR7Bas4I74lPpM5DzaR3GiVQffNa8oWhVMW
   BmGd+MJeWtTlmieHL2+EEvh2Uc5nQbjmm22LdeJUTgj+HkZoulQAeeGoY
   nlwHhCQvThqunBYMniSRIyCEYu5XJhhT4qWZ3AcfNFcTdnPrqmeDPZ6os
   sbUJXMAX81Jqrl002qSeHr5vYbdTZLDn71JpFVaBhjTQUDJPI7FtdUykU
   qVup/0IhajuxA3kDA7L/hXdCjo554DWdp4x0AsfPpUnWUe+ashwAPCpsk
   A==;
X-CSE-ConnectionGUID: RvitSRqcRv+pXAwW150ZCA==
X-CSE-MsgGUID: juQe3hnwSZaBMDMnX820pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="72911246"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="72911246"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 02:57:37 -0800
X-CSE-ConnectionGUID: Pf2GSyhpTueEa+yY8u1tQg==
X-CSE-MsgGUID: Mi31aJmBR0iGv1Mw1MGqYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="206965384"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 22 Jan 2026 02:57:34 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1visNY-000000000UP-1se9;
	Thu, 22 Jan 2026 10:57:32 +0000
Date: Thu, 22 Jan 2026 11:57:21 +0100
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: disallow use of `CStr::as_ptr`
Message-ID: <202601221157.89t3Sqbl-lkp@intel.com>
References: <20260121165835.4097975-1-gary@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121165835.4097975-1-gary@kernel.org>

Hi Gary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rust/rust-next]
[also build test WARNING on next-20260121]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Guo/rust-disallow-use-of-CStr-as_ptr/20260122-014335
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20260121165835.4097975-1-gary%40kernel.org
patch subject: [PATCH] rust: disallow use of `CStr::as_ptr`
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260122/202601221157.89t3Sqbl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221157.89t3Sqbl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221157.89t3Sqbl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: use of a disallowed method `core::ffi::CStr::as_ptr`
   --> rust/kernel/task.rs:422:54
   |
   422 |         unsafe { crate::bindings::__might_sleep(file.as_ptr().cast(), loc.line() as i32) }
   |                                                      ^^^^^^ help: Kernel's `char` is always unsigned. Use `as_char_ptr` instead.: `kernel::prelude::CStrExt::as_char_ptr`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#disallowed_methods
   = note: `-W clippy::disallowed-methods` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::disallowed_methods)]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
