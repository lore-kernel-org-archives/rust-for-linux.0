Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="xB9nP3O2"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81A45559D;
	Mon, 11 Dec 2023 06:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZHTJ6ujafwoHRG1qGR5ouPeD8ExjzjHTfpVKq7MDRvo=; b=xB9nP3O2lWKRqhm/vYuJKA+QFb
	e97fxOO7oEBB+5wxqsxud61IFceO7mbmR5xGmcFViAF1dMqKVbDJ7gUcAC02v9zE2Luo313e1ClMU
	WGbHwS9RUiVfbBAb2fIGYJFQxQufosWfs/mcxXjg8ZgQ+hv4n/xn9QZUGQ6oLP8ddJS0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rCgqH-002ckc-A1; Mon, 11 Dec 2023 15:01:05 +0100
Date: Mon, 11 Dec 2023 15:01:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
	tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com,
	benno.lossin@proton.me, wedsonaf@gmail.com, aliceryhl@google.com,
	boqun.feng@gmail.com
Subject: Re: [PATCH net-next v10 1/4] rust: core abstractions for network PHY
 drivers
Message-ID: <2ba23c4b-b42d-49f0-8d3a-09432c4a6d97@lunn.ch>
References: <20231210234924.1453917-1-fujita.tomonori@gmail.com>
 <20231210234924.1453917-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231210234924.1453917-2-fujita.tomonori@gmail.com>

On Mon, Dec 11, 2023 at 08:49:21AM +0900, FUJITA Tomonori wrote:
> This patch adds abstractions to implement network PHY drivers; the
> driver registration and bindings for some of callback functions in
> struct phy_driver and many genphy_ functions.
> 
> This feature is enabled with CONFIG_RUST_PHYLIB_ABSTRACTIONS=y.
> 
> This patch enables unstable const_maybe_uninit_zeroed feature for
> kernel crate to enable unsafe code to handle a constant value with
> uninitialized data. With the feature, the abstractions can initialize
> a phy_driver structure with zero easily; instead of initializing all
> the members by hand. It's supposed to be stable in the not so distant
> future.
> 
> Link: https://github.com/rust-lang/rust/pull/116218
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
