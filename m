Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GaIl8Cwb"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC3CA101
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 04:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702297845; x=1733833845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dtvlHNB4w7HlIkcynxYEFz9ZdbCs181fDKf8P3MZE9c=;
  b=GaIl8CwbptwDRO3mBnSegFRO5pDHNedWTLEtTJ1Ko8omnqz28GqHgh9s
   HCTR+uZ2N0NR84fOcoNMBkbUdjJ7kdBgE1LjdMY+sgivRKRVlEvZtJ9Wp
   TAkwfopHA+7V5+i4x5oNZoeEkqNLaqVUQ0mdZnGOWeqwSda935kmwltM0
   XVtKa2OS6aI0z4zp0KWWi9WZHteGx5k1cb6VQeuhYJUqn3jkiiHny8zCs
   Z83H3uk04ly9qrx82iPhubAAS8IwTF2T4FPgRBZcShiLa9G8H8PuNMM6Y
   aZapudYNHAjefxg61bE0MyT9WGPe6k1YCB7b8qgciH5awQ1Yec++AePnV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="7993672"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="7993672"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 04:30:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="916829006"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="916829006"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 11 Dec 2023 04:30:44 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id C4BF839B; Mon, 11 Dec 2023 14:30:42 +0200 (EET)
Date: Mon, 11 Dec 2023 14:30:42 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3] docs: rust: Add rusttest info
Message-ID: <20231211123042.GD1074920@black.fi.intel.com>
References: <20231211121613.3489513-1-dirk.behme@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231211121613.3489513-1-dirk.behme@de.bosch.com>

Hi,

On Mon, Dec 11, 2023 at 01:16:13PM +0100, Dirk Behme wrote:
> Searching the Rust kernel documentation all existing Rust Make
> targets (rustavailable, rustfmt, rustfmtcheck, rustdoc and
> rust-analyzer) are explicitly documented with their Make syntax.
> While the Make target rusttest is mentioned two times in the
> existing documentation, it's Make syntax is not explicitly
> documented, yet. Add a test section to document this.
> 
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
> 
> v3: Add the comments from Benno and Miguel. Thanks!
> 
>  Documentation/rust/general-information.rst | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
> index 081397827a7ea..016c7feb433ce 100644
> --- a/Documentation/rust/general-information.rst
> +++ b/Documentation/rust/general-information.rst
> @@ -77,3 +77,22 @@ configuration:
>  	#[cfg(CONFIG_X="y")]   // Enabled as a built-in (`y`)
>  	#[cfg(CONFIG_X="m")]   // Enabled as a module   (`m`)
>  	#[cfg(not(CONFIG_X))]  // Disabled
> +
> +Testing
> +-------
> +
> +To run the Rust tests, you can use the following make target::
> +
> +	make LLVM=1 rusttest
> +
> +This requires the kernel .config and downloads external repos. It
> +runs the ``#[test]`` tests on the host (currently) and thus is fairly
> +limited in what these tests can test.
> +
> +Additonally, there are the tests that come from the examples in the

Typo: Additonally -> Additionally

> +Rust documentation and get transformed into KUnit tests. These can be
> +run via KUnit. For example::
> +
> +	./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch x86_64 --kconfig_add CONFIG_RUST=y
> +
> +See the :doc:`KUnit documentation</dev-tools/kunit/index>` for the details how to use it.
> -- 
> 2.28.0
> 
