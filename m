Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0CD3596F1;
	Fri,  9 Jan 2026 09:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767951869; cv=none; b=Ppjg4fuF/zNRlBgd0mZrzTJr6NiGAVzs5qDLYovdCg/UlRm/ZAI7pYnpJSGoL/Y1dz4+s2+FKJXCCSnyap5nddxhI2fwdnefb1Bm7Kf3LWwRNVnfzGv8z0sleaH3GG+wXFlA2cLOl889rRzyVKnMkYSz43pfivJREjeWDnb98dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767951869; c=relaxed/simple;
	bh=IJxznVoX5ne1r388YU++/zYk6bsR+JbaDIGMXKa2qFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkg/Qywx4QPW8o8jH7bitR2xPdAQ6HSN19j1Xf8OIAFMIpnNcIJ5pgIvuD8yEcUGCg/Nf6wlBPKXtA4M3PyG+U3bpwALorJSi0XS/BybCrH7Z8CLkQ1qFKx+84x5EPnK2STU9xRIsz21bzgtEKAEFupqYL8fDHq6yjoYCmzopHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X2St/wIL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X2St/wIL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767951866; x=1799487866;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IJxznVoX5ne1r388YU++/zYk6bsR+JbaDIGMXKa2qFE=;
  b=X2St/wILQ0roaSFhS2yxrF+tY9eTkmzR+pbg3HQU8trz3oBVOWn3gh+A
   qX9VXUCXZbwH9kWqHzn7XnbrYtjamqESQy1M4am2ILFYXgyQBWnCZB9b7
   CxVhFVOAeQ6Ax2Z37rH6KJuX+3ndtdq6D5PgyH+YuEngTKX4odNAgPMTP
   qmjrR9quNRG1q4AYHGL0N7v7zaIyt5pTVZGofRgZtkihru+PbTxUXX1j+
   Jqmv76f9tJsh34Vn7KxMjbyC0xAdnmQ8aTku1MGdFJZlkbUWG2vwFc2hn
   kwhEbqeiQ7h5QMzKtji6c/Ltyic6PU6jjX/ty2s1X8qqVEtyo7hLmTeWT
   Q==;
X-CSE-ConnectionGUID: mL0/+08ySiC2Br+Edk/a+Q==
X-CSE-MsgGUID: swp+VWyxRRiXmMFOeUJMEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79629231"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="79629231"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 01:44:25 -0800
X-CSE-ConnectionGUID: cjXF3zoNSOaQ7AzVDVz3MA==
X-CSE-MsgGUID: sf8wvSN6TxKjT8vIVNKvCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="207581254"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 09 Jan 2026 01:44:22 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve92Z-0000000022u-1yss;
	Fri, 09 Jan 2026 09:44:19 +0000
Date: Fri, 9 Jan 2026 10:44:00 +0100
From: kernel test robot <lkp@intel.com>
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/12] rust: pin-init: internal: init: add escape hatch
 for referencing initialized fields
Message-ID: <202601091003.kjIJiuUn-lkp@intel.com>
References: <20260108135127.3153925-13-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108135127.3153925-13-lossin@kernel.org>

Hi Benno,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rust/rust-next]
[also build test WARNING on linus/master v6.19-rc4 next-20260109]
[cannot apply to rust/pin-init-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benno-Lossin/rust-pin-init-allow-the-crate-to-refer-to-itself-as-pin-init-in-doc-tests/20260108-234753
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20260108135127.3153925-13-lossin%40kernel.org
patch subject: [PATCH 12/12] rust: pin-init: internal: init: add escape hatch for referencing initialized fields
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260109/202601091003.kjIJiuUn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601091003.kjIJiuUn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601091003.kjIJiuUn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: large size difference between variants
   --> rust/pin-init/internal/src/init.rs:59:1
   |
   59 | / enum InitializerAttribute {
   60 | |     DefaultError(DefaultErrorAttribute),
   | |     ----------------------------------- the largest variant contains at least 224 bytes
   61 | |     DisableInitializedFieldAccess,
   | |     ----------------------------- the second-largest variant carries no data at all
   62 | | }
   | |_^ the entire enum is at least 224 bytes
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#large_enum_variant
   = note: `-W clippy::large-enum-variant` implied by `-W clippy::all`
   = help: to override `-W clippy::all` add `#[allow(clippy::large_enum_variant)]`
   help: consider boxing the large fields to reduce the total size of the enum
   |
   60 -     DefaultError(DefaultErrorAttribute),
   60 +     DefaultError(Box<DefaultErrorAttribute>),
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
