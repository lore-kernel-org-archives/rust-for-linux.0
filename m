Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D15A3932F9
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 11:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361394; cv=none; b=QWQbpOIvqLgyqvXF8kv3dW9/VM4EsmxoVYCV0H2UyX4W5C1x8l8GWtpl/vJtk/xDrPoKuxAIgicsYsngZAZRpD0QVpZCRy75g9C7nvmjr1wDLhM8t96c3iRTePqgTlbH8DRsjuVI5D3s1lcqKeS+K56nWumI2V95UzXK1/2aIg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361394; c=relaxed/simple;
	bh=y4Em+/oqvtAd4BbTMwqdCW1GLknmhc0qX4dduvErf2U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lm71CQ5CAwbtTqW2kq746xT4+5nxIvUa0uxtrCJcs+Ox/BoiBdnl5Ctd2haZ8lNXnpKlXa3HHlfMJXUI5vSN8CiYBaB5QFb69Kn0VB6wPfwsOHRdba0C5GGmTPYaUNHjK97i+ITPIrdI1f2JbALs9XxCg1Y2nuYnqI9Bx95n+Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1fCT6pE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1fCT6pE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26CEC1F000E9;
	Mon, 10 Aug 2026 11:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786361393;
	bh=y4Em+/oqvtAd4BbTMwqdCW1GLknmhc0qX4dduvErf2U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=B1fCT6pEy7WdG/Kk8wkpEqDGrGvP+gSl/8Xd6HPG59ZZehevWp3K8SplILXuKsybn
	 0kx+fZSM/IfNDOLM2VLM9CIM2I+0zbqnO/kmrub3Xz5iqZ+zBmAisitkjFs37O/Rno
	 Wm9GHl3+8VSuKBVkezuId7ZbOiURJ0xcJuei6lNNyE6bmF9gdvEs4pMm3GeNIPsjsm
	 APIfDV7gfRbHea8eOvCM0kB3EO+FEfnoOkycjwLf/VzlyqHm57QyuFGPrJhw4tyCD/
	 8gsAvFEShptjDiwSUANwMrokyi7BXtWcTbraztFM4MaQEQz9lwuFSyKM8P+Gc2gjdN
	 +Ws5v4TzCEeew==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, aliceryhl@google.com,
 arve@android.com, boqun@kernel.org, brauner@kernel.org,
 cmllamas@google.com, gary@garyguo.net, gregkh@linuxfoundation.org,
 ojeda@kernel.org, tkjos@android.com
Cc: acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v6 2/7] rust: time: add jiffies time unit for Delta
In-Reply-To: <20260808062839.1159990-3-tomo@flapping.org>
References: <20260808062839.1159990-1-tomo@flapping.org>
 <20260808062839.1159990-3-tomo@flapping.org>
Date: Mon, 10 Aug 2026 13:25:43 +0200
Message-ID: <874ih22p54.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> Add a Jiffy time unit with isize as its representation and provide
> Delta<Jiffy>::from_jiffies() and as_jiffies() as the unit-specific
> constructor and accessor, mirroring from_nanos()/as_nanos() on the
> nanosecond Delta.
>
> Represent the jiffies span as isize: Delta is a signed span (nanoseconds
> use i64) and, as a timeout, the value only needs to reach
> MAX_JIFFY_OFFSET ((LONG_MAX >> 1) - 1). isize is signed and matches the
> kernel's c_long, so it meets both.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Best regards,
Andreas Hindborg



