Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F322E1758
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 14:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929380; cv=none; b=q+g+4E0eszLmImS1eSDGCCEpOv96jckl72HAQDMbyCk+fmEpo9K6TgLqC5cPP08XAiRzoQ5KSjby2XM6Au47qglz3rvmw0NftLdfMnJkaXPPMtupoTIQwGsXmr9zi2tcchUAkuLUDCfwFxQZo38QCJhiIFB4rUpj6TVlExZNaB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929380; c=relaxed/simple;
	bh=mON6NzajXOOuoYrbmV1J/qBmMLZ+cbFhJqAPelVGChE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hKVRMDcP/xMMJOOo+iy65QmKVTYsHEH7HtGKURzlQYE9GaU5C0Ny7G1Iw3I1ABoX56agASGGxQXqsZ9dVBbmSR+WIOkPsSGEMf8plaKMzsL1iHKGmwhWMG/nupQkEVBflTmy+LDYs+iY9dkeThMCWVFA7j1K6k6DlDv7UI9d4+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ExqClqhZ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ExqClqhZ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48535f4d5e1so9779265e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 07:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773929378; x=1774534178; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kP2B356wOLQghCYXzjGgmv+A4RpAJV5Az5JCF/MyL7c=;
        b=ExqClqhZYVi0ofHPTVW9V9akyXhczhqhyDSTSI0PayvCv7U4WXRkVYUHvzdckasABv
         gJ6K9fQRlgD27J8EHdwKOKV/HhhFleSDJLJe1/2Sqc52Cre6968VcDoiVXjn6fu5bysa
         Wo82KS6DRDC5xMnmqqrxzurgm9b0eKfwSkSFIWJDqRwNY6L06U7rFg8O788vdGVEnKgo
         3VjU9+I9kdeGZaQEcW/ueC5uPkyLn54atk9GH/9AXog3TEz5AiicheLmvbxG8uWTASGi
         BVRAUEklx6/3uSqI3KhEMDlIQn4W2diXrOHDZA1mwTQHHpZK0Yx5FLxvgVlPucC8Jtcl
         X9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773929378; x=1774534178;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kP2B356wOLQghCYXzjGgmv+A4RpAJV5Az5JCF/MyL7c=;
        b=Bc6ybOTBylFhobpWWrp3/T7vYkZRrwfMghlAxd6VtOg2tAr/SB1j01WbI7d7ANd31S
         eTKNU+gwrJ1DHul6xjEE95dJNG7gTn9JVvEFAjJiq+wLo3eVo2RmJoUWQqryOzUA85yJ
         FEHeBazTWfPFPSrR935Bu5ZleDwHy8RInyvrz7T+j5Knb6cNBKkO7lgq7atC9O+aqQl0
         B9esjV/NRQBRpVQSfEESKCwBcAwyOHelAYnBTejJF0G50/5uZyNx4NtFH3X5oh/asJPT
         SszbEN9jXz71B6YMOyWB7rCe9vOFm+jTUWucQ+W7N0DcBFlZwJFnZX/G6hx4j5rYkFbj
         2qCg==
X-Forwarded-Encrypted: i=1; AJvYcCVWmSztj8anEBkJh98Ia2HnVRFQRyJFGgkTguM+cYjK4ujroSpPcBs704pQ/OCBsJ3r0s4mJ3ThBF9yH7JroA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjSXVwYuwoMO+lVJWiuFbWnkIVTyaf9z4LEs/vdcFCalqObvsG
	emHy6f+V9G8JVx1aL6wO1w88CjqdkzmqKNrXMhWbHWf9eozKomyeSF3srVumqijdDlEoAT8sXNa
	HPBaE9hDRK49UiwV7vg==
X-Received: from wmoo17.prod.google.com ([2002:a05:600d:111:b0:485:4ce0:d98f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3111:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-486f44435bdmr125626755e9.20.1773929377395;
 Thu, 19 Mar 2026 07:09:37 -0700 (PDT)
Date: Thu, 19 Mar 2026 14:09:32 +0000
In-Reply-To: <20260319121653.2975748-2-gary@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260319121653.2975748-1-gary@kernel.org> <20260319121653.2975748-2-gary@kernel.org>
Message-ID: <abwDnC2an5lkF8zT@google.com>
Subject: Re: [PATCH v3 1/4] rust: move `static_assert` into `build_assert`
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Yury Norov <ynorov@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Mar 19, 2026 at 12:16:45PM +0000, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> Conceptually, `static_assert` is also a build-time assertion that occurs
> earlier in the pipeline. Consolidate the implementation so that we can use
> this as the canonical place to add more useful build-time assertions.
> 
> Reviewed-by: Yury Norov <ynorov@nvidia.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
