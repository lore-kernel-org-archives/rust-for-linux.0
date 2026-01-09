Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7081A350D4C;
	Fri,  9 Jan 2026 08:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767948327; cv=none; b=Z0/jDg6bqRXCBbDly9ChsDXjrg77pnWciaVit1UT7AR+eNMxkXQb2Jl5Ex84RtbzyVnOmS7EaeroR+H+J4zZoHwvDGROG+pG2nZthprty209DjuMN7IYwqfJ3wrGxDOWR+E4+YVutotjgL9bY2t/344drnpHgzAsyT1iLYvf++k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767948327; c=relaxed/simple;
	bh=+R9ZQNbcrHscdGDFavQLmbf+oRUkezZn5P5k8m+NfNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcEsMb84m7UXCh39Y5UZuLebcpVU9HfXjx+Kn67EHw2RHEsKSmtyoPlWXYWfcsZzO1C9U7bvf0b7p6vQxz9OTG+M3eJ8ro8BALvjvd9ErUG5yoMgEDSo5fu4nD8LyLjUa8qTcilwOogB18hQ6k3XOWBd+iNx+k/0sd2LQtut7uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnSiN7qm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnSiN7qm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767948325; x=1799484325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+R9ZQNbcrHscdGDFavQLmbf+oRUkezZn5P5k8m+NfNI=;
  b=VnSiN7qm5ZQSmnXN/H6+47Vl4JO/zkXKgNdBjNk1zlPjNP8Ax0qlsZfn
   31KFklgsCJ9GiYM0xnyIv8hdvdqWkEa7718VXN1ym2BovkWVMHl+nAXfk
   NnnwxL/k42IOzllR47wq43r/cxY0v68u0pTpl6x9R00cLDpTX/6hCJOcE
   I8eEr390tU4ohoh+l0X9VvAECP+vgZ1TsqzszsJiVTXpERyk05pWRTaCf
   rr7JsIcNqcuRwTn3B1yza6hvfdiWFt+CzKxLatXts4FJSL4///Q/Sd8C2
   Agzp48ZHlNA2Le2ZBdNh9U4sI5wZlcgg36SmOqS07iMGNiBYUhLaP6PI+
   g==;
X-CSE-ConnectionGUID: yHVAzyS5RxCG/biU6wK4UQ==
X-CSE-MsgGUID: 3UbAXhL9Qri1jq8gDYoPqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="72963615"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="72963615"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 00:45:24 -0800
X-CSE-ConnectionGUID: VKE8T/f/Rt2G+Dw/Lmq2Lw==
X-CSE-MsgGUID: 2H9icBJKTneWzTPzMBoglg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="203044676"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jan 2026 00:45:21 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve87S-0000000022C-3wgx;
	Fri, 09 Jan 2026 08:45:18 +0000
Date: Fri, 9 Jan 2026 09:44:26 +0100
From: kernel test robot <lkp@intel.com>
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Alban Kurti <kurti@invicto.ai>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 08/12] rust: pin-init: rewrite the initializer macros
 using `syn`
Message-ID: <202601090928.HMBGPBHb-lkp@intel.com>
References: <20260108135127.3153925-9-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108135127.3153925-9-lossin@kernel.org>

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
patch link:    https://lore.kernel.org/r/20260108135127.3153925-9-lossin%40kernel.org
patch subject: [PATCH 08/12] rust: pin-init: rewrite the initializer macros using `syn`
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260109/202601090928.HMBGPBHb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601090928.HMBGPBHb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601090928.HMBGPBHb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unreachable `pub` item
   --> rust/pin-init/internal/src/init.rs:12:1
   |
   12 | pub struct Initializer {
   | ---^^^^^^^^^^^^^^^^^^^
   | |
   | help: consider restricting its visibility: `pub(crate)`
   |
   = help: or consider exporting it for use by other crates
   = note: requested on the command line with `-W unreachable-pub`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
