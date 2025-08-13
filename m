Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8B62E9EB3
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 07:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755069759; cv=none; b=LWyW0kPMpQMg0wOIBPMBfQ59T9XO9/m0fAGz9u+og/LVbR/aVY45lVGkmMnM6msMz2uexvsAGC/dQSDWMvS3tPztwrEHyggsqg8UOMuphRRzMczW4taLKLgxs8ZYOpAf8NLIXscM+qD2cKyeyjfjIUwLrInpa5+qGhRXoDPR0zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755069759; c=relaxed/simple;
	bh=zHWm1Cr8otJn4ch9T8KtSHR/9iyJgWcpch+TdzYFzag=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o5gJKLJDVZt+RioKKSAbtIM7fDEqw5oqe4OSZHylj7Fgjeu3CeMsNfm+CVOsOwRzMwlfA8xIPL6DfigtmmYRa3B3s4j36ngZcS4vB53BBwfQ/XbTLZPlXFgvS79XPC1rxeQ78BcXa4imw2ndh5Rr9Tl2ushEILwFAXezDasQVy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UaCgrkGE; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UaCgrkGE"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3b91b45dc0cso41379f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 00:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755069754; x=1755674554; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9OeJRKOtDCkvJ844r7dtJq3GmrirtFq/MoszLdIqFBk=;
        b=UaCgrkGE1Mm4fjoj9FnpHOeqNCYEdr0Cel9IOepexPC+PxwpuFWSDj4BffmpQff+LV
         UahLIpf4sFwQJmaUY4Bgj2f+CmruU4uVRNAcihtbBcUkgl4hv2EG5yeyg/I/Q8tPsE1p
         A1Gu3ALa6TEpa8S7MLkSNnsHNoOsuh+sbSOi5YM3NgTy/UF2/KuQfiD4jnvemfmhMXrn
         V2CXuIwyQgxMf9648QQdeDE9ugb8a4TD9J3FDWkIMu1+hAT+tCACirpzcg/S5HpyFXJc
         uU1Oulg/gQAQtSmfOH3lCBe9IdRmKj8OwRFINLaWCMxLiukBJmndixQYXSnKLPouOVhN
         uleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755069754; x=1755674554;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9OeJRKOtDCkvJ844r7dtJq3GmrirtFq/MoszLdIqFBk=;
        b=wyyPHB065p/87CzScL1xT2zF6OOnacfI09l1ABnUzzRHC7+6Oh6yVQlEz9O2FgGdYC
         Ce6eTvcF00skVnFQDecLZQLIg9ef6NFR+VFsJe8VDZAkkWZStvdkG+PUAtW0BDskkW72
         UMqSSELHJjlNYxFBfUZS2lcVNhqJ5wLqlQjRy91EtoPuTCL77N9N+hBxhdAjtvO0H/V0
         wzxHbcw1bZxD7wAl0gjQ2BxeSY3BnsCg3e82+Dc1rG++BJu4uHmydAaHYy0upiuN4gls
         piKvbQ5RdIQ7NlhoEuovWhY0gM1ZptbPpD4nhF1ShNggvuPoI3LohoSiN38p8KIanToO
         P/KA==
X-Forwarded-Encrypted: i=1; AJvYcCVzkMpuK2nAb5re/ytAQNTt1Q7kDoajDwE+pRoMlb/h0roDPVX0U0dTEvozByH+MTEV+B36t1NKdtm1F5w4eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVk3snr5xQdjn9RjKe7u5yeXTSiVa2c/+1sWOfux0RoGSq6a9O
	C2I9uw4a4Ge8nw1IwjqgEiML7fHYJmMX4Cdwhj2uQZ0PVePrKJCdnAi/t6dv2FnnTaKdZXJe2ue
	NYEA5Mw8Y37jtenM3xQ==
X-Google-Smtp-Source: AGHT+IFRoWmp1WD0PJKQpOnS88NN6unHtaV2+4xaLDTSiVc9zhHuKpVbFIj0d1eLOibGzkzdXMR34RAbSAcqANY=
X-Received: from wre18.prod.google.com ([2002:a05:6000:4b12:b0:3b9:95c:a591])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2dc8:b0:3b8:f863:672c with SMTP id ffacd0b85a97d-3b917ea0f3bmr1328010f8f.33.1755069754599;
 Wed, 13 Aug 2025 00:22:34 -0700 (PDT)
Date: Wed, 13 Aug 2025 07:22:33 +0000
In-Reply-To: <20250812-rnull-up-v6-16-v4-9-ed801dd3ba5c@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250812-rnull-up-v6-16-v4-0-ed801dd3ba5c@kernel.org> <20250812-rnull-up-v6-16-v4-9-ed801dd3ba5c@kernel.org>
Message-ID: <aJw9Odr4Ik7RtdCd@google.com>
Subject: Re: [PATCH v4 09/15] rust: block: add block related constants
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Aug 12, 2025 at 10:44:27AM +0200, Andreas Hindborg wrote:
> Add a few block subsystem constants to the rust `kernel::block` name space.
> This makes it easier to access the constants from rust code.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
