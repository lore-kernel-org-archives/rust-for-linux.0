Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9DDD26C
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 15:42:19 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91944B8
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 08:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wasU7xjpuJnlZAEZBfy6iy1EsGg3ICES0fXcakDjlf0=; b=uBUOTNmA5d1tOjjCSdZ9NIBt7N
	jqEleiK01EPS6siDpHKHzTcewqhs3t3VT9it3aFsdtzk0gvQ/sRuty5tv0OabY6hdczJJLQDnk/Go
	zC0Aqr+m3JMCUrCn6lF4QkB4djfi2lRIwy6POB91ZeVod4OokbatAN4QGHq1FY+RMwIY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qkRFQ-007MI6-14; Sun, 24 Sep 2023 17:42:16 +0200
Date: Sun, 24 Sep 2023 17:42:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	miguel.ojeda.sandonis@gmail.com
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY
 drivers
Message-ID: <aae808cd-68c2-44a4-9e01-2c5e01193fbf@lunn.ch>
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
 <20230924064902.1339662-2-fujita.tomonori@gmail.com>
 <CANeycqo5Ujf+tMTkMOVqc8znz3Kd4MFUyhfvNw3cRNPdYVSxBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANeycqo5Ujf+tMTkMOVqc8znz3Kd4MFUyhfvNw3cRNPdYVSxBg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> > +    /// For the duration of the lifetime 'a, the pointer must be valid for writing and nobody else
> > +    /// may read or write to the `phy_device` object.
> > +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
> 
> Is the requirement that nobody else may read or write to `phy_device` realistic?

In what scope?

The phylib core will use phy_device members. The MAC driver has a
callback which should use phy_device members. However, the phylib core
also has a mutex to protect phy_device members. Nearly all calls into
this driver and all calls into the MAC driver are made with this mutex
held. And phylib core also uses the mutex.

      Andrew
