Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD30934F27D;
	Wed,  4 Feb 2026 04:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770180904; cv=none; b=MiwueRimBuLQWqpUiv25JPZHLNF9Otr1dxNugSH2mubqQmyUaz/+apIg/Z6nF8W7TI5xdOXY/EBih9u4xgGsdEpBvp9GwgqI939SicVrmP5I9QmxjCt7dfM1sJBtg+dLJF5Hn1oHa4Qhf4J1gxFmoqQglSF2MDjoFgVLo8ZSplQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770180904; c=relaxed/simple;
	bh=1Nwm7gBX7S9HdvZbxKueVgPT9oxK2NzjXtkYV1/Owhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bl6HXeoG02lVKYwOmukJoXBZH9lW9IALtkfb16zEHXdUFU99UUYpJI1RztkKC5So1qeQc7U3dfPp4+5/05btpUz0MgZnI2Y/Uk3zFwnbX3/iFD9lmYNDM5wMFc2JLHtqLpPz33KnMsq4zL0Im0asDsCC1O8GOao/D/CcIaCTNDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5ZLmSDS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5ZLmSDS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770180903; x=1801716903;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1Nwm7gBX7S9HdvZbxKueVgPT9oxK2NzjXtkYV1/Owhg=;
  b=a5ZLmSDSPLI7unKx3VL9qpDq4gDa4qfFSi1a7EuQigFubbmZDjmFDLgZ
   CzNSGnd0FZDP4QZOz6IeSoZXMAnOEuZY3SJJA/pkvxtMYPfTJwBvtqTDz
   nkAqK9YxWM4T5TbNDYW7avRnb/kouHATbTaJm08oIGN2EpbMLj2Scgf/Y
   5V1Zblc2OsNOKTP/762l3BC5+KTV/sirNCLQOu8ETKOP4m3+MY8vcXo83
   wtU5chT1guSznRDtuU2buQ3bmPqusELlNvyzEFI1ccDVWCpLgR7EEn4HP
   YcP0XtR90M3a0WCiUfVVHfH2KRat+eQhrzZaUmybaUatOAdnPe5+knQZB
   A==;
X-CSE-ConnectionGUID: BhMG2/I0TjCRjV4HhMhSOA==
X-CSE-MsgGUID: q3di4UhbTEGgJyQR571mRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71445532"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71445532"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 20:55:03 -0800
X-CSE-ConnectionGUID: Go9oiR6cRXOHvtdjzaDvsw==
X-CSE-MsgGUID: o4DANno4SB6DfMLmTjiedA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="214216972"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 03 Feb 2026 20:54:59 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnUum-000000003aX-1MGq;
	Wed, 04 Feb 2026 04:54:56 +0000
Date: Wed, 4 Feb 2026 05:54:23 +0100
From: kernel test robot <lkp@intel.com>
To: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>,
	rust-for-linux@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Tejun Heo <tj@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>, Alban Kurti <kurti@invicto.ai>,
	linux-kernel@vger.kernel.org,
	Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
Subject: Re: [PATCH] workqueue: rust: add work item runtime modification
 support
Message-ID: <202602040543.4ixOmzHo-lkp@intel.com>
References: <20260203215555.832171-1-hamzamahfooz@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203215555.832171-1-hamzamahfooz@linux.microsoft.com>

Hi Hamza,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rust/rust-next]
[also build test WARNING on next-20260203]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hamza-Mahfooz/workqueue-rust-add-work-item-runtime-modification-support/20260204-060728
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20260203215555.832171-1-hamzamahfooz%40linux.microsoft.com
patch subject: [PATCH] workqueue: rust: add work item runtime modification support
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260204/202602040543.4ixOmzHo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040543.4ixOmzHo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040543.4ixOmzHo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unsafe function's docs are missing a `# Safety` section
   --> rust/kernel/workqueue.rs:443:5
   |
   443 | /     unsafe fn __enqueue_delayed<F>(self, queue_work_on: F) -> Self::EnqueueDelayedOutput
   444 | |     where
   445 | |         F: FnOnce(*mut bindings::work_struct) -> bool;
   | |______________________________________________________^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_safety_doc
   = note: `-W clippy::missing-safety-doc` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::missing_safety_doc)]`
--
>> warning: unsafe function's docs are missing a `# Safety` section
   --> rust/kernel/workqueue.rs:558:5
   |
   558 |     pub unsafe fn raw_enable(this: *const Self) -> bool {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_safety_doc
--
>> warning: unsafe function's docs are missing a `# Safety` section
   --> rust/kernel/workqueue.rs:582:5
   |
   582 |     pub unsafe fn raw_disable_sync(this: *const Self) -> bool {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_safety_doc
--
>> warning: unsafe function's docs are missing a `# Safety` section
   --> rust/kernel/workqueue.rs:588:5
   |
   588 |     pub unsafe fn raw_disable_delayed_sync(this: *const Self) -> bool {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_safety_doc
--
>> warning: unsafe function's docs are missing a `# Safety` section
   --> rust/kernel/workqueue.rs:594:5
   |
   594 |     pub unsafe fn raw_cancel(this: *const Self) -> bool {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_safety_doc
--
>> warning: unsafe function's docs are missing a `# Safety` section
   --> rust/kernel/workqueue.rs:600:5
   |
   600 |     pub unsafe fn raw_cancel_delayed(this: *const Self) -> bool {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_safety_doc
--
>> warning: unsafe function's docs are missing a `# Safety` section
   --> rust/kernel/workqueue.rs:606:5
   |
   606 |     pub unsafe fn raw_cancel_sync(this: *const Self) -> bool {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_safety_doc
--
>> warning: unsafe function's docs are missing a `# Safety` section
   --> rust/kernel/workqueue.rs:612:5
   |
   612 |     pub unsafe fn raw_cancel_delayed_sync(this: *const Self) -> bool {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_safety_doc
--
>> warning: docs for unsafe trait missing `# Safety` section
   --> rust/kernel/workqueue.rs:664:1
   |
   664 | pub unsafe trait WorkHandle {
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_safety_doc
--
>> warning: unsafe impl missing a safety comment
   --> rust/kernel/workqueue.rs:702:1
   |
   702 | unsafe impl<T, const ID: u64> WorkHandle for ArcWorkHandle<T, ID>
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: consider adding a safety comment on the preceding line
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
--
>> warning: unsafe function's docs are missing a `# Safety` section
   --> rust/kernel/workqueue.rs:564:5
   |
   564 |     pub unsafe fn raw_disable(this: *const Self) -> bool {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#missing_safety_doc
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
