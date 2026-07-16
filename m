Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C3337D126;
	Thu, 16 Jul 2026 17:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784224151; cv=none; b=U+s7Me+8D2HTzq+BTrStew6qfAYqqPX1mGMHD2nHx1WJTt8oTccLqD3wMs+qm0KYGGFR6XrIJIrDbgA4ewipO9bo5Fkd38UksLJ2CuHph7Dsn3Qed9SKexFq9gvIMxvDbO6puQPOMviC21d+iiZYJB6TIcMy4EXbObrkF3uaDis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784224151; c=relaxed/simple;
	bh=WDOpxcwFle75xJgV45Y3mz4ze1wpcOya2GSWIlnO6Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpfYNr3Nt+hCBIvzEVHbV85lx0RQ7fmVKnrhJqhaEdZncYrFNypSwpS32SWDSV6MFOEc2dP/V7hCwMfyGOK2kQvJuCk6WVyCt6BSVL45ZNBI//29LWD9g5RduqQKfmIn5vKhl6mTMdEDB1ZZRMT1VW3DEPyZa8YQPJnest0FDOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EHKxKrpy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EHKxKrpy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784224150; x=1815760150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WDOpxcwFle75xJgV45Y3mz4ze1wpcOya2GSWIlnO6Qg=;
  b=EHKxKrpypfwt/Hy6uUdYyp3klYP5s5/RREy7f3rxX+50j7JYfdacii34
   zQR6OIRHl3hgi5w2d43Mp35XKGtHHmVTBQt7lMpAoaJT9uSNkOHIm71VJ
   0oQ41eTE3GofMZYvBuelWArVHJ6DOFEwWPJr4VAFQqTncRoIIYvKENDgy
   Evn6qI+axGWNI8x+o5V2h38/ulUt89sSKeP3cXTMoLnGbWFf4fcaYw37o
   RDABEa/74HwVcWqkqkAn/+pvrKZleX7JDKLeKtVTkelXJ0p+9xFRDRJmH
   oaXLi/dUG86ufSihMmaqtXMPCbA40ZHO3uQyLmVGDVV+dEgvP4m9WVFIM
   Q==;
X-CSE-ConnectionGUID: ZE3O0oDEScmQvAqK2p5JQw==
X-CSE-MsgGUID: eD0MXmxbQSKf2dye9iYuoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="84853710"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="84853710"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 10:49:10 -0700
X-CSE-ConnectionGUID: XfGCLMq2TIOWPCEFC2xIgw==
X-CSE-MsgGUID: kOYF/zaMQF25P48lYMtL6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="255415130"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 10:49:00 -0700
Date: Thu, 16 Jul 2026 20:48:58 +0300
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
Message-ID: <alkZiozKVGlAYVUb@ashevche-desk.local>
References: <20260715195520.25410-1-linkmauve@linkmauve.fr>
 <alieVR1cOtOySi4_@ashevche-desk.local>
 <ali7bki3jqpd8ckE@luna>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ali7bki3jqpd8ckE@luna>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 16, 2026 at 01:07:26PM +0200, Link Mauve wrote:
> On Thu, Jul 16, 2026 at 12:03:17PM +0300, Andy Shevchenko wrote:
> > On Wed, Jul 15, 2026 at 09:55:16PM +0200, Link Mauve wrote:

...

> I’ve attached a patch fixing this particular issue, I will include it in
> my v3 if that’s ok with you (or it could go as a different series, I
> don’t care much).

Works for me.

> I think I’ve found another bug in that driver, it says .max_register =
> 0xffff but .size = 0xffff, one or the other is probably off-by-one, and
> I suspect .size should be 0x10000 instead.

Yeah, max_register means offset of the last _accessible_ register.
So, 0xffff sounds about right there. As for size being 0xffff, I weakly
remember that there was a discussion about these values. Can you dig the
lore archive?

-- 
With Best Regards,
Andy Shevchenko


