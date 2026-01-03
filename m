Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2A4248F5A;
	Sat,  3 Jan 2026 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767450506; cv=none; b=HfoKnwp0uRnDOI+Ms+XVStv6mfcB1nFiKqXyjaH6yQmNauneRksuPN/Jm+2SdAqPRxCMQlZgU99Jcfyst/BiUQWOsO83Z2IhijF4TqDg5wN3+gg7nqUois69mTs4OWtShR8Np+Rxs/W0/3jBgPNhB/TygUEoJy855e9ey/QZCPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767450506; c=relaxed/simple;
	bh=VEXaGo2DCaFhuwJSYRD7mwidNsifYMsc2iWnuMabtz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ck31qOgqRoB4IxMWYtWk/oMHlVLFHRxtDd1zn3YNC7/oLfqqrYevY8MHj1K8Dtsw40rDA27RcF3Jm+UJ/ISZBLYOBVPSJwejiP28bPcJoA+6wrCH1RcYeBb1mBsA9lIQRv1y1Nj6u0kkJZ3Jk9RCU53gCV/d5W69QMnNV3MX0ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UlWQ5cHS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UlWQ5cHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767450505; x=1798986505;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VEXaGo2DCaFhuwJSYRD7mwidNsifYMsc2iWnuMabtz8=;
  b=UlWQ5cHS7s3LDYTs1yPqSpcZLZvvh6tlYIw5YRxQlkuHJMb9NMQ7tHEw
   pNGRjHZFh8mU8gEFIcP1lWvN+gATswUHpneZ0bBHNIUR8f0pDKOlE/lus
   etbH/zSvMH7BQMW6klZQ0z4H8xs+SKvPgs3haPuxLwhqUX68mQHwg+9T7
   Cob0zNj/w/wTyj0HY/hhjYv36eKlaL36XgvFhwN2F01kdHDXE88Yc9n83
   /fOGaDGunhrHQQA3R7HCF+QBH+VxAMzP8i9JuLR6rCM+VLdENnCphN+Eu
   UBITtIAZokfjCtttbk4/7yKsJSk5AoHhODIjSisNXbUwhbY/Z+kjuQvuL
   A==;
X-CSE-ConnectionGUID: JMtii84+TWKj0S39vjfLmw==
X-CSE-MsgGUID: QuOmlewrS9i9zM7hpXbQaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68809059"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="68809059"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 06:28:24 -0800
X-CSE-ConnectionGUID: PHs/u2mNTECGxKh3vTDqAQ==
X-CSE-MsgGUID: 3U0rgGSfQVisFca1RHWokA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="239467274"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 03 Jan 2026 06:28:19 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vc2c4-000000000iL-384z;
	Sat, 03 Jan 2026 14:28:16 +0000
Date: Sat, 3 Jan 2026 15:28:13 +0100
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
Subject: Re: [PATCH v10 6/7] rust: ww_mutex: implement LockSet
Message-ID: <202601031513.bVzSj6aK-lkp@intel.com>
References: <20260103073554.34855-7-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260103073554.34855-7-work@onurozkan.dev>

Hi Onur,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/locking/core]
[also build test WARNING on rust/rust-next linus/master v6.19-rc3 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Onur-zkan/rust-add-C-wrappers-for-ww_mutex-inline-functions/20260103-153912
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20260103073554.34855-7-work%40onurozkan.dev
patch subject: [PATCH v10 6/7] rust: ww_mutex: implement LockSet
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260103/202601031513.bVzSj6aK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260103/202601031513.bVzSj6aK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601031513.bVzSj6aK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: this let-binding has unit value
   --> rust/kernel/sync/lock/ww_mutex/lock_set.rs:273:17
   |
   273 |                 let _ = lock_set.lock(&mutex1)?;
   |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: omit the `let` binding: `lock_set.lock(&mutex1)?;`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#let_unit_value
   = note: `-W clippy::let-unit-value` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::let_unit_value)]`
--
>> warning: matching over `()` is more explicit
   --> rust/kernel/sync/lock/ww_mutex/lock_set.rs:273:21
   |
   273 |                 let _ = lock_set.lock(&mutex1)?;
   |                     ^ help: use `()` instead of `_`: `()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ignored_unit_patterns
   = note: requested on the command line with `-W clippy::ignored-unit-patterns`
--
>> warning: this let-binding has unit value
   --> rust/kernel/sync/lock/ww_mutex/lock_set.rs:274:17
   |
   274 |                 let _ = lock_set.lock(&mutex2)?;
   |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: omit the `let` binding: `lock_set.lock(&mutex2)?;`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#let_unit_value
--
>> warning: matching over `()` is more explicit
   --> rust/kernel/sync/lock/ww_mutex/lock_set.rs:274:21
   |
   274 |                 let _ = lock_set.lock(&mutex2)?;
   |                     ^ help: use `()` instead of `_`: `()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ignored_unit_patterns

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
