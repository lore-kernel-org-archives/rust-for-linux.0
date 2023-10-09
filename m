Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6AB1A261;
	Mon,  9 Oct 2023 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1pB3rinu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6FF1C433C8;
	Mon,  9 Oct 2023 14:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696863162;
	bh=uVgAxBbRq3kxskYGq0e+GZhgbZJlCTEwwi6KLEagEcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1pB3rinu2XPiRDYaVd8RLyleDo6jtUJFNPVcsxAzNNRYsDs0tt4eyRj3T+mI8KJvq
	 cNEr2AQ7JpV6dBddLr2YN2q4xNZhqlbCw+T8mQz5DrU9AaqcJTjZuF592UQ6srB3G8
	 dcujUKu7QI8H918ufXzvFMJzUp1EL18mBKPFYWww=
Date: Mon, 9 Oct 2023 16:52:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	Andrea Righi <andrea.righi@canonical.com>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH net-next v3 0/3] Rust abstractions for network PHY drivers
Message-ID: <2023100907-liable-uplifted-568d@gregkh>
References: <20231009013912.4048593-1-fujita.tomonori@gmail.com>
 <5334dc69-1604-4408-9cce-3c89bc5d7688@lunn.ch>
 <CANiq72n6DMeXQrgOzS_+3VdgNYAmpcnneAHJnZERUQhMExg+0A@mail.gmail.com>
 <2023100916-crushing-sprawl-30a4@gregkh>
 <CANiq72nfN2e8oWtFDQ1ey0CJaTZ+W=g10k5YKukaWqckxH7Rmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nfN2e8oWtFDQ1ey0CJaTZ+W=g10k5YKukaWqckxH7Rmg@mail.gmail.com>

On Mon, Oct 09, 2023 at 04:13:02PM +0200, Miguel Ojeda wrote:
> On Mon, Oct 9, 2023 at 3:46 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > That's not ok as you want that option enabled on systems that have those
> > broken processors which need this option for proper security.  You would
> > be forcing people to disable this to enable Rust support?
> 
> Yes, that is what would happen. But if we want to avoid the warnings
> and be proper (even if there are no real users of Rust yet), until the
> Rust compiler supports it and we wire it up, the only way is that, no?

Then the main CONFIG_HAVE_RUST should have that dependency, don't force
it on each individual driver.

But note, that is probably not a good marketing statement as you are
forced to make your system more insecure in order to use the "secure"
language :(

thanks,

greg k-h
