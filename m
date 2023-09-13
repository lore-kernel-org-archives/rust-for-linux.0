Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B79337F
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 18:50:21 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5A60170B
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 11:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Qcn1cPRABrCw/rrro4Y76kzV0lC7/TOM+JqX0407c60=; b=OADqHQ+dHN7jBflG4ubF6LcHf1
	6u9nYiMegiaLyHQaz0d5NWfU+LEfzJDdLGJUNHKHoJrSVBxeLlAnOcLj5qm+oXTsLMZahBuA1HaOk
	i4iusb8r8bq/JVLhVo1Nr3dkOorV2oXC4JkVeunh9LMqiPxEK9TPXqpgDU4p8TJosGBY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qgUwM-006KoD-69; Wed, 13 Sep 2023 20:50:18 +0200
Date: Wed, 13 Sep 2023 20:50:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 4/4] sample: rust: add Asix PHY driver
Message-ID: <3e858fa9-c498-48b6-8376-99e4db10d846@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-5-fujita.tomonori@gmail.com>
 <894554e5-fed7-456a-a214-efd01f43958b@lunn.ch>
 <2023091353-handclasp-charter-e30a@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023091353-handclasp-charter-e30a@gregkh>

On Wed, Sep 13, 2023 at 06:53:33PM +0200, Greg KH wrote:
> On Wed, Sep 13, 2023 at 04:11:00PM +0200, Andrew Lunn wrote:
> > On Wed, Sep 13, 2023 at 10:36:09PM +0900, FUJITA Tomonori wrote:
> > > This is the simpler version of drivers/net/phy/ax88796b.c. The C
> > > driver implements three PHY drivers but this implements only one,
> > > AX88772A PHY. This provides educational information for Rust
> > > abstractions for network PHY drivers.
> > 
> > Rather than being a sample, please make it a real driver. Place it in
> > drivers/net/phy, add a Kconfig option to select it. Maybe drop the
> > rust_ prefix, since the .rs makes it clear what sort of file it is.
> 
> But note, we can not have duplicate drivers for the same hardware, so
> the .c file needs to have the support for this device removed from it,
> OR you need to add support for the other devices to this driver and then
> the .c file can be removed.

I would suggest these Rust drivers support all the devices the C
driver does, and there is some kconfig logic to make them mutually
exclusive.  And to keep the build bots happy, kconfig to disable the
driver on architectures Rust does not support yet.

       Andrew
