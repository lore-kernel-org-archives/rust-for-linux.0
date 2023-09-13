Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518C7A45
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 18:57:43 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD8061989
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 11:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Vl0eKXyxYAtAEQq9ytHijqMxiKe3tcF4Sg0LogK0Cq8=; b=10dnCRWhF5jBoaOA1k9Hb2t3hc
	uUhyDCfbSfh1tykNqFLvdKIgwuYVaUIwWOKrRgpcJ8EiWonh87CiMqpm9UFKCh8nWA/GUt93LbfBL
	TsrjLHkRTgby+Qb8uONqgnHtBWeOKGr0h5On8hwJvve0Xi8y9xVxzKSloTCIj4qpmukQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qgV3U-006KrQ-PZ; Wed, 13 Sep 2023 20:57:40 +0200
Date: Wed, 13 Sep 2023 20:57:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 3/4] MAINTAINERS: add Rust PHY abstractions file
 to the ETHERNET PHY LIBRARY
Message-ID: <dd12e8b8-16a0-4cc2-8b0c-78386ce2dabc@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-4-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913133609.1668758-4-fujita.tomonori@gmail.com>

On Wed, Sep 13, 2023 at 10:36:08PM +0900, FUJITA Tomonori wrote:
> The files are placed at rust/kernel/ directory for now but the files
> are likely to be moved to net/ directory if things go well.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..95ecf96b911a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7797,6 +7797,7 @@ F:	include/trace/events/mdio.h
>  F:	include/uapi/linux/mdio.h
>  F:	include/uapi/linux/mii.h
>  F:	net/core/of_net.c
> +F:	rust/kernel/net/phy.rs

I would suggest you add yourself as a Maintainer as well. You are
basically stepping up to forever maintaining these files, at least
until Russell, Heiner and I learn Rust.

And to make that maintenance work simpler, you might want to move
phy.rs to drivers/net/phy, so it is alongside phy_device.c,
phy-core.c, and phy.c, the files it needs to track.

	Andrew
