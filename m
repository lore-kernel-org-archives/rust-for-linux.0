Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365221B7F4;
	Sun, 15 Feb 2026 23:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771198086; cv=none; b=HCjZ40m7o/dD9xkYaZ5zGr3UJ+Pv3tlC82O2k9ZIf5tL5LIo6anyd3NsNfA6tJiAB/ItP9kk/p8qTQavyCq64K50J2CavSWfUxEhtdJA1/CVB0UFILtSAv7a+U0LrJDxlFD5xQmnbAdK2x4M8B/ipgWh4MtKC5hQqEWpMPOQqlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771198086; c=relaxed/simple;
	bh=agLUdmSDCrHvhMoto+La1aHGujXwuXilw2xL03ggdQE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YNftJU3durNspcCzeY3JCJQOxabY3O/X1MzioUvxHWFkvrBT3Fe5hVip9AF6EtAhEqDI8vFx2rcp2H1dDAcrVyf852LIy4PEPu4GreiCuAmhbJEZyoeeVNyE6ug2RvZ/etn6czj2HZrQRPoBJwAoku2pz3s9t0BAqpBUykWnL6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=co8FlOee; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="co8FlOee"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF81FC4CEF7;
	Sun, 15 Feb 2026 23:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771198085;
	bh=agLUdmSDCrHvhMoto+La1aHGujXwuXilw2xL03ggdQE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=co8FlOeekokJ1egtu6/JTdLXl6PSqLhl2uR4oOQ72RybtbfvUjk4of0+yL577eTEM
	 27NLy7H97eMeEVdb0mDhpwxMoyaB5eqZaztqi88hFvy+M5Ly21979u5mdzuXvEc23Z
	 FCh8XNZCWZ4fIww2oWkBLuDDbL4BHzTQmO2TEAU7hB4uBMyH6rmUk9TttRJWyowDrn
	 og0kEd3LIo0utv3WkKSCrl+agr+CVKyyJdv/uds6bfuzULp+k+APiGJ9SifR8ftAaT
	 11w1xa0HVDr7FdsDKc7iaMs/sfqcXQzMi9JVVtrCcil8Hjg6V8SchApnMZ/3Dp1jAe
	 tLvxK/ofZRejg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 00:28:02 +0100
Message-Id: <DGFXBHXTR8YS.3NUDRE3ZKV7Y6@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: sync: add lazy initialization methods to SetOnce
From: "Benno Lossin" <lossin@kernel.org>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260215-set-once-lazy-v1-1-6f5bd2efda11@kernel.org>
In-Reply-To: <20260215-set-once-lazy-v1-1-6f5bd2efda11@kernel.org>

On Sun Feb 15, 2026 at 9:27 PM CET, Andreas Hindborg wrote:
> @@ -76,10 +79,46 @@ pub fn as_ref(&self) -> Option<&T> {
>          }
>      }
> =20
> +    /// Get a reference to the contained object, or populate the [`SetOn=
ce`]
> +    /// with the value returned by `callable` and return a reference to =
that
> +    /// object.
> +    pub fn as_ref_or_populate_with(&self, callable: impl FnOnce() -> Res=
ult<T>) -> Result<&T> {

I would name the argument `create`, but not `callable`. Same below.

Cheers,
Benno

> +        if !self.populate_with(callable)? {
> +            while self.init.load(Acquire) !=3D 2 {
> +                core::hint::spin_loop();
> +            }
> +        }
