Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8388263A8
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 18:32:24 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AE8BE6E
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 11:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=M8rg7YyprUHM4zXv8VGEqE9G01kRI42CyzbizrRLo1Q=; b=OpMx+fGTDbxjDqm/MgOyvUoFkQ
	aNbOC7HU/QKP+364c4YuEYBxRQhsOpMuCy2pndtCxJEdr6ExoV/VzkHOyrT1L4yoOcfN1x59o3/hQ
	+xmhEL9GW+DliQVhmZwTLJcUIhrDGqP3Mt5m3Rofj0cgzCywVry5Zsh5unwAhIeYT0eU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qkqNV-007TqN-UQ; Mon, 25 Sep 2023 20:32:17 +0200
Date: Mon, 25 Sep 2023 20:32:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	miguel.ojeda.sandonis@gmail.com
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY
 drivers
Message-ID: <b07d6626-f2db-4d87-8c34-ba8873cad5de@lunn.ch>
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
 <20230924064902.1339662-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230924064902.1339662-2-fujita.tomonori@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> +    /// Resolves the advertisements into PHY settings.
> +    pub fn resolve_aneg_linkmode(&mut self) {
> +        let phydev = Opaque::get(&self.0);
> +        // SAFETY: This object is initialized by the `from_raw` constructor,
> +        // so an FFI call with a valid pointer.
> +        unsafe {
> +            bindings::phy_resolve_aneg_linkmode(phydev);
> +        }
> +    }

void phy_resolve_aneg_linkmode(struct phy_device *phydev)
{
	__ETHTOOL_DECLARE_LINK_MODE_MASK(common);
	int i;

	linkmode_and(common, phydev->lp_advertising, phydev->advertising);

	for (i = 0; i < ARRAY_SIZE(settings); i++)
		if (test_bit(settings[i].bit, common)) {
			phydev->speed = settings[i].speed;
			phydev->duplex = settings[i].duplex;
			break;
		}

	phy_resolve_aneg_pause(phydev);
}
EXPORT_SYMBOL_GPL(phy_resolve_aneg_linkmode);

This symbol is exported such that only a GPL licensed module can use
it. So to keep with the spirit of this, i would expect that the Rust
function resolve_aneg_linkmode() also has some sort of markup so that
it can only be used by a GPL licensed module.

Is there any handling of this at the moment? We don't want using a
Rust wrapper being a way to get around the GPL restrictions.

Is this a FAQ? Is so, please point me at the documentation...

Thanks
	Andrew

