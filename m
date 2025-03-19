Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2011E1DF4
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 12:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742385936; cv=none; b=qvtlivH4nQOIQX/0a4+cYM9dCUjGivMjeR50jg6Cew42OaJL6sQA4BYMmrrLjw8uW+1+F3fq3HjJTDIEzJqLGsMdyU4Uv3ZhVwHm3i9p9Gu+z6+nKYy+/1gVumAkN00ODkhkjuWWmtDm70bpNDWwptFpKvZKmVO+xobq9jZxvcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742385936; c=relaxed/simple;
	bh=/sgMUq9kyU4ZUSQimzoCzp9shmlalLR1UBW+34qXz2s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=L7czsUqamPP42yybdHgCYUvzpmUEeoYAkU6Nk4k33C5RwIcjBnv3b/T8imydqACN0bYeSruyjFxBqo25y6YMTL2Ue5GP/siKkqDhCxrlGbImEwEOl5J+zG9XaOAndO3ZHdPJVyuV5M6MoQMvyt9DPxUZPivhSnYIaSMP6fgPtvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=feKZdc2S; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="feKZdc2S"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so23354615e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 05:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742385934; x=1742990734; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Afx+r5Luww/Abgd2iSJsqzRz7kjWQCvle2A8j07pIdc=;
        b=feKZdc2SrwdwXAbfZnX4Xrmd3/r/9NJiqSRG6NkLVzd0GIabC1RiN4OO8qmSIdM1+V
         v3AXPdKCUTo6UawHMiMShgZTg/OvVplbNI7Vil0WDb7FmoqhP7rVoeC2o/fAC78ECYDz
         KaxDMPCppca9aJmMK4xTGaiIP4LTsntvVIddgF5/sfY+wyaDZRVfIOzVlna5KbQFYCrV
         26ExxqmVK8bpWDkj5sHuOP6ey+icVbTm0A/g73bzyLOPTUPnnxUvd/ckPraP+EQqWzO6
         fjKJCR1R0VyD4skm+QloxqBzNueOSykyQPauJg7vbLM8P76dIwz9jGd3SEmc5+eQBpLi
         lhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742385934; x=1742990734;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Afx+r5Luww/Abgd2iSJsqzRz7kjWQCvle2A8j07pIdc=;
        b=PDD909a4k+T+rwPYLGNGou6vHnZveEGY1dHKlq3NQqasMBWXQqJjTKDzJvQGGI1Msj
         Ng8oD7AKiPzt+b0WC5h76MvASuR+CmeJ/Q26QOqi2rLjmDhdZWxFyq3DSLppIeH4FrsB
         2mrgIXwUmuzeqZvvOW6N1rAmBFaVy3uVCf+Sa8IFAkz0zlfuIwUztSUekcOGF0V9F7l8
         0GEiy2IKiWePNqj8FUq6iegVx07pUlubUhKOYslMlA9ZZ717j85RtxfLk7cj40h03cBJ
         pkOR8jSc6oCWvGLpfqDPmh0kwi6E2013r3+XNSkueg2sZcMLXOfZ1zN5AMJP+uPktDc9
         U1qw==
X-Forwarded-Encrypted: i=1; AJvYcCVkhWVroPzPYcT0pF8Y3WLlrHgdSaN9gjqyXH0nIbACu0zGRpzCT8eCuWSRwysDIxW7/fG50C9IiMSsODsLSg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq7KEq773oTjIcxoS08CHkNjZEAtbLgUKkLdFg+eucpdXhXAWz
	ldkLGFvinnvxW9W2R35yCUjWhWoKZNKjm3wirFfo6DeZMpv3zcWVDMnh63rPSsdiM1gHz/kVUsz
	vJfXluor7cbWEug==
X-Google-Smtp-Source: AGHT+IF4W9TrsaeGW9ftDK5AwQdh8v1B1xsNPi4MJVe6OyLmzGV662Yxr2zDVzBA/BPZdMbIvH+MLcJTtHS+ZYg=
X-Received: from wmbg8.prod.google.com ([2002:a05:600c:a408:b0:43d:1f62:f36c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f0d:b0:43d:ed:acd5 with SMTP id 5b1f17b1804b1-43d4378d039mr25931565e9.10.1742385933857;
 Wed, 19 Mar 2025 05:05:33 -0700 (PDT)
Date: Wed, 19 Mar 2025 12:05:31 +0000
In-Reply-To: <20250318212940.137577-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250318212940.137577-1-dakr@kernel.org> <20250318212940.137577-2-dakr@kernel.org>
Message-ID: <Z9qzCxlACKUgYstd@google.com>
Subject: Re: [PATCH 2/2] rust: platform: impl Send + Sync for platform::Device
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: bhelgaas@google.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, linux-pci@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 18, 2025 at 10:29:22PM +0100, Danilo Krummrich wrote:
> Commit 4d320e30ee04 ("rust: platform: fix unrestricted &mut
> platform::Device") changed the definition of platform::Device and
> discarded the implicitly derived Send and Sync traits.
> 
> This isn't required by upstream code yet, and hence did not cause any
> issues. However, it is relied on by upcoming drivers, hence add it back
> in.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
