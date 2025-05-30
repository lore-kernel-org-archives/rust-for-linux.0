Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32F219F464
	for <rust-for-linux@vger.kernel.org>; Fri, 30 May 2025 03:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748576914; cv=none; b=EeeSr8O5eRrBz6zhnqEJTOkbuRN6rvp/JQeU7wR4hQiArLX6jtTGY+2IYREo7IctBjGZ80LhRT+KTIDjKkZIfqhjqWJn+Huu/qfASOMt770/QYBdEE94e8Xecs7mHbd8i83VhgDhkeF2/dO60BnNp/yZLIGkAq99P7rpwwTEkB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748576914; c=relaxed/simple;
	bh=aoeFrEdC768y7i2Z+5cR7TBTWbTsj3mR869KdADzkQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WuyYsTuIfA65iXoRkLLPwL6zTZ619YyScf2xWsMRzCe6VFNZx1dqR7E0TDcT0n/qJq7BC/QMh+PfJX47Tlb51pS7m7eUMwNsK++Yf7rEX2EqwZyeHa+JFOGnuJgJ6uYcA/Ca1DfazePxOOSrUILHXtcKa/Grw6l3dSLlclS3iMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Na3QG/5L; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Na3QG/5L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748576913; x=1780112913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aoeFrEdC768y7i2Z+5cR7TBTWbTsj3mR869KdADzkQ4=;
  b=Na3QG/5L8B/gY18GZ8ZAJL9JglmrGi/DGyD3VikbHF+9oa9y2f4Gy2gG
   3g7JAbVP8Sv/Qz/yywSSOI5ongC3amKRSTjnVoshyKeru810ZDL3c8YBL
   I5r1Prq71jlVXNEUXMYlqiwn1Y/BsKy9rF0v2WJ9QIXFs1BNLYN2Mqior
   tTMmyCqtCd0YeUNtoDjXDipl4fpnyR7tu/XTMeEJfkr4iH1tUuzFi0TKE
   U/YQ11FWAbQ/T6a6aZIcuIiS993untYLfphVovQFl0tKChaqMSDhW4o2E
   iz7/a+Wwt1LFJwIz+7XTjVKAaguWmz0JrWjUUyakSOLmYjfANCbtCeGMR
   w==;
X-CSE-ConnectionGUID: jvEsInw4Rf2LIFqhqXp2kQ==
X-CSE-MsgGUID: +W0WULdbQw6yQZv8scvq2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50664027"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="50664027"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 20:48:32 -0700
X-CSE-ConnectionGUID: Q7+l9vfQRDG9IWwqSN4D1A==
X-CSE-MsgGUID: CIDTXEiGQduf3uJQOcr8zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="144739724"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 May 2025 20:48:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKqjM-000XJQ-1K;
	Fri, 30 May 2025 03:48:28 +0000
Date: Fri, 30 May 2025 11:47:36 +0800
From: kernel test robot <lkp@intel.com>
To: Timur Tabi <ttabi@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	Alice Ryhl <aliceryhl@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
Message-ID: <202505301109.ySBz6GOs-lkp@intel.com>
References: <20250529184547.1447995-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529184547.1447995-1-ttabi@nvidia.com>

Hi Timur,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/rust-next]
[also build test ERROR on linus/master v6.15 next-20250529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Timur-Tabi/rust-introduce-sfile-macro-for-easier-code-tracing/20250530-024820
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20250529184547.1447995-1-ttabi%40nvidia.com
patch subject: [PATCH] rust: introduce sfile macro for easier code tracing
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250530/202505301109.ySBz6GOs-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505301109.ySBz6GOs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505301109.ySBz6GOs-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/print.rs at line 468:
    
            let start = find_last_or_zero(FILE, '/') + 1;
            let len = find_last_or_len(&FILE[start..], '.');
   -        &FILE[start..start+len]
   +        &FILE[start..start + len]
        }};
    }
    
>> Diff in rust/kernel/print.rs at line 468:
    
            let start = find_last_or_zero(FILE, '/') + 1;
            let len = find_last_or_len(&FILE[start..], '.');
   -        &FILE[start..start+len]
   +        &FILE[start..start + len]
        }};
    }
    
   make[2]: *** [Makefile:1826: rustfmt] Error 123
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
