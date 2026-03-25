Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3713CEB94
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 11:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439069; cv=none; b=qPVvI4jhgEGrqMFCOJOmIKQlURrK+HzwxQSd6ze1i9QxOhJw0KSkfWDfOMiLnLjiOb+onSUU0pvyOHevbKiEhvDSDO88TR9ssRzmkEehC6xzxG7tI2o/reZPcG6kfDBmQwk8JQOcStJyQPwQNoDCyaNfXAWXucAeqi92pEPcWvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439069; c=relaxed/simple;
	bh=QpeO54ZMy+zY8vE2iN9PG22Q0G/v6tjmzjfrkPN+V3A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tQYpZw1B42RxS0nY1VwmZqvuxZDzWOqUcRljBqOv4vSfqLTwTM92rBB0R9EaH+AQvhKKYSlU6FQEWHJfRIEIFGxMy9LuhzUiXIBJf29Iy/FxRVyhpswmC5exRbK9Dylr05OlTN7SMVQAPRIfxjzBHnxuzSSA2F9LbfYq+nGLyMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lyhybvbT; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lyhybvbT"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-668c932088fso6954052a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Mar 2026 04:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774439065; x=1775043865; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xUNk5DBarhia0VP1Ved6SPUtX2O9K1Wf39PDjoKefxc=;
        b=lyhybvbTrIrn8yIXmuqTyVzPk6wLy/7IPlVXmPhvJ0JzV8npjDgWmScGopQ1b/GpvD
         n6TzpPiUkZqMNP3tzU3Li0Ulbgxs5UhZgK027pffhms2V78qD8Vd31/KPE3eyeE/475N
         j4liNPC5X4ucVIL2x1WxnD/OmtBjmOyGpdu7qBarQr15XwlsLpWeePV0gBZrCGScKinI
         MkZPtkpuYHatRYdLVjNFY4c5W91kIGstVuWSgEAu0m9jevAKizArddc7PEU0Nb/73zSk
         L5v3ojirT/l8WiHe6i/iremInzd6ZlbUgGZ/4vK7mntKQntBSxbPSsvWDPA9inVCjIZU
         VLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774439065; x=1775043865;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xUNk5DBarhia0VP1Ved6SPUtX2O9K1Wf39PDjoKefxc=;
        b=AEdxHpiEbSfLaX3B8omy2PzCk+QkTLS7sgb9z8RdLtj1ZeZPvV2AO+IZJV89O7z/Jz
         JMX1X4Ktahc4tq5Dg7E3g94EwSxMnitYHxKl41MCpT0KLbCOhzxot3MCby9uSss1Imb4
         u+c/PpyQJVL2LSdMrjhM9cgOOZafPGhJfOx2A9DPhZ535Ax9VXZY7PmcvMPhmzPCXCQ7
         4yGF1tijrYL81w5ylDtuqACJsF1h7g6xYnQ1SfJjXighNb9yrCOrlbkqPcnIEhn7QnjB
         OgehYkg4plqFmXpE850/odfCf3plAryx3ZMUKR69YtHaE7QcToqFalX+374BXz7Un9BJ
         UU7w==
X-Forwarded-Encrypted: i=1; AJvYcCWH9f5n30FhJfi9Y/jQN+VpAtjaWpG8vbv3k569ewB31xOdeYaPHW6IWH1JzIwIWqoUUXmDt85UyefDUOcq2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyE6tEycIPmRUnUx2Ua27LQ4bsSSuH9NDdbN3auF3Ep0t9/ThFS
	otH9f5s+fnO/MPplwoUm5unjdN9V4HMkrK6JSG5zpWx4T3V24Ue9UF0DF6NIsvNIX02trIx9V+G
	IpHalEM5sd4WQnqSSCQ==
X-Received: from edgg21.prod.google.com ([2002:a05:6402:1ed5:b0:668:8a5e:6647])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2116:b0:667:7fcb:3a2c with SMTP id 4fb4d7f45d1cf-66a826b30b2mr2152133a12.24.1774439064945;
 Wed, 25 Mar 2026 04:44:24 -0700 (PDT)
Date: Wed, 25 Mar 2026 11:44:23 +0000
In-Reply-To: <20260325003921.3420-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260325003921.3420-1-dakr@kernel.org>
Message-ID: <acPKl5HXwd6e4Sl2@google.com>
Subject: Re: [PATCH 1/3] rust: uaccess: generalize write_dma() to accept any Coherent<T>
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, abdiel.janulgue@gmail.com, 
	daniel.almeida@collabora.com, robin.murphy@arm.com, a.hindborg@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu, 
	ttabi@nvidia.com, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Mar 25, 2026 at 01:39:15AM +0100, Danilo Krummrich wrote:
> Generalize write_dma() from &Coherent<[u8]> to &Coherent<T> where
> T: KnownSize + AsBytes + ?Sized. The function body only uses as_ptr()
> and size(), which work for any such T, so there is no reason to
> restrict it to byte slices.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
