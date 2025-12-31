Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D227E27B348
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 16:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767197594; cv=none; b=XVA74iLS5JYEm0iQ/jrI2QiUA3qZ4VHqjgA7ArT3sUMzHl0xuW8ixA9yXCO32MEVJh6Vx+5PP4KLJPVmCUnIuFDJQGrVfuNUvCcZPoKXffvGBu0gkn6tdVfVu9XHwL158wZneJwT3UIeJHyl2WXArmwIfmcB7QLnNUrDuh04N5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767197594; c=relaxed/simple;
	bh=VqKjwWgi7+4Au/iZuGRoMZ8f9sz+nR0CeyjoFj+IYnE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=RYHs+ApFW/vmsvlNZRPRJ+N7MJvNr7wAlKgkXXipa5E0Q4YQFcLZBOpYTAL9buoyCVWVJ6TpiMTDvCF/0P2zsvqi3IiBREqp8fA3wepBl5AiTBVqjjFaD6Cz2BCPURAIi+VB5T2rIGBuV0oByvsKyoTW5vfAgCT7bmehiWCeaBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTIa8tEZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTIa8tEZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35276C113D0;
	Wed, 31 Dec 2025 16:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767197594;
	bh=VqKjwWgi7+4Au/iZuGRoMZ8f9sz+nR0CeyjoFj+IYnE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=tTIa8tEZ4tj/lT3kLYqDmkBXd3PtSq7p3YBAK+lmVfRG0U9OhE9ucaXbD0Y2XMg0r
	 5IVS/E5bRe4iiHGN4xtkZJOnY6PSsrkpQszaghPL9YWrjcWBqaJzunKBEvKIoI5sl7
	 7f9DbrM8Z2OCzjvh20+KJ1uYrYN2utyctd63n05oDf1iWv73vavKTZRjXhlUgyLjdu
	 lw8lNnD/1af1Nsj4wnt+njSNDbiXtnoZjz174vv+MZjjZ4rmU1oYpLPX7ZaWfYmu1m
	 wWoo7RVb7aq0CBlWvQK4sJLWWexROgmhij0lpcnUE9ClKM6ifneckpgSqb6tf19mxP
	 kaANIcjnP4Rtw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 31 Dec 2025 17:13:09 +0100
Message-Id: <DFCJ9H2RQ63G.1VDGWHYJ4SYVE@kernel.org>
Subject: Re: [PATCH v1 1/2] rust: dma: fix broken intra-doc links
Cc: <dirk.behme@gmail.com>, <gregkh@linuxfoundation.org>,
 <ojeda@kernel.org>, <rafael@kernel.org>, <aliceryhl@google.com>,
 <a.hindborg@kernel.org>, <abdiel.janulgue@gmail.com>,
 <bjorn3_gh@protonmail.com>, <boqun.feng@gmail.com>,
 <daniel.almeida@collabora.com>, <gary@garyguo.net>, <lossin@kernel.org>,
 <robin.murphy@arm.com>, <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251231045728.1912024-1-fujita.tomonori@gmail.com>
 <2ee56a65-c618-43a5-a050-231a3ebaf3be@gmail.com>
 <20251231.180738.11732647006485259.fujita.tomonori@gmail.com>
In-Reply-To: <20251231.180738.11732647006485259.fujita.tomonori@gmail.com>

On Wed Dec 31, 2025 at 10:07 AM CET, FUJITA Tomonori wrote:
> Danilo, would you prefer that I send a revised patches or will you fix
> them when applying?

I can fix it up when applying the patches, no need to resend for this.

Thanks,
Danilo
