Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BA920C029
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 22:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773700564; cv=none; b=ZzZfWo2JWHSQRosExXgbbbE2fi+Leb1NrMDNpX8FgoNjAZsZMQW8433CdJFrcdwY2sigXb8StR2HGKOYe4jUJZH3c6XqO92eq66KmW/Bp/phS3vKyjKAHrK9TR+1UERpgmUu9Ps+469aY9XQ4jE6kAEAr7dZLQg0HR4mgvrCaBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773700564; c=relaxed/simple;
	bh=TOF6dJBRYXVDvTCwAhqcu6cKHx0I22Pb91A1OOMIh28=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=tZZKIKqx5wBaAQ0SmJnP74SviG+wG/2X4CBsLBT2gviy/rKDGgmyDGVtHppVByeFbfv91e7vLF0MI6SY389z9HC72Jsj/cKqg27wmcNgt6ChqlwwzVk7wTHvrCcBzQUYmPa13MM7P8PPhuiY5R/2RTbbPcxjMXQ1D9HTyHiz+GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pnKEb25w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pnKEb25w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E674CC19424;
	Mon, 16 Mar 2026 22:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773700564;
	bh=TOF6dJBRYXVDvTCwAhqcu6cKHx0I22Pb91A1OOMIh28=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=pnKEb25wpddQ43pgq3xrYHXC660KC+qwC7cDIXg+XJidPoDWpd6coMihLID2h1Xu3
	 ZodVTREY4CkRdj5uYlPUUOz//vjowDU8xOrFpLz+bubkzkCHtpk2pX7OH/peUHojnu
	 Q0cD1vvE9IybXUSOt8u5wohnrJJblMCZMRVdswrqpxb5xTBCmWo0OdmtRtZRtIk0V0
	 tp4BdMa2FoD/YmHx9vL2ZEa5KKm1g2EZJzjxI75KdmBjJjz7yLrC2NcN5TuOnP/VT7
	 5FIVQqlQOdy7/Pbt7Hi0ZJMHmKrkSNmGQ/rpVlqMm/FaFmrpDfodK3wkT4FINW7YP0
	 W4FR6qLO6wV+w==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 23:36:01 +0100
Message-Id: <DH4KDGXZF3XU.R94ADYNQ8RUW@kernel.org>
Subject: Re: Nova developers: avoid nouveau mailing list until it is fixed
Cc: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>, "Jason Gunthorpe"
 <jgg@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <2a914258-bf58-4b46-99a7-d8c76fe52671@nvidia.com>
 <bc2517c2-6772-4cbd-8fd7-6dbdcdd13eab@nvidia.com>
In-Reply-To: <bc2517c2-6772-4cbd-8fd7-6dbdcdd13eab@nvidia.com>

On Mon Mar 16, 2026 at 11:24 PM CET, John Hubbard wrote:
> And if "someone" wants to fire up a new "nova" list, that uses vger
> like the other kernel lists, I wouldn't complain. :)

I considered this already for other reasons, so let's just do it.

(We can't get a vger.kernel.org list anymore, but a lists.linux.dev one sho=
uld
be no problem.)

I can send a request for nova-gpu@lists.linux.dev later today.
