Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F051DA42
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 20:20:20 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7231BC6
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 13:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=WUOEa8YvCbvbBaGesUmjgPgWP7IcKE1t7km7n21U4us=; b=bFzDNDaS/+UQ0a36C9tLlxB96Q
	BMltRy30QBqZ4Ms56lYRyMaPOgwLGsPSVHTK0X/eNkKFIBqqeXQfpfcINuNIuz1Cx5VW4EUuThhBN
	TcSWMyuPpR9L3fhiBwDy5AuWlwPv1HucVRXjBWStke6o4MalC0u+x2PhnT5uBwa3hj/I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qgWLR-006L3Q-7A; Wed, 13 Sep 2023 22:20:17 +0200
Date: Wed, 13 Sep 2023 22:20:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 4/4] sample: rust: add Asix PHY driver
Message-ID: <aedf0ea8-5ea3-4e36-b9b0-46ec31ab1cb6@lunn.ch>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-5-fujita.tomonori@gmail.com>
 <894554e5-fed7-456a-a214-efd01f43958b@lunn.ch>
 <2023091353-handclasp-charter-e30a@gregkh>
 <3e858fa9-c498-48b6-8376-99e4db10d846@lunn.ch>
 <2023091349-hazelnut-espionage-4f2b@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023091349-hazelnut-espionage-4f2b@gregkh>

> No, don't do that, it's horrid and we have been down that road in the
> past and we don't want to do it again.  One driver per device please.

Has there been any discussion how we handle Rust only currently
supporting a subset of architectures?

We cannot replace the C driver with the Rust version unless it will
build for all architectures we support in C. Otherwise we are going to
cause regressions.

Are you suggesting Rust is only used for new drivers for hardware
which currently has no support, and so only building for a subset of
architectures is actually progress, not a regression?

	Andrew
