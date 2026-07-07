Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDC441A78F
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 13:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430005; cv=none; b=hstoTAaqhs/e4kEZWXqi/PmGLg1ehQxiXBgxwj5uZnwZFer/1bEh+UM2DKZFm+Zo9N98puMIpK5E60QOIkal2E5OCggzqGe5qPl/qPua3OC0ETdWvbifunrDewmCdzEaMN52mpYFoAYKtTpQaO5ozkIx9wineqGZLELYJ9xM6pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430005; c=relaxed/simple;
	bh=MmybheBvPbZ9+fvtkdTreXu3lF24dABq4Vme1lUmp0k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A0w7daxy4hAzTS+wtJE/SjibhqzeEzvP0hZEC3BLS7i4yO/KlxihWL62mo9O1hpzKsUvq3xomJsOWClGeyegLO9wUNHjUTABy4PQDDWg1yt0AYZH03vaoEEmSGaGRxl/e2nY5yiGTYSTQMEvta43R7D+/RdRYTcZp7uQhqHfZX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gy8g+MBo; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gy8g+MBo"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-493c619bb52so29701315e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 06:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783430003; x=1784034803; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QAD8oBOQgciUMb3A+X2IkqOxCsD9BlkHYpuCHLlyDA4=;
        b=gy8g+MBoUjztWivompumUzhzsaJ3hsH4T6VEhW34lUpAt+L06Fg0xFp9KDWLnjQqXK
         eN/HpgQjaKk83u1AAY3qAPuiZVJDGpC5vXlLBIJQdQaNW4gs8x/vTOEk0rSd2AoFkitw
         njqAD6eTOaPPPyqkUX1SYup9dtF6zLHj8rz2Cq74OB2gCgeQ6ZoS9PIiIj3HLgdv1iCT
         eM4NxMI+Kjjck6DpB3/KMvZsrlTjQ/eh3gjvImwUE36aruEzLksN7qOajxRUsGypgTQv
         /VC2IWEUC1TzoEj5HXkomAjq+LV7llxaTYIKbGXuR9FbHu5KJmSfkqf1ZF4fiDMofRBD
         QKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783430003; x=1784034803;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QAD8oBOQgciUMb3A+X2IkqOxCsD9BlkHYpuCHLlyDA4=;
        b=Iyqp+ubLig9tB3zfJ38xCS4Y4KUYjsB+jVygzvDJS7/tAkeGbqnJUn6jfoZXoRKOY+
         kFIkYPFh4ei2DyrxZ6I6YdIPn1XT/bjJZQl3wUq+a3UKBuHUn/4sVcEjeSDviP8qenRE
         RDB9JeXWuID2A8faO0YI/w2Bk3Jf4Hua+u9rYOiOh7TZzSKai9oNUl9ESh3q7rcpCR3x
         RSNI1W+dKd0o2D4o2gTPXkq3P48w2V47bnoljN6mJIi5GMukZp3WUdNlY08/ASTbW79B
         S0mfcloOF80YqiOVhrJnBrhVha+Iu9G3okrQlBADYkao+6OjcSMXLXfBangbfElKBDCe
         hQGA==
X-Forwarded-Encrypted: i=1; AHgh+RokkdMBJxAdjEBmh3LmN9Jm9yBvWDrEi93by1680WiIKcHie166k87rEHpCdeHI285XR2DaUrG9I6A3KoA0Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh4wopMT/SJJQWJpXyUXQgoDH4KwLEvHWojc8XT+hW/XikY//N
	MooiBeHhH3sO2Yl48NOiBjSvuUjVupcgDFdPYb1ageL9/OmXSa++lVIE17TVRIBdw6OaXH/AkQd
	edmC1mU5lsJPFDo7/wQ==
X-Received: from wrmf17.prod.google.com ([2002:adf:e911:0:b0:474:4c49:fdb5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e92:b0:493:b6ee:fcb7 with SMTP id 5b1f17b1804b1-493df04b124mr65012395e9.14.1783430002417;
 Tue, 07 Jul 2026 06:13:22 -0700 (PDT)
Date: Tue, 7 Jul 2026 13:13:21 +0000
In-Reply-To: <akM7upgsb5y9d67B@MacBook-0RXW5>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-2-cc922f544dc0@google.com> <akM7upgsb5y9d67B@MacBook-0RXW5>
Message-ID: <akz7cVZvxeWKl-mJ@google.com>
Subject: Re: [PATCH 2/5] rust: sync: add const constructor for raw_spinlock_t
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Gary Guo <gary@garyguo.net>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jun 29, 2026 at 08:44:58PM -0700, Boqun Feng wrote:
> On Tue, Jun 23, 2026 at 03:38:05PM +0000, Alice Ryhl wrote:
> > +/// Helper for creating a raw unlocked `bindings::raw_spinlock_t`.
> > +///
> > +/// For use in statics containing raw spinlocks.
> 
> I think 
> 
> 	#[doc(alias("__SPIN_LOCK_UNLOCKED", "DEFINE_SPINLOCK"))]
> 
> is not a bad idea here?

I'll add that.

> Do you plan to have this go via binder tree? (Sorry you might already
> me the plan, but I couldn't recall). Anyway,
> 
> Reviewed-by: Boqun Feng <boqun@kernel.org>

Yes, I think that would be the simplest. Thanks!

Alice
