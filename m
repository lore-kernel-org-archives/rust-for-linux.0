Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DC43C1970
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 17:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768498117; cv=none; b=FjIM0GcpRMcnFnt30FMdfH1jVRtD5wbZiUUGeTmjy7eYTQ+ck4m0LS7rGHBbbXVWmbtdK8qEG+ZZNMTn3eRaFroUXV6Gh+i9b2fBfQTIyaSRcFYHbncoc/DSNIW/lsthgbp+nvIMAwlwhNCMl9G4uWRHg7BIY6pFsAO7ymgfnb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768498117; c=relaxed/simple;
	bh=P6LyHnXwl97jHbEhU+1xZ3S5rlbWeSwOLxVdj5CzHFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZbz6uQ+9rfhY6W/jwhgThDlubk3FSKjDadnLDP4re6Nte8OGI1EBY6GwJXLu0zFPrZg3gQfVP4FvlwTju5OKHoG3Q8CZDNV5F8HbsE+eimpo3soiK2gx3EpL4jYI9pi6svy0ivfazTwJ2t7ilevUmeVUh+pXWcurQ7EtoY5JVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DiXoyk4b; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DiXoyk4b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768498116; x=1800034116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P6LyHnXwl97jHbEhU+1xZ3S5rlbWeSwOLxVdj5CzHFQ=;
  b=DiXoyk4bOVFRjs+gDFYAe0nG/YPxO+/dcCWmlJ6N2L1te5YsbBnrgtLv
   qB1XEPpisfbQclP+tAAflsB3nAY0JaKzVNKGGkZ5AyWjhGr/2ziJcx+Ah
   UxIuyXiuYFaWUhFVaO0TOhsLTMIR9DM7rzqxYK1xvdvFWIb8NSHo49lVb
   0CBvgIwUDnDFyHGosjRdBdG2eTbdcg/Oeodh1Cjif0ikwwf2JakUvmZUw
   XjzDTS2SIpfWIwfnSTMFRNyIGWOeUZoOnpjmtMflsKPFaF+5izjb6WwVO
   LSshghub35U+NxEraIhWU5jxmo5tEcttzYeCasp8egQyVA9O9LYRt45KT
   Q==;
X-CSE-ConnectionGUID: qptuub6cTmiHpPIvGqpg3Q==
X-CSE-MsgGUID: fXFKLyTtTwqQ+hK4EN3M3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69709537"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69709537"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 09:28:35 -0800
X-CSE-ConnectionGUID: 3exdOicFSFCvGWvaJ+T6tw==
X-CSE-MsgGUID: eCD674mvQpeeHyeVfRGR8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="204897663"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 Jan 2026 09:28:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgR94-00000000IlM-0fbh;
	Thu, 15 Jan 2026 17:28:30 +0000
Date: Fri, 16 Jan 2026 01:27:47 +0800
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>, Matthew Maurer <mmaurer@google.com>,
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	John Hubbard <jhubbard@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 5/9] rust: debugfs: implement Directory trait for Dir
Message-ID: <202601160158.7mf9LG1y-lkp@intel.com>
References: <20260113225408.671252-6-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113225408.671252-6-ttabi@nvidia.com>

Hi Timur,

kernel test robot noticed the following build errors:

[auto build test ERROR on 654826aa4a8f25cf825ad9254f37e6cb5092098f]

url:    https://github.com/intel-lab-lkp/linux/commits/Timur-Tabi/rust-pci-add-PCI-device-name-method/20260114-065717
base:   654826aa4a8f25cf825ad9254f37e6cb5092098f
patch link:    https://lore.kernel.org/r/20260113225408.671252-6-ttabi%40nvidia.com
patch subject: [PATCH v4 5/9] rust: debugfs: implement Directory trait for Dir
config: x86_64-randconfig-122-20260114 (https://download.01.org/0day-ci/archive/20260116/202601160158.7mf9LG1y-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601160158.7mf9LG1y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601160158.7mf9LG1y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0599]: no function or associated item named `new` found for struct `Dir` in the current scope
   --> rust/doctests_kernel_generated.rs:4085:16
   |
   4085 | let dir = Dir::new(c_str!("my_debugfs_dir"));
   |                ^^^ function or associated item not found in `Dir`
   |
   = help: items from traits can only be used if the trait is in scope
   help: trait `Directory` which provides `new` is implemented but not in scope; perhaps you want to import it
   |
   3    + use crate::rust_doctest_kernel_alloc_allocator_rs_0::kernel::debugfs::Directory;
   |
--
>> error[E0599]: no function or associated item named `new` found for struct `Dir` in the current scope
   --> rust/doctests_kernel_generated.rs:4145:16
   |
   4145 | let dir = Dir::new(c_str!("my_debugfs_dir"));
   |                ^^^ function or associated item not found in `Dir`
   |
   = help: items from traits can only be used if the trait is in scope
   help: trait `Directory` which provides `new` is implemented but not in scope; perhaps you want to import it
   |
   3    + use crate::rust_doctest_kernel_alloc_allocator_rs_0::kernel::debugfs::Directory;
   |
--
>> error[E0599]: no function or associated item named `new` found for struct `Dir` in the current scope
   --> rust/doctests_kernel_generated.rs:4204:16
   |
   4204 | let dir = Dir::new(c_str!("foo"));
   |                ^^^ function or associated item not found in `Dir`
   |
   = help: items from traits can only be used if the trait is in scope
   help: trait `Directory` which provides `new` is implemented but not in scope; perhaps you want to import it
   |
   3    + use crate::rust_doctest_kernel_alloc_allocator_rs_0::kernel::debugfs::Directory;
   |
--
>> error[E0599]: no function or associated item named `new` found for struct `Dir` in the current scope
   --> rust/doctests_kernel_generated.rs:3973:20
   |
   3973 | let debugfs = Dir::new(c_str!("parent"));
   |                    ^^^ function or associated item not found in `Dir`
   |
   = help: items from traits can only be used if the trait is in scope
   help: trait `Directory` which provides `new` is implemented but not in scope; perhaps you want to import it
   |
   3    + use crate::rust_doctest_kernel_alloc_allocator_rs_0::kernel::debugfs::Directory;
   |
--
>> error[E0599]: no function or associated item named `new` found for struct `Dir` in the current scope
   --> rust/doctests_kernel_generated.rs:4028:19
   |
   4028 | let parent = Dir::new(c_str!("parent"));
   |                   ^^^ function or associated item not found in `Dir`
   |
   = help: items from traits can only be used if the trait is in scope
   help: trait `Directory` which provides `new` is implemented but not in scope; perhaps you want to import it
   |
   3    + use crate::rust_doctest_kernel_alloc_allocator_rs_0::kernel::debugfs::Directory;
   |
--
>> error[E0599]: no function or associated item named `new` found for struct `Dir` in the current scope
   --> rust/doctests_kernel_generated.rs:11462:20
   |
   11462 |     let dir = Dir::new(pdev.name());
   |                    ^^^ function or associated item not found in `Dir`
   |
   = help: items from traits can only be used if the trait is in scope
   help: trait `Directory` which provides `new` is implemented but not in scope; perhaps you want to import it
   |
   3     + use crate::rust_doctest_kernel_alloc_allocator_rs_0::kernel::debugfs::Directory;
   |
--
>> error[E0599]: no function or associated item named `new` found for struct `Dir` in the current scope
   --> samples/rust/rust_debugfs.rs:136:28
   |
   136 |         let debugfs = Dir::new(c_str!("sample_debugfs"));
   |                            ^^^ function or associated item not found in `Dir`
   |
   = help: items from traits can only be used if the trait is in scope
   help: trait `Directory` which provides `new` is implemented but not in scope; perhaps you want to import it
   |
   34  + use kernel::debugfs::Directory;
   |
--
>> error[E0599]: no function or associated item named `new` found for struct `Dir` in the current scope
   --> samples/rust/rust_debugfs_scoped.rs:134:29
   |
   134 |         let base_dir = Dir::new(c_str!("rust_scoped_debugfs"));
   |                             ^^^ function or associated item not found in `Dir`
   |
   = help: items from traits can only be used if the trait is in scope
   help: trait `Directory` which provides `new` is implemented but not in scope; perhaps you want to import it
   |
   9   + use kernel::debugfs::Directory;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
