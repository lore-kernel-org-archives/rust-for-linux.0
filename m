Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2843B287257;
	Sat,  2 May 2026 11:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777720747; cv=none; b=hkc0jz03Ee58/zWAY3EQZICKiHTrF1M5w+Tt75D5u4tZfRkZ+MbLYC6Z/3XBdzLFJwHKHa7IjgRdfmIUK8wXyDP0h4cvckp9umxEHcOSNT0qu+M1nBQvkvLxUwtH0ipZB4J4hKGpqWHR/8zS0fIY0DWs9PkTSInVubGnLqS6CFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777720747; c=relaxed/simple;
	bh=0PgggsRU117dtsO6/PX8WLCRZH5x1OP6Qp+tAoF87h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SN/iwqwaVv0WkGDYLveLLWb5dEpowlj/e/vGleKME7+I2ycnrFWj2DUwKR2hZV6k3915LoXOHtUZbnzu+gHkWeeH3VWOx6zU/OriBK0HC760wTcGn5LETKuKWqsIhfiY2nGZZ5CMg+0V0tXW5tGY007rOAE19oFDAKpFjDjqHvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XxMBDqQy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XxMBDqQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777720746; x=1809256746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0PgggsRU117dtsO6/PX8WLCRZH5x1OP6Qp+tAoF87h8=;
  b=XxMBDqQyD12dpR2dRXOq+YhabDtB2dB9Vxs4BrK962+njY/BXZjuX6Y6
   d7wheW0Lo5raJ9phNAuRHPl4168cwaqYbNwDDoFOCT5qCw62OIhedNung
   VCjEma8aFjwSOrmPNV3gcVOy1ptuMjM5aepzrVsq6spY/xmal3x7q0/2s
   bxSmGAUvsWSck3HgvoE84x2AIVt75TF7llFoHAoI+VXcCQMRMktjBztYU
   ZTLPwuhSiobsbxhldZwKiK1DPN6nag71VK0ka/QjROn7GSmSP8/j7UaJg
   uL/Z2rnW4E77NbmGNmLEIuYdXdN4yRiz4yv6F9BeyRnnlP9ClR8yLDZWT
   A==;
X-CSE-ConnectionGUID: w+WZUMfYSJqnmbT7gp6uBQ==
X-CSE-MsgGUID: PwtcItlIRpqx7LyPa1PB8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="81233271"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="81233271"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 04:19:05 -0700
X-CSE-ConnectionGUID: nlUSMv1QR4il5ma1NB1rQA==
X-CSE-MsgGUID: s6cZAwSdTtSPJzEQBanOAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="235155215"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 02 May 2026 04:19:02 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ8N9-000000005Ft-34x5;
	Sat, 02 May 2026 11:18:59 +0000
Date: Sat, 2 May 2026 13:18:15 +0200
From: kernel test robot <lkp@intel.com>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, ojeda@kernel.org, boqun@kernel.org,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, peterz@infradead.org, fujita.tomonori@gmail.com,
	tamird@kernel.org,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH v1 1/1] rust: add Work::disable_sync
Message-ID: <202605021337.ck8OCWEF-lkp@intel.com>
References: <20260428104459.174602-2-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428104459.174602-2-work@onurozkan.dev>

Hi Onur,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rust/rust-next]
[also build test WARNING on linus/master v7.1-rc1 next-20260430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Onur-zkan/rust-add-Work-disable_sync/20260502-140019
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20260428104459.174602-2-work%40onurozkan.dev
patch subject: [PATCH v1 1/1] rust: add Work::disable_sync
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260502/202605021337.ck8OCWEF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605021337.ck8OCWEF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605021337.ck8OCWEF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `run`
   --> rust/kernel/workqueue.rs:436:62
   |
   436 | /// structs, you would implement [`WorkItem`] instead. The [`run`] method on
   |                                                              ^^^ no item named `run` in scope
   |
   = help: to escape `[` and `]` characters, add '\' before them like `\[` or `\]`
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
