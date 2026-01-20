Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72023ACA62
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 08:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768896473; cv=none; b=o1hqIG+37nDyN3taDQSfufsyu5Bk8P/R9kSPSj+zdEvWdyIkQ/vkQVbtr9zePzkmzOM/vSzDyg33sNHCg+57d6tsVxu5PZI6UyAfc/K1qr1As5nMAR9Del27GXEmIwFWSFtAPkCf8hWV77AxWQ5drnudzSPQ/FIWdC8pcoqB4t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768896473; c=relaxed/simple;
	bh=ucgjxynmvbCMMzavM53FB5TVLhCnksyvG0M2hhNy8mk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BXMpcr+CLz9+Lh6kxZkjJAbsQ7O6p8V6t2PDQRsWC/HQxnfBkPJsoztnvQU3pH6h225RP+nFbk3vl8wlDfju8relttiC2Cjms7utc69nafjmGOY4R+EEPvWHuW1cUDgOJKbAh6ionjTvJYkut1L1QUY9OP0ehL/GrA97Kzp+Brw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PV44GI2a; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PV44GI2a"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-64d264e09c7so5036834a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 00:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768896470; x=1769501270; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WB25pun9VTYRY26rX72qaIvvvqgUzYKtx7vSm7qo1+U=;
        b=PV44GI2aFDgKSaPiuTzteF46V6q1IPtmuuUgt+++dIUYfOH4IMmC5ZovEpazJraKYV
         IflNfGRyP/1vRPqanoY5S8HN8zE60w2Viowsu16PuXRLXbLd/rIAgoiFgvjMz/kqAWao
         rCfXnamf78R2Na8sbe8OiKX9xQqxQspHElBFeBiUz5TAjDjLO3diMEZwLnVcvuq+byE0
         78+xZQ3xeURO3tJ2t9ZBVRQvWXBpND7L/b7y/PCzVZ9zm0mbbLXp6ugxNUAtS7HG6LmV
         Z6oyWgqk9ejR5NrIqJ+wGdSBDvwEk+PcmxOeLk5M46EbsYvDY+g4QObeCDzCuax7bUH9
         o3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768896470; x=1769501270;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WB25pun9VTYRY26rX72qaIvvvqgUzYKtx7vSm7qo1+U=;
        b=tKPzNwk1ypJ26CBp161dUfoQyXCLMUycTgaXXDRA1vca4YvGklLph3pm6TVywQlhH/
         iOSyAQvoy/SR6A9QXdgZcuCRhq3Oe9jeRS5UWVTWIutNzwyhV3UJLdbiVnJsxZMDwvIQ
         15/4UbU2AiylKRU02BLZEVH/kphkkZ4Kr3jznyXpG/AZMFJL71GUR2gII4jlF30RCnqu
         gI8ddagXY1dOflQT8FSc9Lmr/PCzp3BUVVpm7fpG6jLEKXPid2Kf5MXsFIJ1GAvOvjwA
         Xes6esZWbqeltkskwCCcameqMKYlN6SPoEJ4aZpT2NkTYyU0bDSOj6B0shcYSm8xFcE9
         2ZFA==
X-Forwarded-Encrypted: i=1; AJvYcCV3oG1mHPyPwPAsPmhCTE/xUU8VVfmHCamHUEPCjGiHc98R1YJGl9WzIMiySsKpaYtgQQHvv7zrW93DM9it8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLGafams/VX1XHEtt7P2laqtdNmZjJl19tDOJWDu0/7/cBkOQq
	LKwNBojJbxtuwY2kWt3lxM7WNwqr80AHtm5F2q9IbBx4qw9WCosk8L1l+98NHoR1gSRW+rCYQsZ
	9PK3mrrJoCpyM9NoUqA==
X-Received: from edi27-n1.prod.google.com ([2002:a05:6402:305b:10b0:655:b4e9:b671])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2711:b0:64c:90e9:aeac with SMTP id 4fb4d7f45d1cf-657ff2a6643mr899124a12.13.1768896469942;
 Tue, 20 Jan 2026 00:07:49 -0800 (PST)
Date: Tue, 20 Jan 2026 08:07:49 +0000
In-Reply-To: <aW6V0gn4mLiCUu1q@um790>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260119070838.3219739-1-dirk.behme@de.bosch.com> <aW6V0gn4mLiCUu1q@um790>
Message-ID: <aW831WHs-O-OCWAl@google.com>
Subject: Re: [PATCH] rust: drm: tyr: Fix register name in error print
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, dri-devel@lists.freedesktop.org, 
	ojeda@kernel.org, boqun.feng@gmail.com, gary@garyguo.net, 
	a.hindborg@kernel.org, dakr@kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jan 19, 2026 at 12:36:34PM -0800, Deborah Brouwer wrote:
> On Mon, Jan 19, 2026 at 08:08:38AM +0100, Dirk Behme wrote:
> > The `..IRQ..` register is printed here. Not the `..INT..` one.
> > Correct this.
> 
> Hi Dirk, I was hoping to get rid of this register read since it's really
> just a bit of debugging, and it's the timeout error that is of more
> interest.
> 
> What do you think of handling this through my read_poll_timeout changes
> instead?
> 
> https://lore.kernel.org/rust-for-linux/20260119202645.362457-1-deborah.brouwer@collabora.com/

We can always merge Dirk's change and then yours on top (removing said
piece of code). That way, if the stable team feels like backporting the
typofix, they can, and otherwise there's no harm either.

Alice
