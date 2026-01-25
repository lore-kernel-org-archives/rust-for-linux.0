Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEA413AA2D;
	Sun, 25 Jan 2026 21:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769375845; cv=none; b=fceZ9xNTcIfxrr0KbwAdr/BzPQ3C/PuiGfXEWIA+Xb5qGDjLew2stuyOdtjS+xB2iCAm3gzMEEf6Jlp5hHjtdmvAT1iXuSfMpWVtKiQIp9uXmctCiJ49erSlZ3u2taGtd1JmLb0Z5q1CJ2BlmiBVH8uO8A3KVMJAIReecWG04GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769375845; c=relaxed/simple;
	bh=P2aw8fg1hcqAS5/X9fP1N5WppHckO6H7eqIrLxTjsCU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=WSb7L38pwlMTdPM6bltWKrBZH9Zoi3msMM/hNKpZ0bDBj9xLLAfr82Wa14LWfi/DB9OlRyrGD7jGvMvwi82bThgiLmulv1HSXmXSQQHVq/UuyoR5TezNC8XfPcsP7w6Q3lhEJHQ6ULXig4L0BQoCGxgA0opZ2NYrz/KZNFnREPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J7p6w6CF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J7p6w6CF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DD97C4CEF1;
	Sun, 25 Jan 2026 21:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769375844;
	bh=P2aw8fg1hcqAS5/X9fP1N5WppHckO6H7eqIrLxTjsCU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=J7p6w6CFZoRkIeWwp6Nuzqbqt6dn66hyrsPrL2A4LFxDcsb5lzxmRN77VO8bh+jER
	 Os+iazBiCmctL5VX+xVJF+a4GykfLXsjthZUDwykmfch6At6AXCxX+GZfBInmTcRdU
	 DGOromZVRJ9GoZebRKr1wLkTFnOzXjXglgYkNCi+WWaozA4P0HRwYF5ZJmZVoW1mGD
	 eUZ/35uVruMyaIqZheZfkZugICgKo7I8zvtWhaCnDpN76JaleXrsdpe6qac30zXY0F
	 ybdzxAFkeAcs6xcYVmsl3bPFUI+/nth9uPl7dnfhs5j44OXOiEWu2bB4tCI0S7NZEr
	 2qtuVJ575ZWaQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Jan 2026 22:17:17 +0100
Message-Id: <DFXZDYFOPVZ5.1EM568PBOZI1F@kernel.org>
Subject: Re: [PATCH 1/3] gpu: nova-core: remove imports available via
 prelude
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Daniel del
 Castillo" <delcastillodelarosadaniel@gmail.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Lyude Paul" <lyude@redhat.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Shankari Anand" <shankari.ak0208@gmail.com>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260123172007.136873-1-gary@garyguo.net>
 <20260123172007.136873-2-gary@garyguo.net>
In-Reply-To: <20260123172007.136873-2-gary@garyguo.net>

On Fri Jan 23, 2026 at 6:19 PM CET, Gary Guo wrote:
> These imports are already in scope by importing `kernel::prelude::*` and
> does not need to be imported separately.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

I will pick this one up after -rc1 is out.
