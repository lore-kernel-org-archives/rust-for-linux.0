Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6FE28CF5D;
	Mon, 10 Aug 2026 07:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786346868; cv=none; b=mjHHstmDpDUWvvKDeLiCbNLikbvp7UqbMU2gjg+2TfMDkXfbvsKwBYFM3xFJ+4zt96hFQy34cN2Tx8u4pDDm5Tc01JtbCxwJ6uxHuT4S0P31eamEWlQZIagdzYTTguV3eEXBMy1CtMNsWb/dXbPUO94RacqpUEWjrq0kdkUEb2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786346868; c=relaxed/simple;
	bh=xQLhwS8wv9sFqYFOv/TIN/5z4j31qZTJrUsswVUaMwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFjliel98VTyg0W7PMoFiZrMutW3OaP+esOCf/1L+ZRVUl50KGdI3ENmbCzacd89AIThR1H6xhGJ7z/dZz+d3e6152/GGQwvDZ+R2MLlTrCd4Y7UT8aaZMKAlmDIdxclUlThkj9J73j2AAYNVCBzXnCY3mSK08DToFFqDWdAH0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FG75gnP7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FG75gnP7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786346867; x=1817882867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xQLhwS8wv9sFqYFOv/TIN/5z4j31qZTJrUsswVUaMwY=;
  b=FG75gnP7rW6eu0m595W1Sd3oeT2R0aMzbWX9W1zCQFqsMlKA0CcV9kUj
   AXzCPoGefjFBqElLD2PjL6EqoJIU+XbHvzR2/eTE+vHvm4BphqQ3W/qoa
   tz2qar7gTfUEMaP5/kVdO3QtzKedH5bjaT9Wvnb+Q3GkfKvS6EzvyKJ+E
   kyo42KMBbf3YwsYX2Q8LQKVHwv3SwcrqTaEK+fFfNvLNo9ByX87PWYfSY
   1itkPPUM0zC3/BoDwTQX+0Ks5czmbtP20m6KbO/LFc8V5kKFLCS9YFuMl
   Kw+mvolaiDB6+p5DN9c354GC4dBh7619x93dCQdQI3Jj+r+cA6JOV/eEr
   w==;
X-CSE-ConnectionGUID: NPVHzscfQO+doNMdk+QHvA==
X-CSE-MsgGUID: cCepRIf2TZq0ioTUrdhGXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="112400376"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="112400376"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 00:27:46 -0700
X-CSE-ConnectionGUID: fVqcRD4QTWCn0dQ6j9/S5A==
X-CSE-MsgGUID: 7ZXTFfZuQhmUulcEeVHcvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="263584571"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.99])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 00:27:36 -0700
Date: Mon, 10 Aug 2026 10:27:33 +0300
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
Subject: Re: [PATCH v4 0/3] nvmem: migrate to const void * in reg_write
Message-ID: <anl9ZRM0REenBK8t@ashevche-desk.local>
References: <20260726131724.15299-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260726131724.15299-1-linkmauve@linkmauve.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Jul 26, 2026 at 03:17:18PM +0200, Link Mauve wrote:
> This callback used to take a mutable void * for no reason, which causes
> the compiler to be unaware that the val buffer should never be modified
> by the callback.
> 
> This was found while drafting the nvmem-provider Rust abstraction.
> 
> Thanks to the guidance of Andy Shevchenko, this now introduces a new
> callback and deprecates the existing one, with the goal of renaming the
> new one into the old one once no user remains in the kernel.

LGTM now, FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

But I think you also need to provide a road map of finishing this job (the best
is to provide a continuation in some of yours public Git trees to point out).

-- 
With Best Regards,
Andy Shevchenko


