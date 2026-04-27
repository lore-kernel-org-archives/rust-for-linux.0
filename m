Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A3836B061
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 07:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777275827; cv=none; b=g+4McQpv+5bpx6eVWhEkQu1e15OW2+pU1uXaovKCGF29/PAWyArHBPhlcQ+HUII1e7kA/WQZOTgRcXZdLpVF0fYx8iR3E+COnACkOFYbFlO+5/qKfVrAgZiFin4AfTlqWKHfgtzlSfWW9aTNArxxDGtO0uM2zyQAVIpcft2Si8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777275827; c=relaxed/simple;
	bh=FrIZu2R1KDrbgHqzV82kms2t/+/LtuQRXNfEiYRT6S0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U67ArVGg91GIn67g4B/f148K6yAhrrbImOD20gQhPMnbR/HrYBIdcw0/4mUHEmtZ2qslrnsYoXmyZSI47TfL1ZeMjhe/jonJdaUqkRDPunTr4rF8A9Z7+Bs45skPj37QlLYF8XO8Cy7/CieTX2I8DzSWayVO2wvVGM7n/CgjzmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JihA3WW2; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JihA3WW2"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-488c2a4e257so74443815e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 00:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777275824; x=1777880624; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4b7VOyMdZQukSg5b3dCqDlxQJhNiVZbNyWvcteXyu/4=;
        b=JihA3WW2nijtr+2UTdTnrs3mcXou46izXwIEEv/UdLH7tq2kpwvw2XjB510LIASHL4
         UoynqdUvu8dD5Y9rW8OKaWzLnE+hrTf1NiHcO14r1rO1cpHoWotDc5q1zc5IgBrFDznf
         NIJY6ZNIa/eKW4sPCpjtXcXP2kQ9h7NTzkwPlW04nPlAZNjEWFiGPiuTh3YCqoSpXrre
         fDCrag/jQg3BPCVImfLiM+IdeprUYAdJROvAB+wy8A3TQxU/mKFdtGTU4yftkgevOxew
         DKpcYX89VZ7/JeXpE5VViSOMitWqWxbio31wL3pENhL+aC56D7frbWTKyw1Fj++ThzV6
         KUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777275824; x=1777880624;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4b7VOyMdZQukSg5b3dCqDlxQJhNiVZbNyWvcteXyu/4=;
        b=RH6UQoFikoNrO52dR3PboOf8OFQEXAhdLQ8zptGNkyT1770wNuIUEMVKdmdwEVCyS6
         tJ4tlTr3ecU5r44jGQ1RSD6qLC0DD9q0FhRZoZCFazC2Kq+DycNF1qjqYBpjjutGVCTw
         FHT5X0eeyUECiwKLSKBPOh+2NM7Sz03pcgIdZwZPhHn8rzTGrPtvQDdX2QHuS0fC6O+G
         nTDSIqCMMsyFhKC8lhzHZTGNlBVzvMkx+j2UxvLm1kSb2N9Bw/GEuPDzKXsEgpUMMp6g
         3Yh8Vdyyhx4leF+Ch7e9EI8f99WMVq/Kl4zlIMPNjuEmA8AwmIMNQfyWFVh5yJlpOywe
         SD8w==
X-Forwarded-Encrypted: i=1; AFNElJ8l5+IR0016N6RatNIJAgjmBmsVsvUZKRo339m7mDgwazgoJtC30nPPS8qtjDADT0f95JmKAKAsxk0UuehXTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9OAKA9ASlijHLZ1syju/F2siJe8K+JDqEgou6bWd1DYAHVvQs
	WyPOIafkGpBSPGZPt8xbcY9bzgwlE/6/kifaHK5DTHxhuhIGnc82ggA4H/a9ISfLOj/JdXSiKC7
	M0xyhUEFB3ILW80egtQ==
X-Received: from wmf23.prod.google.com ([2002:a05:600c:2297:b0:489:1f67:5a75])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8592:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-488fb779acbmr422779885e9.15.1777275824524;
 Mon, 27 Apr 2026 00:43:44 -0700 (PDT)
Date: Mon, 27 Apr 2026 07:43:42 +0000
In-Reply-To: <20260423-pin-init-fix-v2-1-ee3081093a0e@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260423-pin-init-fix-v2-0-ee3081093a0e@garyguo.net> <20260423-pin-init-fix-v2-1-ee3081093a0e@garyguo.net>
Message-ID: <ae8Trmjs8Ke5wp-g@google.com>
Subject: Re: [PATCH v2 1/2] rust: pin-init: internal: move alignment check to `make_field_check`
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Apr 23, 2026 at 03:51:49PM +0100, Gary Guo wrote:
> Instead of having the reference creation serving dual-purpose as both for
> let bindings and alignment check, detangle them so that the alignment check
> is done explicitly in `make_field_check`. This is more robust again
> refactors that may change the way let bindings are created.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
