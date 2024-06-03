Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0292C15C3
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Jun 2024 14:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717423348; cv=none; b=u3yBwYcUJwOVTvSSYCfMZdnBuZcrYTlWcrkcD254PIKK06soq7bZt2AlStOFfnhm9OxTLZJziRILD3Hm9o3CokhX6sll74Um3iz4c/PoLR3U0Dv7Z6J4oRrhcuuP2WaTQME3GjK5fuxHD6guWWjWWn/AoS1lOS5y+1rcGtt+F9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717423348; c=relaxed/simple;
	bh=GqGELxJLJdMUHNCxJKhA9B8Xr6E98o7Znlm9Yc6eHNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KtQ6oVWZiZwRrvM4tzUWZdtpuQaNxkH7UGC+SnnL2SlLdg5YdZWXK3x1advKS36Xc2kruroSHIT9+ZAdCQ3zK9af0wLxpN2WvgvgsDotBOq/H9vmN53mH1EJbhJG2Ps+OkNyZqBoPRyT9NHBG+RLGSRngflto6Bx3crEEKGCbsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=N/f/0mET; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="N/f/0mET"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/47TcyFqHgjV1Vwkmqa8P/6jI6dr/kXq1ePNILvDDxg=; b=N/f/0mETO1cWftPsaf/FXbvmWA
	pOVOvCXRqTwJ1qNbH+DizX4NwT9SzlX2ICdZ7Xez3VIh2BHmuh7HsP5u1hNsL+STc64xO10KHaygG
	GaH4Vg75PzDygoocpQ0p58LgO9d91S6UG4oiHyM0Ff2aFkQUN77i/IgJJFPJS6qrrIpE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sE8GO-00GiPh-8C; Mon, 03 Jun 2024 16:02:16 +0200
Date: Mon, 3 Jun 2024 16:02:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, benno.lossin@proton.me,
	tmgross@umich.edu
Subject: Re: [PATCH v3 1/2] rust: net::phy unified read/write API for C22 and
 C45 registers
Message-ID: <7551876f-a7ff-40e9-9458-8b4b205521e3@lunn.ch>
References: <20240602231749.57111-1-fujita.tomonori@gmail.com>
 <20240602231749.57111-2-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240602231749.57111-2-fujita.tomonori@gmail.com>

On Mon, Jun 03, 2024 at 08:17:48AM +0900, FUJITA Tomonori wrote:
> Add the unified read/write API for C22 and C45 register. The
> abstractions support access to only C22 registers now. Instead of
> adding read/write_c45 methods specifically for C45, a new reg module
> supports the unified API to access C22 and C45 registers with trait,
> by calling an appropriate phylib functions.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  MAINTAINERS                      |   1 +
>  drivers/net/phy/ax88796b_rust.rs |   7 +-
>  rust/kernel/net/phy.rs           |  32 ++----
>  rust/kernel/net/phy/reg.rs       | 174 +++++++++++++++++++++++++++++++
>  rust/uapi/uapi_helper.h          |   1 +

I've not been monitoring kernel rust too much. What is the state of
the build system changes? Can we put Rust code in the subsystems yet?

	Andrew
