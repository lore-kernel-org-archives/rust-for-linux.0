Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F24A442FC3;
	Thu, 16 Jul 2026 17:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784224236; cv=none; b=rjOGs4jElI4Bu81EnsTHaS9Qb25JZk2fuEm1iq3Oytu0x0di5CcwfrnVFhn5eQw3I9TPoNgeZbjiVkgEj05/U5IQ4MCJjnUvvw7s2nPpHOre62C2CxRtd7NhBELfOXDakQDSuNhVv8MX+VkdNjEjLksPCeniNbRkrRVJcOWMVus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784224236; c=relaxed/simple;
	bh=xxOjee7glhv2bbNIZZyyAk70a5eC9HP+MBjlGBfZqNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZsOQpKcbsZ8ACnpPJkIaE+hffSDnKfPsWe+eI5kXj5ycgwYD/HiVgLMQhPYkaGk0owLVlSuOcOLaPxSkImsA0ytXYG5qlMgRAvuZ7DCb5zri/rZvt8D5QE3Oel5urigRNH8O2ftUlKbSTGwkyuVYgv4mNwdM2+ZWYdZA3BHi0OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RRbewCLm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RRbewCLm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784224236; x=1815760236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xxOjee7glhv2bbNIZZyyAk70a5eC9HP+MBjlGBfZqNA=;
  b=RRbewCLmo2hVRKZH6V9VIiWQSY61R73vBRWr5OCG7iYK8lb5xgjCkEFC
   nSUpzUiX0cTvE6uwRittoROOmTX//E1HCPKB95Sr9UkOcPh5KeJ+XWjKD
   vXCGkwHY8tckYI/hFbjOKcbT1wyWWfDZmjSBx2UipUgqIRfTreS7eE2F0
   bIFqzCPvj9mFjTjZwitkb3plnqy61hNfX4KAGCGEmphCcZwGvq70IcXXz
   l8H6DnuzsBIrqX+DhbOQKQZ6JgF1JM+D7a1b+39BdRrBcC7Q5vl6phGJh
   yVMJrrnCsDbdDNDyHAyo1qk1Ne0bvVlPJd1fsHWY75PshI4EjpQpHKEdM
   A==;
X-CSE-ConnectionGUID: 00lmLQHzQF6aIDMdNtF8nQ==
X-CSE-MsgGUID: LouHCOmlTvOdoRztqIw5Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="88569124"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="88569124"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 10:50:35 -0700
X-CSE-ConnectionGUID: KSXdeNBXTx+whu28zmJl9Q==
X-CSE-MsgGUID: ISrJSJNIRJu4vj7xXuRo5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="260854065"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 10:50:25 -0700
Date: Thu, 16 Jul 2026 20:50:22 +0300
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
Message-ID: <alkZ3tVY0y31RYUz@ashevche-desk.local>
References: <20260715195520.25410-1-linkmauve@linkmauve.fr>
 <alieVR1cOtOySi4_@ashevche-desk.local>
 <aljAqBNVXV1aVJqx@luna>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aljAqBNVXV1aVJqx@luna>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 16, 2026 at 01:29:44PM +0200, Link Mauve wrote:
> On Thu, Jul 16, 2026 at 12:03:17PM +0300, Andy Shevchenko wrote:

[…]

> > TL;DR: you should fix the Apple driver (and might more if any of them
> > use that dirty trick).
> 
> It was the only one of the drivers/nvmem/ to do that.  Three other
> drivers use a pattern where they merge read and write operations into a
> single access function with a type=read/write parameter, so const safety
> can’t work there and I’ll continue casting from const void * to void *
> in the write function to keep that pattern working.

I meant all the driver in the kernel that are going to be affected by this
change.

-- 
With Best Regards,
Andy Shevchenko


