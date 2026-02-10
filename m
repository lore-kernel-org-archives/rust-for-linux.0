Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583B032B99C;
	Tue, 10 Feb 2026 05:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770700352; cv=none; b=b4h189z7JauVYoh7TuG9PGODkYRrDSaBEESsyZQ9kU7ghAVDZvFiitE99W/2oCwePJ2l0SuCj1vY/tXsnb9nwV1E6ec0GfTLCK0sB8HvekxYLoO+GQbA5+3mrS48x4HmySjoQ7WgE4LtciwMPyrm4L0+Hlqs4SBQmzFCxF3ZPPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770700352; c=relaxed/simple;
	bh=3UNd5cxLJqz/3s1NIEI3vT5VGVl5sklAlpXeEWdBoZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lH/B6UpbHERRPLCd1rYgLYTcTCzRhzERrua7+jDvXkYKqdhQnhZTK760U7Wh7ETY28aJaGTGeAfydRWKOhUY2vdnMM4W03iqFxNolquOaV9qg9WmUQHBhwszgurBjaM/Ou2eVUQDbRXd8dVcmdRQQ5tGtzUkfR/O6ETqC6sH00M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i1tneYIG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i1tneYIG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770700350; x=1802236350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3UNd5cxLJqz/3s1NIEI3vT5VGVl5sklAlpXeEWdBoZY=;
  b=i1tneYIGtMuJq57FJmP8AhQSpzTvi2+As5lp9M6IT9GTHH1bq7083r2T
   uQN24Cw6itllkPEeWXbgNBUctbyJrmhKUOxXAZGlOKEzgyCptaHPL18Wy
   zm3GUEaaeSoaL9v3gGr/lR2HBFdplgZXQecPmJikoqzA/ID1H9eKgZ4H7
   Z2UMPtqIcFFgbBbS44cBXlLxbrFJ0/lekSiH9wzk/qS8OVilQZUyDH3O2
   A04C0fQojy0OHcqb9YJcUIV+8DeLkXBg4R5K1CRciasE8FeuFtB6roq0q
   EYctWvMq7iNZn7nUabBvxKz7vH2mxkvArXWiak12Y9rimAvReB4gBPuZk
   Q==;
X-CSE-ConnectionGUID: Hb20PsggQAu+IbvkvwlVqA==
X-CSE-MsgGUID: 22bRJQn+RjmpVXsprzLe8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="74425762"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="74425762"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 21:12:29 -0800
X-CSE-ConnectionGUID: PE/oxs8ATIetyQVLsPYhpQ==
X-CSE-MsgGUID: zIgjYMXuS/mOmpPCoKhmbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="210907238"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Feb 2026 21:12:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpg2v-00000000of2-0EFa;
	Tue, 10 Feb 2026 05:12:21 +0000
Date: Tue, 10 Feb 2026 13:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com,
	rostedt@goodmis.org, ardb@kernel.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev,
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: Re: [PATCH V4 2/3] rust: Add PowerPC support
Message-ID: <202602101353.da6BkK6l-lkp@intel.com>
References: <20260209105456.1551677-3-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209105456.1551677-3-mkchauras@gmail.com>

Hi Mukesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.19]
[also build test ERROR on linus/master next-20260209]
[cannot apply to powerpc/next powerpc/fixes rust/rust-next ah-configfs/configfs-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Kumar-Chaurasiya-IBM/powerpc-jump_label-adjust-inline-asm-to-be-consistent/20260209-185801
base:   v6.19
patch link:    https://lore.kernel.org/r/20260209105456.1551677-3-mkchauras%40gmail.com
patch subject: [PATCH V4 2/3] rust: Add PowerPC support
config: powerpc-randconfig-r073-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101353.da6BkK6l-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101353.da6BkK6l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101353.da6BkK6l-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   clang: error: unsupported option '-fsanitize=thread' for target 'powerpc-unknown-linux-gnu'
   make[3]: *** [rust/Makefile:624: rust/helpers/helpers.o] Error 1
>> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:5:9: warning: '_IOC_SIZEBITS' macro redefined [-Wmacro-redefined]
>> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:6:9: warning: '_IOC_DIRBITS' macro redefined [-Wmacro-redefined]
>> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:8:9: warning: '_IOC_NONE' macro redefined [-Wmacro-redefined]
>> clang diag: arch/powerpc/include/uapi/asm/ioctl.h:10:9: warning: '_IOC_WRITE' macro redefined [-Wmacro-redefined]
>> error[E0658]: inline assembly is not stable yet on this architecture
   --> rust/kernel/sync/barrier.rs:19:14
   |
   19 |     unsafe { core::arch::asm!("") };
   |              ^^^^^^^^^^^^^^^^^^^^
   |
   = note: see issue #93335 <https://github.com/rust-lang/rust/issues/93335> for more information
   = help: add `#![feature(asm_experimental_arch)]` to the crate attributes to enable
   = note: this compiler was built on 2025-06-23; consider upgrading it if it is out of date

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
