Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489F932F748
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 12:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784204837; cv=none; b=ZobGAPauTlg8wKT1aQ4cbBF98A5mUUv1KHe1H9tLjYi0f0+WxFCIMXfM/YkN+fueA1Pl9KSmoKYvV2zOfPxcNJ7fvbDKSOAe9Q/5EFUDEYIrMFLSbpsiAVhhF7bwa/vL+NR0INynQoxiJJAGCh0gd1nTGy1G8qoDJW2TmujbRRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784204837; c=relaxed/simple;
	bh=7O4/0OSbH1Y/zp8zjFS4jShqd78HQDhbVFMaaX5tl9g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=t+NVxdbHHL0DpQORd8PHb8wzVg6Dk9xMk5p37Z3r0aywpUqnhFjw3Xryq0fBobomK4c8CbLlH8To1h4Bfee0CJKh2xzCmzSpdyVG234W1YdeVIQnA1lHmx5XXEVMjOLy64jfEnOY0QkPRA9Vw4o5f/R06bxq2SR7irwk80NR/J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GTkdt2m5; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GTkdt2m5"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-47485fde05aso3849665f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 05:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784204834; x=1784809634; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vU+uWDxGjhxeFCEyixor39X4wa2P2p9cpoSP2aSeuPA=;
        b=GTkdt2m5hJIaeoyLuhwGuHGnWGtSWDgZVwC4Jwc+7GavmIDIlXk5+eBeGOozixn8M9
         bvrMQcWybuC+TIGlzpUj4QtUGL2knk9dWqTRtsZTThItoXCHLgj7LOiB7aD6mp74oyKK
         LzvKvETPl7bQQlTl2W2lM6F9lo1ok/yqYTrX1uNTSbbIDs0hQilNXFCfSsmfcQtqoKP/
         Z5ma5H+9kNGiHePUSIMZqkNa7AIgoDl0CcTCntK5kOS7GDvlY3cXVcooJf8MkAaQ0/L+
         ga0d9OOWIqs/PUZPfeVJPl287piI38dZuGauuV1dWbgPrwB5nBq2mwS8nGP0bcovrXod
         dRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784204834; x=1784809634;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vU+uWDxGjhxeFCEyixor39X4wa2P2p9cpoSP2aSeuPA=;
        b=JvHLn/wZVSpBV1CceQJz3PjKSSWoiyut4ao4ldwlemXcftKQfbLIGUnLkyZiUix04a
         6T1K0XiL3IdZSjN96H7sSxbAkcbECkrwunCF/HJg4vdoeM7n5kRpCGTn3zXKb67VoqqP
         gOUPUJdi2b2uEfQqTbVxKiil1csECU7YVvJjSi/kqPqOpITAIF1wyrUa7t2+scGeJRtH
         Q4TYOaM77BUv/ClBf2bmzDF1YhPTnR5aO7D/fEq9MAKDEXg6y+aAkW+FiLy1Kgq7VCOv
         5sTgby/9g+POx61sEHccj0v/Qkaqbv+OKYpzr5XKHKUZaBSKnW2tE9Jd/e4BroLfz9Rw
         pA0g==
X-Forwarded-Encrypted: i=1; AHgh+RqzCXomkrc8j3ps0nxRhtJ/wFlXIWhjNVBrBorVHaJ1ePf3PNqKnwxk3SWrsVgbMmB9YkInSWkhuIwIqI1Rzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWqnzkSXTR369jxH3lP6G4Hwpd9qIdmmh1moGWGFm+iJkOqoH/
	UnWkZNQM/gmvezYP+crJ88KckdwXla5TGdU2ZLGeuNezszn2B7e6DTs0eFbStFnBIe89g5L+UUg
	M1xFcTGnxM5m16dQS3A==
X-Received: from wrrw12.prod.google.com ([2002:adf:f9cc:0:b0:47f:2bb3:93cf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2483:b0:47d:ecaa:3f97 with SMTP id ffacd0b85a97d-47f4fce6c1emr9350637f8f.45.1784204834069;
 Thu, 16 Jul 2026 05:27:14 -0700 (PDT)
Date: Thu, 16 Jul 2026 12:27:12 +0000
In-Reply-To: <20260716-defer-complete-v1-1-ce0e38d30dc6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260716-defer-complete-v1-1-ce0e38d30dc6@google.com>
Message-ID: <aljOIDTJ3lNaNHIm@google.com>
Subject: Re: [PATCH] rust_binder: add TF_DEFER_COMPLETE flag for avoiding
 userspace roundtrip
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Todd Kjos <tkjos@android.com>, 
	Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Jul 16, 2026 at 11:20:56AM +0000, Alice Ryhl wrote:
> +            {
> +                // This performs a deferred push so that `read` can wait for the next incoming
> +                // transaction without a userspace roundtrip.
> +                let mut inner = self.inner.lock();
> +                inner.push_work_deferred(completion);
> +                // However, if `TF_DEFER_COMPLETE` is not set, then set `process_work_list` to make
> +                // the push non-deferred. This forces a userspace roundtrip.
> +                inner.process_work_list |= info.flags & TF_DEFER_COMPLETE == 0;
> +            }

Sashiko makes a good point that we must be a bit more careful here. If
we find that that the thread-local queue only contains the deferred
completion, but that the process-global queue is non-empty, we must
still deliver the deferred completion first before taking anything from
the process-global queue.

Alice
