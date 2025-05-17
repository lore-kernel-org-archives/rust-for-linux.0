Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4E31DDC0F
	for <rust-for-linux@vger.kernel.org>; Sat, 17 May 2025 21:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747517846; cv=none; b=caSKA+l20nJ6VgDoAH5ECUf78gL78H8Cudlw+BBT2hIccE8dKmeC5uaCn1ogp8wMeRx4TWEePcRmB7j4nz5LXwbKNiPMLvxeA64XOyYbRIBC0SdkHKJAYuU6tRiK2c5SFg+QDdY06wpfDSJ2VNZxS1msW51ro8Kd2M+gyJyh3Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747517846; c=relaxed/simple;
	bh=a4Z+OfYM/RmSaLQ/ZTI97l43un5yBV8OEUGbPy6KrCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEB2Jt7bP+4IMqNNWO5zVWiQvqeullTERDWjxrBuw0AzecUS9iGVICtMsqu0iIcgsi81m7Orel74Wbe0B45XZjwfAOmWlT8orKyRHAPZvQTnAiafhPSw8hdobNx2DV72+BmpIbjvGD5DYgIqX+jugkwss4loY7IV/uJIhX+Wwk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJ1LX0hJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJ1LX0hJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747517845; x=1779053845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a4Z+OfYM/RmSaLQ/ZTI97l43un5yBV8OEUGbPy6KrCs=;
  b=jJ1LX0hJVkccVeZ4U89KHy6BTX2REXAFf6a8i63KRANfPY1Ybnh9aCal
   lKzBAVJjtcguEbYXwEt6FNoGvT3WHppcon9wBpUbXrI44Tc/2zjXFC8Bq
   j4gusdNhrFgzXumuGntH4sAb0AiBfoPVd1OWtgT51bBse7HJmYEtV/Pi0
   KEZj7G2wZY+sxLxVloBe7ggXB5+3bq97k14won4XiyTyuMzyt+5bvL+Oh
   LtQPWKaHZJNSDtIIG5k/Gkw4LPXBpOYOPUwpXC8tKRGPRM8BkVka3+G0u
   w84BtxMBjlnRqtLYRd1iFwnFyyWoXQpacqUZxDbQjyzBYFpNMnq71sJZb
   w==;
X-CSE-ConnectionGUID: ebpKXtCTSbyZrZrZ+upeQg==
X-CSE-MsgGUID: vEZv1wUjRvirE5s1Qz/6Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="49567140"
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="49567140"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 14:37:24 -0700
X-CSE-ConnectionGUID: 7bZfwtb7QoC0ylkpxoMQIQ==
X-CSE-MsgGUID: QtBAnf0RQUuQh7+WOotLLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="139496803"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 May 2025 14:37:21 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGPDa-000KS7-2g;
	Sat, 17 May 2025 21:37:18 +0000
Date: Sun, 18 May 2025 05:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Korotin <igor.korotin@yahoo.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	Igor Korotin <igor.korotin@yahoo.com>
Subject: Re: [PATCH v4] rust: macros: Fix macro referencing core and kernel
 crates
Message-ID: <202505180525.LRAJXV9j-lkp@intel.com>
References: <20250516122349.1944895-1-igor.korotin@yahoo.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516122349.1944895-1-igor.korotin@yahoo.com>

Hi Igor,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[cannot apply to shuah-kselftest/kunit shuah-kselftest/kunit-fixes linus/master v6.15-rc6 next-20250516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Igor-Korotin/rust-macros-Fix-macro-referencing-core-and-kernel-crates/20250516-203554
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20250516122349.1944895-1-igor.korotin%40yahoo.com
patch subject: [PATCH v4] rust: macros: Fix macro referencing core and kernel crates
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250518/202505180525.LRAJXV9j-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505180525.LRAJXV9j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505180525.LRAJXV9j-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in scripts/rustdoc_test_builder.rs at line 50:
        // Qualify `Result` to avoid the collision with our own `Result` coming from the prelude.
        let body = body.replace(
            &format!("{rustdoc_function_name}() -> Result<(), impl ::core::fmt::Debug> {{"),
   -        &format!("{rustdoc_function_name}() -> ::core::result::Result<(), impl ::core::fmt::Debug> {{"),
   +        &format!(
   +            "{rustdoc_function_name}() -> ::core::result::Result<(), impl ::core::fmt::Debug> {{"
   +        ),
        );
    
        // For tests that get generated with `Result`, like above, `rustdoc` generates an `unwrap()` on
   make[2]: *** [Makefile:1826: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
