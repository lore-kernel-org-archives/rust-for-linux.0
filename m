Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D232D47FF;
	Sat,  7 Mar 2026 12:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772885056; cv=none; b=IXA/b+KB7QovlOP6KO/gp4cmnjFBPd+pczilrSzz0GS3aIqHjgMYL2QdfPh9Fa++1PQAsmn7JmHm6oTSUCulzfhYlgk3LigzGnzHj1eJJS7ak27Lgh2cHWVbJo+TWVxzi28+ZTew8d2wFnD9GyS2+Ud1qrC7n6D60+ngN4CeZZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772885056; c=relaxed/simple;
	bh=1PvKYukyaRzl1NZUan8LwurnhLCl+JYAX732iKgm2Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDiZPIpRx0Fx7G21u7Szk0JECRAr/mXxT/R7qfOrv+78GmEfhQOqagz7zK/O9y9eIX0Xmmr71JwJSJmzHKuY7cUeA0cksNJCu36ypr+IqVzHVdREZMmvqCVJkyT4km+Rb1hhpZxhc6yOHKOuy13SwRu11Eg6g6iouUpmrtcn41s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PdNMvFib; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PdNMvFib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772885055; x=1804421055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1PvKYukyaRzl1NZUan8LwurnhLCl+JYAX732iKgm2Zc=;
  b=PdNMvFibOOaMtrfyPHDLdpXcfwm9Dj+rsy7eHzy6RjiONng/9LRCzdQq
   7CWN4NZLTVv/PWvNEDpgURoUXWOGkRkxrl17Vi/EQEdU+0SclMgShNWE1
   tOBqbVZd0C1JfajbHumzzA5AZ/sn5o7OOIa5agYWMurYoozm11SZAeVoS
   k6uVea4aVVzS/veGBntjYdNKndVpSaWUlUF3jXIACTOXlVNSgDEN2OpBV
   DXNC6wOs0rZmfCu4yBNgtdy52NdThIqDOn6kFvMyKl5CxtCJgaScsMdNi
   s0dmTvn6xDskHbzP33a18aw+kPp1XecwIx9wasZhXMuNCZDryswCl5gx3
   w==;
X-CSE-ConnectionGUID: uHL5yhJaQuW9f97XeTUUSg==
X-CSE-MsgGUID: fYVgH2bFThusMVVO7TqYYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="61551341"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="61551341"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 04:04:13 -0800
X-CSE-ConnectionGUID: ZVtXw897RjCfKfoBYSxPkw==
X-CSE-MsgGUID: IpCTFG2LR5uX+B5V1nZzKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="223746392"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 07 Mar 2026 04:04:10 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyqO6-000000002TJ-20Qp;
	Sat, 07 Mar 2026 12:04:06 +0000
Date: Sat, 7 Mar 2026 13:03:18 +0100
From: kernel test robot <lkp@intel.com>
To: Mohamad Alsadhan <mo@sdhn.cc>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Alice Ryhl <aliceryhl@google.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Mohamad Alsadhan <mo@sdhn.cc>
Subject: Re: [PATCH 2/3] rust_binder: add Rust binder tracepoints
Message-ID: <202603071232.kB8K6o91-lkp@intel.com>
References: <20260307-rust-binder-trace-v1-2-5e03283c6e53@sdhn.cc>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307-rust-binder-trace-v1-2-5e03283c6e53@sdhn.cc>

Hi Mohamad,

kernel test robot noticed the following build errors:

[auto build test ERROR on 11439c4635edd669ae435eec308f4ab8a0804808]

url:    https://github.com/intel-lab-lkp/linux/commits/Mohamad-Alsadhan/rust_binder-remove-rust_-prefix-from-tracepoints/20260307-134539
base:   11439c4635edd669ae435eec308f4ab8a0804808
patch link:    https://lore.kernel.org/r/20260307-rust-binder-trace-v1-2-5e03283c6e53%40sdhn.cc
patch subject: [PATCH 2/3] rust_binder: add Rust binder tracepoints
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260307/202603071232.kB8K6o91-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071232.kB8K6o91-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603071232.kB8K6o91-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in drivers/android/binder/trace.rs:75:
        unsafe { binder_wait_for_work(proc_work, transaction_stack, thread_todo) }
    }
    
   -
   -
    #[inline]
    pub(crate) fn trace_transaction(reply: bool, t: &Transaction, thread: Option<&Task>) {
        let thread = match thread {
>> Diff in drivers/android/binder/trace.rs:75:
        unsafe { binder_wait_for_work(proc_work, transaction_stack, thread_todo) }
    }
    
   -
   -
    #[inline]
    pub(crate) fn trace_transaction(reply: bool, t: &Transaction, thread: Option<&Task>) {
        let thread = match thread {
   make[2]: *** [Makefile:1912: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
