Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6D6436363;
	Wed, 21 Jan 2026 21:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769031637; cv=none; b=jfSPx5Q7oW5mhyrzCEUUIanIDHxEOMKlHbQCPYZ8iGoBQpd8Xj2e20uq52n1yE6ZjBnNrbXVwtpEjKpoDNbR+sGO+cs6aiiH/kSJVE0Ay6VRPdFdxIJ5wDURaeBgBCB28w5ZbGklAe7nKrtkwX7YB8IKY7CAAa4uA2MovwHJVvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769031637; c=relaxed/simple;
	bh=+4c/+SbT8AAcsRZkkvc90YUY014MWzXPizZ6FqR9GyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uY9GwQG2ICZNggw0RXYfI8h1uY93+TI3FxlCbfhAp81/Nn9C2oeG7ri3enoxIJlK0kE79t8DMjzp28fyb/qsPWsKV8WDic2hbozJWEH03iVZZeMqKm8ffI8IkDqJNR3B/qPUmMJc6xaRzjraKz82PligL6a5nGfoGlAsoJQIY5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bTjMjil3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bTjMjil3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769031635; x=1800567635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+4c/+SbT8AAcsRZkkvc90YUY014MWzXPizZ6FqR9GyQ=;
  b=bTjMjil3YmNS9k+TnumtHyJwfUJaqPKa1dfiFfLq6xx7oDzrGBWFc0hV
   a+txJE6l5DbvFjG+wglUJ6DtAT7Q7a1d/0KjBCX4sCtOwdY7CU6rqFPGQ
   /5vbQDLth8CVBI/r8fJyhXbpUIxPp2A3U5AVesma2lsGf55tIoYYIT3Z5
   HjPu6kWAKFCIqK4Q14qwhg4LqWB6IM9HGsnKoEX50BodFHUwPOVvFS9/v
   +gHJFQiPYzrqe8WR7VWjo3S/HXKWvFyPdxRTnS9M+vq1UwT8gYOBC6B6G
   HsjWMNQ3A+nAm6JA576GeZaFRmBTww8D9OM1jl6toesoMWcSWXVMhWzt9
   w==;
X-CSE-ConnectionGUID: Pr3APBKJQRWjV1VQdBxt4w==
X-CSE-MsgGUID: 76lYS2w8T86Op5RNaq64cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80570320"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="80570320"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 13:40:34 -0800
X-CSE-ConnectionGUID: QjRXQVhgQdqICYF+roRD8w==
X-CSE-MsgGUID: 1e/3U2lfSx6j41upJ5VlFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="206806785"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 21 Jan 2026 13:40:30 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vifwB-000000000Nl-3Fri;
	Wed, 21 Jan 2026 21:40:27 +0000
Date: Wed, 21 Jan 2026 22:39:59 +0100
From: kernel test robot <lkp@intel.com>
To: Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>
Cc: oe-kbuild-all@lists.linux.dev, Yury Norov <yury.norov@gmail.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH v2 4/5] rust: io: add `register!` macro
Message-ID: <202601212253.xJmIu2oa-lkp@intel.com>
References: <20260121-register-v2-4-79d9b8d5e36a@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-register-v2-4-79d9b8d5e36a@nvidia.com>

Hi Alexandre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c259cd7ea3c9ad369c473ba2385d82e3432088b1]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Courbot/rust-enable-the-generic_arg_infer-feature/20260121-152936
base:   c259cd7ea3c9ad369c473ba2385d82e3432088b1
patch link:    https://lore.kernel.org/r/20260121-register-v2-4-79d9b8d5e36a%40nvidia.com
patch subject: [PATCH v2 4/5] rust: io: add `register!` macro
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260121/202601212253.xJmIu2oa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601212253.xJmIu2oa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601212253.xJmIu2oa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unresolved link to `crate::bitfield`
   --> rust/kernel/io/register.rs:15:20
   |
   15 | //! [`bitfield!`]: crate::bitfield!
   |                    ^^^^^^^^^^^^^^^^ no item named `bitfield` in module `kernel`
   |
   = note: `#[warn(rustdoc::broken_intra_doc_links)]` on by default
--
>> warning: unresolved link to `crate::bitfield`
   --> rust/kernel/io/register.rs:411:20
   |
   411 | /// [`bitfield!`]: crate::bitfield!
   |                    ^^^^^^^^^^^^^^^^ no item named `bitfield` in module `kernel`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
