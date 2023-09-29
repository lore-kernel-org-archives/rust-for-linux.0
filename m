Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9ACF9CC
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Sep 2023 12:23:19 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5EFDB
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Sep 2023 05:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qzWdg6EWuD8etgiINCMYW+sLek5G0dfaBq+SSzen8l0=; b=quFwKNiyJnmv3yE2rGSln8IDKl
	TAAhYICuw5CWrqXHRmd3WqG+nXk0QB4kPljeY259x8KoZEA6X942t5/aqYtdAIQWwKA9olmGU9QMZ
	++n056+dNqVZE9GPB6YaCTx3yQj07AdgG/ty7bbIt5TQZUEgpM81KWAQinRaKze2F6ww=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qmCWY-007oxh-Ph; Fri, 29 Sep 2023 14:23:14 +0200
Date: Fri, 29 Sep 2023 14:23:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org,
	tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com,
	benno.lossin@proton.me, wedsonaf@gmail.com
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY
 drivers
Message-ID: <4b0759fb-88f8-4470-a8e5-094aa0b0886c@lunn.ch>
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
 <20230928225518.2197768-2-fujita.tomonori@gmail.com>
 <2023092900-manpower-runaround-859a@gregkh>
 <20230929.173856.1751823335892887678.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929.173856.1751823335892887678.fujita.tomonori@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> >> +/// Represents duplex mode.
> >> +pub enum DuplexMode {
> >> +    /// Full-duplex mode
> >> +    Half,
> >> +    /// Half-duplex mode
> >> +    Full,
> >> +    /// Unknown
> >> +    Unknown,
> >> +}
> > 
> > How are these enums going to be kept in sync with the C code?  This
> > doesn't seem like a good idea and will quickly cause very strange bugs
> > that will be impossible to debug :(
> 
> enum DeviceState is guaranteed to be kept in sync with enum phy_state
> in C. If the C code is changed without updating the Rust code,
> compiling the Rust code fails. This is because a rustified enum is
> generated from C's phy_state enum at compile time.
> 
> enum DuplexMode refers to C's defines in include/uapi/linux/ethtool.h:
> 
> #define DUPLEX_HALF             0x00
> #define DUPLEX_FULL             0x01
> #define DUPLEX_UNKNOWN          0xff
> 
> So we can't use the same trick. But I guess that these DUPLEX_* values
> are unlikely be changed.

I did suggest changing this into an enum. I've not tried it, but i
think it should just work.

      Andrew
