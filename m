Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB923A4AD0
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 20:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768594894; cv=none; b=FGW61YPrKDh6ZQYtTTJCFWNfCfE3zTkRs9INOSPW1OFHmHANnyGAMm6vYgFUwlyLrsCvHAeWbxdM5hqLiiayqeIG/gmnEMoBekw5xeYNzoxCG0FchnPRc29bWcicmIjNggdLK53DHDZbl8JBvuaHUyQnpUPmLWL+d7khqdpxfl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768594894; c=relaxed/simple;
	bh=z8xdkfPtkAh29N1Y7nIlxG72kA3KHdZLod1K2H0Ip4o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=uIYSwVj14Hz3n+U48fytfGnQA4QkxeNLxm0Rv9beql+kCNPoND1yvwz88KRqYJB1czf54niysTm3wxz7xCnWAX23mq8WaX67KoNASaWVOzOQ6gAEammIJ+WT86gtjVhZhO5ZF7Q/oVlY4vhTU7S999HpVmEEoRypNIjQB/ndN3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uGlMkRFN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uGlMkRFN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8BF5C116C6;
	Fri, 16 Jan 2026 20:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768594894;
	bh=z8xdkfPtkAh29N1Y7nIlxG72kA3KHdZLod1K2H0Ip4o=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=uGlMkRFNSHWtUntHLprO4lIlwxI2NikBI5LREkePb+NGGtlyMYe238VzabatnovVl
	 N6wS0WEnNmgdEl3el66xgE2j1KJomf0RgeC6Kz3w0B1JixILXj4wYOMNIifXCYuS5Q
	 PEEE6nCD5TD7D0w8Eun1RiUnxKqUwRE4dCoPtM+zo0HytRZQvRrVR10nWDEmGD2AKX
	 2g2P3T4XiQHkdlcxZSVJVHzBOiVSuHH8F+mkwg3pvLkTc9lRa+Vdjrr52i7yEDE/j7
	 ka4EuUHez7ZH+SzPrXiuOt4uLAMhufUGooQAtf6j6yufLGkcu4kD8oEw9HWcgYfFZk
	 GdHB8oPy4150Q==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 21:21:31 +0100
Message-Id: <DFQAKCP72Y4W.3SD00GX4Y29N3@kernel.org>
Subject: Re: [PATCH v6 06/11] gpu: nova-core: move some functions into the
 HAL
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
 <20260114192950.1143002-7-ttabi@nvidia.com>
 <DFQA0S0IXLNS.NBNHXPS9OHOV@kernel.org>
 <b476ead7-f9af-4194-a848-dcb3f415cd34@nvidia.com>
 <DFQACNZ42CNK.27BOZPAO1T33R@kernel.org>
 <9489bcba-6c0c-43b5-baf4-5f1dc9a888aa@nvidia.com>
In-Reply-To: <9489bcba-6c0c-43b5-baf4-5f1dc9a888aa@nvidia.com>

On Fri Jan 16, 2026 at 9:15 PM CET, John Hubbard wrote:
> I missed something here. Could you elaborate just a bit more on
> your proposal please?

Both HALs Ampere and Turing implement the same code to reset the falcon eng=
ine:

	regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true))=
;

	// TIMEOUT: falcon engine should not take more than 10us to reset.
	fsleep(Delta::from_micros(10));

	regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false)=
);

Instead of repeating this code we can just add a new function
regs::NV_PFALCON_FALCON_ENGINE::reset() that toggles the bit with a
corresponding delay.

So far the delay is always the same, should a different delay be required f=
or
another architecture, we can also pass it to
regs::NV_PFALCON_FALCON_ENGINE::reset() as argument, but that doesn't seem =
to be
necessary.
