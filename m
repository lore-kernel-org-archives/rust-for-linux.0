Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B429A3F5BE4;
	Sun, 20 Sep 2026 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789903132; cv=none; b=eN6HNk+bcf06uSLB3JjMIJPYDjha6sfhm4zcA0GMNz01AbYnuV/NutxdEmdYzakhzo7VSOir/YURXJrHfNVmSfUPRmCMx7PMWvKtW9bngM09mSelILpPn5wbnmwbvLh2NYUvO2JFZ33ATStPPE7p3CdEzjj5fsBZifh9xn5xzSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789903132; c=relaxed/simple;
	bh=YHFSIfa4pVKxrlhxSffj9dcUAOSEVU/P5QMiQksQiaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2P+lz7hc3tAtJ9tyK3Hv9PnJCVZc1Om3GbZD1dCVhyJjtaUd/+vzDJbiIyR+2AxQcRXhhfLN1C0VT2PTDI4e1HW0pX4rRSt40+OTkaUAppL0nq7CJcCWhtfk8v8v2eBQCQwhLkjsE2lGZlJKssdu1YuU0Jdi7M5q8uggyZHIrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 8CCBF7189A90; Sun, 20 Sep 2026 13:18:45 +0200 (CEST)
Date: Sun, 20 Sep 2026 13:18:45 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
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
Subject: Re: [PATCH v6 0/4] nvmem: migrate to const void * in reg_write
Message-ID: <aq_BFQ4wgnJqGngQ@desktop>
References: <20260920111000.2404131-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260920111000.2404131-1-linkmauve@linkmauve.fr>
Jabber-ID: linkmauve@linkmauve.fr

Oops, I forgot to carry the tag I got in v5…

Here it is:
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

On Sun, Sep 20, 2026 at 01:09:53PM +0200, Link Mauve wrote:
> This callback used to take a mutable void * for no reason, which causes
> the compiler to be unaware that the val buffer should never be modified
> by the callback.
> 
> This was found while drafting the nvmem-provider Rust abstraction.
> 
> Thanks to the guidance of Andy Shevchenko, this now introduces a new
> callback and deprecates the existing one, with the goal of renaming the
> new one into the old one once no user remains in the kernel.
> 
> Changes since v5:
> - Link to v5:
>   https://lore.kernel.org/rust-for-linux/20260804135940.2378737-1-linkmauve@linkmauve.fr/T/
> - Add a dev_warn() when registering a nvmem driver with a deprecated
>   reg_write callback.
> - Add a fourth patch enabling COMPILE_TEST on three more nvmem drivers,
>   which forgot to depend on that config.
> - Remove a few unneeded (void *) and (const void *) casts in core.c.
> 
> Changes since v4:
> - Link to v4:
>   https://lore.kernel.org/rust-for-linux/20260726131724.15299-1-linkmauve@linkmauve.fr/T/
> - Rebase on top of linux-next 20260803, the previous series didn’t apply
>   any more due to changes in core.c.
> - Also convert the at24, at25, eeprom_93xx46 and m24lr drivers to the
>   new reg_write_const callback, these were missed because they got moved
>   to the nvmem directory in linux-next between v3 and v4.
> 
> Changes since v3:
> - Link to v3:
>   https://lore.kernel.org/rust-for-linux/20260716142415.28718-1-linkmauve@linkmauve.fr/T/
> - Drop Apple SPMI patch, which had already been independently included
>   in linux-next as 7089170e1df160f5f8fb395bc5aa2e2697b4e896.
> - Reword the cover letter’s subject.
> - Reorder the meson firmware patch before the other ones, so that every
>   commit is always working correctly.
> 
> Changes since v2:
> - Link to v2:
>   https://lore.kernel.org/rust-for-linux/aljAqBNVXV1aVJqx@luna/T/
> - Rebase on top of linux-next/master.
> - Fix logic error which made all devices read-only.
> - Remove a blanket cast of function pointers to void * in
>   apple-spmi-nvmem (patch 3).
> - Also fix constness of write buffer in firmware: meson, which is used
>   exclusively by meson-efuse (patch 4).
> - Re-review all changes to make sure the passed types are more correct
>   than they were before.
> - Actually test with COMPILE_TEST, which I forgot to enable before…
> 
> Changes since v1:
> - Link to v1:
>   https://lore.kernel.org/rust-for-linux/20260715175229.24672-1-linkmauve@linkmauve.fr/
> - Removed all changes to other subsystems than nvmem.
> - Added a new reg_write_const callback instead of changing the exisitng
>   reg_write.
> - Deprecated the existing reg_write callback, it will get removed once
>   all users in the kernel will be done migrating to the new one.
> 
> Link Mauve (4):
>   firmware: meson: pass a const buffer to meson_sm_call_write()
>   nvmem: core: deprecate reg_write callback with reg_write_const
>   nvmem: make all reg_write callbacks take const void *
>   nvmem: enable COMPILE_TEST for more drivers
> 
>  drivers/firmware/meson/meson_sm.c       |  2 +-
>  drivers/nvmem/Kconfig                   |  6 +++---
>  drivers/nvmem/apple-spmi-nvmem.c        |  4 ++--
>  drivers/nvmem/at24.c                    |  6 +++---
>  drivers/nvmem/at25.c                    |  4 ++--
>  drivers/nvmem/bcm-ocotp.c               |  8 ++++----
>  drivers/nvmem/core.c                    | 26 ++++++++++++++++---------
>  drivers/nvmem/eeprom_93xx46.c           |  6 +++---
>  drivers/nvmem/imx-ocotp-scu.c           |  6 +++---
>  drivers/nvmem/imx-ocotp.c               |  6 +++---
>  drivers/nvmem/internals.h               |  1 +
>  drivers/nvmem/lan9662-otpc.c            |  6 +++---
>  drivers/nvmem/lpc18xx_eeprom.c          |  6 +++---
>  drivers/nvmem/m24lr.c                   |  4 ++--
>  drivers/nvmem/max77759-nvmem.c          |  4 ++--
>  drivers/nvmem/meson-efuse.c             |  8 ++++----
>  drivers/nvmem/qcom-spmi-sdam.c          |  6 +++---
>  drivers/nvmem/qfprom.c                  |  6 +++---
>  drivers/nvmem/rave-sp-eeprom.c          |  6 +++---
>  drivers/nvmem/snvs_lpgpr.c              |  4 ++--
>  drivers/nvmem/sprd-efuse.c              |  6 +++---
>  drivers/nvmem/stm32-bsec-optee-ta.c     |  2 +-
>  drivers/nvmem/stm32-bsec-optee-ta.h     |  4 ++--
>  drivers/nvmem/stm32-romem.c             | 10 +++++-----
>  drivers/nvmem/zynqmp_nvmem.c            |  6 +++---
>  include/linux/firmware/meson/meson_sm.h |  2 +-
>  include/linux/nvmem-provider.h          |  6 +++++-
>  27 files changed, 87 insertions(+), 74 deletions(-)
> 
> 
> base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
> -- 
> 2.55.0
> 

-- 
Link Mauve
