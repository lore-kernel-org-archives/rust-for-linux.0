Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E74733DEF2;
	Thu,  8 Jan 2026 07:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767859046; cv=none; b=B5Kfw1xbR+EhqZeQVwI+pptHOb2lF9ru5ci637EgRACKmJcZ00Q+kZGt9XapacriQLWpanLQyzkYtXg9QYZZpegHZKNtk+L9K70w+i8gwTBSpuu2s4q+JqaOUoKBpk7Ozm8eL0eWfjzZSArO79HCB9GwWwHpQ5jAXUR4yOZP8g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767859046; c=relaxed/simple;
	bh=fTUWi/SqH2rk7j1Y/F0hIQgvM4+GA9AOfQcFXQw046g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNnSQMOvJp65x9Z+QoDK0fc7YwkTnav//GwPOf8l2/VpduoL9eBkZAQXfPdSXi9uZ2gw87z8ceNRiWzvpzf7sKDs1vp/lQ8wUYxjyJyOQMJ+3WjpRx3LrBC1qi6/TXaP1XdAkDUo6uuvdsOhybSHgw1LFVcv9pGY6M0FVotGJPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nc2JuXuK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nc2JuXuK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 056B1C116C6;
	Thu,  8 Jan 2026 07:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767859045;
	bh=fTUWi/SqH2rk7j1Y/F0hIQgvM4+GA9AOfQcFXQw046g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nc2JuXuKNBwWvuv+3jE/AVutXTgLdMWoBHN2TzRnX/BTE4Mk75vddOWE28t01if49
	 WzY3ZyTE1XENdDS6keuMTxwuMuI4HJbTzdGc3PWkjhme520Wc+FCnEZryfvO/k8ASR
	 lRhsuLii9ZShIJKueVXt46raUx7K//VfcmWntukM=
Date: Thu, 8 Jan 2026 08:57:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: 1064094935@qq.com
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	pengfuyuan <pengfuyuan@kylinos.cn>
Subject: Re: [PATCH] rust: device: add platdata accessors
Message-ID: <2026010858-yonder-seventeen-361f@gregkh>
References: <tencent_C135881D822B4C6C12E841516893C774A805@qq.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_C135881D822B4C6C12E841516893C774A805@qq.com>

On Thu, Jan 08, 2026 at 03:42:51PM +0800, 1064094935@qq.com wrote:
> From: pengfuyuan <pengfuyuan@kylinos.cn>

Please use your "real" name (you can use native character sets if
wanted.)

> Implement generic accessors for the platform data of a device.
> 
> Platform data is typically set by platform code when creating the device
> and points to platform-specific data structures. The accessor provides
> type-safe access to this data without requiring unsafe code at the call
> site.
> 
> The accessor is implemented for Device<Bound>, allowing drivers to access
> platform data during probe() and other device lifecycle callbacks. Unlike
> drvdata, platform data is managed by platform code and has a lifetime
> tied to the device itself.

Do you have a user for this?  That would be good to see at the same time
here, we can't just add apis with no real users.

thanks,

greg k-h
