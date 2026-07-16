Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F913D5645;
	Thu, 16 Jul 2026 11:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784200054; cv=none; b=jZGYMYlgp2lS/6ZM0g+e8SU8yYkku6ugYXev8UAAXlXKB/g4bF2oAAzjH9umRYRrcocAgszQR2sKcHaIT24cEyX6dWSjYz9TxxnEjQM8GJcC9CSRBU12C03Zwaff2HLjUKGaXtPIdXUTiVDYAevd0aZF+MJbk49xUWeUFClCWh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784200054; c=relaxed/simple;
	bh=Q6VGXW5tf9e1NERg0XxzMyBWsizwiO2Hrp5/U9CR138=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NabNtQBxbntOMOWeoMEQxWSNGGp8NSi8z0XgWpS78bvYv1D0vD330bfH4hCIsNfg4ybrFfdr1sTIalvv/sQk5DBd6AcSUk0A3GQHkCpNtulH+oe/k7CqAMiH5/eqFHv+xgyBOpw6AGiVyNvwRuURnLZctBjgsQcNI1ZpLdD0AIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id D604FF40D30; Thu, 16 Jul 2026 13:07:26 +0200 (CEST)
Date: Thu, 16 Jul 2026 13:07:26 +0200
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
Message-ID: <ali7bki3jqpd8ckE@luna>
References: <20260715195520.25410-1-linkmauve@linkmauve.fr>
 <alieVR1cOtOySi4_@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="siXK+shzjeD2fFGh"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alieVR1cOtOySi4_@ashevche-desk.local>
Jabber-ID: linkmauve@linkmauve.fr

--siXK+shzjeD2fFGh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jul 16, 2026 at 12:03:17PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 15, 2026 at 09:55:16PM +0200, Link Mauve wrote:
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
> You forgot to use --base. It's unclear against what should be this applied.
> I tried Linux Next (next-20260715), and it fails.
> 
> Yes, it applies against v7.2-rc3, but it means that this won't be applied on
> top of maintainer's tree (which has something already that you have to take
> into consideration).

Indeed I developed against Linus’s master, I’ll rebase on linux-next for
v3.

> 
> For the record, the first version of the series was no go as the first patch
> there breaks the things, like
> 
> drivers/nvmem/qfprom.c:446:22: error: incompatible function pointer types assigning to 'nvmem_reg_write_t' (aka 'int (*)(void *, unsigned int, const void *, unsigned long)') from 'int (void *, unsigned int, void *, size_t)' (aka 'int (void *, unsigned int, void *, unsigned long)') [-Wincompatible-function-pointer-types]
>   446 |                         econfig.reg_write = qfprom_reg_write;
>       |                                           ^ ~~~~~~~~~~~~~~~~
> 1 error generated.
> 
> This version doesn't have this issue (at least with my smoke build tests
> on x86_64).

Yup, I enabled the drivers but didn’t select COMPILE_TEST, so they
didn’t actually build and I assumed everything was correct…  This won’t
happen again.

> 
> Now, what catches me is that regmap_bulk_read() proto used for both cases in
> drivers/nvmem/apple-spmi-nvmem.c without any changes. Which makes me think
> that the approach can be done in a simpler way, id est converting users first
> to use const specifiers in their callbacks first. But this trick is done with
> using (void *) casting (?) which makes warning to disappear, which is
> interesting case. So I think the Apple driver should actually use proper
> protos and hence wrappers, otherwise it makes compiler blind, which is not
> good. TL;DR: you should fix the Apple driver (and might more if any of them
> use that dirty trick).

This series only affects the reg_write callback, not reg_read, so it’s
to be expected that regmap_bulk_read() keeps its void * parameter as it
will modify it, it’s regmap_bulk_write() which correctly takes const
void *.  The Apple driver completely removes all function pointer safety
by casting the function into void *, although that’s not due to const
incompatibility but due to the first argument being struct regmap *
instead of void *.

I’ve attached a patch fixing this particular issue, I will include it in
my v3 if that’s ok with you (or it could go as a different series, I
don’t care much).

I think I’ve found another bug in that driver, it says .max_register =
0xffff but .size = 0xffff, one or the other is probably off-by-one, and
I suspect .size should be 0x10000 instead.

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

Thanks!

-- 
Link Mauve

--siXK+shzjeD2fFGh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename=0001-nvmem-apple-spmi-improve-calling-safety-with-wrapper.patch

From ec85ce97c6c835d99aa28b11b78af2744b45dc49 Mon Sep 17 00:00:00 2001
From: Link Mauve <linkmauve@linkmauve.fr>
Date: Thu, 16 Jul 2026 12:59:13 +0200
Subject: [PATCH] nvmem: apple-spmi: improve calling safety with wrapper
 functions

This driver used to cast the regmap_bulk_*() functions to void *,
bypassing any compiler safety around incompatible function pointers.

With two small helpers, which just convert the void * priv parameter
into the wanted struct regmap *, we can remove the void * cast
altogether.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 drivers/nvmem/apple-spmi-nvmem.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/apple-spmi-nvmem.c b/drivers/nvmem/apple-spmi-nvmem.c
index cbf25c53d048..81d9e242c836 100644
--- a/drivers/nvmem/apple-spmi-nvmem.c
+++ b/drivers/nvmem/apple-spmi-nvmem.c
@@ -18,6 +18,20 @@ static const struct regmap_config apple_spmi_regmap_config = {
 	.max_register	= 0xffff,
 };
 
+static int apple_spmi_nvmem_read(void *priv, unsigned int offset,
+				 void *val, size_t bytes)
+{
+	struct regmap *regmap = priv;
+	return regmap_bulk_read(regmap, offset, val, bytes);
+}
+
+static int apple_spmi_nvmem_write(void *priv, unsigned int offset,
+				  const void *val, size_t bytes)
+{
+	struct regmap *regmap = priv;
+	return regmap_bulk_write(regmap, offset, val, bytes);
+}
+
 static int apple_spmi_nvmem_probe(struct spmi_device *sdev)
 {
 	struct regmap *regmap;
@@ -28,8 +42,8 @@ static int apple_spmi_nvmem_probe(struct spmi_device *sdev)
 		.word_size = 1,
 		.stride = 1,
 		.size = 0xffff,
-		.reg_read = (void *)regmap_bulk_read,
-		.reg_write_const = (void *)regmap_bulk_write,
+		.reg_read = apple_spmi_nvmem_read,
+		.reg_write_const = apple_spmi_nvmem_write,
 	};
 
 	regmap = devm_regmap_init_spmi_ext(sdev, &apple_spmi_regmap_config);
-- 
2.55.0


--siXK+shzjeD2fFGh--
