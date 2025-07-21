Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F3B28BA9A
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 14:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753109724; cv=none; b=HJWsN9UD+H4ERE0lvbjpUL4pxbJjkd8XS8H+M/13PUyzp5ot42LYWZQzus/xqq4rwQ5vSWoirtdu4okC0lwvGK/dDiNvVFUp2UGIPFbqWn7p87Rp0bTgIjHOr4DaRmBTtpUKlTViwkhB/KtccNRWNTKj8neuHM5pXnlKK8KLeLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753109724; c=relaxed/simple;
	bh=ZgtVnJcOsoI+erHAB0O3e7e4PXz+r450oj9/Ov5DhpE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Y2B2UlJJHaBDNRHcEU+BarxLqhs/ZsYIdbHP7y2QbpeVBKhg/oeq9lZlxnyr87m3ykSfXv+0o1D0qqXZPYlqqhP/3NWFj9NbGPibxiHtrVURbnlf6oxLmcUnung7UZCLVCy9FaZ8Kqd1uYJ7bP4vXboM4Zrip2he8tKEZqNyaJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FSRFidng; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FSRFidng"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4561c67daebso16383195e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 07:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753109721; x=1753714521; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nIkm8zbvd3d5B5IB10UU8koluangNArwbTcD9iZkkEg=;
        b=FSRFidngDmIxSrlfMvvVTLfHlqBoladHwb+AbJK10FL1DOWbQ2tXdg1hrJo0fyuQCX
         oFglg5dxH3hGSfYRt0ZxeJWqUFKNoECXw6QSXwZwxxVQjbmRfeySKh8Z6hUVDftrPtD9
         fD9xQYiohowmMo6+3SuKBG0xIhWbuvA02m/Hqd3itAoq253i/3boOjJ1nLEXKoPB5d5S
         hshJfTcK0rUqMFXXy8OFIHvHtQ8U9iIuQtmkx+uyvhe35bh/lrMrtwIJGKnT8u+b0soy
         Xmp59tVDa4Son01DqOolaqhYXN42ut73SUD76Q7eA+Yyml2aAUhUmD88CdukWqKRfv9i
         CA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753109721; x=1753714521;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nIkm8zbvd3d5B5IB10UU8koluangNArwbTcD9iZkkEg=;
        b=tt/dR209dKathPrjXC0lg+XlkVjZ1sF75VRse2vrJUtCTMGsZ2/1frXwkMqEYaCygf
         T5NvroYCaelpsyvaWLd7ANv7gNPpYRXRzKNZUZhl/5sQdHeEc4eP460BBIIwWWUbWbPA
         L06bgZN410k8oC8G60ycEF9AEdLSsS69o5eAbDGpTCmmcc6XEQJU9fIeF7QklFOYSPtx
         BKCP9agd+fQkpydfhBTssgU8ZU8m6k70X8kUfj+iHDfTWBaZiY6JVEFA206mhEroide3
         6xvDoj/mkYyfAygj8V3IqNNq7vF96gpMBb1248oSLtRW1UI6gwg1UAlvD/grFnpAaF7B
         XROA==
X-Forwarded-Encrypted: i=1; AJvYcCXh9Yudw0FDDknTwl6ik+wxC8fbyuR1ZOzAJlNqTluusvw4yA8dzhSBcuajA/VldBYT7ynpxhTF/x9T7cSS7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3XIhpsEpD5D6d8VK+YMgOV5LMnVOPNQ16os2v/otD8dQwp2PH
	b1/yuYJYJKQKL5G7Jr+vnf4ybct6p6OnpaH2K1BF1j6DZ/acFkLFPiyKRBLl4Xa09f+socKz4gV
	a7js6E7Hsf+Hv51vEHg==
X-Google-Smtp-Source: AGHT+IEfUvqsUXX7mjN3ADzeqqjN+nnoq4umTFLEEX0oJHAoh0DUDSSefRyYrhyKMQYxAIrsPeFXqc82yi2VXIs=
X-Received: from wmcq26.prod.google.com ([2002:a05:600c:c11a:b0:456:293d:55c5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c285:b0:456:1122:8342 with SMTP id 5b1f17b1804b1-4563a51150emr80477435e9.5.1753109721212;
 Mon, 21 Jul 2025 07:55:21 -0700 (PDT)
Date: Mon, 21 Jul 2025 14:55:20 +0000
In-Reply-To: <20250626162313.2755584-1-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250626162313.2755584-1-beata.michalska@arm.com>
Message-ID: <aH5U2Jm6Jpf5LyB9@google.com>
Subject: Re: [PATCH v5] rust: drm: Drop the use of Opaque for ioctl arguments
From: Alice Ryhl <aliceryhl@google.com>
To: Beata Michalska <beata.michalska@arm.com>, Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, daniel.almeida@collabora.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	alyssa@rosenzweig.io, lyude@redhat.com, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Thu, Jun 26, 2025 at 06:23:13PM +0200, Beata Michalska wrote:
> With the Opaque<T>, the expectations are that Rust should not
> make any assumptions on the layout or invariants of the wrapped
> C types. That runs rather counter to ioctl arguments, which must
> adhere to certain data-layout constraints. By using Opaque<T>,
> ioctl handlers are forced to use unsafe code where none is actually
> needed. This adds needless complexity and maintenance overhead,
> brining no safety benefits.
> Drop the use of Opaque for ioctl arguments as that is not the best
> fit here.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

I'm guessing this should go through the DRM tree?

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
