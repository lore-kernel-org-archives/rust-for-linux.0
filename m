Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1F5487BF
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 21:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750800963; cv=none; b=BPrHrETNS9MWBwsliIP+ENEoZooEeiR7E2NSMld69zNcngLDS/bpgAY8HplPfR0hVV9SPhPZtCjGNA4twTjeI64GPNuk3AM46n69XM0+2miYzXscbLk+eGFTsrkZLVO1DtwW4aexVlvc6xG8Xc+HW3R7CGToUAepM/u742MnFD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750800963; c=relaxed/simple;
	bh=HM5ZaLKft095fgLFQg806+Y/LLjBgrZ3W4+fWgD+86A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EGEX7sAPpQkqJm/PkZGHCQYrTTD0dwXIG6gU4x/JRznHnD+PIoOVN0q9cfkQgMOJ2qMXc6m/WnXK1W+PITPmsm/u1vFchnARDiKT7gjHdXvyKhN2hTRxZ9kHURAW3M4Px/x+EN4nS9vPYLV76DpHjZgaO0PG2sAYyx9tUjMikWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrUoTYT+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrUoTYT+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8169C4CEE3;
	Tue, 24 Jun 2025 21:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750800962;
	bh=HM5ZaLKft095fgLFQg806+Y/LLjBgrZ3W4+fWgD+86A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UrUoTYT+BY0SHnrHs3HePf2dndBJ7m97OwoJ3rgHMn+G8WYUSNVc1jgHZu3tJDdhE
	 BeZe9OehQ9sndQhpZyatdJRfJRo98HZ+q3EcLmw6YDd+XF6L5no+K5AQbk/CjtSPS1
	 RHsjZsFNyWvJ/nRzzbfuINCfMnOBnfCAeSVew35gtLOz0kfFnbSHpCzaAtUlXjEW4d
	 zRYBPjpsUcziJ6OGKKDCIJRcNAzhlqZ1IdVf4AGk6zOawBic6tLTO38s5kvCV441mr
	 AEIic/DkVYG8Gtgi5n77w9APZmpJM8coRbCopqGaUKzwjlbcAEj//RlJ89FG+677dJ
	 qHymV6RGAHQ+w==
Date: Tue, 24 Jun 2025 23:35:57 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com,
	daniel.almeida@collabora.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, tmgross@umich.edu, alyssa@rosenzweig.io,
	lyude@redhat.com, rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] rust: drm: Drop the use of Opaque for ioctl arguments
Message-ID: <aFsaPZKql35qPj0X@cassiopeiae>
References: <20250624212225.2169888-1-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624212225.2169888-1-beata.michalska@arm.com>

On Tue, Jun 24, 2025 at 11:22:25PM +0200, Beata Michalska wrote:
> With the Opaque<T>, the expectations are that Rust should not
> make any assumptions on the layout or invariants of the wrapped
> C types. That runs rather counter to ioctl arguments, which must
> adhere to certain data-layout constraits. By using Opaque<T>,
> ioctl handlers are forced to use unsafe code where non is acually

s/non/none/

> needed. This adds needless complexity and maintenance overhead,
> brining no safety benefits.
> Drop the use of Opaque for ioctl arguments as that is not the best
> fit here.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> [ nova-drm changes: Danilo ]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

It's your patch, it doesn't need my 'Signed-off-by:', but feel free to convert
it into:

	Acked-by: Danilo Krummrich <dakr@kernel.org>
