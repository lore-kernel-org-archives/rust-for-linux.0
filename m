Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB7837D
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 20:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF2DC433C8;
	Wed, 13 Sep 2023 20:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694637499;
	bh=KThqMz9iIebXwUyGAg44Mmitp636IEz7vByQi+oXR3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I8A8O7S4f3mwjPcEnfc4F1uMV1y+HZSP1ig0m3eRv7OXWCxBDXANswUc9hANriGGJ
	 +Qe8e1C5WNhTacxuipnfm7x3NrhXQV5PPGJBv8W4ZfmqJsuTzne/Yd1b19FJJ+VaRm
	 itwcUBDsXR2ldfOeJMeALgF7NHV4yhpqPRkVDABA=
Date: Wed, 13 Sep 2023 22:38:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1 4/4] sample: rust: add Asix PHY driver
Message-ID: <2023091314-grudge-sanitizer-0d0b@gregkh>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-5-fujita.tomonori@gmail.com>
 <894554e5-fed7-456a-a214-efd01f43958b@lunn.ch>
 <2023091353-handclasp-charter-e30a@gregkh>
 <3e858fa9-c498-48b6-8376-99e4db10d846@lunn.ch>
 <2023091349-hazelnut-espionage-4f2b@gregkh>
 <aedf0ea8-5ea3-4e36-b9b0-46ec31ab1cb6@lunn.ch>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aedf0ea8-5ea3-4e36-b9b0-46ec31ab1cb6@lunn.ch>

On Wed, Sep 13, 2023 at 10:20:17PM +0200, Andrew Lunn wrote:
> > No, don't do that, it's horrid and we have been down that road in the
> > past and we don't want to do it again.  One driver per device please.
> 
> Has there been any discussion how we handle Rust only currently
> supporting a subset of architectures?

Not yet!

> We cannot replace the C driver with the Rust version unless it will
> build for all architectures we support in C. Otherwise we are going to
> cause regressions.

Agreed.

Which is why I would recommend starting out by doing only new features,
not replacing old ones.

> Are you suggesting Rust is only used for new drivers for hardware
> which currently has no support, and so only building for a subset of
> architectures is actually progress, not a regression?

Yes, that is what I would suggest, regressions are bad.

thanks,

greg k-h
