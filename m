Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130303EBF20;
	Sat, 24 Jan 2026 05:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769233022; cv=none; b=NSLpuHmvZTlYNJyUT49ZiXoutvrZg8sSbszy2n7Xe5zoDyHuWEQVgLbxwXndytWneqovTqyVZftuQ1stO8GF6OnJUprsnNlD1/iDIJIx5lCBhEgqyMXhqeshjEEHCP98Nb46xnhLA5Qq+SjJkMTnrZsOF5gOpm4pIt5ihnAqmoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769233022; c=relaxed/simple;
	bh=FxT5vpKwk3ZMUCufjNlcGkACv89Jt5O1d4ZBsZ1yDxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWcIuWC61fQiAe8RsCwq9nHyeY0GaRo8hzN3b4koUDSgSq7OkAJcTcJ3hYhFPQ24kIlvKELoBxNj3IT2xsX2REGNmKvgOd5mK3K0LbUm7LmXXjG0lgl1mwUVa4cpOqKzqpeqoZ805NEDe0KD5kUJNkuxKESNbiBKWmz9d+8wsMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEYlQXLe; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEYlQXLe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769233020; x=1800769020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FxT5vpKwk3ZMUCufjNlcGkACv89Jt5O1d4ZBsZ1yDxg=;
  b=aEYlQXLe5w14fXDt888rWkCAMbL3yMn9D6Q6S3e8cKalu/4IYlQorwau
   BCUcSMvqCsta0fhNrIlteiU+u/DYJW1o77arZqBboileaZYYUt0j6P63X
   Dx/NA+v8w3+V2sOrf1gk9y/cn3gzwYqRC8J9CikWLZoZMbHAXUjp41iJO
   OO44/TclylqJFC76LgMGxlVrUcy2as9imCWtEvvMV9yVLCOvOqWDjXrkI
   VxCN+e66bK29xGIttRrNjzuXst6/XpcW7lo0MToJwd5cSrOkl9fMlySFp
   kwM8WK7gJOrmENbO2V8Xty/d15XlZlyiadsFY33iwUp8FGvkv13fvyxLS
   w==;
X-CSE-ConnectionGUID: Z+EaxedNRRuAXi6zP4KanA==
X-CSE-MsgGUID: LS/pHQbhRQKGhQLoabYVkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74111472"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="74111472"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 21:37:00 -0800
X-CSE-ConnectionGUID: 6x3QASeiT++S8SXK8ENk+Q==
X-CSE-MsgGUID: NfYX69yHQhK1kQ67fRAoXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="207107407"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jan 2026 21:36:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjWKL-00000000UwY-38Yf;
	Sat, 24 Jan 2026 05:36:53 +0000
Date: Sat, 24 Jan 2026 13:36:07 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] rust: samples: usb: remove redundant `.as_ref()`
 for `dev_*` print
Message-ID: <202601241311.4vcnMzFr-lkp@intel.com>
References: <20260123175854.176735-6-gary@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123175854.176735-6-gary@kernel.org>

Hi Gary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Guo/rust-pci-remove-redundant-as_ref-for-dev_-print/20260124-020452
base:   a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
patch link:    https://lore.kernel.org/r/20260123175854.176735-6-gary%40kernel.org
patch subject: [PATCH v2 6/8] rust: samples: usb: remove redundant `.as_ref()` for `dev_*` print
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260124/202601241311.4vcnMzFr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601241311.4vcnMzFr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601241311.4vcnMzFr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `self`
   --> samples/rust/rust_driver_usb.rs:8:9
   |
   8 |         self,
   |         ^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
