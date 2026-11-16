Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852040;
	b=aEbovmDzUooZRhB1//0tjoWKHNOJ2leE/v5BJor9GjCyVYqwyF+K+ILST5CK+Coj6DSX
	 w89Z4KPEOJ1VIs67+y5ZFQVONBoi7aHPPBAGFyx0YcTPM232J3SSIIGrdnJCn9JpRkcge
	 fu6vvj4CyFsRI28rqoOcmX8YDTS8ccq9GjvL5dXknPULF7fg36VuLzCjrOUQIkR+ceXXl
	 txvGRWGgNqGdR5NHOYsH8W/U5bUTXqf6hypSZKMqzeG6U/BKDb8Zh0Wx7+9vRf8/J362U
	 lSmTVRWbxop9XuzCMpDa64AQFOhNi+NHmI6HpFnoDOuNLtEjQjOvKECRDeZkVD00AUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852040;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=AGMTwFfs53sTPCTAbdlxmCJ8hYeb9iUmlEmcpKGM0Ow=;
	b=kvXL8kXHes0x93z+IQsGOeU+QGXrgPB26+GzdyPNo5HPN1uGWAqpBEwBDfbi3zEm4eJ0
	 EIv5FwzVHkGsIEHWRdotXsIe8PdZVhec5+ul8An2uKMaZfu2Nlr0wnlHoXflKIqg7BMiE
	 2bI+jIQYD57Swuyj+WcYn/DwZOwNGIWd49jWa28p9B+PDlAgS6GfHgX3CD+cj7+S2TDgL
	 h2uwIJKgs206pGAh0poSfc1yMX0l8ckEtCd9p9GPTEebTlzA3V1kcYk9Nj71yDPhhCjQt
	 JJYTVKilMnhiyB37804Zbfi5Nd3wCEADBrxgQLr1Ab7QVwMzpes3dZL4P9lysY/uX3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=czzKdeD5;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB358606A881;
	Mon, 16 Nov 2026 18:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB358606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=czzKdeD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794852039; x=1826388039;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wWTaX5iA12+M0wZvVENhAikZT3twTo+LW7rgrLUSPGY=;
  b=czzKdeD5M0VQO/XLCplAUBt5kG6UTfNZAHDTc2cz0yCI3u0+CL5tG04V
   5sps0E3mUUYovZhtmiX5uRJpw/tbTenewKzM9T48fD1zkdDmsShyrgrGq
   /nU+js8h+5xqu/wvI7dUrLtZfzWDMfyCNWO9wVJX1rdYwrn2w5X/KXvCy
   6ICDeS6no7jIfC2xPDV2rMU8XlY0pizIVdYYaMtt3QuMLPCT9oG3i0WVi
   nsdpBpQAhnarZ/M8VkG9mSXahpIGWeZ7iqjHIkE4I6uAhd0vVOOhDKrf5
   t7uLxMsw8O32IUZT64R4Z7aQReydrPlOJ4bhFZ0XKk7Hz/1fMFJXjqaez
   w==;
X-CSE-ConnectionGUID: LB1K4VAWSdGMzmxc0ZmCdg==
X-CSE-MsgGUID: 0sFN+zHqTBaqd9IZ1ZQyLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3632816"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3632816"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 10:00:39 -0800
X-CSE-ConnectionGUID: RV4zCj+tTT6w/vcjLZb1Bw==
X-CSE-MsgGUID: r6GgFtjpRX2f2sT+idN6jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9591695"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Nov 2026 10:00:34 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT10J-000000019Bc-1yxt;
	Mon, 16 Nov 2026 18:00:31 +0000
Date: Tue, 17 Nov 2026 02:00:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>, Akash Goel <akash.goel@arm.com>,
	Karunika Choo <karunika.choo@arm.com>,
	Lukas Zapolskas <lukas.zapolskas@arm.com>,
	Chris Diamand <chris.diamand@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Ketil Johnsen <ketil.johnsen@arm.com>
Subject: Re: [PATCH v5 11/13] drm/panthor: Support FW init of protm
Message-ID: <202611170131.5ommYcYW-lkp@intel.com>
References: <20261116112601.3483649-12-ketil.johnsen@arm.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116112601.3483649-12-ketil.johnsen@arm.com>

Hi Ketil,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on next-20261113]
[cannot apply to linux-review/Ketil-Johnsen/drm-panthor-De-duplicate-FW-memory-section-sync/20261012-145929 linus/master v7.4-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ketil-Johnsen/drm-panthor-De-duplicate-FW-memory-section-sync/20261116-122549
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20261116112601.3483649-12-ketil.johnsen%40arm.com
patch subject: [PATCH v5 11/13] drm/panthor: Support FW init of protm
config: sparc64-randconfig-1000-20261116 (https://download.01.org/0day-ci/archive/20261117/202611170131.5ommYcYW-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170131.5ommYcYW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170131.5ommYcYW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/gpu/drm/panthor/panthor_fw.c:145 Excess struct member 'start' description in 'panthor_fw_binary_section_entry_hdr' (did you mean one of: 'va.start', 'data.start')
   Warning: drivers/gpu/drm/panthor/panthor_fw.c:145 Excess struct member 'end' description in 'panthor_fw_binary_section_entry_hdr' (did you mean one of: 'va.end', 'data.end')
   Warning: drivers/gpu/drm/panthor/panthor_fw.c:208 Excess struct member 'buf' description in 'panthor_fw_section' (did you mean one of: 'data.buf')
>> Warning: drivers/gpu/drm/panthor/panthor_fw.c:299 struct member 'protm' not described in 'panthor_fw'
   Warning: drivers/gpu/drm/panthor/panthor_fw.c:299 Excess struct member 'ping_work' description in 'panthor_fw' (did you mean one of: 'watchdog.ping_work')
   Warning: drivers/gpu/drm/panthor/panthor_fw.c:145 Excess struct member 'start' description in 'panthor_fw_binary_section_entry_hdr' (did you mean one of: 'va.start', 'data.start')
   Warning: drivers/gpu/drm/panthor/panthor_fw.c:145 Excess struct member 'end' description in 'panthor_fw_binary_section_entry_hdr' (did you mean one of: 'va.end', 'data.end')
   Warning: drivers/gpu/drm/panthor/panthor_fw.c:208 Excess struct member 'buf' description in 'panthor_fw_section' (did you mean one of: 'data.buf')
>> Warning: drivers/gpu/drm/panthor/panthor_fw.c:299 struct member 'protm' not described in 'panthor_fw'
   Warning: drivers/gpu/drm/panthor/panthor_fw.c:299 Excess struct member 'ping_work' description in 'panthor_fw' (did you mean one of: 'watchdog.ping_work')

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
