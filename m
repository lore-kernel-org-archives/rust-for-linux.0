Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E384C2C86D;
	Sat, 28 Mar 2026 05:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774677240; cv=none; b=LhcSPf9hWsTlgMFA9PpRLQWYPNbiRJdBzhP6WhwyYFeR9a6Zh0SBp5BqzrjX1nGp96XVr0A3U4T6oeQ3ZA06EZgRkL4sqDmSqNV5OqJnvDeft9vtdr+RBfMenv7ZbccjVvziHnTNBiCFrJCTt8jV25wf8JAc+OtU+PWRXiBqzew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774677240; c=relaxed/simple;
	bh=NovnRvKKD8DcWILq6IiXVqzkoes/2l5rAXk7H72hnKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxtyRKy5jmIfojzOv8By1jbisIpq4WY1xFRaR+4xHMptSHcsFglbp0WnDgPiPWRWaORwPw1rP2pn1hQz93zmWqX8NOg9YVVFD5oZhVE+LQcoUIjj1xf4Ynp0FbfyHiymHLYlYaFeQ4BWkPLtTYZ834JIphxVUx64LaHpNSUaN7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZt+6wHK; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZt+6wHK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774677237; x=1806213237;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NovnRvKKD8DcWILq6IiXVqzkoes/2l5rAXk7H72hnKc=;
  b=YZt+6wHK4tKxCNmAs2d/+oiwKZArqyPoh2Kn+fIjGj5lcZ/+ZNwttrUZ
   Q3CsfTb/H33HuC/QpOaVrfsN+yeiyTO1X7T0McmKmPw3dM/E9I0J/a/ZS
   Ut5hP8OXcvG9QZ2d1vqGkrbAvjiN36oW+PCwM7GbUALEqGVcRN5We6g17
   aH8r1zC5VvjTRdfRZsN88FVMEzV6uo+Rj6XLcssErSJPSz+El4L2XhcCm
   EJA66q6X3yJ/cdGy1xfL6pJtjroq+Fc6ZEP4PPcYUKmcuAQwtSYXJ+e/W
   cTMcBIlDWhrTDLfqKRmc3Zq+0HoGF4KT2s3Yg+3/x5uKE6KtLEehTtt7V
   Q==;
X-CSE-ConnectionGUID: MzQ41dPsTIWvFTAQ8vCRHg==
X-CSE-MsgGUID: i22/VJB0RcK8joLykvMKug==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75626514"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="75626514"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 22:53:56 -0700
X-CSE-ConnectionGUID: fiTMB2pTRdaD1Ju/PCFH7Q==
X-CSE-MsgGUID: tNxAW/sFQfSpkfmm/VY48w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="224708881"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Mar 2026 22:53:52 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6McH-00000000B6X-03aN;
	Sat, 28 Mar 2026 05:53:49 +0000
Date: Sat, 28 Mar 2026 13:53:20 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alistair Popple <apopple@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, John Hubbard <jhubbard@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v3] gpu: nova-core: gsp: fix undefined behavior in
 command queue code
Message-ID: <202603281331.1ESuqgfz-lkp@intel.com>
References: <20260326-cmdq-ub-fix-v3-1-96af2148ca5c@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-cmdq-ub-fix-v3-1-96af2148ca5c@nvidia.com>

Hi Alexandre,

kernel test robot noticed the following build errors:

[auto build test ERROR on dff8302ca1d0e773c90dbeeb05e759f995c95482]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Courbot/gpu-nova-core-gsp-fix-undefined-behavior-in-command-queue-code/20260327-003216
base:   dff8302ca1d0e773c90dbeeb05e759f995c95482
patch link:    https://lore.kernel.org/r/20260326-cmdq-ub-fix-v3-1-96af2148ca5c%40nvidia.com
patch subject: [PATCH v3] gpu: nova-core: gsp: fix undefined behavior in command queue code
config: x86_64-randconfig-102-20260327 (https://download.01.org/0day-ci/archive/20260328/202603281331.1ESuqgfz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603281331.1ESuqgfz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603281331.1ESuqgfz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: rust_build_error
   >>> referenced by build_assert.rs:28 (rust/kernel/build_assert.rs:28)
   >>>               vmlinux.o:(<nova_core::gsp::cmdq::DmaGspMem>::allocate_command)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
