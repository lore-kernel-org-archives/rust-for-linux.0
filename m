Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F35B16132A;
	Wed, 11 Mar 2026 13:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773234273; cv=none; b=FIk3wP38H3VNjWYskVggAlP3JJGf8kdbGWK9vEuaMAos3gprqiU3crPoLo4uthU2eFKZaY8F4AaeBVFY8vvfKt7GCQTPfBeZQCHj5mcHMh9yzyom1iVSmPy9XfKRNqzpD3gGS4CsJSTEF4gjOsrg5NIuU5Bw0QEkx4ziETxNoXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773234273; c=relaxed/simple;
	bh=x2f2kLLNlfREhUaFvz8oTtk0blO9no/cjE2kqFA7jwc=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=FCUBaIrprDY4kkpYRYfJJd9gpM60WxNss89aNbkjgmtigGin5JqAbXZcoP4Hy4IuvwCuRFmkIxzoCR+2i0n0F3uPgG87gHLqImP7PkPc8+y5ySjM9jmoU+E+ewa3JCzib+LksZBb0hMj9Rl4gTlNQIGC/Dine9w3WQMs4wTR8gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aC3gA8+l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aC3gA8+l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370DDC4CEF7;
	Wed, 11 Mar 2026 13:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773234273;
	bh=x2f2kLLNlfREhUaFvz8oTtk0blO9no/cjE2kqFA7jwc=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=aC3gA8+l19+CTnNAquVjKHf6H9F150rQAK6jgOTV5ZvkMINjX64kRcDP+XiYnWyfK
	 qDpwvxRe7weHnPgybTkkV4TLwGF0LUWlpV3xGQKywzXxOjk7waDJOQ34PtzJBnGPco
	 hJoan1VBoMYr+s4i0NS+KOzd5psMWIDiNtouPu7JPFxqWjGFEm0wHecpWpOesDuCeC
	 uPn2ux8QL0ZaOTrXEl3qxXxUopQxwFmf7DI9JWLE6C1weT8xwtoWVRqykWi3eOrL7s
	 SrmYPh2QzovY8qTCvu4/tsp+3+vJSAljdZ8PVmJgPN2IJnYfGZgI4BK5q4MXTzmple
	 d56LLAFWkQ8vw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 14:04:29 +0100
Message-Id: <DGZZ35ONHS0Q.N6Q05IA0T0IB@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: gsp: fix UB in DmaGspMem pointer
 accessors
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, <acourbot@nvidia.com>,
 <aliceryhl@google.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
References: <20260309225408.27714-1-dakr@kernel.org>
 <DGYQCXD2VH23.3D54NHJH6I0VA@garyguo.net>
 <DGYSTBMF931L.3OV1I4IWUW4ON@nvidia.com>
 <DGZYYB7XDN4N.3L7ZRCJSQH2QE@garyguo.net>
In-Reply-To: <DGZYYB7XDN4N.3L7ZRCJSQH2QE@garyguo.net>

On Wed Mar 11, 2026 at 1:58 PM CET, Gary Guo wrote:
> If this patch is intended to go through -fixes, then we should really lan=
d your
> series via -fixes too, otherwise it is just causing unnecessary conflicts=
 on
> linux-next.

It has already been merged in drm-rust-next, so we will have the conflict
temporarily. I say temporarily because I will backmerge once the changes in
-fixes hit Linus' tree anyways.
