Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD5C1A594
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Oct 2023 17:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="kJsdoAsi"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A01E211B
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Oct 2023 10:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Lbh/Cr7a9ZUO75a7KtcW9LeyBaUnv3rX/1/MVy/+S2w=; b=kJsdoAsirowpitgzDgEufx/LhM
	wupeP00D7EDVzX+NUNDGaPlm/KCJNpfx+N2g4TD9vEU4bBAowQq7zfPG+AnVWjlArJhDkE9JOexm2
	KS1+iECTcXZ1XjBP1F17/2emRF7YGNQJV3JPlk6OUQJZf1ClIDY6AOWA2oMkM6DvjI68=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qttBM-002o3F-1C; Fri, 20 Oct 2023 19:21:08 +0200
Date: Fri, 20 Oct 2023 19:21:08 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, steve.capper@arm.com,
	Asahi Lina <lina@asahilina.net>, boqun.feng@gmail.com
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
Message-ID: <3cc3b66d-7190-477c-af04-a5d06a0d50fe@lunn.ch>
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-3-Jamie.Cunliffe@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020155056.3495121-3-Jamie.Cunliffe@arm.com>

> +``arm64``     Maintained        Little Endian only.

This question is just out of curiosity, not the patchset itself.

What is missing to make big endian work?

Network developers have expressed an interesting in testing Rust code
on big endian systems, since the code should work on both endians. It
might be easier to get an ARM board running big endian than get access
to an S390x machine.

      Andrew
