Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F712416875
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Aug 2026 12:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970797; cv=none; b=QhTUtzASjQkxV+KwMwWZP3YTl2VmN6up6oN3djLKTTA1GydkjJFblSJE3q8UzKyOPn2moW6J5aJq0fUYVWfm5jlBwCTcrXqjO/8cOKg6n6F9gaafIE2mcyi1G8guWUxHbLVe8SWVUU+4QUl+CwdNHsgfyLySrBpoDOVvONQBfY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970797; c=relaxed/simple;
	bh=wAFksMzOto0uzeyXgKXy5O0UUPPgjl24xnnjbVSqgwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hg0UY6RU217hwwbrD6gfBTTCGA+IDB9Uv93evfjR7JpdyFF7sKHdYQYkPoXF64n/yKWoJ5ntF9+L1kSCkd8MzcVrXYLCjGr23+3HHrKP0+7CYf/OHOipggNxpLAOBoQERW92YrzwXqMUyzP1r3D4hkwcI48KD2pItRg4OpMVHuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Krms+FKg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Krms+FKg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786970796; x=1818506796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wAFksMzOto0uzeyXgKXy5O0UUPPgjl24xnnjbVSqgwA=;
  b=Krms+FKgX6d4bBIa0B1wEXCIt8w1q9WFrx/c6d0we4UpKmiURp4b17Bn
   IO9wDxZJ8lFco97R0TtYrcvbeKDG5eNwrrvyqsBR/IECbbSBArUabSd3k
   DDIo2PL5W+KAWdYOEjiWVm84iN/PzynEsas/tB9xgz+YE21ibFt9VvxsQ
   PUSn054BWUvQROVPTS2PIto0hJRAXrgtMynrI0KhCf/kkfyqpYLUb/pIH
   fm+3cbUGrWhW4Uk+PUF+Kz3vR0FpWdZB1kNA/hQuaPppwjSeaaEwhoHX5
   eBcxgtNAu0onL7lXxo9PvdF2Pk0D5lkgukHf6My2/1rW1Bh6XUONjM2i1
   w==;
X-CSE-ConnectionGUID: ZLFZsLJfSlqI70BexviLjA==
X-CSE-MsgGUID: 05Z1toBBSGy2R6nHMZcwLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98598466"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="98598466"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 05:46:36 -0700
X-CSE-ConnectionGUID: 8ZdX1opQRXSRTHpMhl1CHw==
X-CSE-MsgGUID: niKDf76nSaO7V1qxyIkr3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="266888479"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Aug 2026 05:46:33 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvwjV-00000000dSs-3uy0;
	Mon, 17 Aug 2026 12:46:29 +0000
Date: Mon, 17 Aug 2026 20:46:21 +0800
From: kernel test robot <lkp@intel.com>
To: Priya Bala Govindasamy <pgovind2@uci.edu>, ojeda@kernel.org,
	gary@garyguo.net, rust-for-linux@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	peterz@infradead.org, zhiyunq@cs.ucr.edu, ardalan@uci.edu,
	pgovind2@uci.edu, dzueck@uci.edu, yuantan098@gmail.com
Subject: Re: [PATCH v2 1/1] Make Guard::lock_ref unavailable if Lock is not
 Sync
Message-ID: <202608172043.JxF675RT-lkp@intel.com>
References: <878cfb22ab185874bc363e2b7910a6978af646ab.1782763889.git.pgovind2@uci.edu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878cfb22ab185874bc363e2b7910a6978af646ab.1782763889.git.pgovind2@uci.edu>

Hi Priya,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/locking/core]
[also build test ERROR on rust/rust-next linus/master v7.2-rc7 next-20260814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Priya-Bala-Govindasamy/Make-Guard-lock_ref-unavailable-if-Lock-is-not-Sync/20260814-173656
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/878cfb22ab185874bc363e2b7910a6978af646ab.1782763889.git.pgovind2%40uci.edu
patch subject: [PATCH v2 1/1] Make Guard::lock_ref unavailable if Lock is not Sync
config: arm64-randconfig-003-20260817 (https://download.01.org/0day-ci/archive/20260817/202608172043.JxF675RT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608172043.JxF675RT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608172043.JxF675RT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0277]: `T` cannot be sent between threads safely
   --> rust/doctests_kernel_generated.rs:20824:33
   |
   20824 |     assert!(core::ptr::eq(guard.lock_ref(), lock));
   |                                 ^^^^^^^^ `T` cannot be sent between threads safely
   |
   = note: required for `Lock<T, B>` to implement `Sync`
   note: required by a bound in `rust_doctest_kernel_alloc_allocator_rs_0::kernel::sync::lock::Guard::<'a, T, B>::lock_ref`
   --> rust/kernel/sync/lock.rs:239:21
   |
   237 |     pub fn lock_ref(&self) -> &'a Lock<T, B>
   |            -------- required by a bound in this associated function
   238 |     where
   239 |         Lock<T, B>: Sync,
   |                     ^^^^ required by this bound in `Guard::<'a, T, B>::lock_ref`
   help: consider restricting type parameter `T` with trait `Send`
   |
   20822 | fn assert_held<T: core::marker::Send, B: Backend>(guard: &Guard<'_, T, B>, lock: &Lock<T, B>) {
   |                 ++++++++++++++++++++

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
