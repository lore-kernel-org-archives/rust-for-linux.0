Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8891C8604;
	Wed,  4 Feb 2026 00:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770165000; cv=none; b=dWVvK6UlmaRuyZ8bllcmZgVd9Y8LVv+qHyD7iD5sDArFf7iLCdFiSxPmTCVECedjNZ2Vuxt7n9b3Nf+NNkqIekmkT6M1A2lo23WL/+bbljMNFpL9N6jCMQn6YULiTm4IiYfZSemdhdElapNxREkOsA5zGgYAYrUvlMQK+NzEYpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770165000; c=relaxed/simple;
	bh=hq5sQ8SsnQiDZ+9x1aysB4lXQTC4NKydWUm816IEOQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trZXaTBOoe+JYefHU/5mosW8OeZUq+vX+9VZaVTNAYSuI3LogyB9vKjuBBVIuzKGbAca7RX5fBAz3tfWcvJf5hjWIWatSKShQ+quBC6PdFrAkAF4sbVgstuB+yHSq3HFgnOODdDDo7IAZ2eCgUuTIaoiMl/+3AnSt6ojuS2+0Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5ppY7lc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5ppY7lc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770164998; x=1801700998;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hq5sQ8SsnQiDZ+9x1aysB4lXQTC4NKydWUm816IEOQg=;
  b=V5ppY7lc0O8kQLULR5tMXczcXlo61oHyMRAG3uI+VMcGmOTd6sSoi0Lx
   Qna1QuxkqZpydrEBnowsgG9OywgnYrEuR/YPRbgSIV3XrfEAUxf6rMVLW
   xgxGINJ0vurBcOi0gi1j5NvMdDUxCW8S9X7AERb0l35GqtU6W2SNzYqcj
   6AJmwTfXIwh6H791aQkigH80QdO+6ruNpSOFJ8q/7cXeSVFTw/63fJ10O
   yc88uZMuv31+dmSbT9F99UkM1u03ROr3hicb5QjsHKgvd4yw3Ga5m3P5+
   iMBxHLA7cxqY6/XeKoTC9UFmsRgzxa03Kfk2nnrABEunBDLHZXhCRjjTE
   w==;
X-CSE-ConnectionGUID: 7fl7T9h4ScqdnE/zDsZglQ==
X-CSE-MsgGUID: e2zCjKi+SGyY0XcYcbvQsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="81979337"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="81979337"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 16:29:57 -0800
X-CSE-ConnectionGUID: iZbst8bNQBuupPr2W7isAQ==
X-CSE-MsgGUID: iMP2cav5Rm6HmMsNOL4Ddw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="240682954"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 03 Feb 2026 16:29:55 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnQmG-000000003VN-0Dbg;
	Wed, 04 Feb 2026 00:29:52 +0000
Date: Wed, 4 Feb 2026 01:28:54 +0100
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
Subject: Re: [PATCH v4 1/2] rust: add system_dfl() around the new
 system_dfl_wq
Message-ID: <202602040119.xqN5Fe8s-lkp@intel.com>
References: <20260203152818.317806-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203152818.317806-2-marco.crivellari@suse.com>

Hi Marco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rust/rust-next]
[also build test WARNING on linus/master v6.19-rc8 next-20260203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Crivellari/rust-add-system_dfl-around-the-new-system_dfl_wq/20260203-233415
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20260203152818.317806-2-marco.crivellari%40suse.com
patch subject: [PATCH v4 1/2] rust: add system_dfl() around the new system_dfl_wq
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260204/202602040119.xqN5Fe8s-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040119.xqN5Fe8s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040119.xqN5Fe8s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `system_dfl_wq`
   --> rust/kernel/workqueue.rs:972:80
   |
   972 | /// Note: `system_unbound_wq` will be removed in a future release cycle. Use [`system_dfl_wq`] instead.
   |                                                                                ^^^^^^^^^^^^^ no item named `system_dfl_wq` in scope
   |
   = help: to escape `[` and `]` characters, add '\' before them like `\[` or `\]`
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default
--
>> warning: unresolved link to `system_unbound_wq`
   --> rust/kernel/workqueue.rs:984:68
   |
   984 | /// Note: `system_dfl_wq` will replace in a future release cycle [`system_unbound_wq`].
   |                                                                    ^^^^^^^^^^^^^^^^^ no item named `system_unbound_wq` in scope
   |
   = help: to escape `[` and `]` characters, add '\' before them like `\[` or `\]`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
