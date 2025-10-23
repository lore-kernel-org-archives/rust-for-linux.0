Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E152FE048
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 08:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761207805; cv=none; b=hKz1wM/ZR+jhuObKA7eGdlP7efCqVOGz44/OcA+c6xaX6AF8dkwpp9OSZCPAVSGNSO9mnA64JTB4csHdbk8OMAm/AcIkiAdzVBnXpt217WoInVgk/hXHpKYkjLf3CTknKcv13tkXOXlVXFLmumA21Xo4zIPSDNIRgqPNBezHXY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761207805; c=relaxed/simple;
	bh=GZ2o/nJlsEOzs00Oa82WFjuaDZobMx/ouP1Wbql+PLo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MO2XJAkbSLh6cFvJQaIFVfoM6hO7lADv5dFqU7DTW5ExF1sqqKcaTbpNnw/plfWXpSTidwWRIJMECGzwROgda/urxCusYrsGpI7hRstM078+/ZNlX/U6CrPyf6AEdSOH6UszoTI2QuXooMosMXbI1jeGOkVatEqBSO066QIcSGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GhpUltlx; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GhpUltlx"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4710c04a403so4298515e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 01:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761207801; x=1761812601; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QpqWsbe7X8TE4MbamMdrMlILOwJyeV2HZGxH0RxJ4HU=;
        b=GhpUltlxb7pXO7xYnzD2qz1vBVpmNmwv/qPEqqVA5snlYpxMksSkOIwpsEwUiWxLiW
         Y6ryfxWnV7R9h/x2jXwpTkHzeimlb6pztsOLm61EhOhbFI81pNmmRfBzrYcV+UZyeGoR
         Xkcsxa97YzGiykhiDUk4iMzSaFv8sayVUBB48pE7DJs1g8J77oPv6z+LtVCWMj7tTC0A
         HI/4u7TGKCfEb8EY5x4RJfsU6eHGH8KrdEfIQ685Ap4au4wkg6rNt/enGnYhuA/OYmES
         gXxalzKaOcqQJAVIbVFB37ONZk3xFfi3qEwf24vsV1y/8y74Y6Wyp6fAGa97plN6VaJc
         WOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761207801; x=1761812601;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QpqWsbe7X8TE4MbamMdrMlILOwJyeV2HZGxH0RxJ4HU=;
        b=DoVRakZ1xzv85UaiDlzF6S9mVKb+OFHtEsLjqxdksbm1CQuNmDNO46R0/EX0C4o9lk
         buOXfvodA3DZDrpuTeSWnYDLW8mKF7slP0fqI5b06P3l7qJs/s2mIioOzdJFWmcj+Y/H
         i2dApwYLllVZ0lJg5Ye9Blce4UPNY8fohHw/UQXOJOKEflUKXUc2yIlSjGnqJqCPjN9q
         KOL3hV5KhEHiVEo0xgkX3Zokzqd7dVHuJtsH/gLYhCaOuz9LMgRBvpSTh12mqR3gYvJI
         X8XzDCNjttR/rCmeUwCFwexFp5ppoY6F/+399iXbdutxQW+Zrsz9g+m9wbXkIIjPrkDI
         RHyg==
X-Forwarded-Encrypted: i=1; AJvYcCX/sHGGlplrs+NP5hmSbyFEVoFVV1IDQuo3WqCDFJkXvZkP1RJEfSG8qPACTqGuYLe0fNSPmIIJQkRkQSFwnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdLPJawe6/81/YLotrsQvAAWUqqZua5Q6v09+/UUzKm2wP5l5i
	H9twFNI8uwlgZd24vmtJ/6b46vB/j4ufLqf56PeSTRF1MHusafQJXn8sK4ZGIVHwMjB0b8MKA9f
	pBTUDxxPOr9XD5b+pEw==
X-Google-Smtp-Source: AGHT+IHRFzs92gG+pJqT1st2Vl1lkPZd3yrofQcAqIqA/U/9o7yE75rCP4nX2IU1q+y5Llnr+jhwkJEc7xi+Eoo=
X-Received: from wmin5.prod.google.com ([2002:a7b:cbc5:0:b0:46e:67c8:72a6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a214:b0:471:ff3:a7fe with SMTP id 5b1f17b1804b1-471179123b8mr119070815e9.19.1761207800744;
 Thu, 23 Oct 2025 01:23:20 -0700 (PDT)
Date: Thu, 23 Oct 2025 08:23:19 +0000
In-Reply-To: <20251022143158.64475-10-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251022143158.64475-1-dakr@kernel.org> <20251022143158.64475-10-dakr@kernel.org>
Message-ID: <aPnl92lLX9sCWrT6@google.com>
Subject: Re: [PATCH v3 09/10] rust: debugfs: support binary large objects for ScopedDir
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, mmaurer@google.com, rust-for-linux@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Oct 22, 2025 at 04:30:43PM +0200, Danilo Krummrich wrote:
> Add support for creating binary debugfs files via ScopedDir. This
> mirrors the existing functionality for Dir, but without producing an
> owning handle -- files are automatically removed when the associated
> Scope is dropped.
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Matthew Maurer <mmaurer@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
