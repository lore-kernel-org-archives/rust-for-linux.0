Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6073CD8B0;
	Thu, 16 Jul 2026 09:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192616; cv=none; b=PNoeMBfNKKgqldI7/IhesaTYd7Z0XZyZRIV0IHGxQhjekFtfyExra5jzvnDmP9LBAMLHvVfU8d5b4zIItzWyc7VX586lofI3jgWdomCG2LGRRNdu2v+cUw8C6nyMztpuOTkEVbfuxah/9tcEPYAybN6rLmfpuLzgD16GlnTFVvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192616; c=relaxed/simple;
	bh=mdc0Qg0CaS9HhMRhYLzKY0lvqzMX6zDKQ+/7G+CVATM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tl0gEFXkzuGQaVm0wJSw3CzautHN2NOEPyxN1QZfY8QEJMVIMCn/4wFW5BWlQvgYP7ze/3T5TNq0lf6z6AdfQf3AyaEs3mUD+Je1M2v6koAMfL2jxa8ZwLhkZAFgLdTTouL7TT25YNxhdrlKyhjlbcrY/CUuqlxSA0CrV/J+ZL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmCfPuud; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmCfPuud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784192614; x=1815728614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mdc0Qg0CaS9HhMRhYLzKY0lvqzMX6zDKQ+/7G+CVATM=;
  b=XmCfPuudKfg96rOkNRVBKpg+cmRsN4UpwQPR3YDHt9Z57QWU2BOrwx5E
   Tww1l3QYiHH+7BLiqcBl+wURkjW3CyfU2IWVT7hImvknmFM2T9OUveqTJ
   X/MWlmP1qe2BRp8hEuvPt1iNH8cNCyKoj2382RJ3B0lHLDREPn4yvAdZN
   GMoC/e1Fok5jz3z94IRg/3vhJKJfOTfbDAQtw8mfErUawrqX1g0JL2TUj
   lbjO2Goj2EbRruYVeU0WreIOOaVDHqQlNPnjJAvVrFh2L+cju/1kOBEpR
   BBLnjMjv2M+GAnuPYg2xEzO+8l6Kwrvq7McCS7TyHUq7XknhNfaIipZ0W
   w==;
X-CSE-ConnectionGUID: 7Hv/F3d5RkCCuPv3D61Xlg==
X-CSE-MsgGUID: 938+LABAQgu7PXuLXytfIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84874234"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="84874234"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 02:03:30 -0700
X-CSE-ConnectionGUID: lRoi4/cIQz+TT/pG5vIyBg==
X-CSE-MsgGUID: /nbhLZgmScmziK0fSPUDtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="260260162"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 02:03:20 -0700
Date: Thu, 16 Jul 2026 12:03:17 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Andy Shevchenko <andy@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Kalyani Akula <kalyani.akula@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/2] nvmem: fix a const-unsoundness in reg_write
Message-ID: <alieVR1cOtOySi4_@ashevche-desk.local>
References: <20260715195520.25410-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715195520.25410-1-linkmauve@linkmauve.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jul 15, 2026 at 09:55:16PM +0200, Link Mauve wrote:
> This callback used to take a mutable void * for no reason, which causes
> the compiler to be unaware that the val buffer should never be modified
> by the callback.
> 
> This was found while drafting the nvmem-provider Rust abstraction.
> 
> Thanks to the guidance of Andy Shevchenko, this now introduces a new
> callback and deprecates the existing one, with the goal of renaming the
> new one into the old one once no user remains in the kernel.

You forgot to use --base. It's unclear against what should be this applied.
I tried Linux Next (next-20260715), and it fails.

Yes, it applies against v7.2-rc3, but it means that this won't be applied on
top of maintainer's tree (which has something already that you have to take
into consideration).

For the record, the first version of the series was no go as the first patch
there breaks the things, like

drivers/nvmem/qfprom.c:446:22: error: incompatible function pointer types assigning to 'nvmem_reg_write_t' (aka 'int (*)(void *, unsigned int, const void *, unsigned long)') from 'int (void *, unsigned int, void *, size_t)' (aka 'int (void *, unsigned int, void *, unsigned long)') [-Wincompatible-function-pointer-types]
  446 |                         econfig.reg_write = qfprom_reg_write;
      |                                           ^ ~~~~~~~~~~~~~~~~
1 error generated.

This version doesn't have this issue (at least with my smoke build tests
on x86_64).

Now, what catches me is that regmap_bulk_read() proto used for both cases in
drivers/nvmem/apple-spmi-nvmem.c without any changes. Which makes me think
that the approach can be done in a simpler way, id est converting users first
to use const specifiers in their callbacks first. But this trick is done with
using (void *) casting (?) which makes warning to disappear, which is
interesting case. So I think the Apple driver should actually use proper
protos and hence wrappers, otherwise it makes compiler blind, which is not
good. TL;DR: you should fix the Apple driver (and might more if any of them
use that dirty trick).

-- 
With Best Regards,
Andy Shevchenko


