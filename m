Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED2E3A1B5;
	Sun, 21 Dec 2025 12:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766321771; cv=none; b=aaISfs7kUq4yThxCZaE+OobbQNFqUrhCb4QZKWzQ18ZcHZmO/7iZFP+hOWoAnJhqWZy04UThEh4PvSRf84Ej2qT7vQr8+bquWNS1mFVPa6qijOvME9dyPtzG5epD7tc5xH6Lzso1P8kYeowI2580obSh36PR2MW3935hRBvT4/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766321771; c=relaxed/simple;
	bh=N7NHTxid8yacV9LmMZv3GiH9rqE+GSW/aaVG38SLO2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OaTL5Z+OShmHLjLyioaROTq/wyXm7OzgBb9nz764lZQ3sAYeXt1U19fTY8eb/BnOxj3BttoXsLhG2hsx2Rvi/mqonpoZvoCEJCbvpCDDCnu+RlkrR1yTH/CH/unV6PNX6YJslx7GHKBqMLp+qwcz07T0BB8KwxOef3B8+XHpgBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MmYszv5X; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MmYszv5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766321771; x=1797857771;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N7NHTxid8yacV9LmMZv3GiH9rqE+GSW/aaVG38SLO2c=;
  b=MmYszv5XjgoSwxXbYeuC/fSk3ZfSyWL5vCy7HSfmIk2AH5SHyu1ArGUn
   0sbHv0AxYMLRnwn90QZPFeB6ub4e3e3Fhr8dzXsdbM2uRRcVFsN6bqu7Q
   87yniupSgfvhofH/K7ZssO5mwCvXOeYnDEHgyUs/HghaBdD776oAmnm8Z
   E8YUsQbrXZQi7Sj2FOuVkXcmQW2tcF77CHABjq3ZGYFa3oJW+Wg5WjlId
   OUSE5rFtfRoBVg1iQHBEpsdSyr5q8ahhCZEveL/bkPHrUFlp9E3dIldhp
   mNmtjnO1Urf6SUfUUuukTviaAxxeDwrc7vOzHnoT53gGOUSxtDkHcuJ9s
   A==;
X-CSE-ConnectionGUID: S0Ees2DhTIeRePPxLjN+qw==
X-CSE-MsgGUID: Vg+enHZvQS2w93tgqyXZZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78922140"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78922140"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 04:56:03 -0800
X-CSE-ConnectionGUID: T3harOe5Sy+FFUZAbgnesQ==
X-CSE-MsgGUID: m5TyObk+QUSRXptB26i0Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199205661"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 21 Dec 2025 04:56:00 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXIyc-0000000053s-0SQE;
	Sun, 21 Dec 2025 12:55:58 +0000
Date: Sun, 21 Dec 2025 13:55:43 +0100
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH] rust: sync: implement Unpin for ARef
Message-ID: <202512211302.CuYHRqLX-lkp@intel.com>
References: <20251217-unpin-for-aref-v1-1-84711b747d02@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217-unpin-for-aref-v1-1-84711b747d02@google.com>

Hi Alice,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Alice-Ryhl/rust-sync-implement-Unpin-for-ARef/20251218-013900
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251217-unpin-for-aref-v1-1-84711b747d02%40google.com
patch subject: [PATCH] rust: sync: implement Unpin for ARef
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251221/202512211302.CuYHRqLX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211302.CuYHRqLX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211302.CuYHRqLX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0277]: the trait bound `T: sync::aref::AlwaysRefCounted` is not satisfied
   --> rust/kernel/sync/aref.rs:87:19
   |
   87 | impl<T> Unpin for ARef<T> {}
   |                   ^^^^^^^ the trait `sync::aref::AlwaysRefCounted` is not implemented for `T`
   |
   note: required by a bound in `sync::aref::ARef`
   --> rust/kernel/sync/aref.rs:68:20
   |
   68 | pub struct ARef<T: AlwaysRefCounted> {
   |                    ^^^^^^^^^^^^^^^^ required by this bound in `ARef`
   help: consider restricting type parameter `T` with trait `AlwaysRefCounted`
   |
   87 | impl<T: sync::aref::AlwaysRefCounted> Unpin for ARef<T> {}
   |       ++++++++++++++++++++++++++++++

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
