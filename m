Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CA937DEBC;
	Mon, 17 Aug 2026 18:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786992898; cv=none; b=ltfjaxBkQpgvE75+ZewOPqS+906rYVHm8RUSWVFT6rZ/O7NiQRUcrmZk2IOeIgfhur600Prh9XVVM0t8XIqS5k0G+p1jBR2cXt8ZPgXc9s+Qf4eVyyodK/7x0ikPgdjTJrqW3pPF5ionwhuCRYrbhpLGo97BEQ8qgY6ybUAXoak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786992898; c=relaxed/simple;
	bh=UagiHACKsOzSdTkMKQraTvqxzxYR38G+03DH+tjOxy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDKR/vQY0GiE1NHih5GEnviLenSNpTVKThwkk6o62xSKaT/IB/yOfWwzRa1NLdOl93//QtRpfgoiTZSsEUXIuYFVVMU8fSn9GYFAGC4Ijb5XOhnTrV+CvbYTsWtIxxzqt1iZ4pNluV7Kkw1SfOweNETO0WFVl9wSH+HjBjJxkWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Im+Qbwla; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Im+Qbwla"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786992896; x=1818528896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UagiHACKsOzSdTkMKQraTvqxzxYR38G+03DH+tjOxy8=;
  b=Im+QbwlaWwDxj/9L0TuFT7z8Zn/ylilwg/lAUVoYtc8R/616OrkwlUT3
   hYc5TW7dcMBv7j0C1EN0ng3bVp4BN6QGKwKQw+LXosg0gQGzckJqGDRII
   ksJgzZUNLKZques4mFxwUr2LTHaZZqU3NwW6Ykvzhq5DelxP0R55ropkL
   Q1yg0tJ7UZ/YMTLgmd31RaRrwf7zkJKbQiKDNWAG4uqbfUkweC3RcvFEB
   azGI+5TVxaEZZ69n1wPvXj8KEdLrbrpQNVRluQ7xbULdGU9rrsHnMcXut
   xhB+thpd9w/s/BRHCkDyB/UqEf6ui4bkq9KKvB2g+PhpTqa/erSfzHfY0
   w==;
X-CSE-ConnectionGUID: nWr9qvULR96IZlTizBOc7Q==
X-CSE-MsgGUID: RHXCF8PGTIm+MGsMw7f+kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87330826"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="87330826"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 11:54:55 -0700
X-CSE-ConnectionGUID: yFyEuGAqQ9Gm8zboujI71g==
X-CSE-MsgGUID: Z79PQw2ITnSV0r6BrpxHAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="266971517"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 11:54:45 -0700
Date: Mon, 17 Aug 2026 21:54:43 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Srinivas Kandagatla <srini@kernel.org>,
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
Subject: Re: [PATCH v5 0/3] nvmem: migrate to const void * in reg_write
Message-ID: <aoNY85rdMdBDSiGW@ashevche-desk.local>
References: <20260804135940.2378737-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804135940.2378737-1-linkmauve@linkmauve.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Aug 04, 2026 at 03:59:34PM +0200, Link Mauve wrote:
> This callback used to take a mutable void * for no reason, which causes
> the compiler to be unaware that the val buffer should never be modified
> by the callback.
> 
> This was found while drafting the nvmem-provider Rust abstraction.
> 
> Thanks to the guidance of Andy Shevchenko, this now introduces a new
> callback and deprecates the existing one, with the goal of renaming the
> new one into the old one once no user remains in the kernel.

FWIW, if the approach taken is okay by maintainers,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

I think this is right direction to go. We should use all possible ways to
protect the data from corruption.

-- 
With Best Regards,
Andy Shevchenko


