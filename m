Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3D11A706
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 14:11:03 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 294B959F3
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 07:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=L8EbUEK/TLSkFiPuZ8//jkIGEBHyxPkmtRIEgt9SSHY=; b=PxEy+K90rQT6rSODFARHNK7DWP
	QjQl6LjP98tJ2cJl5sLA9Qk+uDn5YN4Ahh/ItYgzrdrSEHnJiQieaR1zuj4j2diip937g76/Jue5i
	pbuwZ+XfyMWqD1xKI9gxvSFMviGsjUtLj7Ur0ytbWaDDcdxZiUMujzcx2p7JQQQQjfQE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qgQa4-006JWS-TY; Wed, 13 Sep 2023 16:11:00 +0200
Date: Wed, 13 Sep 2023 16:11:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 4/4] sample: rust: add Asix PHY driver
Message-ID: <894554e5-fed7-456a-a214-efd01f43958b@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-5-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913133609.1668758-5-fujita.tomonori@gmail.com>

On Wed, Sep 13, 2023 at 10:36:09PM +0900, FUJITA Tomonori wrote:
> This is the simpler version of drivers/net/phy/ax88796b.c. The C
> driver implements three PHY drivers but this implements only one,
> AX88772A PHY. This provides educational information for Rust
> abstractions for network PHY drivers.

Rather than being a sample, please make it a real driver. Place it in
drivers/net/phy, add a Kconfig option to select it. Maybe drop the
rust_ prefix, since the .rs makes it clear what sort of file it is.

I'm just back from vacation, and have a backlog of patches to review,
so it make take a while before i can look at the details.

> +const MII_BMCR: u32 = 0x00;
> +const BMCR_SPEED100: u32 = 0x2000;
> +const BMCR_FULLDPLX: u32 = 0x0100;

These should be part of the abstraction. 802.3 defines many of the
registers, including the basic mode control register. They should be
identical for all PHYs. So please add an equivalent of
include/uapi/linux/mii.h, or better still, if possible, actually use
the #defines from include/uapi/linux/mii.h.

Also, PHY registers are u16, not u32. And C22 PHY register addresses
are in the range 0-31, so a u8 could be used, or the equivalent of a C
int, whatever the compile thinks is most efficient.

    Andrew
