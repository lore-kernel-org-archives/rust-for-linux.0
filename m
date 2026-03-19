Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4673D4101
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 14:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930883; cv=none; b=h/djdwaki7oYy/sh57pxXfz7EHddQ31Tn7F3ZvIhhqPuGVfXIDk5LrcoZFlhYSIySEdhNjHLZ5iE8Q7de3zRcPDWNcYeBJObqz/DBabV0NE4l8ZHrMVDat0vYEji4fZ1FrneZa+gXEYwtfTuTRm1OZoBKIgep+UCWwi9TSx/OzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930883; c=relaxed/simple;
	bh=WyMtJOHNgptF+RUudbAi9e6jN+p610GxNdbm0q5d+PU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=noqA67RiC+r0hg8UrLuI0fcJl5x6DtQeCOYbf7H5JyErntWrCjgY24HRHA/or/VAsKbWR6qC1cElSSUoVkZQpAKryhz1hhZFQdXMbVEaouC+fZ2irATXs+pX+DLcO+/2u/8HpcdyjcERMBWushWgV35o1VG5v9M6lLW3jiHcG98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NZPCClfJ; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NZPCClfJ"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43b3d3d2d22so577566f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 07:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773930879; x=1774535679; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QPovHfZvdIEmxMLcWggNVk241OlOV9iUo7irlye/sV8=;
        b=NZPCClfJ4MNq50SDaVKf9fLB9I6F6xzcuIqwy2Dp7IlznXJlGImq5q5gfWq4PNXGCX
         nzhmuEAjWgOypaq1cohLrJcw1G2cEq1nDOFCUgEbhtTXySQwRxOJqctmFumZIxDlkMQP
         271zSh7oqP/nUj/R7ZDyi2ae0c7mPbV37c4EvtnkUJk3/WeVAhLsgtqVIihL3KlZ2GI/
         kML3whRLqYuTYVQPTQzxKupu/kgUd57dA1K/hmyA1zNLTPc7nHiBIeQKfH/WDO5C8/P1
         T9Yy6v57keJOs7C2QVLzf8MYsYBnLwsaYywvrsplc7/xb/nc5Wv3OM5MLvugOyZ45YZS
         vNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930879; x=1774535679;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QPovHfZvdIEmxMLcWggNVk241OlOV9iUo7irlye/sV8=;
        b=nY7vkhN2sh3zKt1AvEdDxCRyECVtQB5rp3uTBhObgkVSaG5HxRSgEAzjpF7c5XA8Km
         EK4Sfu+w4Pm96CpQIxidNgaIm18tHBpcH57YRZ9p7KA/6P8QTuO0iY+Rh5SO6+zqSz3I
         kFtMYkEEkpFGdqVSA0VgV6hRpa4kSGkrXR+PRpDJTyEKFmdNMcAWu5GsQvlrfulQmPRW
         gr7r66sHBfHoNevmzsMka975OhMKTZVOqy5QQb4uJPvho5cW5yCs0483/n5mwZ2Bz0Gp
         PcB8IiWSebmKKt/Nth8THfnD2ZIwoyPlBGLV7hh+Rfhd3E0NwoksNZDNa9ax6ZrNXpJ8
         uaPw==
X-Forwarded-Encrypted: i=1; AJvYcCXMOBlnedVXwU1n3HiERL/aYozn/+3NNugr0A045gAXg0ebqGX88g66ze0aBStQcE0rvCvV2q8Ua46aiDICTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyagexFQbBRjA6sClkcZ/Lbbf0fM8alJegXMzXyOXgYSyGPFa8u
	TpIFd4z75iPUR0cME5V56FIfLp/62zLm2XyUH82CphdUwlHZqObUCOBSpC6x0nxtINMakGATrov
	Mhh3vRPLF1xTw7qAHCg==
X-Received: from wmbeq13.prod.google.com ([2002:a05:600c:848d:b0:477:a181:1922])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:198f:b0:485:5981:1411 with SMTP id 5b1f17b1804b1-486f4472ee8mr129992255e9.23.1773930879123;
 Thu, 19 Mar 2026 07:34:39 -0700 (PDT)
Date: Thu, 19 Mar 2026 14:34:38 +0000
In-Reply-To: <DH6TTZXH3JKU.1URETSC28K6TZ@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260319121653.2975748-1-gary@kernel.org> <20260319121653.2975748-3-gary@kernel.org>
 <abwEZaOSqnuwQCux@google.com> <DH6TTZXH3JKU.1URETSC28K6TZ@garyguo.net>
Message-ID: <abwJfsEHd10hqAOb@google.com>
Subject: Re: [PATCH v3 2/4] rust: add `const_assert!` macro
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Mar 19, 2026 at 02:26:06PM +0000, Gary Guo wrote:
> On Thu Mar 19, 2026 at 2:12 PM GMT, Alice Ryhl wrote:
> > On Thu, Mar 19, 2026 at 12:16:46PM +0000, Gary Guo wrote:
> >> From: Gary Guo <gary@garyguo.net>
> >> 
> >> The macro is a more powerful version of `static_assert!` for use inside
> >> function contexts. This is powered by inline consts, so enable the feature
> >> for old compiler versions that does not have it stably.
> >> 
> >> While it is possible already to write `const { assert!(...) }`, this
> >> provides a short hand that is more uniform with other assertions. It also
> >> formats nicer with rustfmt where it will not be formatted into multiple
> >> lines.
> >> 
> >> Two users that would route via the Rust tree are converted.
> >> 
> >> Reviewed-by: Yury Norov <ynorov@nvidia.com>
> >> Signed-off-by: Gary Guo <gary@garyguo.net>
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> >
> > It may be worth to mention in docs that const_assert! may only be
> > checked if the function it appears in has a caller. Whereas
> > static_assert! is always checked no matter what.
> >
> > Alice
> 
> I explained this in patch 3 on why `static_assert!` is preferred over
> `const_assert!`. Given that we recommend `const_assert!` only when it refers to
> generics, the check is inherently tied to a specific instance anyway, so I don't
> think it needs to be mentioned in the item doc.

Ok.
