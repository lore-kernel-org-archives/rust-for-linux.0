Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663772D7DF7
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 20:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762376362; cv=none; b=DlL880kPPnSdOu38WU59i58+2FR/gQpgVOpJWcRm8+rB4PkypkrR8hYtqOzrfhTVx7s+oeQgUifT++YODgwiL6eF+wrf+AL7hOdlAbr0+CiW6uOVc3JXIofHRDY1ZBU85sLLQ0wvc7ZgjjIA6w132Ty3G6yGSYh9Zu+Guu2MbOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762376362; c=relaxed/simple;
	bh=WATT6+IItsTab2tsOIp4A1LeA6H3QB0Yru6U6J4YIQI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VS+rPvh/wV6TYpb+XnK07NhV2YeDiB9hvmVhhhhyrgxqG1ygy3iD9SvcznvssBSk16xdSosbjI1Y6xGNpn3aN5zYgTA/nQXIiGyIi4IeQ/SPePAenMxkhxcTxL0ZKg9LiQDzIJOH8QP/dW0xyBXlsHcmneweeEdPU/g1gIFCXZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUEWHZvV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUEWHZvV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D3FC4CEF5;
	Wed,  5 Nov 2025 20:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762376361;
	bh=WATT6+IItsTab2tsOIp4A1LeA6H3QB0Yru6U6J4YIQI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hUEWHZvVUoxW+uqr9XdiU83OpXv6DHApNT2ajBWaoOOkrmGHHEZZo+I71FS6vSrQ4
	 8wpa2FfSlSH1rOI8Z8x1FEBEseqKd0eyxqAES+QgWSWYlsiACqs9wH2O4rKXu+y1q4
	 ffyaSJKDIQcnGFKfj1JcwoHE1/XzrIYzzaHxwAe9ViHgOgo8Qom7jZnPW1P09HyaWV
	 /Cewr4FxFn8dif2Ebzh9eoxCnIPw+kxypxZorGYN8vlRsQGEY7BrMwHH6AeaotySD/
	 dTw+XFFms/SNMpB9wr3nxjr3PRjyItT+BnTvtZEdVHUbvppcUn3xNwkppoqWtZHZlp
	 KFzN39c884RcQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, ojeda@kernel.org
Cc: aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 dakr@kernel.org, gary@garyguo.net, lossin@kernel.org,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
In-Reply-To: <20251105054731.3194118-1-fujita.tomonori@gmail.com>
References: <nsSZZk6z9Ia7Gl5JS9LVNDRjc-9eFvtSWyLI4SSjsHNouDkDV-GmXnixMYlIpGHryPfhLr8Z2W_CkWd6D2frYQ==@protonmail.internalid>
 <20251105054731.3194118-1-fujita.tomonori@gmail.com>
Date: Wed, 05 Nov 2025 21:59:06 +0100
Message-ID: <87pl9w6vs5.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> This adds the Rust equivalent of the kernel's DO_ONCE_LITE and
> pr_*_once macros.
>
> A proposal for this feature was made in the past [1], but it didn't
> reach consensus on the implementation and wasn't merged. After reading
> the previous discussions, I implemented it using a different approach.
>
> In the previous proposal, a structure equivalent to std::sync::Once
> was implemented to realize the DO_ONCE_LITE macro. The approach tried
> to provide Once-like semantics by using two atomic values. As pointed
> out in the previous review comments, I think this approach tries to
> provide more functionality than needed, making it unnecessarily
> complex. Also, because data structures in the .data..once section can
> be cleared at any time (via debugfs clear_warn_once), an
> implementation using two atomics wouldn't work correctly.
>
> Therefore, I decided to drop the idea of emulating Once and took a
> minimal approach to implement DO_ONCE_LITE with only one atomic
> variable. While it would be possible to implement the feature entirely
> as a Rust macro, the functionality that can be implemented as regular
> functions has been extracted and implemented as the OnceLite struct
> for better code readability.
>
> Of course, unlike the previous proposal, this uses LKMM atomics.

Please consider if it makes sense to base this on `SetOnce`. It is in
linux-next now, but was on list here [1].

Best regards,
Andreas Hindborg


[1] https://lore.kernel.org/r/20250924-module-params-v3-v18-1-bf512c35d910@kernel.org

