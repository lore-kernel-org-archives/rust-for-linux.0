Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1A619D898
	for <rust-for-linux@vger.kernel.org>; Sun, 16 Mar 2025 22:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742162402; cv=none; b=NGln9LcEPK0nOws/HxuAeCGnQc21PrXc7U2rdoa3OTKoXYuz10dh/JlNxn8YUQ3Ix3ZSXtQIw5Mibme4GvW3qR7nCoGYYXH29Xc02muVaunXas9XMxU9sMfPhmIgRq4TDgm0JlH0BLvj2t4nDejnylUohcCqPAmW7BKeMw1gN3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742162402; c=relaxed/simple;
	bh=IpDUv3j2R3ESS3O8Gx+oPVnq+GTFL8wMrwffaqNjyG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XG5pjnX9wVscPOpaUehjnY55ChG+Zx8O710w1D9r3ri6BmYPQ36wY6MOPg1rj8hrti4XMWsTPE1GFNHCMwfaixmrFBrAuasmuZrwW7PLNvH9oJuFmi1W3mf/bg2AOBcZc2pRfQWmmNd1VpfH7G6E8m6SrMt9GkhPusPkx7Rrc1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/ZtDc85; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/ZtDc85"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45768C4CEDD;
	Sun, 16 Mar 2025 21:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742162401;
	bh=IpDUv3j2R3ESS3O8Gx+oPVnq+GTFL8wMrwffaqNjyG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c/ZtDc85lcA2rydJZiKtR0OdrDSmlJqQ3eTfxUmGU4p6kADlcfUe1LwH7pfeSaq5I
	 hbG8kCqGxCT3eAkcYsrSZE8e11+v9TydJnm6X3vk1DGUvkJrnLtm3kE8Ng3fHPaS1k
	 txkQi782O7Ms2/vswkpQJJTAMgsNfx9IRerCwsWrMCJRASMakajMPSNriesRJyc89m
	 UvAbmnXSRZfAxeZVgkKAwp+w3GXXsR3V6J4zr9o9sAioI2f+5huDbkjPh8fh2yEPO8
	 /YJfmW9/n+rNwni98I+2XJ2PfIgOwPWfXiQR/9zjYGv+8ZE+JgkbWgVY3dmqsFK4On
	 ljdF9zw4qYs+Q==
Date: Sun, 16 Mar 2025 22:59:56 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, andrewjballance@gmail.com,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: alloc: extend safety requirements of
 Vec::set_len()
Message-ID: <Z9dJ3Ns-9BZMk9u3@pollux>
References: <Z9bWODCNNEq3xI51@pollux>
 <D8HVI9K91JWV.NHOPVELH5JE5@proton.me>
 <Z9cfkKTVKtc3imyK@pollux>
 <Z9ch0fgUI-V-rlGr@pollux>
 <CAJ-ks9=b-uMCLMMKT-9emgrrUXeaA50DBSEAWjSD+uHHZu-i9Q@mail.gmail.com>
 <Z9c6e8cbdFMTT6K0@pollux>
 <CAJ-ks9=J1hsnFvKzAOwi918UiP49-mmSki=aH2dhiSr7WAqrPQ@mail.gmail.com>
 <Z9c_8AQWgW70XH1U@pollux>
 <CAJ-ks9mBJUReOCbF-ar+Scoo8RAqYu-mc-Ej8UMHoyGHs0H7sw@mail.gmail.com>
 <CAJ-ks9=OZyRNPxEJqBvjt77Wv=689jHLVFNDCjUE9TM7Vp-00A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ-ks9=OZyRNPxEJqBvjt77Wv=689jHLVFNDCjUE9TM7Vp-00A@mail.gmail.com>

On Sun, Mar 16, 2025 at 05:52:33PM -0400, Tamir Duberstein wrote:
> Actually, I don't think we need `dec_len` after all. `clear` can be
> implemented as `self.truncate(0)`. Do you agree?

Indeed, but I still think it would be nice to have dec_len(). pop() would be
another candidate for instance.
