Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE07D22F177
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 09:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768209410; cv=none; b=eSmdY7EG0KzZAU1+u6XJIoXEFD5rnKe16aPvwoJNWLu2fWxhvQU/Nq4wY3PUa6W1jzheO1gXycPuciY0ypwNWi95eX6NsEww9CQVS9LAaNSiAV/eL9I43QUVJzPf380eVMPrcHtzd/TZo1x0/fYzz2+PmxW1K0s81XNX4vrWeKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768209410; c=relaxed/simple;
	bh=R1pEg30IKZdEMseFjRCGSTr/Al3sD299ghSaDJS78qo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l4YGa1boiF7gnTEKGHL3RsqLdadxC6/gYsl1ofucSXgHKBHDNeK5HSZOd6Z59LjlwvJ0xRrkBPNgrKCfftsFwiiC936rYQiRGH4LJIieW+STNlrTIa32e9YRiRJvEd/3O/20j0bOW7c5qVfB9XKpvvjNEVIrmoBUA+I4piVbbzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vr/B9KSy; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vr/B9KSy"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b87264858ebso43521366b.0
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 01:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768209407; x=1768814207; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fcPJjwpaGQKjnO9mY4k+lkR6LU4TXE/9NhF8gZ2rTXI=;
        b=vr/B9KSyT6iM0ixjtpTp9JphhM724GyIP3/lvLqCwuH5xAPi7qmgKKlv8cdp5PZDq2
         4ztm8D4miMX5mc/M41ANyeCPfSDlE3dj5NLoa+EfUYmhsLR6gepEDBjh8jlH5v+JN0JP
         X9ay7onzhgRAEb2/bpf/i3axO/I2K1uPXrZWW4+47zmbwZZNUIf7H27MnDIU5uV/Va7g
         ZYduvy3jFVIhilqh2iCqooF66ZrBf8oF95qOGYAiaJBhCgTwH2pKJz4aAOaf2Jxldn9O
         yHSt3S8wSTO2Jtx0XFnLL4Q2ym3+cVjhhb+36f8w2NEw8llvlLA7X7rlXZnPQSKI49IG
         J6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768209407; x=1768814207;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcPJjwpaGQKjnO9mY4k+lkR6LU4TXE/9NhF8gZ2rTXI=;
        b=auQnTk/qOBMm3soP0gb1wwk8tHj0dlDV7kTgl+pEaSl04eHUYV96Xt/IHUpp0HkM1/
         rV4G7wTufChaxRQWmgX5SaulbFOPa7nk56/XJjAbU6WPm/BgZHQONf9PlZgQUoi+ulH6
         pYUc9ByuqqBfVlGSIkUr1Hf9SWX8HLMXxnh3J7Hxt5ttW46OgcNs43hUHmM8kQi4k5KF
         PFXL0394gSXIpKAgo77cLYeGgReFpWfWT382Xn4Q+LWyeYDby+oBnLp8XqDd/ZlP35N+
         J00yijJWNoN2+P6eShx7o1s+YKJCEPeLKdYVqPZYS6cs6iXpNKONEj1/Q8RetIOna5Mn
         EtPw==
X-Forwarded-Encrypted: i=1; AJvYcCVGeuvAMqq7ChDjoV0uY9vcW3Cm5NVmSLraVkwA28G75JrSwQCZ1/C3NH+2vHEoqRkERiQpvX2B2JB2U2h8+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgr0WxfZbtfaZkrDOmRaJibkrEw4Egch274ChR17dgEmCuxOYY
	JsjS5hUBwXCawybZFHl7OTuypUPX7fFzYzZ1VytuoN54UcRmXScfZP6OSkNKcx7CaVHAa8QjrKb
	9JUkbkqfG3gZAXV1PdQ==
X-Google-Smtp-Source: AGHT+IENfzoDf3ZcsGKaZKpMOGtDPq3WSl6+Hua711P98PROwCQV8vO10Oecfhod60sRs5bwVilTmXaqj7a0cAY=
X-Received: from ejcre10.prod.google.com ([2002:a17:907:a2ca:b0:b73:737b:c33c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6d04:b0:b87:20eb:a66d with SMTP id a640c23a62f3a-b8720eba9bamr156484766b.65.1768209407085;
 Mon, 12 Jan 2026 01:16:47 -0800 (PST)
Date: Mon, 12 Jan 2026 09:16:46 +0000
In-Reply-To: <20260110114817.2312828-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260110114817.2312828-1-alok.a.tiwari@oracle.com>
Message-ID: <aWS7_vqLIvIo4CWp@google.com>
Subject: Re: [PATCH] rust: auxiliary: fix remove_callback invariant comment
From: Alice Ryhl <aliceryhl@google.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: dakr@kernel.org, tmgross@umich.edu, a.hindborg@kernel.org, 
	lossin@kernel.org, bjorn3_gh@protonmail.com, gary@garyguo.net, 
	boqun.feng@gmail.com, ojeda@kernel.org, leon@kernel.org, ira.weiny@intel.com, 
	david.m.ertman@intel.com, rust-for-linux@vger.kernel.org, 
	gregkh@linuxfoundation.org, alok.a.tiwarilinux@gmail.com
Content-Type: text/plain; charset="utf-8"

On Sat, Jan 10, 2026 at 03:48:13AM -0800, Alok Tiwari wrote:
> Correct copy-paste errors where remove_callback safety invariants
> incorrectly referenced probe_callback().
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
