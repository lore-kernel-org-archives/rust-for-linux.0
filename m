Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBEA3B2A4;
	Tue, 24 Oct 2023 16:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="QJNjVowj"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4317AC;
	Tue, 24 Oct 2023 09:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qYz02loAPguf4pV3Qtc9mcE4k49YLy1EJ6YkscJLCXA=; b=QJNjVowjZMOHaqUTgHLghWPTXr
	3Tquo2wZDD09vksgeYNmMjP8E+DdPLWkpvcsKyu+E4tJXJKZ3PNaxodtGipbWTTKk+je/9qdICQSx
	HYrdo0NPSvrcwFnwQzwj1t+4CuSPLpTIT7F/b3/CHQlbkiir8XNCVm0EVh5Tegwac1xg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qvKWH-000625-AF; Tue, 24 Oct 2023 18:44:41 +0200
Date: Tue, 24 Oct 2023 18:44:41 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Benno Lossin <benno.lossin@proton.me>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	miguel.ojeda.sandonis@gmail.com, wedsonaf@gmail.com, greg@kroah.com
Subject: Re: [PATCH net-next v6 1/5] rust: core abstractions for network PHY
 drivers
Message-ID: <06be812d-2371-4c75-88cc-d2a8466cc3bd@lunn.ch>
References: <20231024005842.1059620-1-fujita.tomonori@gmail.com>
 <20231024005842.1059620-2-fujita.tomonori@gmail.com>
 <1f61dda0-1e5e-4cdb-991b-1107439ecc99@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f61dda0-1e5e-4cdb-991b-1107439ecc99@proton.me>

> Can we please change this name? I think Tomo is waiting for Andrew to
> give his OK. All the other getter functions already follow the Rust
> naming convention, so this one should as well. I think using
> `is_link_up` would be ideal, since `link()` reads a bit weird in code:
> 
>      if dev.link() {
>          // ...
>      }
> 
> vs
> 
>      if dev.is_link_up() {
>          // ...
>      }

is_link_up() is fine for me.

	Andrew
