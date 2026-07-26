Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D641FBC8C;
	Sun, 26 Jul 2026 12:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785070584; cv=none; b=FywZIhta/NXkyrkO4oiZ0Gjwn1n17g+wn4tGL1/mUJODnCHCoxxTmhXb4XybxjQHpRNbM694izMhd00eJaVWeuHT0Vd0Kx08WNpwDZmnGwQ9D0k7kc57qEGFhVgitwbod2SK5dSBzt3Vi+xw1pnosu+w0m+q4iSP87sp29gY7SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785070584; c=relaxed/simple;
	bh=qOWSLoFTRbEIxSauVxZ4vA0xfF8LEiuIbFTNM/LfThE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWbCmr46At+rxtABSkcKDcnYOr7xT/G19DTNsrkyPG0E2Nb/bc3wA1KxyHzG7b4oe3F0LqZJLwNXaruvAZVHCd8BWFK7vP5PDKJqb94d3/v+bwJiGbQymXn0Pu+UwqaY6tULg4NwXgsmsGUGBUNcILYcPDf6kj9x/9eljFZuvIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 046A5F40DDF; Sun, 26 Jul 2026 14:56:17 +0200 (CEST)
Date: Sun, 26 Jul 2026 14:56:16 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Srinivas Kandagatla <srini@kernel.org>,
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
Message-ID: <amYD8I6a1c01fnvs@luna>
References: <20260716142415.28718-1-linkmauve@linkmauve.fr>
 <20260716142415.28718-4-linkmauve@linkmauve.fr>
 <alkd0WWr3KX7MS5O@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alkd0WWr3KX7MS5O@ashevche-desk.local>
Jabber-ID: linkmauve@linkmauve.fr

Ah, someone independently sent the same patch as this one in
7089170e1df160f5f8fb395bc5aa2e2697b4e896, so I’ll drop it from v4.

Sorry it took that long!

On Thu, Jul 16, 2026 at 09:07:13PM +0300, Andy Shevchenko wrote:
> On Thu, Jul 16, 2026 at 04:24:10PM +0200, Link Mauve wrote:
> > This driver used to cast the regmap_bulk_*() functions to void *,
> > bypassing any compiler safety around incompatible function pointers.
> > 
> > With two small wrappers, which just convert the void * priv parameter
> > into the wanted struct regmap *, we can remove the void * cast
> > altogether.
> 
> Reported-by: ?
> 
> > Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
> 
> ...
> 
> > +static int apple_spmi_nvmem_read(void *priv, unsigned int offset,
> > +				 void *val, size_t bytes)
> > +{
> 
> > +	struct regmap *regmap = priv;
> 
> No need :-)
> 
> > +	return regmap_bulk_read(regmap, offset, val, bytes);
> > +}
> 
> static int apple_spmi_nvmem_read(void *map, unsigned int offset,
> 				 void *val, size_t bytes)
> {
> 	return regmap_bulk_read(map, offset, val, bytes);
> }
> 
> ...
> 
> > +static int apple_spmi_nvmem_write(void *priv, unsigned int offset,
> > +				  const void *val, size_t bytes)
> > +{
> > +	struct regmap *regmap = priv;
> > +	return regmap_bulk_write(regmap, offset, val, bytes);
> > +}
> 
> In the similar way as above.
> 
> ...
> 
> > -		.reg_read = (void *)regmap_bulk_read,
> > -		.reg_write_const = (void *)regmap_bulk_write,
> > +		.reg_read = apple_spmi_nvmem_read,
> > +		.reg_write_const = apple_spmi_nvmem_write,
> 
> I think the proper ordering is to address this first (before your main change)
> and update later with const argument. Yes, it will be a bit more changes, but
> it will be cleaner.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
Link Mauve
