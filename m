Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C263E00BB;
	Mon, 18 May 2026 08:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779091858; cv=none; b=erIn2/SBoVozlGnB8p0cLy7a4JZ5pEu8dvflwAdZwCQiRIQpVNKHGZKeDg/2Y2AG6jgkADk/xXHCsQDsgEwtuvXJqt9Yncyt3P1In1e4qoEPV3gDOZvU4KdYX9BuB72VWGQGbygWkrLATj5o3x0S29rsmPgmUv8OpMZMTpuwO7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779091858; c=relaxed/simple;
	bh=kBQlxaGW0WoiWNYGtR1ldHPDj5zOuiSLZiUvi0EQicM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxUqw7/DtKaMz4IyZQi/UZY70S6FIBAc5Oy2b29cR/HBHW6PbBZqUuGTqro0a+ttIizAvl4S31jAYpP4dEeFj2dwZWBDvJ0yUIbqbqMjQviVZwz8B3vzQNVbqksH5Ae7W5EZW27NB2RDZ1XsOINUuylV7x/7QBUDnn+pkrZJA3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CJ73Pkkq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CJ73Pkkq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779091857; x=1810627857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kBQlxaGW0WoiWNYGtR1ldHPDj5zOuiSLZiUvi0EQicM=;
  b=CJ73PkkqQ+1RFNbKU6JtL/kyzCZ+HBRVHHcVRy3bL3bDFA8oH3H6RSVp
   H91dgTrYm5RzNmbKota1JXvbcGFxmQj+2ueowsXLvADf4XaCH7NlV4RwX
   vTlIikTSXhEEN1xY6AqLfo+NwCIk/iisWGuNSp0V7D842E8vjB8uOUGMr
   p/UNjcMY6Izx71JR8ZQNjVoMqsRuaDt44Da6UdDapzQfNLLmM2xBcpThh
   OSPDRHzK4/cetoEQU1+gzeDDquA0TgeIYfEyIL70+u3EnRj+7+xe8lyVq
   Cc0Ev256RPX3TvjoxBMof16OXNI2LZFvzhZALu8oxuEAlut0NXbmIPbm/
   w==;
X-CSE-ConnectionGUID: UXHtrzdHRwyEzY1I/Js40A==
X-CSE-MsgGUID: 1tmpGM6WSnO3l7AwHZOfjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79838768"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="79838768"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 01:10:56 -0700
X-CSE-ConnectionGUID: jAAvwc53SHGPYIBtgDz+wg==
X-CSE-MsgGUID: V0OB3xscQouvHV9RX2doYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="239226329"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 18 May 2026 01:10:55 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOt3s-000000009ll-1Nb4;
	Mon, 18 May 2026 08:10:52 +0000
Date: Mon, 18 May 2026 10:10:00 +0200
From: kernel test robot <lkp@intel.com>
To: Moayad Salloum <salloummoayad4@gmail.com>,
	rust-for-linux@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	ojeda@kernel.org, aliceryhl@google.com, lossin@kernel.org,
	a.hindborg@kernel.org, Moayad Salloum <salloummoayad4@gmail.com>
Subject: Re: [PATCH] rust: workqueue: add cancel_work for Arc<T>
Message-ID: <202605181046.7pBrngJZ-lkp@intel.com>
References: <20260518042347.95213-1-salloummoayad4@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518042347.95213-1-salloummoayad4@gmail.com>

Hi Moayad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rust/rust-next]
[also build test WARNING on next-20260508]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Moayad-Salloum/rust-workqueue-add-cancel_work-for-Arc-T/20260518-122747
base:   https://github.com/Rust-for-Linux/linux rust-next
patch link:    https://lore.kernel.org/r/20260518042347.95213-1-salloummoayad4%40gmail.com
patch subject: [PATCH] rust: workqueue: add cancel_work for Arc<T>
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260518/202605181046.7pBrngJZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605181046.7pBrngJZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605181046.7pBrngJZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: missing documentation for a function
   --> rust/kernel/workqueue.rs:874:1
   |
   874 | / pub fn cancel_work<T, const ID: u64>(item: &Arc<T>) -> bool
   875 | | where
   876 | |     T: WorkItem<ID, Pointer = Arc<T>>,
   877 | |     T: HasWork<T, ID>,
   | |______________________^
   |
   = note: requested on the command line with `-W missing-docs`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
