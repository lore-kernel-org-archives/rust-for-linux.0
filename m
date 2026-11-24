Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539257;
	b=g+aSWUD1fNjOO7htIK94xv1NWGKy+njy8SmQui7WbEgBi9qiprT8T3kd6tk6Vf08C+Vz
	 jHI0UbhftaxNaZWULVcLTnPsMv5IqeRqDBKOPiJ92f4eeCTqe7r4CC2hmm11V/DIyNCgP
	 TtkdRt915oBHUw0KB8zlXVFTqjR8ONODVhddwLWLTBD3WAFNw8bX6GJKwvhI0XtFEl4Mk
	 0l3J1eTaPPK+0CoCUKZrAUoUnG0g9qCLScUFOfncGAOLVjz5FsKf1E9O//m3eJ0gBx0xi
	 6DDrJCXZ3n21waZzB9ccvVmr8ccQdO0ay6IIP8iLivrVsmsmn5MFoqECCsVZQAmTKCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539257;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=CQq3cn5OTp7tCndSsmVZ6PwJT9jX22+B9CY0Yosdsx4=;
	b=UFbMi7gdhtpNFWogB23P6mQbSM/5gsJuSDvi3uT8Yod+VPh9+4P/C4aZUZ2SvAMkVLSa
	 SLOcZe7BQ0WTOKrGOOBWLN0tERAAzSuIxPBpDVOzMWR0eUtEmzu2OOvxm8Nl51XJ5IWpv
	 QwoOMgioFYC3PXfq1PBuu0Qek4f3Pbk7ig5Uh1bRWefrilr5/VesFQD73Ef4JfDUwfRzO
	 QBVnGr+vq2DLmhGAIYDX5HohRp6ooud7uJ+zRSJyepikYORJ8uWZzIyirM0dqFQeei2wd
	 UsxlBE+eMF1F2CsaS4tswgFParYLLH9kLBKzwVsHUnclARbWDkLq7f1IKsggDdnlETA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WW09wDbv;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF89606A333
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 16:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DF89606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WW09wDbv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795539257; x=1827075257;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cEnj9GUC9C0dZpOykEV7TDMrFtzJuotLx+ZqYNB/UEs=;
  b=WW09wDbv3V3Rtj56h36a48/oQYnlYYQxXgI/PStFl5/TrvBl5KfdAv0M
   OTXsnvylKOgF0uzSbwKlnmSTOt7+TQNhFm6nUSA5BLo7guMPlrTiz46z4
   muIl/Aa1Y8lCIKWlPVQ0BRuMAvmiJrEYBfIz12mWGIZZNM5KSGweuuWDx
   1oUZ+yHjShoYGTvnGQ8AOlg1z4WbnYnp2ypkyb+azvPPMWcs2epxjUMvu
   tr3+uj8tuL95AeWTbcxcemlOVmVob81IKaAA70kpMadyPCqllyLfBZge+
   8MSuh9aIAdBy+E0R3hoaIvD4PUGkf+XFfq8+0JlTx0olGmjcRkuKn10j4
   Q==;
X-CSE-ConnectionGUID: cAUlR/hTRjWt5sZ5mf6ceQ==
X-CSE-MsgGUID: f/MCVXQoRgqmb5mRz3mKwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4240337"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4240337"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 08:54:09 -0800
X-CSE-ConnectionGUID: vnpYnMGKSYeRsQ/M01NTNQ==
X-CSE-MsgGUID: GhG120cyQY+TVqu2ME3v0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11810537"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Nov 2026 08:54:04 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVtmL-00000001Pmw-0kfT;
	Tue, 24 Nov 2026 16:54:01 +0000
Date: Wed, 25 Nov 2026 00:53:45 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	"Liam R . Howlett" <liam@infradead.org>,
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org,
	Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
Subject: Re: [PATCH] rust: bug: add warn_once! macro
Message-ID: <20261125001602.y8fdKF1R-lkp@intel.com>
References: <20261124132707.101769-1-mbkchelofficialdev@gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124132707.101769-1-mbkchelofficialdev@gmail.com>

Hi Ivan,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on akpm-mm/mm-everything linus/master v7.4-rc4 next-20261123]
[cannot apply to ah-configfs/configfs-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivan-Tverdokhleb/rust-bug-add-warn_once-macro/20261124-152707
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20261124132707.101769-1-mbkchelofficialdev%40gmail.com
patch subject: [PATCH] rust: bug: add warn_once! macro
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20261125/20261125001602.y8fdKF1R-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125001602.y8fdKF1R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125001602.y8fdKF1R-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:28:
   In file included from include/linux/cgroup_api.h:1:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
   |                                                   ~~~~~~~~~~ ^
   1 warning generated.
   llvm-nm: error: rust/helpers/helpers.o: No such file or directory
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>> error[E0425]: cannot find value `BUGFLAG_ONCE` in crate `$crate::bindings`
   --> rust/kernel/bug.rs:172:37
   |
   172 |                 | $crate::bindings::BUGFLAG_ONCE;
   |                                     ^^^^^^^^^^^^ not found in `$crate::bindings`
   |
   ::: rust/kernel/mm/virt.rs:118:12
   |
   118 |         if crate::warn_once!(did_overflow || address < self.start() || self.end() < end) {
   |            ----------------------------------------------------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `crate::warn_once` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
