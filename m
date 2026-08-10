Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C7F3ADB89;
	Mon, 10 Aug 2026 10:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786356235; cv=none; b=G/IcSGhNU7uVRF9785At2G+PNKtiJFAPSxGeg/1GS2n2yfNEhaKSMmC+D11gNtoo3tfNl8etxeI7Sr7Me5I916aG4NTNkOj0k4DMFZa/gxCB86/W3pjMbqiEEWskIacT7X9K8EIvR+Nu4d4Ij9yHQvc3HG7+80ikhobcfmTYnjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786356235; c=relaxed/simple;
	bh=/lSWpkgbaFYwGuprUNg21Fj/qhzEtOap45oTOdy7qmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNWkRbNmoY+8SPvWzp8nguVr7Upm/J1V6Opc9jvZ+SFCS/Cp9kAZQ18iPwk2SB60r+HFkSAM/8MoW9p5NIv6ddNkAd3o+J+zre7Gusqrz49OUt09hzjgj+QuROnnlTh+BDAdUx+ntTEfnTr3JHOJhng3TNE60K9LemXwnuG/Ubw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 0C2B470AF95E; Mon, 10 Aug 2026 12:03:45 +0200 (CEST)
Date: Mon, 10 Aug 2026 12:03:45 +0200
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
Subject: Re: [PATCH v4 0/3] nvmem: migrate to const void * in reg_write
Message-ID: <anmiAfteOQzPXRqX@desktop>
References: <20260726131724.15299-1-linkmauve@linkmauve.fr>
 <anl9ZRM0REenBK8t@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <anl9ZRM0REenBK8t@ashevche-desk.local>
Jabber-ID: linkmauve@linkmauve.fr

On Mon, Aug 10, 2026 at 10:27:33AM +0300, Andy Shevchenko wrote:
> On Sun, Jul 26, 2026 at 03:17:18PM +0200, Link Mauve wrote:
> > This callback used to take a mutable void * for no reason, which causes
> > the compiler to be unaware that the val buffer should never be modified
> > by the callback.
> > 
> > This was found while drafting the nvmem-provider Rust abstraction.
> > 
> > Thanks to the guidance of Andy Shevchenko, this now introduces a new
> > callback and deprecates the existing one, with the goal of renaming the
> > new one into the old one once no user remains in the kernel.
> 
> LGTM now, FWIW,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> But I think you also need to provide a road map of finishing this job (the best
> is to provide a continuation in some of yours public Git trees to point out).

I’ve just pushed these changes here, as usual just build-tested:
https://github.com/linkmauve/linux/commits/nvmem-v6

I was planning on working on those after the 7.3 merge window if this
series indeed goes into 7.3, but I was never worried this would be hard
to do, it’s a pretty mechanical change.

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
Link Mauve
