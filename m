Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B36D2E974D;
	Tue, 12 Aug 2025 09:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754992620; cv=none; b=oYNJill4xFPtQoU+ujMBxukopHkaPqrhg9UUyEpLT9AAvVRt15RNit1WFC8BYsjPOoJUIUu64W2K3hfVd8OMyCwuFE056P7H6wv62ioBh677CMR0t/EtNs0xIcALvjwQm3tg47pzKT8AfvYXKjRUvmmfoXo0Z+l/o4NO65D3WM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754992620; c=relaxed/simple;
	bh=kZ2l5x950PA0cR5I+Bh1ES8Lujux+bvQVQOPWBN9iz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjODPMt4Peie6rkKPt/dyJ0QAPjfFBV1ULJOLPwTRZWOFFM0rgppz8jy/6dXmzcO/b8ZBPu1GxhmbhSqvrnW8fZssNS/fBohRbqN+zdu1tPC92saVCGOOdInSOvu6wFmObirz3NhpPqaiPxWq6FfJcCfzCZQmSNfCpnxogD1JXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fxOupTQL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fxOupTQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754992618; x=1786528618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kZ2l5x950PA0cR5I+Bh1ES8Lujux+bvQVQOPWBN9iz0=;
  b=fxOupTQLXW2woqAZkKM0GBwShs4XLJcDPFw47AGMJq5WzEIdlU9dQtHW
   2IshLG/RJl8NERSSxDS+7ak3LzN7i6p7LITkYOywXozbzaL9BWfqcISVN
   3+zJAzE3XNbJWfs5ClFN0ZJmgL04pI6bXZFkaTBPYCWSt81yXQztSAcO5
   thFs+H0Xh6GbE0lSIuk17hTUa0tQ4xshAgPrZN6GBneXlSkyHVgmeF8cQ
   k/b9QX7ppc/7gXjaAPP5ZBtml0rrcWUL8+7WA1GY7PX8JuOkjHnCTKzMe
   l1nm1MEEFQxy4zbXzKOrouRBdSAe4JotS963EqNE99k1QTPPu0uNzMg1A
   Q==;
X-CSE-ConnectionGUID: Y2Z3js9JRT+KIe+iW1Rzgw==
X-CSE-MsgGUID: 08MeM3WYRgm0d8TErknVuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67968760"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="67968760"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 02:56:58 -0700
X-CSE-ConnectionGUID: RkPC6m94SoKqMbnl2CRniA==
X-CSE-MsgGUID: 9h5Ou5W5QQuC4liiIRCzig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165655966"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 12 Aug 2025 02:56:54 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ullk8-0006eW-2k;
	Tue, 12 Aug 2025 09:56:39 +0000
Date: Tue, 12 Aug 2025 17:55:05 +0800
From: kernel test robot <lkp@intel.com>
To: ~_xllx_ <_xllx_@git.sr.ht>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH linux] of: resolves TODO for copy_from_slice
Message-ID: <202508121650.l7ZSniGd-lkp@intel.com>
References: <175489428990.9320.6825335165759789458-0@git.sr.ht>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175489428990.9320.6825335165759789458-0@git.sr.ht>

Hi ~_xllx_,

kernel test robot noticed the following build errors:

[auto build test ERROR on linux/master]

url:    https://github.com/intel-lab-lkp/linux/commits/_xllx_/of-resolves-TODO-for-copy_from_slice/20250811-144924
base:   linux/master
patch link:    https://lore.kernel.org/r/175489428990.9320.6825335165759789458-0%40git.sr.ht
patch subject: [PATCH linux] of: resolves TODO for copy_from_slice
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250812/202508121650.l7ZSniGd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508121650.l7ZSniGd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508121650.l7ZSniGd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0080]: evaluation of constant value failed
   --> rust/doctests_kernel_generated.rs:6978:11
   |
   6978 |          (of::DeviceId::new(c_str!("test,device")), ())
   |           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation panicked: copy_from_slice: source slice length does not match destination slice length
   |
   note: inside `rust_doctest_kernel_alloc_kbox_rs_7::kernel::of::DeviceId::new`
   --> rust/kernel/of.rs:42:9
   |
   42   |         of.compatible.copy_from_slice(src);
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ the failure occurred here
--
>> error[E0080]: evaluation of constant value failed
   --> samples/rust/rust_driver_platform.rs:88:7
   |
   88 |     [(of::DeviceId::new(c_str!("test,rust-device")), Info(42))]
   |       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation panicked: copy_from_slice: source slice length does not match destination slice length
   |
   note: inside `kernel::of::DeviceId::new`
   --> rust/kernel/of.rs:42:9
   |
   42 |         of.compatible.copy_from_slice(src);
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ the failure occurred here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
