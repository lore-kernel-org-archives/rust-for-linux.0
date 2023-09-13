Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F1137F
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 18:43:26 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA00A3
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 11:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NnDCfkAdgzm6CovkPtRPy7lD5fbtMy28gj8ZQcYpm5s=; b=28F+rDlW7ED3cGFJF6FrQGzHyZ
	bmaPlLn5B9DXUJhe9IPab5OJSnhyp3jJr3lypGQoMO2OsrJr/490YqUzRa3iXLhtRyfUQENYiT+4G
	2gocKLUhbDpXwzZEF2lJo7WOr0dH3qJIhqRqLRi0GD30ccSYoLvlPWnc+GKmbQz7fglc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qgUpe-006KmO-2L; Wed, 13 Sep 2023 20:43:22 +0200
Date: Wed, 13 Sep 2023 20:43:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 4/4] sample: rust: add Asix PHY driver
Message-ID: <f3df3919-6bd0-49fd-b1cc-7cb5e16d34fd@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-5-fujita.tomonori@gmail.com>
 <2023091348-agile-premises-53fb@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023091348-agile-premises-53fb@gregkh>

On Wed, Sep 13, 2023 at 06:56:04PM +0200, Greg KH wrote:
> On Wed, Sep 13, 2023 at 10:36:09PM +0900, FUJITA Tomonori wrote:
> > +impl kernel::Module for RustAsixPhy {
> > +    fn init(module: &'static ThisModule) -> Result<Self> {
> > +        pr_info!("Rust Asix phy driver\n");
> 
> Meta-comment, when drivers are working properly, they are quiet.
> 
> Also, no driver should have pr_*() calls in them, they work on devices,
> so the normal dev_*() calls should be used instead, if you have to print
> anything out.

And for this subsystem, they should use phydev_info(phydev, ...).
Underneath that will use dev_info(), using the struct device within
phydev..

	   Andrew
