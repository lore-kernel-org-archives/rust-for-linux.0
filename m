Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F0913AE7
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 13:14:14 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D050F106
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 06:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=d1QiV7xwqs+ZMDUu5ccK99dWI0DDGH8s5cGWP3AR5zk=; b=W/iPIcmlB9plyFjmkmqT+YRJy5
	gXj3cdKuACXHE88uK/ADkm0ZJwusykaVTwVbHKJqDapap7YkR4+Wf+a2oLCklLLf+kWgTC+wiAQ/g
	y7ewsXZKN/bRInbDKQocUlSc0BeiQnwaMsrYWtZwXI+FyQTYp7wYqVLAeFJnxKrcSgnQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qklPd-007SWe-R6; Mon, 25 Sep 2023 15:14:09 +0200
Date: Mon, 25 Sep 2023 15:14:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: benno.lossin@proton.me, wedsonaf@gmail.com,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	miguel.ojeda.sandonis@gmail.com
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY
 drivers
Message-ID: <813331ba-398e-455b-9792-37b79e06e33e@lunn.ch>
References: <20230924064902.1339662-2-fujita.tomonori@gmail.com>
 <CANeycqo5Ujf+tMTkMOVqc8znz3Kd4MFUyhfvNw3cRNPdYVSxBg@mail.gmail.com>
 <652520d9-c409-6bb4-821b-5bb8bf99bc0d@proton.me>
 <20230925.203004.1803118860435488218.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925.203004.1803118860435488218.fujita.tomonori@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> It's conversion from enum like const values on C side.
> 
> #define DUPLEX_HALF             0x00
> #define DUPLEX_FULL             0x01
> #define DUPLEX_UNKNOWN          0xff

> 
> We can't automatically generate rustified enum from them so we have to
> convert them by hand, match or repr.
 
If it helps, you could submit a patch changing them to an enum. I've
no problem changing C code to make Rust/C maintenance issues simpler.

	Andrew
