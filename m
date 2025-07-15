Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AC3275118
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 09:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752572564; cv=none; b=oqxYde0hcJxQX6I+xqQ3f1lm1kzilqzKxQfQ86XYEyDvVybkTuuzlk63sQzXVPfz7o0AIGI11pVbNiseAp+7VG5wOAtKeK33qgtgmOUs/pWO3RRYxejBTKKvg2QzcHUrCMYlsRz+b9fGPQUxJP87NCzXg7oo35MfLufVg0AaHnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752572564; c=relaxed/simple;
	bh=dlkAnhJaomQ2T0SdHCSA3+Gcau2eH1xErMq2ETxSbNs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ktx2Bnvz0Fud3sXl2njYk4RuGCkOjGdnjPcN9l5fsBjzSCQFf8mtPPvR6PCGMvMFA9jQFo8YxhGERENMHAC5E/M/7wOYmCqhmgXIN7BVaOcJr8Q8cnSQqBx7Zx4pbwuOcrBPHOegglZ2dsj7jFvUOpKW3VkPh8b1A48Gaa5niyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rgYWSuiJ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rgYWSuiJ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-451d3f03b74so30224045e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 02:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752572557; x=1753177357; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2KuGHyRPDvml4ocX1AZOTeZ8x+ILcOo5ktYP0sgC0Tc=;
        b=rgYWSuiJIaPFDfamKUEb1nfkMOcjLitlIH4WC4ejbYAO6qFhxIF+JQaqv69pXlXH11
         S7n/IDAgjkFaS3e3u5irp6YE29aX6/OVplC0S3d+VQkiwc3ycu11/1PjmjnDmtnTzbL2
         teGi7LDLDD+k/I415Sc/WNzupFHwzX/Rs2aqDsKF/B2AgQ0d6A77oidZn2WpTwEJZcBs
         Y4gbNj1OUrPVnLJ7cx/0zFWVRP+6R7jMpAyADKzYrzRHmzEikA1jGp6r+ES4MwV9Xj2p
         WlstSIcTHVbujAe1x/8fAJYGghm30+Zvnn7qZoSdLfjFPgpJK9JuSCSquo/n68GVisIf
         hdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752572558; x=1753177358;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2KuGHyRPDvml4ocX1AZOTeZ8x+ILcOo5ktYP0sgC0Tc=;
        b=nEHD/625ah8OyqUzLl4Ty8+eMhzKZwlQEZ6JqWv7JfyC0jSlgk0FDvaRAyXMQ00OEi
         t6Yn6lzGUHTflTbmRwH6HCurZvgE4LmS7bq9SB3XV6wMStyua9WorEsQI8r5YzK6I+29
         cDNzX6BNjNBjCeXX8Nw/RrfOTVJ03ZmhfRoKTGjRCKCeoZoyOtLobs1kv/wNP88LjOZG
         RW5quo+N1X7YJguBcLOZNVBSz0Sg5qgyOuKx4/KcdG2oAzRnXjpg0ScqW5V7pVAwenOW
         HxIdimgFLm0Z2+x/EODm5SSbGMDz5bJg4HVm5ORnSJKR9GVtJzV4L0zlkWLMAltnU+eI
         nnyg==
X-Forwarded-Encrypted: i=1; AJvYcCXuuWv3BX8Faj3h9FQRExKwjsuGIPve+mPOkIyGCsYD5JK0jM+YYA5hbwtqzVythgjwIKy8P3fPk5Naxofj2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfuUDcw7BrRAmMCtyDzf2pO1Rp3m/2PIjhoa0b/G8vN29P1qvs
	QHwLwwfwUFp1cpkc2c3s3saN9tj3PtK9wNJT1SFgNgHIYFZ3/ei1DlNx75sYfCTEWAaPZE4XS/r
	XY2T9yOQQ+IOB8hl53Q==
X-Google-Smtp-Source: AGHT+IHvE4UCK7PBe4CViNkIN5aZzxDl2kn27mYrFfsP21JL2dmQdQ6OGNbYYURJGhutkI27jESTUTpKnrenyiU=
X-Received: from wmqe20.prod.google.com ([2002:a05:600c:4e54:b0:456:43c:dcc3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e12:b0:456:21d2:c6f7 with SMTP id 5b1f17b1804b1-45621d2ca13mr44779585e9.23.1752572557800;
 Tue, 15 Jul 2025 02:42:37 -0700 (PDT)
Date: Tue, 15 Jul 2025 09:42:36 +0000
In-Reply-To: <20250711-rnull-up-v6-16-v3-8-3a262b4e2921@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250711-rnull-up-v6-16-v3-0-3a262b4e2921@kernel.org> <20250711-rnull-up-v6-16-v3-8-3a262b4e2921@kernel.org>
Message-ID: <aHYijICX_xuF-Mb0@google.com>
Subject: Re: [PATCH v3 08/16] rust: block: remove `RawWriter`
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 11, 2025 at 01:43:09PM +0200, Andreas Hindborg wrote:
> `RawWriter` is now dead code, so remove it.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Could be squashed into previous commit IMO, but no big deal.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
