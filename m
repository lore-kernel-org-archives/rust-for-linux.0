Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0A3286B1
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 22:48:41 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D24A3
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 15:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8nbvxheJI4qpeqppYxE7DuskarFi0q0fWpTCF1AAeAA=; b=11UctbosXhHevhCTgSe2WGG4T+
	MrWd4lovRzew+eT4MKAIUnQZhBB1xzweaMpMceDwIbqiVHgej6sUCwY3WJeMa3G1flcDyE+3ikBrK
	AxataOSYYhdV6RndNVpDrMiz2ZUidVYMSGJdojueA3dsUOPV3mJOY0fKkpnJEPj8KLWM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qiN2Y-006qhi-F7; Tue, 19 Sep 2023 00:48:26 +0200
Date: Tue, 19 Sep 2023 00:48:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Trevor Gross <tmgross@umich.edu>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Benno Lossin <benno.lossin@proton.me>
Subject: Re: [RFC PATCH v1 0/4] Rust abstractions for network PHY drivers
Message-ID: <439b6ee7-65e0-4849-8028-cbf5e752dd87@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <CALNs47uN7GsEVJ5scqwZbzR-Dfk-uWp7EpafCBg0BarLhy+7ig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALNs47uN7GsEVJ5scqwZbzR-Dfk-uWp7EpafCBg0BarLhy+7ig@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

>     impl kernel::Module for RustAsixPhy {
>         fn init(module: &'static ThisModule) -> Result<Self> {
>             pr_info!("Rust Asix phy driver\n");

Another FYI from the kernel best practices side of things. Don't spam
the kernel log like this when a driver starts. Drivers are supposed to
be silent, unless things go wrong.

>     /// This will be the same as what exists - I assume this is read by
>     /// the C side somehow?
>     #[no_mangle]
>     pub static __mod_mdio__modname_device_table:
>         [Opaque<bindings::mdio_device_id>; 4] = [
>         make_mdio_id::<AsixAx8872a>(),
>         make_mdio_id::<AsixAx8872c>(),
>         make_mdio_id::<AsixAx88796b>(),
>         bindings::mdio_device_id { phy_id: 0, phy_id_mask: 0 }
>     ];

Actually, No. This ends up in a special section in the module .ko
file. The tool depmod(8) then reads that section and uses it to build
/lib/modules/<version>/modules.alias

See:

https://wiki.archlinux.org/title/Modalias

> [1]: @Fujita I know you have mentioned there are times where a driver
> does not always have one mask. I can't find anything and am not sure
> how this would work since `phy_driver` has `phy_id` and `phy_id_mask`
> fields - do you mind linking an example? The above could probably be
> adjusted to work with this

drivers/met/phy/meson-gxl.c does some funky things:

static struct phy_driver meson_gxl_phy[] = {
        {
                PHY_ID_MATCH_EXACT(0x01814400),
                .name           = "Meson GXL Internal PHY",
                /* PHY_BASIC_FEATURES */
                .flags          = PHY_IS_INTERNAL,
                .soft_reset     = genphy_soft_reset,
                .config_init    = meson_gxl_config_init,
                .read_status    = meson_gxl_read_status,
                .config_intr    = smsc_phy_config_intr,
                .handle_interrupt = smsc_phy_handle_interrupt,
                .suspend        = genphy_suspend,
                .resume         = genphy_resume,
                .read_mmd       = genphy_read_mmd_unsupported,
                .write_mmd      = genphy_write_mmd_unsupported,
        }, {
                PHY_ID_MATCH_EXACT(0x01803301),
                .name           = "Meson G12A Internal PHY",
                /* PHY_BASIC_FEATURES */
                .flags          = PHY_IS_INTERNAL,
                .probe          = smsc_phy_probe,
                .config_init    = smsc_phy_config_init,
                .soft_reset     = genphy_soft_reset,
                .read_status    = lan87xx_read_status,
                .config_intr    = smsc_phy_config_intr,
                .handle_interrupt = smsc_phy_handle_interrupt,

                .get_tunable    = smsc_phy_get_tunable,
                .set_tunable    = smsc_phy_set_tunable,

                .suspend        = genphy_suspend,
                .resume         = genphy_resume,
                .read_mmd       = genphy_read_mmd_unsupported,
                .write_mmd      = genphy_write_mmd_unsupported,
        },
};

static struct mdio_device_id __maybe_unused meson_gxl_tbl[] = {
        { PHY_ID_MATCH_VENDOR(0x01814400) },
        { PHY_ID_MATCH_VENDOR(0x01803301) },
        { }

So the phy_driver wants an exact match, but the module is loaded based
on the vendor OUIs.

icplus.c:

static struct mdio_device_id __maybe_unused icplus_tbl[] = {
        { PHY_ID_MATCH_MODEL(IP175C_PHY_ID) },
        { PHY_ID_MATCH_MODEL(IP1001_PHY_ID) },
        { PHY_ID_MATCH_EXACT(IP101A_PHY_ID) },
        { }
};

The devices seem to not have unique IDs, so:

static int ip101a_g_match_phy_device(struct phy_device *phydev, bool ip101a)
{
        int ret;

        if (phydev->phy_id != IP101A_PHY_ID)
                return 0;

        /* The IP101A and the IP101G share the same PHY identifier.The IP101G
         * seems to be a successor of the IP101A and implements more functions.
         * Amongst other things there is a page select register, which is not
         * available on the IP101A. Use this to distinguish these two.
         */
        ret = ip101a_g_has_page_register(phydev);
        if (ret < 0)
                return ret;

        return ip101a == !ret;
}

Its a variant on Murphy's law. If vendors can get something wrong,
some vendor will get it wrong at some point.

     Andrew
