Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020A926AD5
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Jun 2024 14:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717425926; cv=none; b=jKQhwdnEcEaHXOsX8mMiAa17UuZurNzcSG4fobliU3oHmLPjkuv0yhtfJxS79Wigyual0uYxzs/Tqk0cRsVUNS1AEFEq9xQGgtJ7gDSVYRs0jLFOMsoJPvxFbEUyrWbzKL3oYgQEJSYlHGrDGrHzKxAvJOzHTi2JvhLeXFV5urU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717425926; c=relaxed/simple;
	bh=BjjGs4FtYfiirV7xfMQwKkqO1fvNAPArhgel7ApzFGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NENw2xPy2x93CDjvVIkEmUUnW2iQBvjDLakh7zOvHD+SeUIgiCT7wEfIHVIazoZ+56+OOY6TuadOpKWKE94TkwaNhV2DxLNLVbBVCDNokHXmktL8TMaLidXH7pNWw/DNt0lQpYOcWD9VEWdycFltN4Z1kCV+/vtseH8vqB0RLyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=ZUU5Na66; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="ZUU5Na66"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=v7PVxNa5HB3cNPiGL+LyP5lvD8R/B0aP+CZB3MYh4hc=; b=ZUU5Na66ckAy1Wv2EdHUYV4pUv
	KSfpXn337YbeXVsJCO19UkKkBwUMw97+I7VyaSDktHSVDhtWwLTsp/mAbByhDiKh7UvoKx9T0bYiY
	3NV/f4sJ1SAT3SsAKuhkcykhduk/sD/S790DrqeOWInfSmu3iBDyfsIXWIjyzw1B8hkE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sE8w6-00Gijo-4u; Mon, 03 Jun 2024 16:45:22 +0200
Date: Mon, 3 Jun 2024 16:45:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, benno.lossin@proton.me,
	tmgross@umich.edu
Subject: Re: [PATCH v3 2/2] rust: net::phy unified genphy_read_status
 function for C22 and C45 registers
Message-ID: <4bd8080d-9d78-4e5f-a330-4abf64464040@lunn.ch>
References: <20240602231749.57111-1-fujita.tomonori@gmail.com>
 <20240602231749.57111-3-fujita.tomonori@gmail.com>
 <b663e009-ca8d-4cb4-8a16-9e28177baa56@lunn.ch>
 <20240603.233954.1644803151268035787.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603.233954.1644803151268035787.fujita.tomonori@gmail.com>

> Currently, a driver can execute C22 version like the following:
> 
> dev.genphy_read_status();
> 
> With this patch, a driver can execute C22 version like:
> 
> dev.genphy_read_status::<C22>();
> 
> And a driver can execute C45 version like:
> 
> dev.genphy_read_status::<C45>();

O.K. That is nice and clear.

Thanks
	Andrew
