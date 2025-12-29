Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A281DF26B;
	Mon, 29 Dec 2025 14:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767017223; cv=none; b=jy1COCpiBBV8ckQd3KPejtXN/ILuCjnAntmhOAlTMR0mv2DbN7zqDLH5uw5gIgQPSqHyqZMgEbpTdMcGHcpTVfX7U4g4P0wExYOI0uk6Ztcjb4H+iEYpTmc36Lr5uxR8EG5Rw2aLPKj24uUyhUvw9lA1xRxDr+uKBe50FDI2mWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767017223; c=relaxed/simple;
	bh=Vqthrsk86qUptjjnT/SxI4P5pyZyHO5EO2Oie9I/XEc=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=Iss2N46gsVUwSk+MX8ZJKbWPH42IbqHMo/oksr7p72gCHxiTPDJf2pJXkJc1eJUxwQmac3RJcC2P0hcYzEaEe+h5n0ZByHgJAQga0tGbw6r0PGKv0hdvQOS2fsyPyVefjOG6M/MgRWSbw7MWm7d9UNPcek0RMLMmxPZM25teF2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qE9eonAe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qE9eonAe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA07C4CEF7;
	Mon, 29 Dec 2025 14:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767017222;
	bh=Vqthrsk86qUptjjnT/SxI4P5pyZyHO5EO2Oie9I/XEc=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=qE9eonAe6D+U1GYACYB8VjJijvOOAq+tgYsK8DcvdfwnNBMryp/hk/gySeXTzoLiC
	 s2h9aDznvWm+zSBF3K2HlXLrUET91MHOWDeYH7U3g6wZJFi0s1YHT7hsA9vNVKsUyR
	 rI/pDOrodI/bGoms1VAVpvnVgh9NS96I+MgNsUztEZj/8YpEz2O9qdryJLtuHOknBX
	 YtGUvHEJJR6PpWAkWBhvUecE4PDXgYNB4oqE9FMqImZnGzXLhMyJ+BlOAYacoVmey2
	 eXiKseF+HFWZ8pbdJg0a2dYYcVz0EYuI0rZLAZKK5RqFDrUy8Xbdf0akg6hF2bmUJR
	 wcyABWXiTE1qA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Dec 2025 15:06:59 +0100
Message-Id: <DFARBS5X3XAV.304WNUYV2ES3Q@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2] rust: dma: remove incorrect safety documentation
Cc: "Miguel Ojeda" <ojeda@kernel.org>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>,
 <a.hindborg@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Yilin Chen" <1479826151@qq.com>
References: <tencent_5195C0324923A2B67DEF8AE4B8E139BCB105@qq.com>
In-Reply-To: <tencent_5195C0324923A2B67DEF8AE4B8E139BCB105@qq.com>

On Sun Dec 28, 2025 at 5:52 PM CET, Yilin Chen wrote:
> Removes a safety requirement that incorrectly states callers must
> ensure the device does not access memory while the returned slice
> is live, as this method doesn't return a slice.
>

Fixes: d37a39f607c4 ("rust: dma: add as_slice/write functions for CoherentA=
llocation")

> Signed-off-by: Yilin Chen <1479826151@qq.com>

Applied to driver-core-linus, thanks!

For future submissions, please remember to add a 'Fixes:' tag when appropri=
ate.

Please also make sure to use scripts/get_maintainer.pl and also Cc reviewer=
s.
