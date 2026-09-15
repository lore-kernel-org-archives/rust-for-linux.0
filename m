Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166DE45D5E2;
	Tue, 15 Sep 2026 07:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456556; cv=none; b=ARe1cMUDC63eczqzkoY0erP71eOtGAgQGcy4vNXchXN8wl3cWz9e88Ebucca2BhWAZT//u1lillwZXPlpPOBMqyvmITQ0anZ0pVa2ylp/Tk2TjYN4Et7QgpJtKZlqCLzsMPMqsZx9R4/SrRvF4EQ0R1k7Rzb/tIsYhgY2MTF5zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456556; c=relaxed/simple;
	bh=+hFmXzfeob24QkbjYP8iQSqL7rHNCW4SoAluNe2Mtzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cB/Fn1MPmGzioysAyzAWr1Co2uFEf+0bEmdvNBeRyzfyCwgZEgSWqh6UM7/OcWo1erDs78xKPZTzszYEueSjYgRUmUVP20zhLL2RWonTWl4p1NFkYriJLID7a3twx7nfZfYnfjNwHTXkwamRIJGZNVmOAjbB1uUfuk64LfYNIUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SqTPGq1/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SqTPGq1/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789456550; x=1820992550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+hFmXzfeob24QkbjYP8iQSqL7rHNCW4SoAluNe2Mtzo=;
  b=SqTPGq1/wIAt9oHS4ekKDbtM/G4Ocj3SZMwt0/NBaW1JmxQb5STj2vgF
   EUI19h3YNhp+CgoentcZiZFmvRElTAipytatNsq/Ai6mc7N4l+8SD9OHM
   NPjZlQ7A2uHGNx/i2EEi+7ZxXX7HQOa1KzrZnPUqt3uxaPwOiqVs69dyo
   KjlFTby+Ol7uNVYWfX4aTBx15PnJ0CEVVNfxOVaZQtv8kA3yWJr4Gh59s
   bWk+D3oWw+dZlEyhkWtmc2hWQdQT/jsUZElIISdLLZh5PLJyfRcIX4H9C
   a8BWJKM4Wkx4uV8SHLJUUXbk/ZhtMJChv+tjzlZRLMKc0XYtk+PJHWSal
   A==;
X-CSE-ConnectionGUID: H9vYFKX1T7ypSpfKTc6YTA==
X-CSE-MsgGUID: 8VWw3pWOQdWZAykg0JnRuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77372789"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77372789"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 00:15:49 -0700
X-CSE-ConnectionGUID: jCoR3+hhS+iTfoVrXV+ydQ==
X-CSE-MsgGUID: EtpDa52ZR/agKBjetRCxuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="268588584"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.203])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 00:15:38 -0700
Date: Tue, 15 Sep 2026 10:15:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
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
	Johan Hovold <johan@kernel.org>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 2/3] nvmem: core: deprecate reg_write callback with
 reg_write_const
Message-ID: <aqjwmMn7GkAoxsu2@ashevche-desk.local>
References: <20260804135940.2378737-1-linkmauve@linkmauve.fr>
 <20260804135940.2378737-3-linkmauve@linkmauve.fr>
 <a1488d9d-3014-44ea-a0d7-6ab99fedccc9@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1488d9d-3014-44ea-a0d7-6ab99fedccc9@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Sep 14, 2026 at 10:48:21PM +0100, Srinivas Kandagatla wrote:
> On 8/4/26 2:59 PM, Link Mauve wrote:

...

> > - * @reg_write:	Callback to write data; return zero if successful.
> > + * @reg_write:	**DEPRECATED** - please use reg_write_const instead.
> 
> Marking here as deprecated is total waste as no one will read it,

This is still okay as we have many such things in the kernel (during the time).

> May be move this message to the core while registering.

No objections here.

...

> >  	nvmem_reg_read_t	reg_read;
> >  	nvmem_reg_write_t	reg_write;
> 
> flag this with compile time __deprecated flag.

__deprecated is DEPRECATED :-)
No new code should use it.

include/linux/compiler_attributes.h:110: * Don't. Just don't. See commit 771c035372a0 ("deprecate the '__deprecated'

> > +	nvmem_reg_write_const_t	reg_write_const;


-- 
With Best Regards,
Andy Shevchenko


