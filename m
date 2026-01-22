Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042053A6408;
	Thu, 22 Jan 2026 11:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769083063; cv=none; b=fawIZv6IB4SX1pqig51F8VWpveJOnpLXWcFzHK4qZFUTCnoh+TajjCgx3VR1AS/vAS2B76H/AmLVzHnSOR+Pd/wM+FmbYZDxRpihVFgt0DBYlCCkvRWH/tKJBCxnr0vCWBKx1xGPWEBV8rbchWo0m6Z45arcKSGb7MIxB/9hOPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769083063; c=relaxed/simple;
	bh=YA0QC/uuVi/Pla7THUSaJVW+WVYLDQx6KC9zI0/c4G0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahvtDh5vb5eNm+GifQ0+6HJaHagh2CsLnMc5qT/9wYWfsfxnZsppSk6iCgfi4egD8vPh3/9cOrMhIGCCpLrCo/2W3WK+0JYFnGXZjjrZAMl9HHqyL40hcZtrOEJgWKVIUQphu4ii5HXiS9UB6ZbQEU90WwKFylI2wT05rx6yBXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CW2WiCbJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CW2WiCbJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769083061; x=1800619061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YA0QC/uuVi/Pla7THUSaJVW+WVYLDQx6KC9zI0/c4G0=;
  b=CW2WiCbJ62mFwsXlPm6IfDlz5jjG1MI9Qgg+wpCNedtfXd2F/29Q7CKK
   T3jed2E/vQ+YFvOkaJseyBdl+1fh7AmsDAoc+C2FW1dWXLQYFnZqVIYS2
   +X/fRZUdENsGGf2pY32N0mlyIZ8BOPiWVdutu9DDCmR6CyHq7Z7kFRBHn
   Z8QxdO+dp1gSJJxUe5hAF8IvsiNEZHjWd+qJnmlt2J8HQ2oogo8H7t9U1
   roudKV3fWV/FMQT1sOryT3YrFj1d8nIhXwGnol8Y3ej1C24E0toJy8YQR
   4cuQj/Z6sT4Yn28LpdEnmqREZO4v0vokTPbs2ZXlGWPthsbo2VszvSc5s
   A==;
X-CSE-ConnectionGUID: gim7Fc3qQtGFOJAQgHHjKQ==
X-CSE-MsgGUID: xYwdUXspRpu+ercyG4/GtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69340140"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="69340140"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 03:57:40 -0800
X-CSE-ConnectionGUID: Ql9UBEfsQDOWEC2fNwU64A==
X-CSE-MsgGUID: CI9rWv2OTcaAonwn5YcYJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="244323105"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 22 Jan 2026 03:57:35 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vitJc-000000000Un-3JQD;
	Thu, 22 Jan 2026 11:57:32 +0000
Date: Thu, 22 Jan 2026 12:56:55 +0100
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun.feng@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v17 10/16] rust: sync: Introduce lock::Lock::lock_with()
 and friends
Message-ID: <202601221246.Qfwh5Atq-lkp@intel.com>
References: <20260121223933.1568682-11-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121223933.1568682-11-lyude@redhat.com>

Hi Lyude,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2ad6c5cdc89acfefb01b84afa5e55262c40d6fec]

url:    https://github.com/intel-lab-lkp/linux/commits/Lyude-Paul/preempt-Introduce-HARDIRQ_DISABLE_BITS/20260122-064928
base:   2ad6c5cdc89acfefb01b84afa5e55262c40d6fec
patch link:    https://lore.kernel.org/r/20260121223933.1568682-11-lyude%40redhat.com
patch subject: [PATCH v17 10/16] rust: sync: Introduce lock::Lock::lock_with() and friends
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260122/202601221246.Qfwh5Atq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221246.Qfwh5Atq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221246.Qfwh5Atq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `Backend::BackendInContext`
   --> rust/kernel/sync/lock.rs:39:27
   |
   39 | /// [`BackendInContext`]: Backend::BackendInContext
   |                           ^^^^^^^^^^^^^^^^^^^^^^^^^ the trait `Backend` has no associated item named `BackendInContext`
   |
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default
--
>> warning: unresolved link to `Backend::Context`
   --> rust/kernel/sync/lock.rs:40:18
   |
   40 | /// [`Context`]: Backend::Context
   |                  ^^^^^^^^^^^^^^^^ the trait `Backend` has no associated item named `Context`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
