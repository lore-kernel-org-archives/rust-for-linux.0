Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A5E12DD90
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Jun 2024 14:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717423789; cv=none; b=Kk2+l2lnlgLYF7/ZT5/+WnDY9hxztD9p/WNFitkjUTRlQ+5uwzO3NuyWmk0FFAzDV5aDY4Z357hBax1j0/u2xBTLD3EMALsuY1JHy8ZAZoeQPuZ5RkLh3GS6QJN7JURQ3w8+8KQ+9ZusBC7chvdHzM0UlNDVv26v+gvuPyNHyWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717423789; c=relaxed/simple;
	bh=amkJH7OiaQn0mx5rTshjPMj5+vJJnUkNASJqpfqiTl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHLRkxKD2p0WuBE7ARnaIVQaVh6sIi84SmkXihwYWYvhaldDP6kyHeKG7086qrrPRQpH8l+nwWOCXjNMBiBX2aJ0YKfSW1mY/dckypduh8wVRdlXXHQHD/nSIuyqq9Vp3j59CRXd6qxEty/pIAFVTFGx8op2gKWi8gHB5e/Iu+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=CJORwxAl; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="CJORwxAl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ncGjkShKich2VCN+WiaqpdI/yFTc16S0s/TS1gVkmjA=; b=CJORwxAlxge3KNT4r6n7B4IHoj
	2FvbcKKmjtiLgwTNbWz9sgdWXmFahmN0599M9yW0UkWDsKZXDBE6EqTARy3j6bNBvhR1NBC2Aw1Rn
	hOIdWT58S/wZNs0QF3hserYlMz7Xo+q1Zk5xbqid8yu38FbTjugMLIDRH9D5W9XSZauA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sE8Nc-00GiRw-Py; Mon, 03 Jun 2024 16:09:44 +0200
Date: Mon, 3 Jun 2024 16:09:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, benno.lossin@proton.me,
	tmgross@umich.edu
Subject: Re: [PATCH v3 2/2] rust: net::phy unified genphy_read_status
 function for C22 and C45 registers
Message-ID: <b663e009-ca8d-4cb4-8a16-9e28177baa56@lunn.ch>
References: <20240602231749.57111-1-fujita.tomonori@gmail.com>
 <20240602231749.57111-3-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240602231749.57111-3-fujita.tomonori@gmail.com>

On Mon, Jun 03, 2024 at 08:17:49AM +0900, FUJITA Tomonori wrote:
> Add unified genphy_read_status function for C22 and C45
> registers. Instead of having genphy_c22 and genphy_c45 methods, this
> unifies genphy_read_status functions for C22 and C45.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/net/phy.rs     | 12 ++----------
>  rust/kernel/net/phy/reg.rs | 27 +++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+), 10 deletions(-)

When this hits the netdev list, it needs a user. Having a user would
probably help me understand how you actually use this. How do it
control if it does a C22 or a C45 version?

	 Andrew
