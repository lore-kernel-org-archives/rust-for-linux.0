Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35643E120D;
	Thu, 28 May 2026 11:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779969296; cv=none; b=V5GQ15Mp0FqX5tEOVHca0zGkvg5R1eBZeVxQi5iZpdiqhqTWKJTfUlVNHw6/DvGuEW9MI9OekuLowql4CmPBVHghl5t0DzI0MiaIU5VqpoCRxz6SD6HaFQmV0lvi8v/47a33BbxozENswfnSvwS2iZb9+Q4eBNTjloj9qGhwuqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779969296; c=relaxed/simple;
	bh=Ve665W//oGL6GJGx1sqDZQqKbtII9PDiZy6FvezfRew=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QDrP9iWorbagFtX3Rf85VjpMmBq9oc9vpccrvMsFUYGAhjDVaBH35fFDK9Tt1QXBP/loCrubpyHANJrb0/JcNrZ+EBBRfVJqNUnutqTrGEQz2IpfzvmIYqmKfjg3x7rZXqRjrtn9OJ3UFmyXnrqjxPcV3V/SCbisgM0FemPEdyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQO9i+tf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQO9i+tf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 587321F000E9;
	Thu, 28 May 2026 11:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779969294;
	bh=Ve665W//oGL6GJGx1sqDZQqKbtII9PDiZy6FvezfRew=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=RQO9i+tfAUdN3035r4u9kTp6+ggtldlmZh8Osf/quvOzy16Aq9mXmt3Uxwam6upqM
	 SD+osZRmX9wfrVJbgeU5bDVlTibFNkXLi2B0+DMAxX3mB2nSVqIWbeVG6EClrniVvq
	 6cKItCtqqafjuuyFeyVUyuZuKnEQHN0yZOa+7nxXXojm+3DDaSo3bvrXeDKK4Nz5vS
	 7/FbbQai0YyrVUtALVkfw0WrmuHP5V4IPQvGU2OvioTDs4ROzWsjTEbGB08LluvN4r
	 uJYMzEBjl9Zyi0jm44kmorIDyUAeXBdEd81RAxLrQ2ltu6aFGZ7//6P1ZEptnqPpe4
	 Dc8InF5sN3u3w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>, Alice Ryhl <aliceryhl@google.com>,
 Benno Lossin <lossin@kernel.org>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Boqun Feng <boqun@kernel.org>, Danilo
 Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, Jonathan Corbet
 <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Trevor
 Gross <tmgross@umich.edu>
Cc: Neal Gompa <neal@gompa.dev>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Sasha
 Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH v2] Fail the build on RUST=y and RUST_IS_AVAILABLE=n
In-Reply-To: <20260521-evolve-to-crab-v2-1-c18e0e98fc54@chaosmail.tech>
References: <ya3U0W7wZmWijvwMHLMrN910Gvndla91jOB_J-Jq2FJzlPtNhcnl2tqTFKUQTKwrQdPYNIQWW8TJxaEm5iy5nA==@protonmail.internalid>
 <20260521-evolve-to-crab-v2-1-c18e0e98fc54@chaosmail.tech>
Date: Thu, 28 May 2026 13:54:45 +0200
Message-ID: <87ik877nqy.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Sasha Finkelstein" <k@chaosmail.tech> writes:

> The current approach of silently disabling all rust drivers if the
> toolchain is missing results in users that try to compile their own
> kernels getting a "successful" build and then being confused about where
> did their drivers go. In comparison, missing openssl results in a build
> failure, not a disappearance of everything that depends on it.
>
> This also means that allyesconfig will depend on rust, but since the
> rust experiment concluded with "rust is here to stay", i believe that
> allyesconfig should be building rust drivers too.
>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>

This is long overdue.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Best regards,
Andreas Hindborg



