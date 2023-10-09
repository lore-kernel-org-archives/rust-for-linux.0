Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82CF567D;
	Mon,  9 Oct 2023 10:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nx08lUVj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E796BC433C7;
	Mon,  9 Oct 2023 10:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696846213;
	bh=vCsF8PrLOJQudhjLfpS6mjQ7Oea7yLQaCtCsChi2+Xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nx08lUVjWOGXxHoEPVDhM5T88Li2UfzSXHNpe9wv0tFq3fogot3tMp33THbanfutT
	 VHkFYsOb8prd6159p/HVl0QzSsdTbtDBQ4G28jIvP9WAPoMUzI4dULOCzKDR8AA5Q3
	 20h8vsaxDiCGcrP+1h7J72xlZSTweXtaR2FEL0Ok=
Date: Mon, 9 Oct 2023 12:10:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch,
	miguel.ojeda.sandonis@gmail.com, tmgross@umich.edu
Subject: Re: [PATCH net-next v3 3/3] net: phy: add Rust Asix PHY driver
Message-ID: <2023100955-scrambler-radio-e93a@gregkh>
References: <20231009013912.4048593-1-fujita.tomonori@gmail.com>
 <20231009013912.4048593-4-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009013912.4048593-4-fujita.tomonori@gmail.com>

On Mon, Oct 09, 2023 at 10:39:12AM +0900, FUJITA Tomonori wrote:
> This is the Rust implementation of drivers/net/phy/ax88796b.c. The
> features are equivalent. You can choose C or Rust versionon kernel
> configuration.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  drivers/net/phy/Kconfig          |   7 ++
>  drivers/net/phy/Makefile         |   6 +-
>  drivers/net/phy/ax88796b_rust.rs | 129 +++++++++++++++++++++++++++++++
>  rust/uapi/uapi_helper.h          |   2 +
>  4 files changed, 143 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/net/phy/ax88796b_rust.rs
> 
> diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
> index 421d2b62918f..0317be180ac2 100644
> --- a/drivers/net/phy/Kconfig
> +++ b/drivers/net/phy/Kconfig
> @@ -107,6 +107,13 @@ config AX88796B_PHY
>  	  Currently supports the Asix Electronics PHY found in the X-Surf 100
>  	  AX88796B package.
>  
> +config AX88796B_RUST_PHY
> +	bool "Rust version driver for Asix PHYs"
> +	depends on RUST_PHYLIB_BINDINGS && AX88796B_PHY
> +	help
> +	  Uses the Rust version driver for Asix PHYs (ax88796b_rust.ko)
> +	  instead of the C version.

This does not properly describe what hardware this driver supports.  And
that's an odd way to describe the module name, but I see none of the
other entries in this file do that either, so maybe the PHY subsystm
doesn't require that?

thanks,

greg k-h
