Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194871EB3F
	for <rust-for-linux@vger.kernel.org>; Tue, 28 May 2024 12:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716900299; cv=none; b=WVseSgIxf/RvzyngVqwaRgnbWO5NP7+NNjWiDn76A/FoB2ePfpL/tsZMRACC68iWZPlO3/Ph1KUOOcFSvZf4Dw+Nu9l/sxyqfqsTceq2rwdE4aKZDMmGElZ6KMQXtzSQkR//D0vIaFolgeknV5HtEXRG/KgsNw+DUAzdDlkbVic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716900299; c=relaxed/simple;
	bh=V/fjFo99P8wV0+6UkIGN87i3XApEcUm5GYAPEGzq9zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRbsda6bDN93+zkxIZXWG5MJv0+McAxJiyesvNcX8CGPz7EoUagivJFj4NiIbb8rO+JWxsTOh0gCf+2RmK2eubGsepYD7QFES1bvCYcwrH0Z4C9m8yIR47nqKWOHMuAaCf5Z1LtoZ//NGTKHC6wgnV6377JPj5cYKyXEdei4h+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W43yxD+v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W43yxD+v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCA0C3277B;
	Tue, 28 May 2024 12:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716900298;
	bh=V/fjFo99P8wV0+6UkIGN87i3XApEcUm5GYAPEGzq9zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W43yxD+vh+YWTCR3p3UfO9IYAMG22j/GHcXt3mfCkZfH5EHzipU5mdl6s00/MqKM6
	 v+Pyim3ZeHhrZhpo7GdJ3kZKkunhyElGabmyZz9G6R2sIOSkf59bNSJxga1biLyDz8
	 TgiSDYrmcE+t22roMDJDuLzt0UvOW3MNdevbgGO8=
Date: Tue, 28 May 2024 14:45:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
	ajanulgu@redhat.com, lyude@redhat.com,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, mcgrof@kernel.org,
	russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <2024052816-makeshift-irrigate-cef5@gregkh>
References: <20240520172422.181763-4-dakr@redhat.com>
 <20240522.085334.1009573112046880609.fujita.tomonori@gmail.com>
 <ZlTdh/eQAIhxNn9e@pollux.localdomain>
 <20240528.200126.99248529380429957.fujita.tomonori@gmail.com>
 <ZlXLzCYiwdMxic3X@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlXLzCYiwdMxic3X@pollux>

On Tue, May 28, 2024 at 02:19:24PM +0200, Danilo Krummrich wrote:
> However, if you have a driver that needs the firmware abstractions, I would be
> surprised if there were any hesitations to already merge the minimum device
> abstractions [1] and this one (once reviewed) without the rest. At least there
> aren't any from my side.
> 
> [1] https://lore.kernel.org/rust-for-linux/20240520172554.182094-2-dakr@redhat.com/

No, the device abstractions are NOT ready for merging just yet, sorry,
if for no other reason than a non-RFC has never been posted :)

greg k-h
