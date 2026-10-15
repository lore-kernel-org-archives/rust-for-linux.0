Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA213E8C77;
	Thu, 15 Oct 2026 05:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792043833; cv=none; b=egLb4RA8fm+8qRSIqzmCZ0V4wsPf8gPF8PiZn83MECQZi/B7fGo8JGMKcCkFoy20ikZx4Z6cCsNeS8cajB3eRUlbmpHozalFrTWld7SVgkD8qwNdRKJOBitdcLj66x0sfIbhFyUri7w+3fKoGr3R68N8fauYSTz/706SkIxj8YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792043833; c=relaxed/simple;
	bh=kRG9/J3nGr0IrN2CX9mkidtU1CyZippTmGS/Pn7nm6o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IOi0cqsruYYd/rwQSBaCiABQDvSxPRAk3a4dkGJX0+jEDlaIxGzRqxw6H53fqfRRjGnj0fg5Ve1NIyvyCTQ7XrkWA8rQ7SfzyemAGkG+jVLCmJbqd+pDOIDXrNnDfXWcmHLyrjK9tWWVCq/0wUAJnzGDQw6zwZVrgkJ4uTx+3a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZfT6/T8z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZfT6/T8z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5661F000C5;
	Thu, 15 Oct 2026 05:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792043832;
	bh=kRG9/J3nGr0IrN2CX9mkidtU1CyZippTmGS/Pn7nm6o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZfT6/T8z9tkZKAqQHQyKK5yCpGXQPHCku/fDPfx8KcRP98zlVK0Dxg1l1GS1r4A0I
	 ZXGQEUCi/d4C2us2Di1xhmFoBIY5zxUzeTt33Rd/wJn3gKzs8jiOihn+da88YMvbBU
	 Zby3ybbCtqebqDxlxPQMsSJwii5mRP2AWIPGp0VBVfWNjrZH4g1eXL5zfdixO+K24V
	 OGlemOgFQqAo0o+fcWHQpRxPKZh2fFKx2A/4V0df3oj5eFi/hzWN3E2vx9nk3PIKjG
	 GFA7b9N04QcvWeTHI2y+v/y3tBZ3rp+9gx8r10mkEv5LBIDTLzPujP244yXGg9rWq/
	 pDIjTq9psDdmg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [GIT PULL] Rust configfs changes for v7.4-rc1
In-Reply-To: <as9J9RsSaFsgvWwv@gmail.com>
References: <87a4opeh10.fsf@kernel.org>
 <gqTtllg5H44e40YGMX9c6VBa0PlE3mhBWByPMSyOgREWMRdJMPnJsI-YzVK32E69-FC2cgRjgrD1CWb3Xus9LQ==@protonmail.internalid>
 <as9J9RsSaFsgvWwv@gmail.com>
Date: Thu, 15 Oct 2026 07:57:00 +0200
Message-ID: <87fqy7cxqr.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Breno Leitao" <leitao@debian.org> writes:

> Hello Andras,
>
> On Wed, Oct 07, 2026 at 04:12:27PM +0200, Andreas Hindborg wrote:
>> Hi Breno,
>>
>> Here is the first pull request from me to you for the Rust configfs
>> abstractions. Please note that I neglected to push these three patches
>> to the remote that is picked up by linux-next (just did it now).
>> However, I tried the merge and verified everything works under my usual
>> configurations, so we should be fine.
>
> Do you want me to pull your tree under mine and send to linus, or, is
> this just a FYI?

Yes, please pull my tree into yours before sending your changes to
Linus.

Best regards,
Andreas Hindborg



