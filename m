Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357E41E672B
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Aug 2024 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723034591; cv=none; b=TmnUSPXC0aVcdJvf8GnHQcs8HcnR4zeZN0L1qaa/0xGMeZ+pJQ8Uau19kcobbFr7P+zRUgZg9NQSz+lgqk5cbcWFVNru+Z8wrcaouM6tZbDi2FToSxNieoMHvu7x5ZqPZYKk7ID1I4Mt4W5F4VLoS/iUc4wUpV4fhsUIn8IK4Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723034591; c=relaxed/simple;
	bh=9TByiAsR7rqHzw0m3GnEqxlrlWwWHyVDWtIiOmBiOok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nzbplDXNsoswvB3bKCKSBXHjThgI/rv2NIIPAHwKIetJVQPg8XMm8bQA0rHBKEE2bankxR7B37N3IXdN76dKIgK0ykLFzrGlm/S4/sMFQQTC5PtEsABZ0nvpq5pGAU6NRBWAPQhS+Lh8+tQlIrvRFxLMO4cf/MCWePTkU06knSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cKhi8PO4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cKhi8PO4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42817f1eb1fso11747625e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Aug 2024 05:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723034588; x=1723639388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TByiAsR7rqHzw0m3GnEqxlrlWwWHyVDWtIiOmBiOok=;
        b=cKhi8PO4+CwK3LtDQiigZiMio4BUyj87VW9SfObsTDqEBHFhPMuWb95tM3b8avxWNH
         qr87Y7PggYnFhV+K9CVzfMMnSYJvPF+K96zQbXVAWh/fl8r5jWsSKYR6fc6N7WfEYEFa
         if5Cb5qDSkgmJQJhHo57pwS59VoI0RrzNM5J19+ra3ObkO5kJUUXI1F1Bq5V9BlPYrEF
         LZ6fLlsRpn+CR2cF73nnNwEpJhSzXJ8mKjUvMxbJlADiA5vnV6QXaykIl8W30/64NIaI
         fgiB01/Po6Nx3OqTGJ5pOQ8x9oJp88lLrNe24p1WCc0IjoCGP+/RgfUwuTGqVh+2TEWY
         ebxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723034588; x=1723639388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TByiAsR7rqHzw0m3GnEqxlrlWwWHyVDWtIiOmBiOok=;
        b=fCpN/LK6I9h7UJ6Rydf7TdrXQTPQXkuFaL+aw/hHg+55gPsxhdvDe5wPr1ysu0oKsi
         ZnfOM64chJx4uPf2bRQDWPNi3KhtJxM9v7hndiwqSL4oBwqJ45UsWDnxAsOU4FcdPdWy
         zStV5EuJDpgig9UQQT2ZW/3KJTvYiMxWWchzJxOpsJTwb85d8FFHlhRSKTp/FPFrt4oX
         qW255NZhbCcB0aMCchkH308luYFpakonClWOknnfHpjBCg4TiiSvRjsLpOFUoLFAwax8
         4LILvNzXmN4WyFHzUQgSGrYSNRaOD7pAuCJUMAKAh3wcAian444zyJIR6EJZBR0KeNXQ
         xiMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1Tuzrplv+J2z89txHpEQlZvl39mxvfx+FFx7uHb48G7Q5znmRjT2P89ouUYroklohUwR7VEDFMWfQMPmqIP1uVHkI2l4e3OXin09pFMw=
X-Gm-Message-State: AOJu0YwPBMCtcw/6OC9cQYLZpHqro4zhBD5w69B+ycsqCaKQ3WiG7BOx
	VYLs4/QkuxZ8TrZkjHVeO4yBw0m/FHep3zKxuBQGDj3LVq3TGHVIJgRFW9hGKp8aPYTS9lWuhsz
	hs4qeyYAeaCivWBV8p4F1/saD+AH78BNvjCEt
X-Google-Smtp-Source: AGHT+IGjfaSyLjwrx4jEwLsF47E1kJuxSp9c65dbrjL2s5oRCzn+kjQm+YNz2CjC070fex44kCMZ2IktnmSjrL7vXZw=
X-Received: by 2002:a05:6000:1c6:b0:35f:cd7:5ba1 with SMTP id
 ffacd0b85a97d-36bbc1c2390mr12330956f8f.60.1723034588294; Wed, 07 Aug 2024
 05:43:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805152004.5039-1-dakr@kernel.org> <20240805152004.5039-20-dakr@kernel.org>
In-Reply-To: <20240805152004.5039-20-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 7 Aug 2024 14:42:55 +0200
Message-ID: <CAH5fLgiBhHVW83zh6wB6916dHdDt5cKsDS8eHS9sre+UkNUuqw@mail.gmail.com>
Subject: Re: [PATCH v4 19/28] rust: alloc: remove `VecExt` extension
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, 
	airlied@redhat.com, ajanulgu@redhat.com, lyude@redhat.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 5:22=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Now that all existing `Vec` users were moved to the kernel `Vec` type,
> remove the `VecExt` extension.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
