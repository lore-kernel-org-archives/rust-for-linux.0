Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBA739150A;
	Mon, 18 May 2026 19:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779133609; cv=none; b=J9P+z+MHpxEfMDvZT1FROuEOPrXMcYq7HWg4mheK7z76QfDzs/lhsmOx/UsDwWwROkKzSg/t8rxjJHiSN2wDSqyKGSfr3qRE7/dDxt6M1SaP9sYS4fjzHZKet9Kwj6shSUKYLx3EOQzRM2pbfOwGOB4qbgLWZDA5XLMo6hxQt7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779133609; c=relaxed/simple;
	bh=Gx17lI2F37+5Bk4iWbk3TC/6gNBWrspj35k7blJsnFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQRhROj70+urjQUhO/pOpyvHPcoMGlZEby+Jefd1ypYfdJKt2aj31+u6x8vnkcI0953v+mEyZbKJP/FfDrDl0RAbUwdrzy+UNeO6Z1/w7TwpE7I/t4yuvdNLT8csYtwHTzRGYPYe4/XxABAo5Vs8YGBkFRQW2VbutVKnM34HYCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eh3qLA/b; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eh3qLA/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779133606; x=1810669606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gx17lI2F37+5Bk4iWbk3TC/6gNBWrspj35k7blJsnFg=;
  b=eh3qLA/bSuazQO5wilBel2QY4EE/ZkF/v0FOKBbX2UU/Lo/mdd2vfK4E
   EJyJs6ILVps859SQb9yyOkDnRkqyxApKcaVLjwRWFVKws6azqteYa0pC6
   ggWkhfKtwoBTOaOUEEl9gFWN3C3Bw2K61BNPEoh2S5IFhKy0BxQpNUQlo
   /xut7tzKdG0Y3EbQBVW36TDihHuVE55SxmJkzwvJZHAXiBDlYJzuYhnSl
   +nuQBbu/0MZxVrVDMLd4kzIE2KEp2rpYtP5MrgYOQJLcLWhK0+ldyOe3O
   qk9t6/eY0DoVEwlAn07uPy+iWYqWoaG7uipTYffIhDNL0WYhwbImzoAZj
   w==;
X-CSE-ConnectionGUID: 9mKW331oQl2xd8ttr3b7qg==
X-CSE-MsgGUID: S7IWxTZBSg2lOl0OYZijRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79964582"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="79964582"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 12:46:46 -0700
X-CSE-ConnectionGUID: DeJB9y4VQQO9L+nsIFdd0A==
X-CSE-MsgGUID: 0Fh/E2GSR/25ZgQXz8OzlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; 
   d="scan'208";a="235081981"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 May 2026 12:46:44 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wP3vF-000000003Kc-3GAk;
	Mon, 18 May 2026 19:46:41 +0000
Date: Tue, 19 May 2026 03:46:02 +0800
From: kernel test robot <lkp@intel.com>
To: Moayad Salloum <salloummoayad4@gmail.com>,
	rust-for-linux@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, ojeda@kernel.org,
	aliceryhl@google.com, lossin@kernel.org, a.hindborg@kernel.org,
	Moayad Salloum <salloummoayad4@gmail.com>
Subject: Re: [PATCH] rust: workqueue: add cancel_work for Arc<T>
Message-ID: <202605190332.rlkguvbn-lkp@intel.com>
References: <20260518042347.95213-1-salloummoayad4@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518042347.95213-1-salloummoayad4@gmail.com>

Hi Moayad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rust/rust-next]
[also build test WARNING on linus/master v7.1-rc4 next-20260518]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Moayad-Salloum/rust-workqueue-add-cancel_work-for-Arc-T/20260518-122747
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20260518042347.95213-1-salloummoayad4%40gmail.com
patch subject: [PATCH] rust: workqueue: add cancel_work for Arc<T>
config: x86_64-randconfig-011-20260518 (https://download.01.org/0day-ci/archive/20260519/202605190332.rlkguvbn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605190332.rlkguvbn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605190332.rlkguvbn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: missing documentation for a function
   --> rust/kernel/workqueue.rs:874:1
   |
   874 | / pub fn cancel_work<T, const ID: u64>(item: &Arc<T>) -> bool
   875 | | where
   876 | |     T: WorkItem<ID, Pointer = Arc<T>>,
   877 | |     T: HasWork<T, ID>,
   | |______________________^
   |
   = note: requested on the command line with `-W missing-docs`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
