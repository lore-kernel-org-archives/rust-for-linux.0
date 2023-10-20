Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F052F1E53F
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Oct 2023 18:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="n54Pe3SX"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF1AAD6A;
	Fri, 20 Oct 2023 11:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nZR1r8sDP/og3tmPVk5LjDm3XzizGLkOwpXN5b9xvCo=; b=n54Pe3SXFj3RMxwPjVp8Ju35h1
	lM7L2Pbdc6fCmRBjAJRAyNmtaDa4ouPhyOy4FvcvzAM8iKZkBGMYYEUB4HMZKRmojFSBOSYHHyVzy
	T9Kl5wK7G+Sporfg2qxXEIft/cFh7UFP7oUJjcgPjsvRLMwTltgRvYtYHvGuLZz6wYBw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qtuWb-002oKc-Rb; Fri, 20 Oct 2023 20:47:09 +0200
Date: Fri, 20 Oct 2023 20:47:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, steve.capper@arm.com,
	Asahi Lina <lina@asahilina.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
Message-ID: <d0f11c35-b8a1-459e-9148-9f037089ecba@lunn.ch>
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-3-Jamie.Cunliffe@arm.com>
 <3cc3b66d-7190-477c-af04-a5d06a0d50fe@lunn.ch>
 <ZTLH5o0GlFBYsAHq@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTLH5o0GlFBYsAHq@boqun-archlinux>

> Of course this doesn't mean a lot, we still need people with deep
> Rust compiler knowledge to confirm whether the support is completed or
> not. But I think if people want to do experiments, the tool is there.

Thanks for testing this, its good to know.

       Andrew

