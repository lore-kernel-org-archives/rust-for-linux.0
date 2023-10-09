Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3485F1A71F
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 16:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="r2XjdlcZ"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC7A89F
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 09:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=x7KteGje5UToUUGbdBQmtFbmP4bDBwTE4GLuB+iCVME=; b=r2XjdlcZNBYe6NofvDhxkR3ic7
	tFeoaUrg6KhS/rAcmBOTGF4xOPnp/GfB1fZ+tNWbKBmkDTwnyz9kmz/gRa6KkmXjmpoben+QNr/Ki
	vnonH8hVr5EAqdKD9w71ImQTImAqxKu3tJQYQVYav3EG4iQu2Jr7nnk7ab0c4kEZLlB4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qpt8N-000w9T-FJ; Mon, 09 Oct 2023 18:29:31 +0200
Date: Mon, 9 Oct 2023 18:29:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Trevor Gross <tmgross@umich.edu>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org,
	benno.lossin@proton.me, wedsonaf@gmail.com
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY
 drivers
Message-ID: <fa747eaa-d52b-4d8c-a44f-00395b035202@lunn.ch>
References: <20230928225518.2197768-2-fujita.tomonori@gmail.com>
 <2023092900-manpower-runaround-859a@gregkh>
 <20230929.173856.1751823335892887678.fujita.tomonori@gmail.com>
 <CALNs47td-3UM-E59R35GAjaHMPT8c-H7Qy=PZ+-wgsXpw5EJAA@mail.gmail.com>
 <00d380b7-f0fc-4784-9f30-c98e630efacb@lunn.ch>
 <CANiq72n-w2Oknzn-yqa2F7NOWkSOv3AHPcmxw8OtpjFTKeJ5_Q@mail.gmail.com>
 <78da96fc-cf66-4645-a98f-80e404800d3e@lunn.ch>
 <CANiq72n3kHrJKXApx2eZ6MFisdoh==4KQi2qHYkxmDi=TYaHew@mail.gmail.com>
 <69ec5900-1baa-4a62-b0a4-ee75b12db5c6@lunn.ch>
 <CANiq72niJtQ285+wKbYdtgWCv7PnKhvRm_AtM+94SHSTu2aoCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72niJtQ285+wKbYdtgWCv7PnKhvRm_AtM+94SHSTu2aoCg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> Calling C code from the Rust driver is not allowed. The Rust driver
> should call the Rust abstractions only.
> 
> That is why Rust drivers do not directly see the C APIs, and why we
> try to make the Rust documentation self-contained as much as possible.

We have around 50 helpers, which PHY drivers are expected to use. I'm
not sure they are all documented, but are you going to duplicate the
documentation for them all? How is the Rust documentation kept in sync
with the C documentation?

Could bindgen read the kerneldoc and generate the Rust documentation?
That would solve the synchronisation problem?

> If you are OK with links to the Rust docs, that is doable, e.g. we
> have already such a link in `Documentation/rust/index.rst` from commit
> 48fadf440075 ("docs: Move rustdoc output, cross-reference it").

Yes, that is a good start. Lets include such a link in the next
revision of the patchset.

	 Andrew
