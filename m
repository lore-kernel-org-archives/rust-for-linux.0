Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704792C08D7;
	Mon,  8 Dec 2025 18:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765219744; cv=none; b=CuYpV3sFSnQKbmxiVHJZm9W336Y2HKCmeU3dHJs0eCG8fE4B4729OwxXnnO3VOodAS6T4GJ0lHSNf4EvT+JvZbXi0PVfFgV3Iisc9vS3A0KQiER78oUa1CxP+SuEXtWg3aU1O4pJtGs7OIJ0M91SM6U3pGa8b+Fq4Ws6AC5dpTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765219744; c=relaxed/simple;
	bh=ZNDcp7ntkaCV9+gmJSA9IUJ55TC4NpxlMjdEcGu2HkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kl6+lhrFYdpJlOAPwSSUTjo1YpBVkvw/U21fJbPLywm2XAV9QKJ+BMVNljsTWDX6DJ/6ldfYx4nAh/GZknTecSbxSwLZLoLF+fxCYuG+WORv2fwTHG2d6WC3M/guCBLKTCpYbn7aRsoUiLgr5cgl+hK5hnp9N74b0xVTFfL4NWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S2YviBwG; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S2YviBwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765219742; x=1796755742;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZNDcp7ntkaCV9+gmJSA9IUJ55TC4NpxlMjdEcGu2HkA=;
  b=S2YviBwG+QeYjaLUUXhqotPLJ6hrSpn6N7yV2wWqx8RwVgZMvtD9lfF0
   rZFPwORf3a69EeNlDsoImPA+jouJ1ke6H45H1tz/5MXTE8vsTYr0pnkYq
   pmqes1QC300EEhJk30cVPj8fMQfKpaFzPHNbz6+Bspj5n6YvufZ4mXtvi
   MdQ6DRqQG9G64HHtRG4JHRvGiBSxN4SbHyFh9nVqUeom8bKfKXI9XdoQD
   zNcp9gVSmIL5NkDamMRl0fLeWjUTippEcTOtAaUWUqQUiYS5MFZbsH+Z5
   3kTk3J4+X4Kt+gcFMf5uybAsoOGX6NzoJRToMZXOpW4U1u0TdaOLaHHNs
   g==;
X-CSE-ConnectionGUID: D4n1WrNuT/2l0MpdMLsunQ==
X-CSE-MsgGUID: /pcTo2hTQB6N3YDFH2Br3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67247786"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="67247786"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 10:49:00 -0800
X-CSE-ConnectionGUID: WQCC2vZhRkaq/1Xfrar6tg==
X-CSE-MsgGUID: tMcjIeBYS22juL3x+m+Tpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="201128972"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Dec 2025 10:48:56 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSgI1-000000000jN-3dZB;
	Mon, 08 Dec 2025 18:48:53 +0000
Date: Tue, 9 Dec 2025 02:48:08 +0800
From: kernel test robot <lkp@intel.com>
To: Moritz Zielke via B4 Relay <devnull+moritz.zielke.gmail.com@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>
Cc: oe-kbuild-all@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Moritz Zielke <moritz.zielke@gmail.com>
Subject: Re: [PATCH] rust: io: convert ResourceSize to newtype
Message-ID: <202512090237.rE4zx0Ob-lkp@intel.com>
References: <20251203-res-size-newtype-v1-1-22ed0b8a7a18@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-res-size-newtype-v1-1-22ed0b8a7a18@gmail.com>

Hi Moritz,

kernel test robot noticed the following build errors:

[auto build test ERROR on 473b9f331718267815649cd93801da832200db71]

url:    https://github.com/intel-lab-lkp/linux/commits/Moritz-Zielke-via-B4-Relay/rust-io-convert-ResourceSize-to-newtype/20251204-012104
base:   473b9f331718267815649cd93801da832200db71
patch link:    https://lore.kernel.org/r/20251203-res-size-newtype-v1-1-22ed0b8a7a18%40gmail.com
patch subject: [PATCH] rust: io: convert ResourceSize to newtype
config: um-randconfig-r064-20251207 (https://download.01.org/0day-ci/archive/20251209/202512090237.rE4zx0Ob-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project a805147ac1ba123916de182babb0831fbb148756)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090237.rE4zx0Ob-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090237.rE4zx0Ob-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0605]: non-primitive cast: `ResourceSize` as `usize`
   --> drivers/gpu/nova-core/firmware/gsp.rs:234:25
   |
   234 |         let num_pages = (sg_entry.dma_len() as usize).div_ceil(GSP_PAGE_SIZE);
   |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ an `as` expression can only be used to convert between primitive types or to coerce to a specific trait object

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
