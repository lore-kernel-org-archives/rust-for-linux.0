Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B024212C53D
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Apr 2024 14:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713535893; cv=none; b=Mzxd6k2uFj7iN5a8tiFzXGEgsOIocBwTUbBojSjhu2tABvmqZtkLa7S4oGcrL03jmeqbAiVb7XGDZnD1a0IaLG0jeG1LlzhF4MS7+E6DEgZFqHbpWj26FYz3v7bGbab48C9Fmsic7ecYZVX3c9RLw9LS6JCdRAEYmI/OrXL1PGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713535893; c=relaxed/simple;
	bh=c1znk+i+thZBVp+r73EqNHjWNK2UKvvmVtN94TO+j9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPp08lZfg0D4M/HiKXZDRGr71Ey8YuFELyCnTObQ5QZv95SiX7L37nIvKp8IIwhrO4wDU9/BtV0VVyQVCb1sXECRVyebaab1CJeEPnXsxHmvM+QURrnbNQR5QoiELuECDUoxv0zF54Y/f2AAEKphROsReY0oj5n/iAPI4kjEnRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aINxbz7N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aINxbz7N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE3ADC072AA;
	Fri, 19 Apr 2024 14:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713535893;
	bh=c1znk+i+thZBVp+r73EqNHjWNK2UKvvmVtN94TO+j9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aINxbz7NcnOeEUByEiYzkt7TSPykoHylFfRFBfgIfZnLPCU0QyCSljvonGvCJTOK+
	 rt4xBD8B8WVgYXFVHKgLnDDexOSzTUuKgvGDksWL5xBdJqthKETkft2LfQBNG8mgyr
	 y7NUk9paTyQg3fDs9O05NvdFoF6/TFNsGOuJTUyw=
Date: Fri, 19 Apr 2024 16:11:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC v1] rust: add 'firmware' tag support to module! macro
Message-ID: <2024041905-blasphemy-footage-4ec6@gregkh>
References: <20240419.225353.364631939354183191.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240419.225353.364631939354183191.fujita.tomonori@gmail.com>

On Fri, Apr 19, 2024 at 10:53:53PM +0900, FUJITA Tomonori wrote:
> Hi,
> 
> This patch is necessary for a new QT2025 PHY driver in Rust:
> 
> https://lwn.net/Articles/969888/

Please use lore.kernel.org links for mailing list stuff.

thanks,

greg k-h
