Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5182B26E6F3;
	Wed,  4 Feb 2026 01:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770168599; cv=none; b=m/ib0Mjnxc0Hc8sqyTfuXfF2tPx1oL61DwzT9YHsZzDG1S3HwnrBSqjhvg9cmfWaejvmyHAYEC6IDohvw7j99sP5N9IqVKqG/PtWVcGw6rF8+cCSUZ7s+lViDPfEapiXCHf5Qsrweuvg834RX0QkErbkoutbJo7w8ZjEGqvnQ3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770168599; c=relaxed/simple;
	bh=u/jt1gP45GYTKBsxoFdKtcIAe07q+cy2OeR9mP6AGTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1ILsmdu2Wc+BfrIYClkmNG43OxgvozxgU+MSCXVuE2wjEqLe3ieMtDyIBvoNN2RF0DUjey7M3eDig+BEdDt6mGvo2Epx6K2DK11xNH+mBF79KEhjX51bzfUZCp6Vat7cBCgCmlcpZXwNeVBznvc2ZCIvOLs6XWjbOOnYRe8YcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kO3FS1iZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kO3FS1iZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770168598; x=1801704598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u/jt1gP45GYTKBsxoFdKtcIAe07q+cy2OeR9mP6AGTQ=;
  b=kO3FS1iZ8YgKms6PolVwfX5SkN8Hhpkef/xO6/E++l0yhIKnEFQyWanE
   /kzDctgxNO1u2aGAa50qivM45wXnH7VSqVh568mMU2jsQ2Ng0tVZ0+xHv
   ULb9axkUFuVFDED/gZbw1WRHOFqjd2t9mnc36i73uW76MJjb2aiSFeZf4
   75d58nqNzyetG9tXdKMplx6/0O4sYm70YmvS8KP5yJsp7f8poXy4+3NZw
   mVMXfQNglUcvWszcteHC9JE//ixxXzKArhzBe7ycbwhMTyER9D1a51REV
   A2x59aCs8TyZS4a4fWhFV2sZA/qUDqwIDtuSZB9i1ZQB9GmfFYqle++4i
   g==;
X-CSE-ConnectionGUID: t+pGLHM9SLOK0/y69CCmew==
X-CSE-MsgGUID: ztZMow3IQFe58/WQIPbjxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71249774"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="71249774"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 17:29:58 -0800
X-CSE-ConnectionGUID: KXAnQvUaTh6PDWMy/k44Cg==
X-CSE-MsgGUID: /kd6mY5DSkuQzCK/as7Pqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="214497132"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 03 Feb 2026 17:29:55 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnRiK-000000003WX-3lwK;
	Wed, 04 Feb 2026 01:29:52 +0000
Date: Wed, 4 Feb 2026 02:29:42 +0100
From: kernel test robot <lkp@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH v4 2/2] rust: add system_percpu() and per-cpu enqueue
 functions
Message-ID: <202602040208.hNcu9QEl-lkp@intel.com>
References: <20260203152818.317806-3-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203152818.317806-3-marco.crivellari@suse.com>

Hi Marco,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on linus/master v6.19-rc8 next-20260203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Crivellari/rust-add-system_dfl-around-the-new-system_dfl_wq/20260203-233415
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20260203152818.317806-3-marco.crivellari%40suse.com
patch subject: [PATCH v4 2/2] rust: add system_percpu() and per-cpu enqueue functions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260204/202602040208.hNcu9QEl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040208.hNcu9QEl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040208.hNcu9QEl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/workqueue.rs:316:
            // stay valid until we call the function pointer in the `work_struct`, so the access is ok.
            unsafe {
                w.__enqueue(move |work_ptr| {
   -                bindings::queue_work_on(
   -                    cpu_id as ffi::c_int,
   -                    queue_ptr,
   -                    work_ptr,
   -                )
   +                bindings::queue_work_on(cpu_id as ffi::c_int, queue_ptr, work_ptr)
                })
            }
        }
   Diff in rust/kernel/workqueue.rs:366:
        /// This may fail if the work item is already enqueued in a workqueue.
        ///
        /// The work item will be submitted on cpu_id.
   -    pub fn enqueue_delayed_cpu<W, const ID: u64>(&self, w: W, delay: Jiffies, cpu_id: u32) -> W::EnqueueOutput
   +    pub fn enqueue_delayed_cpu<W, const ID: u64>(
   +        &self,
   +        w: W,
   +        delay: Jiffies,
   +        cpu_id: u32,
   +    ) -> W::EnqueueOutput
        where
            W: RawDelayedWorkItem<ID> + Send + 'static,
        {
>> Diff in rust/kernel/workqueue.rs:316:
            // stay valid until we call the function pointer in the `work_struct`, so the access is ok.
            unsafe {
                w.__enqueue(move |work_ptr| {
   -                bindings::queue_work_on(
   -                    cpu_id as ffi::c_int,
   -                    queue_ptr,
   -                    work_ptr,
   -                )
   +                bindings::queue_work_on(cpu_id as ffi::c_int, queue_ptr, work_ptr)
                })
            }
        }
   Diff in rust/kernel/workqueue.rs:366:
        /// This may fail if the work item is already enqueued in a workqueue.
        ///
        /// The work item will be submitted on cpu_id.
   -    pub fn enqueue_delayed_cpu<W, const ID: u64>(&self, w: W, delay: Jiffies, cpu_id: u32) -> W::EnqueueOutput
   +    pub fn enqueue_delayed_cpu<W, const ID: u64>(
   +        &self,
   +        w: W,
   +        delay: Jiffies,
   +        cpu_id: u32,
   +    ) -> W::EnqueueOutput
        where
            W: RawDelayedWorkItem<ID> + Send + 'static,
        {
   make[2]: *** [Makefile:1871: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'
--
>> warning: unresolved link to `system_percpu_wq`
   --> rust/kernel/workqueue.rs:1013:72
   |
   1013 | /// Note: `system_wq` will be removed in a future release cycle. Use [`system_percpu_wq`] instead.
   |                                                                        ^^^^^^^^^^^^^^^^ no item named `system_percpu_wq` in scope
   |
   = help: to escape `[` and `]` characters, add '\' before them like `\[` or `\]`
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
