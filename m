Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C9E1D5147
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 15:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770911740; cv=none; b=bw/IuJECsHaRKfocQCpUlDcj6mST9WuvvaCGP5oSjE1kKjCnJG4nV5m4WREOGkLz5CrzJPPMzkEL9uY1gOKBqnbQGwqYg7h3FSsJluxHzSfx0hffVhRBG2hc+mTfPj2ng7j+dJk8Bv3spX0NLSarmj2052RJt2Z5HA5JzpSI1og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770911740; c=relaxed/simple;
	bh=oKpS8Zq97T6bID5LMkxur/x114LFgGk9i8kvBicFK/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mE4EeKunK+t6XpHOky3KEkb4u5avbzQ2TbSXt7KJqVCnKJHo0t8Pe9cMuCD5Ov2VoLgSa3tIBg8soTZgCwdrY2+h1HXqu1qyoUH7NPYIGbQ3gAKWPJTRKSftYcO1J5DuQO6mHucc4OEiOqQ+9kINNXHV8GDcYka84ZCrgFBxYwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSsrRr2N; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSsrRr2N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770911739; x=1802447739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oKpS8Zq97T6bID5LMkxur/x114LFgGk9i8kvBicFK/c=;
  b=CSsrRr2NCvyGYYcuMc/GvxnP0cJSt+LxyWAe1/6lvBZS2VV8n4AMgTEa
   JBhT7FDUyhqM/laDJv1iD98A1/hauyGJpL5bTQadX78D+4vEJjDHIhOnN
   Zdixk3tKQUKV/FIY+pktBdeE4Q1fcANM+oBJcQeMTHmHH6LqknRE3qLw+
   7gtMMIei0SoIzFJUq22hyb3tJh2G+aEbTFCl31PljMEkWymU/Zfm5k6h9
   8CrV59r64+NuiOI2VXm5ug733cHxG+3mmwKqTwwI70yCliJBwAZ0quLNX
   OcE2EjiVflYsl95K0C0EabxH+ss1VEomvAr95hNa5Et3GtGi72wSvlVQG
   g==;
X-CSE-ConnectionGUID: YYXSmw7LQDSwXtSUru3EDQ==
X-CSE-MsgGUID: pmWCa+N4R5mX6rJ417dljQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="75928770"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="75928770"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 07:55:38 -0800
X-CSE-ConnectionGUID: RKr3bZBhRO6WZpGF73jQeg==
X-CSE-MsgGUID: tG4A6mkbQ/qJGllX8KbB3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="250311912"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 12 Feb 2026 07:55:37 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqZ2V-000000001Lh-1K3h;
	Thu, 12 Feb 2026 15:55:35 +0000
Date: Thu, 12 Feb 2026 16:54:48 +0100
From: kernel test robot <lkp@intel.com>
To: Ali Zain <alizainuimx@gmail.com>, rust-for-linux@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ojeda@kernel.org,
	Ali Zain <alizainuimx@gmail.com>
Subject: Re: [PATCH] rust: print: Document SAFETY invariants in
 rust_fmt_argument and call_printk
Message-ID: <202602121620.o4VvwtXn-lkp@intel.com>
References: <20260212125427.122362-1-alizainuimx@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212125427.122362-1-alizainuimx@gmail.com>

Hi Ali,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on linus/master v6.19 next-20260212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ali-Zain/rust-print-Document-SAFETY-invariants-in-rust_fmt_argument-and-call_printk/20260212-205645
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20260212125427.122362-1-alizainuimx%40gmail.com
patch subject: [PATCH] rust: print: Document SAFETY invariants in rust_fmt_argument and call_printk
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260212/202602121620.o4VvwtXn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602121620.o4VvwtXn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602121620.o4VvwtXn-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/print.rs:117:
        // at compile time, a null-terminated module name, and a pointer to
        // `fmt::Arguments` obtained via `core::ptr::from_ref`. All pointers
        // are valid for the duration of the call and respect the C ABI.
   -
        unsafe {
            bindings::_printk(
                format_string.as_ptr(),
>> Diff in rust/kernel/print.rs:117:
        // at compile time, a null-terminated module name, and a pointer to
        // `fmt::Arguments` obtained via `core::ptr::from_ref`. All pointers
        // are valid for the duration of the call and respect the C ABI.
   -
        unsafe {
            bindings::_printk(
                format_string.as_ptr(),
   make[2]: *** [Makefile:1888: rustfmt] Error 123
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
