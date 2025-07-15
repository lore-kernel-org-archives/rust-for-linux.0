Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08852D6414
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 09:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752572200; cv=none; b=Dz8HuIuikojac8uHjPRnfoMhMnaxy547B+Sw7F4vZ6dE2XvMGufQ4N4zQr+k3NqhTdy5WcOpIJDqcRThiBDbgdCLTNu+WcXNJ3t272wML1unTxh085kODCcJxMOjUQHdLVHeKY1ynwA90+WAWbe4DwrwSS79D4AmPlrcwHxqo0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752572200; c=relaxed/simple;
	bh=6YjjE8yx41JhSq70YIv6cyZNts1+4fdz63Q2WWL3ucc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kU08RPyIWUnNy2Vn5kO+6pSw1bX8lbY6OfkirxA4ExfbcMiZn5wRpBm+n4+zMQ7G+rnz4cVNj7H2uhEuyK5LYm3N3VDO4VPn5reVdUugAD4s4e6qPgjY33YRpTlkv6iWabDWEL4MmufRcQGwUNHluBn3dYYgZO4GaxX7KAlMaEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=okZlV1Ko; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="okZlV1Ko"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45597cc95d5so20449685e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 02:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752572197; x=1753176997; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6QNqFlrYFx7H7vRElEzA/t1Mf3ypg7FEvJ57Y0jYqXU=;
        b=okZlV1Koon7gs3CDUDBV/joWRKHg9EbfZhyxBDSrHpqkUUXYvfIgg6fRZkmYfXPIOw
         fZ3WWU4EbjFO2vmB/gZbIvZs+ORsZJCQ25Y8RI01p8vpxV8CvMDDezD4sIKTWbadf9Wj
         bcqzePPyy4M4gmtAZSYVvz8/o2mAokg15h8pzVlmlno4N2miAF5livnsoP+tOsnywGsi
         4Vfi/qia8eHHrV1Ue6U6VvuIIp14VJZJi+U0/BWBlHQ2Wu8NrBm7cPvPTQHQqjg9i3jm
         IKo93AFMCyuS2Nlpt/S3TM2ulP+NmCG61P46jIL3evTvqhxTwiqgkeRqUftZZOm/3cyX
         Kwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752572197; x=1753176997;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6QNqFlrYFx7H7vRElEzA/t1Mf3ypg7FEvJ57Y0jYqXU=;
        b=JuYR/hP4ACs8XnMjGM31Y/q6VtwPf4zQAHrTlCWbIOsVtA2eiRd40wsxAqyPxNd3vg
         zf+W219yACxp7CfV5y9//x2Z4H7fZ8wHKTmmRuJ01/j3snBLQbAVez6qHPtPweYesGBB
         vXG/iS3Tgr+QO7Y95YWd332cbsNtQEnyQC46eguIIT5RVCdhFX/4UDDc4nXBk1o/iiVb
         rUZ31jUOD4Q4XoLy0J6BvlGI9Ok6pbD/LZzdZYF53u2xNp1td5Bl6J5+77s1pqIMYKPw
         M5ro/55xpMed92WKCRLb7ShtjyRf8staU4gX4w11fK9T5Paaj9VyPxAvy95YYYYEfBw+
         zwYA==
X-Forwarded-Encrypted: i=1; AJvYcCVmQYUaRgXBo9FKWlDafgj9Z52N6aFwqDlO1q/oieUGjpKmf0jFOTy5k54NXbPVNfbb973ht++T3j5ZH0DtvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtagaKiQoxtirnSZ0/s1FxfmlcmVB6OQVqXn0Pyz8pcNXF+ccP
	TgyCH3dnIvQaTiKIUbtpw6GbtNmPQidNV088TSpr5hES6Eq6JUw2pW5yD7c8viOX8kxCUIYpOCC
	7kb1odCNgRABk5h/bug==
X-Google-Smtp-Source: AGHT+IGqJXffDogg6Dsm86tBp/jS/D5fTXsBjiiYFtlOS+ceWATnmyZQRVUfbJDoWd4/GCP6yGnIn++VGO2RGeY=
X-Received: from wmsp16.prod.google.com ([2002:a05:600c:1d90:b0:456:2272:8b38])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19c6:b0:456:19be:5e8 with SMTP id 5b1f17b1804b1-45619be0d77mr58477665e9.20.1752572197327;
 Tue, 15 Jul 2025 02:36:37 -0700 (PDT)
Date: Tue, 15 Jul 2025 09:36:36 +0000
In-Reply-To: <20250711-rnull-up-v6-16-v3-4-3a262b4e2921@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250711-rnull-up-v6-16-v3-0-3a262b4e2921@kernel.org> <20250711-rnull-up-v6-16-v3-4-3a262b4e2921@kernel.org>
Message-ID: <aHYhJBHUoWq46kKW@google.com>
Subject: Re: [PATCH v3 04/16] rust: str: make `RawFormatter::bytes_written` public.
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 11, 2025 at 01:43:05PM +0200, Andreas Hindborg wrote:
> rnull is going to make use of `kernel::str::RawFormatter::bytes_written`,
> so make the visibility public.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Making methods public can be part of making the type itself public. I
don't think a separate patch is needed.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
