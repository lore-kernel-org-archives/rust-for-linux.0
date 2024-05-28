Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C68944F
	for <rust-for-linux@vger.kernel.org>; Tue, 28 May 2024 00:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716855500; cv=none; b=TNK9NJAXUlJrJpkiueYUcsWfASIV8Bm3tlhfwi1+Ip8psTuPvB0vYGP+CD0E5ZthaS5H2JeG32kHEnJNFg9jinJyDd6HRwh4Ap3lKy0KpmR39SO6P3fWLxdG87A7ojQ9vCzAxETEsoO7woj9XoJ0+gFnaqgo86WU9nOwXahojKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716855500; c=relaxed/simple;
	bh=QBz0LhqIeDgqeGyigbmQTZ+Il7j2jFT55cIGjE5HUNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmHutrB0J5IywWtwvnri9iq5Igboj/elHU7NdY+45A4mQPz/LHjquZgLomK60c5PJRb2/Kn/Ri7/KOy5u0IWpoQmLk89U37Uc0H90x8YhuKtwV/cJmJSSyCEtToHbfHwsv1HET5USuHebpKmHUV+RojiGWL09G+ZWNw5+fa/Ecg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=E+h12Lf1; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="E+h12Lf1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rJs3xqYJ3teifH5Q5j67UHYz73HW+vHkJz/ZE6xI7rk=; b=E+h12Lf1aO1iX+B3Wm6clhr6br
	0sI5ne3NoMv0XlPL6N0eQdGWRPHxBZCGC6IXdZ//Tp1aZBjhM/gJAj7yOtvQ8nWntLC5mKflD4FnE
	hpEE19kdp760o9EKOQnarwwudXtsAuW6RXoZM7ZZabR4z/3mZqpZ1uBZ28xurrbQtE6k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sBkXV-00G76F-US; Tue, 28 May 2024 02:18:05 +0200
Date: Tue, 28 May 2024 02:18:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: benno.lossin@proton.me, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1] rust: net::phy support to C45 registers access
Message-ID: <287303e0-dcca-4ec8-adae-5b17901a60ca@lunn.ch>
References: <20240527.104650.353359058235482782.fujita.tomonori@gmail.com>
 <8c47a50d-fbba-4884-b409-925aecf4686a@lunn.ch>
 <20240528.080317.686110578274075402.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528.080317.686110578274075402.fujita.tomonori@gmail.com>

> Ah, I was wondering about the difference between 802.C C22 and mii.h:
> - the definition of 7, 8, b, and c are missing

They have not been used yet. There has been talk of using the two
next-page registers, but no patches so far. The PSE registers might be
interesting soon, since PoE is being added.

> - why vendoer specific addresses are defined
> 
> So what we should do are:
> 
> - define 0-15 according to 802.3.
> - doesn't define 16-31 but allow a driver to use
> 
> Right?

Yes.

	Andrew
