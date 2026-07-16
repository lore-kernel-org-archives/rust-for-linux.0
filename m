Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEC141A571;
	Thu, 16 Jul 2026 11:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201394; cv=none; b=AoDfRjJ+PMeAiBKX1lgVjbVKP4IAmLm/gbcQTwiXs5oelbApgwJtGAnPXlQ30xu5bU3FcFZZGxEYDyJloeP3siuP9ZBoBIU4Uz9AQdUPtOLb+kfqxAOlptRWCiDw3w5s4dx86UmDUm4Lwdn5VpTfltx+N8sIqQk8FoAzaRk9cb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201394; c=relaxed/simple;
	bh=bn/4XCsEXhO1/vLWKlhznRFqwSm5TiizvIXsMBUXO9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4MobsZo7sSyugcZadLXXG0bwYmm4lxDlDuC0qC9HeyOqn7DHDb+8Ny/8MMYnEk5K9JsBkvWYPmVhW6Mrtb/ssFjpqYGGuJX5hRBZg0T/KosrIwiTpHjIx5sWWaWOmW/BMTCeMpXh2ufMRE+oIE8i/8g/LBum7jE52/CMFxTbGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 9FB37F40D30; Thu, 16 Jul 2026 13:29:45 +0200 (CEST)
Date: Thu, 16 Jul 2026 13:29:44 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Srinivas Kandagatla <srini@kernel.org>,
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
Message-ID: <aljAqBNVXV1aVJqx@luna>
References: <20260715195520.25410-1-linkmauve@linkmauve.fr>
 <alieVR1cOtOySi4_@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alieVR1cOtOySi4_@ashevche-desk.local>
Jabber-ID: linkmauve@linkmauve.fr

On Thu, Jul 16, 2026 at 12:03:17PM +0300, Andy Shevchenko wrote:
[…]
> ..... TL;DR: you should fix the Apple driver (and might more if any of them
> use that dirty trick).

It was the only one of the drivers/nvmem/ to do that.  Three other
drivers use a pattern where they merge read and write operations into a
single access function with a type=read/write parameter, so const safety
can’t work there and I’ll continue casting from const void * to void *
in the write function to keep that pattern working.

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
Link Mauve
