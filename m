Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBB52E22AA;
	Fri,  9 Jan 2026 07:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767944726; cv=none; b=I5EJ+pVpyPBQgSNRy2XVUa/7lms40Zu5qv4RmUMUudp66a0wVHUOa15bNhsdyz8ukKBPAq1ulQkCZaRYKi+39sHWGaiyJL2zDUKgMp6hHYHNlSfQzBZLz4v2M0J9e7u+8FPcxxT2DfCXgf7JviDzIL6/fshNYMyWbiYxiRHFrLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767944726; c=relaxed/simple;
	bh=B9AuQJTXV9wQV7VS4Se1Qf45TehA6mrvp6M/nzMRcdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f6QMXtj9qhFmKcC9pEQLP3m0aHjHksi/a0ipTBPMtPsE2za2NqMO2z/bmJR+sTFczYHHcvsyh5wfp0R9WnQjCGJJkLlzHoJDaaR+1ZBjFCAnpC303PLAAt3JzfZy9Pcb70YkYXg/QYMkvzWGmyHYYBYl/CmUtfBkEoyauRr2mEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mR2bxLcc; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mR2bxLcc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767944724; x=1799480724;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B9AuQJTXV9wQV7VS4Se1Qf45TehA6mrvp6M/nzMRcdI=;
  b=mR2bxLccs1bfZmW6UeZgDXA24tugPQ5CxemNGpCcERaIDMQSyT/x+yof
   bHhPNyccha2aQCMSlMprg04VdHx5EVDGiT00FFmLIuEUhy+puy1wDmOUB
   +PVRREZ+hZv9we/+H7c9F82uLN/DZNCzqGhp1RvN24ev+UbdTxAqud/Bc
   OTJZ62qgFEeT/VXNbelTt+DjSdEoVbrJwuMCjEIsgdaM7+oGCsMWhLSLN
   fvqXV0R++A5BnSsg+jof4kyQ7cVKDUJVKhrnlO2ZYXwZFXm4S9GRTOWnC
   xx/JeK5v9+IcpYupk5sGKwqg4EzvijW426xA2zRwxzlgm3QoOPHlk+Hof
   A==;
X-CSE-ConnectionGUID: G6ENd4vAT9+LXXFo3eQwOQ==
X-CSE-MsgGUID: buBwe7HTR06ILkaGRm0NCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="86912509"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="86912509"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 23:45:24 -0800
X-CSE-ConnectionGUID: +++36T+mSqqo6gfRQWD6Qg==
X-CSE-MsgGUID: 54QTaAWYQ+SKatFi2ottTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="207941505"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 08 Jan 2026 23:45:20 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve7BO-0000000021A-0u91;
	Fri, 09 Jan 2026 07:45:18 +0000
Date: Fri, 9 Jan 2026 08:45:15 +0100
From: kernel test robot <lkp@intel.com>
To: Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alban Kurti <kurti@invicto.ai>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 06/12] rust: pin-init: rewrite `#[pin_data]` using `syn`
Message-ID: <202601090815.gvBfNWeh-lkp@intel.com>
References: <20260108135127.3153925-7-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108135127.3153925-7-lossin@kernel.org>

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
patch link:    https://lore.kernel.org/r/20260108135127.3153925-7-lossin%40kernel.org
patch subject: [PATCH 06/12] rust: pin-init: rewrite `#[pin_data]` using `syn`
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260109/202601090815.gvBfNWeh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601090815.gvBfNWeh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601090815.gvBfNWeh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: hidden lifetime parameters in types are deprecated
   --> rust/pin-init/internal/src/pin_data.rs:24:33
   |
   24 |     fn parse(input: syn::parse::ParseStream) -> Result<Self> {
   |                     ------------^^^^^^^^^^^
   |                     |
   |                     expected lifetime parameter
   |
   = note: `-W elided-lifetimes-in-paths` implied by `-W rust-2018-idioms`
   = help: to override `-W rust-2018-idioms` add `#[allow(elided_lifetimes_in_paths)]`
   help: indicate the anonymous lifetime
   |
   24 |     fn parse(input: syn::parse::ParseStream<'_>) -> Result<Self> {
   |                                            ++++

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
