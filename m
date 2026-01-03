Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA8A2192F2;
	Sat,  3 Jan 2026 05:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767418882; cv=none; b=Z5XRRCPCUkPLUBa1MPi+hotwnyidEtoh4VJ71VtSfC8geR31dItdE0TLT3jDMlyLhb6qwypXj4J8GyxSuzGEDVNfaBJCJ0EWUCDNsI8Yi+m/PWKozyqEK0O5RqaliH1igt2WZT8FqU7cWCRyAJwVp2GU4pRJV3hdgkZzwQpW1xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767418882; c=relaxed/simple;
	bh=hzJRWhz3myzjv4bNHLS23CIeXz7rdFoYsTg/LK+a0CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7ZuA7ha/xpe+uFLf2ufdkxOkNI31NVtBth3YhxnMD48mTTu0ctIe5Qz2Z8EQA/uYPaMfDPMySaTnstdMcFLuEMlfgkvSREHGWU/w1uJMMdAJ4JWW0Wupjw8NC0CqsHjSQvvLgBBrPMy5eOpUf/EX7Ez4f7c473uxErsuf5n9xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKlhx8Mx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKlhx8Mx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767418879; x=1798954879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hzJRWhz3myzjv4bNHLS23CIeXz7rdFoYsTg/LK+a0CA=;
  b=KKlhx8MxEvolGflHamNKgPAI1JhOEYQbljAl+rpuOdjau4eKJZL5J6R9
   sMvNMWnP8947NWx0JPs4UPsD9GdYb8xsgy3JsNlT2QTIcBk7WbJRf2zxT
   wKT/YS9KJJsbr2QNldnl/wHzxSKv1ea+ZflSuQC8u7yEmeRAwAhjdaUAZ
   X56WREG2Gz23/UpcR8p0Votkf2uZN35YXF3kk6JRRQRTL6LL2E20m4I5c
   X6xjNaL/4iT3o7NVnqiTA924xIpjpith79W6VSLRURO5mwPtvoT7maa1D
   JMQiShqZfNyXGcaCJFasFnFLT/pMUXelIMQT2nH89ayBNYQ9Iatw65Ca9
   A==;
X-CSE-ConnectionGUID: Evu+1/kyTv2Gu5mnFe6yOw==
X-CSE-MsgGUID: XXOYB1ocS2S8W8+fyyqgtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68935376"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="68935376"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 21:41:18 -0800
X-CSE-ConnectionGUID: oXaF442BQAGMmB1v9YxQiw==
X-CSE-MsgGUID: FSm4v2TUT+OoRxS3UIF/qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="202908463"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 02 Jan 2026 21:41:14 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbuO0-000000000cH-0lnt;
	Sat, 03 Jan 2026 05:41:12 +0000
Date: Sat, 3 Jan 2026 06:40:34 +0100
From: kernel test robot <lkp@intel.com>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, lossin@kernel.org, lyude@redhat.com,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, longman@redhat.com,
	felipe_life@live.com, daniel@sedlak.dev,
	daniel.almeida@collabora.com, thomas.hellstrom@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH v9 5/7] rust: ww_mutex: add Mutex, AcquireCtx and
 MutexGuard
Message-ID: <202601030632.SukxzGNs-lkp@intel.com>
References: <20260102175302.194435-6-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102175302.194435-6-work@onurozkan.dev>

Hi Onur,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/locking/core]
[also build test ERROR on rust/rust-next linus/master v6.16-rc1 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Onur-zkan/rust-add-C-wrappers-for-ww_mutex-inline-functions/20260103-021353
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20260102175302.194435-6-work%40onurozkan.dev
patch subject: [PATCH v9 5/7] rust: ww_mutex: add Mutex, AcquireCtx and MutexGuard
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260103/202601030632.SukxzGNs-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260103/202601030632.SukxzGNs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601030632.SukxzGNs-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> error: expected item, found `>>`
   --> rust/kernel/sync/lock/ww_mutex.rs:440:1
   |
   440 | >>>>>>> 90f935950ff8 (rust: ww_mutex: add Mutex, AcquireCtx and MutexGuard)
   | ^^ expected item
   |
   = note: for a full list of items that can appear in modules, see <https://doc.rust-lang.org/reference/items.html>
--
>> error: expected item, found `>>`
   --> rust/kernel/sync/lock/ww_mutex.rs:440:1
   |
   440 | >>>>>>> 90f935950ff8 (rust: ww_mutex: add Mutex, AcquireCtx and MutexGuard)
   | ^^ expected item
   |
   = note: for a full list of items that can appear in modules, see <https://doc.rust-lang.org/reference/items.html>
--
   Error writing files: failed to resolve mod `ww_mutex`: cannot parse rust/kernel/sync/lock/ww_mutex.rs
>> error: expected item, found `>>`
   --> rust/kernel/sync/lock/ww_mutex.rs:440:1
   |
   440 | >>>>>>> 90f935950ff8 (rust: ww_mutex: add Mutex, AcquireCtx and MutexGuard)
   | ^^ expected item
   |
   = note: for a full list of items that can appear in modules, see <https://doc.rust-lang.org/reference/items.html>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
