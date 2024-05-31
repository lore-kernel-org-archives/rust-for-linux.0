Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592FC178CEA
	for <rust-for-linux@vger.kernel.org>; Fri, 31 May 2024 14:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717164750; cv=none; b=BNJq9uwFSlTwUzRDR/vu6USJ46zM9tCTjplLzxD7A6npK4DBZqaSjnp4ZdFZfPrGIutCjPRXfYKsfw5CmKlsD3Pwg697HmCkkW2oKeTFGCG+Kq+jz7n4hap564Ta2CkzDXEI6tiXMwDIndsIgmQlAfxAIpLz5fda6QUA01EUGqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717164750; c=relaxed/simple;
	bh=87kOcVKOczqkIJBIqL9kqFIfiOFK6XfZRGeUND/HzfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKFSKgu9a6PI9y42IYOiS7dYm+03tAyVlZsGDV4X0Jz2JD8Rwqgs2uckk6SJhV1tGJxToToQ3nIVx2IZxVCioEPmZ5Umrj7TpU3F5EsxlxvtbPYevtCLOXykATSvV4wSSX8XCZAcbYMbx/xnMQ0IMPwe1VViLCoOwvbKiPOiI60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=rYrHjcuL; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="rYrHjcuL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XB6Q5uLdyOwShA+G3ePIvnwVBM8Y5Do/h2qmkoqBGuk=; b=rYrHjcuL73lQjljfH8gyzFmGw6
	EtrJl3o1RK5LCXhtrcK1ivoEIBbziyF5TqT5RV8F+9N9V4H3jasSBMJIbA69hVk8Bcg4ix4nfFPvg
	2WFDhhq/6THrTCesqh9/dt/hadDaWcIVy+Lo/EOVZ2tKL67vBM6pyyjSoCr8Bke58Rfg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sD2zT-00GTH9-GF; Fri, 31 May 2024 16:12:19 +0200
Date: Fri, 31 May 2024 16:12:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: benno.lossin@proton.me, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1] rust: net::phy support to C45 registers access
Message-ID: <b376f314-e48e-4af0-a686-e208d129ed79@lunn.ch>
References: <8c47a50d-fbba-4884-b409-925aecf4686a@lunn.ch>
 <20240528.080317.686110578274075402.fujita.tomonori@gmail.com>
 <287303e0-dcca-4ec8-adae-5b17901a60ca@lunn.ch>
 <20240530.145258.456915814420167538.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530.145258.456915814420167538.fujita.tomonori@gmail.com>

> With updating this patch, I've started to think that it would be more
> consistent for the driver to use phy_read_mmd/phy_write_mmd rather
> than mdiobus_c45_read and mdiobus_c45_write (RegC45 than RegC45Direct
> in this patch). This is because the driver uses
> genphy_c45_read_status() helper for the read_status callback, which
> also lets phylib to choose an appropriate bus protocol.

genphy_c45_read_status() is a good point. We need to keep with the
normal way phylib works, otherwise all the helper functions will
break. So i think you need to implement the struct phy_driver
.read_mmd and .write_mmd ops to do direct C45 accesses. That is not
really how it should work, but that is a phylib problem, not a Rust
problem.

	Andrew
