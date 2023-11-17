Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="hyaj2Rks"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C75A111F;
	Fri, 17 Nov 2023 05:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=j3m+Np/U92eIqaQzyqycqq0m1Uvne8h1Ni+QReYmrrY=; b=hyaj2Rks+MC09pJYvhuKyw+KJV
	UGt/9KI63MRdGymnqqEzfvuZF+11Pek+c6Nv46ac94Aegbzg7B850zKeTtpkFa+mMy7QUZePf7MHW
	2hFZorgKFuwFj6b7SemsY/zXxs7QQn8ABTAn49+McHXxTfGRugDpn1igiraOiO93d4NI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r3zI0-000RYV-Do; Fri, 17 Nov 2023 14:53:44 +0100
Date: Fri, 17 Nov 2023 14:53:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alice Ryhl <aliceryhl@google.com>
Cc: fujita.tomonori@gmail.com, benno.lossin@proton.me,
	miguel.ojeda.sandonis@gmail.com, netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	wedsonaf@gmail.com
Subject: Re: [PATCH net-next v7 1/5] rust: core abstractions for network PHY
 drivers
Message-ID: <b69b2ac0-752b-42ea-a729-9efdee503602@lunn.ch>
References: <20231026001050.1720612-2-fujita.tomonori@gmail.com>
 <20231117093906.2514808-1-aliceryhl@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117093906.2514808-1-aliceryhl@google.com>

> I would change this to "it's okay to call phy_drivers_unregister from a
> different thread than the one in which phy_drivers_register was called".

This got me thinking about 'threads'. For register and unregister, we
are talking abut the kernel modules module_init() and module_exit()
function. module_init() can be called before user space is even
started, but it could also be called by insmod. module_exit() could be
called by rmmod, but it could also be the kernel, after user space has
gone away on shutdown. We are always in a context which can block, but
i never really think of this being threads. You can start a kernel
thread, and have some data structure exclusively used by that kernel
thread, but that is pretty unusual.

So i would probably turn this commenting around. Only comment like
this in the special case that a kernel thread exists, and it is
expected to have exclusive access.

	 Andrew
