Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="xUIv0VwL"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D733D57;
	Fri, 17 Nov 2023 08:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uTBv8mHH9oPH7azaHaXg9APqX/hy+5WYGfmmqmA5tV4=; b=xUIv0VwL0eTtiMLnf/f5vFInpt
	hvesyRtb9CpEp8CbiEkEh+OBXWaVmYfyKeQ+D08eX31qjQ4h+DaEYTa0mgvyKK5eT7pX1ItBsDBpI
	m+UDUEmqk56iX0XpgVKL+ZJCrDIALg1GhwvXSBGe7SkCi46fEKGVpclM0VwnoMBxkoWA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r41hP-000SMN-VQ; Fri, 17 Nov 2023 17:28:07 +0100
Date: Fri, 17 Nov 2023 17:28:07 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alice Ryhl <aliceryhl@google.com>
Cc: benno.lossin@proton.me, fujita.tomonori@gmail.com,
	miguel.ojeda.sandonis@gmail.com, netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	wedsonaf@gmail.com
Subject: Re: [PATCH net-next v7 1/5] rust: core abstractions for network PHY
 drivers
Message-ID: <9851386b-59c5-4b6c-95e3-128dbea403c9@lunn.ch>
References: <61f93419-396d-4592-b28b-9c681952a873@lunn.ch>
 <20231117154246.2571219-1-aliceryhl@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117154246.2571219-1-aliceryhl@google.com>

> >> /// # Invariants
> >> ///
> >> /// Referencing a `phy_device` using this struct asserts that the X
> >> /// mutex is held, or that the reference has exclusive access to the
> >> /// entire `phy_device`.
> >> #[repr(transparent)]
> >> pub struct Device(Opaque<bindings::phy_device>);
> > 
> > You can never have exclusive access to the entire phy_device, because
> > it contains a mutex. Other threads can block on that mutex, which
> > involves changing the linked list in the mutex.
> > 
> > But that is also a pretty common pattern, put the mutex inside the
> > structure it protects. So when you say 'exclusive access to the entire
> > `phy_device`' you actually mean excluding mutex, spinlocks, atomic
> > variables, etc?
> 
> No, I really meant exclusive access to everything. This suggestion is
> where I guessed that the situation might be "we just created the
> phy_device, and haven't yet shared it with anyone, so it's okay to
> access it without the lock". But it sounds like that's not the case.

It is pretty unusual for a linux driver to actually create a
device. Some level of core code generally creates a basic device
structure and passes it to the probe function. The probe can then
setup members in the device, maybe allocate memory and assign it to
the device->priv member etc.

However, in the probe method, it should be safe to assume its not
globally visible yet, so you can be more relaxed about locking.

> >> /// # Invariants
> >> ///
> >> /// Referencing a `phy_device` using this struct asserts that the user
> >> /// is inside a Y scope as defined in Documentation/foo/bar.
> >> #[repr(transparent)]
> >> pub struct Device(Opaque<bindings::phy_device>);
> > 
> > There is no such documentation that i know of, except it does get
> > repeated again and again on the mailling lists. Its tribal knowledge.
> 
> Then, my suggestion would be to write down that tribal knowledge in the
> safety comments.

O.K, we can do that.

     Andrew
