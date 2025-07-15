Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812B32D663D
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 09:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752572098; cv=none; b=rcnlxxWN6eTxUAuUOYXzVDFopPMB1TwSya29ja5Z0ybuRLEIADeCqbNpaUkkYglpRui/13fAPdGXdZHRZ9MPw0VlDeXp1D8Hu6tb/SPctlrfyhHsjqnRJlxJY7M5rBeNzrWt44QxkXQIfSgh4rhK7oNeUepyOACuc0yzpRdKlW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752572098; c=relaxed/simple;
	bh=SW8g2sGzj8cOGWOFPcNcOjWxh1xRALfpblwtuQfW44w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DKjqYJzBti7qKscrirRg6HKYANLk3iwZvs2znTVCDsbJOdZnhcOCNg6BepOTe3tcY7F8/308mLrIGTuIK5lQO3AgCBJFwD+VdlzfLSvEsobDHVJdjayHPEPv+rjAR7nrOD9wLqRaWZF8j341Cw3tbWA+sCbeUMhiEDbwcUksssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eCCmsqYU; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eCCmsqYU"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45526e19f43so14164885e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 02:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752572095; x=1753176895; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=l8yUNfVz2yZkexOKK7SEe5mo3/8fTwZuFskFLzVIPqc=;
        b=eCCmsqYUqt4ZYJ/+b56w72eJU1V48L0rmx8d7Ez5A8en+WKqr/WE00Eao+nn9FVM72
         w6pFcY6r09Wao/VTS32P/0pLsy3EKayqcz1KFjYzimDZlvB2HI8uksSxZXy/I1NlmY8j
         Ljvs1zQK00jhVPbJeMcbHqMM+BYkOtIig4UVCzCVA3R8hVI7pzw57pGafju2ApCw5O9v
         DvIiXm1BafCJegfrboMYZRY5NlYDGzpWLiBsUTVZGrqiYVATV+MPXzZxCWwBUUtFNXDf
         rQOUmDfazugKU3Z0/cL1EJnAwvzkEHYuyGCjvbcfilxayFLNecTfWcVxG1n/7XQiUWfs
         rbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752572095; x=1753176895;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l8yUNfVz2yZkexOKK7SEe5mo3/8fTwZuFskFLzVIPqc=;
        b=AFU1EmJlFFIGLsCjhYp1p5sxgEDlxNmnrqGOC2V9qccOymOvZ52eaq4HRAdo86Qq3R
         BdHothq4QFFzuqQiH+6EBqBiRAMKCd7sQvqHls/V0UWeWfox1fX6V+nvqPG2WC3xzprG
         J4x9IHi1GpZIz48s67ws66q+DdVl1+DaJYewfZwM1G3uGozcBkM2hEZQu1KpVlkO4p6b
         DpOEyIHG/v2EDZxoL+2HCbXO924boXuwSNHQrNr6Hsfp4PYzp/H1BKovZC1dglmJppev
         3/Li4rqzH9rLe9xUMXUMZG90jWSO0jWMSCTj5Bit11PWtuc0BPVId1jR3n/OpK7l0H/q
         Vc1w==
X-Forwarded-Encrypted: i=1; AJvYcCUNzI6MA4Jrg7E43/mH4Bn/xSgTz61n0aKiEJXIbmcTXM8kyzj4+MgBNJuxhce90EGc4gHHb/PyurT9Urxx9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuJxgATyGggMYR2f5/kxoXpq0EzF98Z1XQHEW0WrL1QFA02N0v
	WaXRkGxxYuCuIBZ3rIt3+xmoTDPTygwYORHeqKiPW02BHNLlKCSBqoSCD0ztO9ad7YrylhtsuWK
	4aUdkwrihMYevsvB0MA==
X-Google-Smtp-Source: AGHT+IG5JFdwYFqwZe2nCzfhShGuYrv1qI/g5T/gPRHpEuD7yOmiP4fFJ4+Bp8QT6JxHaKdpkkFLe5FdFIrw2eo=
X-Received: from wmbes26.prod.google.com ([2002:a05:600c:811a:b0:456:217f:2625])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b25:b0:456:18cf:66b5 with SMTP id 5b1f17b1804b1-45618cf6c49mr61966405e9.22.1752572095033;
 Tue, 15 Jul 2025 02:34:55 -0700 (PDT)
Date: Tue, 15 Jul 2025 09:34:53 +0000
In-Reply-To: <20250711-rnull-up-v6-16-v3-2-3a262b4e2921@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250711-rnull-up-v6-16-v3-0-3a262b4e2921@kernel.org> <20250711-rnull-up-v6-16-v3-2-3a262b4e2921@kernel.org>
Message-ID: <aHYgvZ0DEsF93zC9@google.com>
Subject: Re: [PATCH v3 02/16] rust: str: allow `str::Formatter` to format into
 `&mut [u8]`.
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 11, 2025 at 01:43:03PM +0200, Andreas Hindborg wrote:
> Improve `Formatter` so that it can write to an array or slice buffer.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +    #[expect(dead_code)]

This could just be a public type to avoid this.

