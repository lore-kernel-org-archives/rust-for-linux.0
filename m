Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BA747426E;
	Mon, 14 Sep 2026 14:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395208; cv=none; b=FuMvIFcywqg4hu+p9AVW2KStHMDqbn5doE5XWhGRLTCQBlJ9cLGL7gdlyP2uBLQWfUga/9tJUUkN7MvS6aPSRt8vGNN1Zksm+2rlZe3Qx9muv21A2fyPk3xz4FefRLrAc0gxtiER7TtdJFJcCvc74ItoFWblcR/3GKlWU0CgECA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395208; c=relaxed/simple;
	bh=HPoZWFDHbv/7IEvQj89VBgQug8JWRFu6B46ZI2l/FlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3bRhkpBAz4l/JyJka57IG2btJDlVISht36wa7ADPwA9+SAFAkb42Dpr8NiViwmF82ypC80HOL9Yxs8wWm4ztpq/NekOU/EfNrb37lacbI/RGaT3kwdpC4I3Z8Yp/QDVAS6DVNoaAeb7xsjaUUV9bCafxOJqtnOGyOiiuz7gk04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 6BE34717EC24; Mon, 14 Sep 2026 16:13:17 +0200 (CEST)
Date: Mon, 14 Sep 2026 16:13:17 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Srinivas Kandagatla <srini@kernel.org>,
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
Message-ID: <aqgA_bGo3yqBNL0_@desktop>
References: <20260804135940.2378737-1-linkmauve@linkmauve.fr>
 <aoNY85rdMdBDSiGW@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoNY85rdMdBDSiGW@ashevche-desk.local>
Jabber-ID: linkmauve@linkmauve.fr

Hi,

On Mon, Aug 17, 2026 at 09:54:43PM +0300, Andy Shevchenko wrote:
> On Tue, Aug 04, 2026 at 03:59:34PM +0200, Link Mauve wrote:
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
> FWIW, if the approach taken is okay by maintainers,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Thanks for the review!

> 
> I think this is right direction to go. We should use all possible ways to
> protect the data from corruption.

Sorry for not pinging again before the end of the 7.3 merge window, I
was on vacations, but this only delayed that work by one cycle.

Is there anything I could do to make it happen for 7.4, or should I just
wait until a maintainer picks up that series?  I just tested and
everything still builds file on top of linux-next as of next-20260911.

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
Link Mauve
