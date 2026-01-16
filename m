Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B1533AD98
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 19:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768593361; cv=none; b=J/12374Bn/waiQCEKdBodWhDuQ4YpZt1Vm7u4Z83P5vrTk5NqPKQJw2oYUgBymsBgMlxWiMflkYle+1oSv+3qh8W4rZZFVC6Tx/SP4ftyyV+sK+7NyAEsy9yIgAvfWKLgOdYKMGFSSYtMpMWuK9CHLRD/97mP5VlQkUAyozY3qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768593361; c=relaxed/simple;
	bh=EqZPA+4yIq6PIe3DOFL/YCoQzgqQgLA/B0VF5a/R/wU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=q1b9UyCLnoXiausTvKTDS17Z1angQXtKMn75j7+h7dxi64srSp2hv1j2vQqElAryIslybR/rn3VLWio75DGQObitQtuQbM6Kwib0A/YQRKdJ9zW7dnN7QrsOzTElbva3r5wobRgeuvj7GmV9L3i5jKWG3sY6BipKFQnJC6PQRKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VM3LxnqI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VM3LxnqI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E0C4C116C6;
	Fri, 16 Jan 2026 19:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768593360;
	bh=EqZPA+4yIq6PIe3DOFL/YCoQzgqQgLA/B0VF5a/R/wU=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=VM3LxnqIlffwTfHa1HBLQUg8TBCLoc579sDMtwgtt2LoeKfcafUACEJCpxJbQ23j5
	 yh71F5Mb86HQwk7SAfdepJxwy2iWblOHxIqAjBbUUzAwUdtXsUth2swb0tNef2KR4i
	 m4Am9bgJXu3us/L1Km/VOCKSqhyAp5ZpLYlz0vabEG7WM9He/awIsZyLH0Y+XHgWsf
	 JoL1xoiqe5RnzVOQ0/4U+GoxEvxIaLX5i3ZfF5Q8RmyP8theubsg26Of3XS6jqdFiX
	 u/yD61hD7xNCiKbIDCzqM4LdfZOKvBPVCqOBNzF5VrUHJbcHffYC7YcVGiYDpQTSh4
	 XG2+Jf5LPMZ5g==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 20:55:57 +0100
Message-Id: <DFQA0S0IXLNS.NBNHXPS9OHOV@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v6 06/11] gpu: nova-core: move some functions into the
 HAL
References: <20260114192950.1143002-1-ttabi@nvidia.com>
 <20260114192950.1143002-7-ttabi@nvidia.com>
In-Reply-To: <20260114192950.1143002-7-ttabi@nvidia.com>

On Wed Jan 14, 2026 at 8:29 PM CET, Timur Tabi wrote:
> +        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_re=
set(true));
> +
> +        // TIMEOUT: falcon engine should not take more than 10us to rese=
t.
> +        fsleep(Delta::from_micros(10));
> +
> +        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_re=
set(false));

This code is just moved, but repeated in the subsequent patch adding the Tu=
ring
HAL.

If we always expect the falcon engine to reset within 10us regardless of th=
e GPU
architecture, we could add a regs::NV_PFALCON_FALCON_ENGINE::reset() functi=
on
doing the above.

If it the exact timeout differs, we could just pass it as argument to
regs::NV_PFALCON_FALCON_ENGINE::reset().
