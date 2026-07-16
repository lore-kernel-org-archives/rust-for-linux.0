Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52663A3E98;
	Thu, 16 Jul 2026 18:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784225247; cv=none; b=BLGLJo11AuYGcQWfe+irkA6bHDtu0w7Jb7XJ0lFHja62yUKD93KXrnMzVLzlDREkb1UsIM5tdtvoyuj0a+rm8WnRHD+IIPKslMg5tpavhUfN+mFvd1KMSFYDXAon6OFn2NIWtQS/6DIjgINNDMp6GcKkB5RbZ4dBpVTS7fSznQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784225247; c=relaxed/simple;
	bh=3zU61iR89W7q/QfMisKJJhMrwLX8REl16SCm0WWEqt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eq+aCH6w8y7pEuNf7WZG0uQhX/3BEX+FQwpzY/iyubP8fLReXezcWhc0lT+C/D2IWou1ufdTLEtyLeeFAxDRppzqg5HCX8vSoBy22f4/knBFkhK8HBbNiBYQTU5AeUpNYIb3bNuu81rbD+EylLjfNI1F137wa1nXZeLPz4zZR0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/ssUJ/x; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/ssUJ/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784225246; x=1815761246;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3zU61iR89W7q/QfMisKJJhMrwLX8REl16SCm0WWEqt0=;
  b=C/ssUJ/xnxscDBES1HMe7zYgIcKz6O/EOWJITNJSTto9Slp88//YhQh6
   fYuxZFdT3bGKfBWOUhAFVWbgdbsZ9Abku/sqVyqVX3AaOYMtXg2GdmdW4
   uyKozGHG9dozF7z19wlvj6mvvMVQAmJeROT9LkocO0bLsX48tq3Xrjsed
   QzhCAt/RheR66P01a0OVGRyYXXLX/XanUF8vvFxB8xKSLyBqG2P8qKMrL
   QLCI1/+cy14qQvF2QZwar6QTeFZGoOtlQ5xqpLMQXOCMD3gAMpzN21dTQ
   DaJnEjjA5hd8yXOFyyeGM31kQp0OL035qjvzPsLLXuSrv4deOVIdoK5cD
   g==;
X-CSE-ConnectionGUID: Jt36V7T6QoGPdpNEEDq70Q==
X-CSE-MsgGUID: xBuQ5QllTqiSgp0k0wfnQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="95250922"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="95250922"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 11:07:26 -0700
X-CSE-ConnectionGUID: APJCwIcNR12AYNk0i8vioQ==
X-CSE-MsgGUID: qNYSOzF+SJGatiaUqRLDtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="253929056"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 11:07:16 -0700
Date: Thu, 16 Jul 2026 21:07:13 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Srinivas Kandagatla <srini@kernel.org>,
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
Subject: Re: [PATCH v3 3/4] nvmem: apple-spmi: improve calling safety with
 wrapper functions
Message-ID: <alkd0WWr3KX7MS5O@ashevche-desk.local>
References: <20260716142415.28718-1-linkmauve@linkmauve.fr>
 <20260716142415.28718-4-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716142415.28718-4-linkmauve@linkmauve.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 16, 2026 at 04:24:10PM +0200, Link Mauve wrote:
> This driver used to cast the regmap_bulk_*() functions to void *,
> bypassing any compiler safety around incompatible function pointers.
> 
> With two small wrappers, which just convert the void * priv parameter
> into the wanted struct regmap *, we can remove the void * cast
> altogether.

Reported-by: ?

> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>

...

> +static int apple_spmi_nvmem_read(void *priv, unsigned int offset,
> +				 void *val, size_t bytes)
> +{

> +	struct regmap *regmap = priv;

No need :-)

> +	return regmap_bulk_read(regmap, offset, val, bytes);
> +}

static int apple_spmi_nvmem_read(void *map, unsigned int offset,
				 void *val, size_t bytes)
{
	return regmap_bulk_read(map, offset, val, bytes);
}

...

> +static int apple_spmi_nvmem_write(void *priv, unsigned int offset,
> +				  const void *val, size_t bytes)
> +{
> +	struct regmap *regmap = priv;
> +	return regmap_bulk_write(regmap, offset, val, bytes);
> +}

In the similar way as above.

...

> -		.reg_read = (void *)regmap_bulk_read,
> -		.reg_write_const = (void *)regmap_bulk_write,
> +		.reg_read = apple_spmi_nvmem_read,
> +		.reg_write_const = apple_spmi_nvmem_write,

I think the proper ordering is to address this first (before your main change)
and update later with const argument. Yes, it will be a bit more changes, but
it will be cleaner.

-- 
With Best Regards,
Andy Shevchenko


