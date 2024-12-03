Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD182500D3
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Dec 2024 20:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733258915; cv=none; b=VAjfrto6+i3gGM5y4YlNZaQuCgF2pau0fxu7it6kwwyt7ArlnRnmJ4Ao3HO1NDMtWI8HqoHTHTWOw1lEEWFkRAx1seP4nCzyPSUFZk6Sf/o5wveoEgnhqy9Xk1XHCI7bbx3AeZ1hKzQHqWTNJWD0bANHYTjxTh8O8H+t9hhXJ54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733258915; c=relaxed/simple;
	bh=LV6Rky9E26YOhfbS/89gbB0UbSiZOxp5xPGNIqPwVKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5eJ8L1qYC+C9WFdW27LhWKDnOVufTAJ000ueT8hY7puEyHPBPh8xwGvBfE/Q+oVkWTWsrNMPC4pBCMQWDqKFwgnUXW2/S0bU9ArR6tGJYoiQ4roDOf2K/tFW7cLfrR26/fekR/FGNTiDyeOA/7B5MQ0R/c/alYCf88ACynNRQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceDflFUO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceDflFUO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 838F7C4CECF;
	Tue,  3 Dec 2024 20:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733258914;
	bh=LV6Rky9E26YOhfbS/89gbB0UbSiZOxp5xPGNIqPwVKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ceDflFUO5g8wxH6IQjiCcBug1JocSvL/3VppRCEJ5y2+dgePD96snzFLiiZmPeLBV
	 +eC06p4tQNAansJKpkUIBlTquCYqNSHoIhqOSo+TcoF49HOv45kS0FEvoYAcOQD7EZ
	 AcT84gCjVoiWmTeCH5NmBR2ltdwetAwsBeksyyTNAYgv49gfmxJfUutY6QsII2XDao
	 u67/1Yjzyb2t+fOBaUyb1Gse86W4taU0i96J66y4209k7e0+h1+7vL4606e8MAaW0E
	 Wky5YPFAkRtNPCu3mJ0Mz3db3Dmh9rPAgFAwrTBCaTaKaEIch1UDFWHp65e1wAjSlo
	 y3d1nGv3sbHGA==
Date: Tue, 3 Dec 2024 10:48:33 -1000
From: Tejun Heo <tj@kernel.org>
To: Konstantin Andrikopoulos <kernel@mandragore.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Vangelis Mamalakis <mamalakis@google.com>
Subject: Re: [PATCH v2] rust: add safety comment in workqueue traits
Message-ID: <Z09uoWycve1yn7Rg@slm.duckdns.org>
References: <20241127150643.789033-1-kernel@mandragore.io>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127150643.789033-1-kernel@mandragore.io>

On Wed, Nov 27, 2024 at 03:07:38PM +0000, Konstantin Andrikopoulos wrote:
> Add missing safety comments for the implementation of the unsafe traits
> WorkItemPointer and RawWorkItem for Arc<T> in workqueue.rs
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/351.
> Co-developed-by: Vangelis Mamalakis <mamalakis@google.com>
> Signed-off-by: Vangelis Mamalakis <mamalakis@google.com>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Konstantin Andrikopoulos <kernel@mandragore.io>

Applied to wq/for-6.13-fixes.

Thanks.

-- 
tejun
