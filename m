Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391F0386450;
	Tue,  3 Mar 2026 19:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772567715; cv=none; b=Q0zTBflzDM/m6vfWnGpSC+PmJYqXF9ZiCPAVmz8keKvka5Om2tA3oyPeA/2dImvohDqsPY2HXjdar9iJR2dgmw6QDiAF+z4F52KzO9f1Wwm60EQyrkm05QZbN2+lRZYQqxF3kqj5LA/TNxY8VZHo6FKcDxypdkvbqH6LuWGyvLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772567715; c=relaxed/simple;
	bh=WLB0VY039DbbQ0p18wQJ+NAynUKYf7KfWja7EdoN6Iw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=nFsx9qoUSTl6EHUDL1XIuO6kWHXCG9cUDbTIxsBPzgJ14lFWgFQg/vJgPPNRX93PyfycjbsUW+vYPZlm3SYLmTqK7gNrXFqSdjv/15OMvgssSswxhx7/2C4m40YgfD6B0jIkoPtPzLVY1ZAnNzGIWf2dHB74iz9oAaNc1k+OHd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YNE+gwD2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNE+gwD2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B63C116C6;
	Tue,  3 Mar 2026 19:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772567714;
	bh=WLB0VY039DbbQ0p18wQJ+NAynUKYf7KfWja7EdoN6Iw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=YNE+gwD2ap3eRUTNWk/tlck5MikSbnXGPSlYydvyU4Wg5yRIotCx6wh3nyAd+f0qX
	 pjg7BfVr1xNhckE1/uE+qAupUYqKZXre7yIlJtSRL07czwSmi6Cy4xhAz9U7PD/CvK
	 vEROnoEO1If6L5VJLmpCgUcxQrskPl5JGergtMn/Tkir78EUQ2ck9WiLeh7oV2mnBu
	 IHc0eEvJjgMtBFOs6SU3CIhkEbiiekgcRtolfYyM2PydCsWYu/PEIheWZ5eGEcBCO8
	 m9voW9h8VAaoW+4QB3wLi+en2LNgJGmbPE3FooNQNraDJohpEmtAMqH3UcGP4aDClZ
	 z2/4rwKh1ICdg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 20:55:10 +0100
Message-Id: <DGTET8S00POD.1CYOWCSRGNQDG@kernel.org>
Subject: Re: [PATCH] rust: irq: move 'static bounds to traits
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260219-irq-static-on-trait-v1-1-6ede6b743ea3@google.com>
In-Reply-To: <20260219-irq-static-on-trait-v1-1-6ede6b743ea3@google.com>

On Thu Feb 19, 2026 at 10:12 AM CET, Alice Ryhl wrote:
> The 'static bound is required by all irq handlers, so it is simpler to
> specify it on the trait declaration instead of repeating it every time
> the trait is used as a where clause. Note that we already list Sync on
> the trait bound for the same reason.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to driver-core-testing, thanks!
