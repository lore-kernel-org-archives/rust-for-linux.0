Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0951AE877;
	Sat, 28 Feb 2026 02:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772245561; cv=none; b=d70czIzVBPhz0lSbYrwqBObhOQyNwBsY5bBOHY7co4iYrfAoETUMoW/Wih7nkGpyVgdrGasLmwotqK6cl/yt1QgKoAUykEN1nb80W98ekstkXuQwt70LuEP2UvjZLRulNXKrj6KNhwh+jpJWaDxiZowhFG1KK2IGFfQ1dek+960=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772245561; c=relaxed/simple;
	bh=Fv0u16OrLvA+wXPbLpK2kdOVfQ+rodAI9LUt4/cRrPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UgLU1dnj1XFJdouap4fAHW4DR8uJ34bGZ2JCGKe2JhvLr8R8bydvBstxefY7q3NTUcHR9b3BkrFwp0PDzYw5q2UlPJVwU7s6Gk3yKrK5gAvcXrklEeX6q3BrxDus04DVCQ8OWhxfN1gEs2OuCPAmDiu9wplP88nTDzOFohqQmFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f5dPOQFa; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f5dPOQFa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772245559; x=1803781559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fv0u16OrLvA+wXPbLpK2kdOVfQ+rodAI9LUt4/cRrPc=;
  b=f5dPOQFagnoq9dKBH87fubRVGjz4J0F0aZQ0JLfbaLzDDMuVPeKBtUW4
   B2nz2hJ8qb81KN0o6VcaWdLTpEOEf+zHiChISl3ftTOyrAvf2Xphkn026
   W/Bd9u0zG+c2IyVmrnHJmz4zut390UMKxWTWaX/d7e6726FMfH0Bjoxra
   F/3tuBtJyhJiQENe7dJoCShCJAXW8TWw43z02c6criqzSvQRKqeS5J92S
   4cTKFMdXhrq4IOLzbDyqjXWLhXU/ZwOzVaLjmP+FNDtwpm/ykEnVtMGuG
   dtSx3SJL5/R6m5v9jo92lq+PHgagEY7GKIB+YR7WvcOjgyL4oH6+c8p4b
   Q==;
X-CSE-ConnectionGUID: OjcAqcxISQ6n13exjOIIIA==
X-CSE-MsgGUID: 4XVcbPhqTt+6xcZaBrN6UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="84417406"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="84417406"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 18:25:58 -0800
X-CSE-ConnectionGUID: lu8eLs8/SeOI/gQwEqJGig==
X-CSE-MsgGUID: wkRCCaOkS/m6UwWiwKm0FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="217088679"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 27 Feb 2026 18:25:55 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwA1a-00000000BFr-31m4;
	Sat, 28 Feb 2026 02:25:47 +0000
Date: Sat, 28 Feb 2026 10:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Lai Jiangshan <jiangshanlai@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>,
	Boqun Feng <boqun@kernel.org>, Benno Lossin <lossin@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>
Subject: Re: [PATCH v3 2/2] rust: workqueue: add creation of workqueues
Message-ID: <202602281033.afIyhHsn-lkp@intel.com>
References: <20260227-create-workqueue-v3-2-87de133f7849@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227-create-workqueue-v3-2-87de133f7849@google.com>

Hi Alice,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]

url:    https://github.com/intel-lab-lkp/linux/commits/Alice-Ryhl/rust-workqueue-restrict-delayed-work-to-global-wqs/20260227-230029
base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
patch link:    https://lore.kernel.org/r/20260227-create-workqueue-v3-2-87de133f7849%40google.com
patch subject: [PATCH v3 2/2] rust: workqueue: add creation of workqueues
config: riscv-randconfig-r063-20260228 (https://download.01.org/0day-ci/archive/20260228/202602281033.afIyhHsn-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260228/202602281033.afIyhHsn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602281033.afIyhHsn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> clang diag: include/linux/workqueue.h:513:76: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 4)' attribute to the declaration of 'rust_helper_alloc_workqueue' [-Wmissing-format-attribute]
--
   In file included from rust/helpers/helpers.c:66:
>> rust/helpers/workqueue.c:22:9: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 4)' attribute to the declaration of 'rust_helper_alloc_workqueue' [-Wmissing-format-attribute]
      19 | struct workqueue_struct *rust_helper_alloc_workqueue(const char *fmt, unsigned int flags,
         | __attribute__((format(printf, 1, 4))) 
      20 |                                                      int max_active, const void *data)
      21 | {
      22 |         return alloc_workqueue(fmt, flags, max_active, data);
         |                ^
   include/linux/workqueue.h:513:76: note: expanded from macro 'alloc_workqueue'
     513 | #define alloc_workqueue(...)    alloc_hooks(alloc_workqueue_noprof(__VA_ARGS__))
         |                                                                               ^
   include/linux/alloc_tag.h:265:31: note: expanded from macro 'alloc_hooks'
     265 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^
   include/linux/alloc_tag.h:251:9: note: expanded from macro 'alloc_hooks_tag'
     251 |         typeof(_do_alloc) _res;                                         \
         |                ^
   rust/helpers/workqueue.c:19:26: note: 'rust_helper_alloc_workqueue' declared here
      19 | struct workqueue_struct *rust_helper_alloc_workqueue(const char *fmt, unsigned int flags,
         |                          ^
   1 warning generated.
--
   llvm-nm: error: rust/helpers/helpers.o: No such file or directory
>> clang diag: include/linux/workqueue.h:513:76: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 4)' attribute to the declaration of 'rust_helper_alloc_workqueue' [-Wmissing-format-attribute]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
