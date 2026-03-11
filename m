Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6733F371892
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 16:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773244971; cv=none; b=sX9VvNjmk0RRl8hF0mjrTRajx9788qaTBb07jqITiwtHQMDzs1ClbdnzeKZ/RpQv8kPo7dGmDQXBtZTkL9sbaThlXzBjX8pHqTJDnwOVAIutKo6HNj9BYUzPEksJ0g1B43bW2QhehskpoRS0r0JsQlT9EqRMe/rYn6Yh2rLlNlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773244971; c=relaxed/simple;
	bh=bmjrHpFJ+o4At4T8bPtvGMBjQTbocjYbPF9mqE1+xew=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ga9HjyPV250z0NH5ILQMzwakidZv44XBoKw33nzZFYxh8AOgeRFDRoEhsPZw81vTsrt6AzpP9CHLyM8loOE9owdp3seNL96K130ExIXKgVrxrJk8Ie9DauRwv0bWj0sCiwPWL+6r7JOR3vsSj3c46nD4R/GRF1ekIEISvmiQ6vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IVe4iYlh; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IVe4iYlh"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-660f98d40ccso5545881a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 09:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773244968; x=1773849768; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2byL9779uGNK+rD0Ul8vhdNJW5F3S+57dqzGzFKDnmM=;
        b=IVe4iYlhcwZUmW67TNYdrC46r8TdFtBswHQwjOZmagUnE1ajqPkv7NpTSMcsoBT/rN
         hGvqaTdt8Y0eRGPcpYR82Oa0nL0Kjd2S9jVJt9+BdvsAJUtiZ6tqy4Y+sy5Uu5CcEi1e
         bWkztM8PsU3N44pH1OfpgAlV+AMv7LNNSXo74UMSpS5IZn0r64941pS+WBWvC/i1ThLN
         Mt6mdrJ1fSfhgazZfswi48XlDwXXyklb/p8HM2kV2YCDceGUsE2DjIaIrI8tjHxm5EOb
         Gn1+7wWCRuqkI9xkEPINTgPO0IAC4bwFgbL5jfi9AgKedeSOSK/Hwo37hqFHORCNRjY/
         rq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773244968; x=1773849768;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2byL9779uGNK+rD0Ul8vhdNJW5F3S+57dqzGzFKDnmM=;
        b=KRt0MDcPHlb1FlgRTFcmp0UEBEGlXgEqv9aeqbgz0H5qnk5vDQhNt+SCba7xsx7Fri
         dZ0l5+faFflxMTK/niSAu/S4PxEavATFHCN0s9w8ptvpDUvVBTBv8NSaPhrm4x29YrHz
         c5eBg2idPL/rbaOaeEIp5AwJf96QmEdlot3oxIpxOlfQM4zw0aEzp5cPx9QSLpI/SmUG
         OIELG13AIF1hDuH/pDNEHO6Uo6XTTEFYVR1U73XV+XVZuqC1cZk1JP6WBkiTfVVkHA02
         sqtF9vb9G239ptXgMzk4LmmahZzrvvYd0MwgthsLVat4Gdh41N4ZGDYxeb+HVp69ifOq
         OrHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoQs87e78uosgTV1gtpmQrdo3VOrPdB7Z9zYiKV5QbDKymrJWnS7OsCTfhjQd0xoxWGUBG31MRxA+a2K1mSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybN+S5uE5M8TYypi6zspn4aHASCs3Ki3lwb2ZYLso9PLfBly65
	RVY2yphv8W8OBHTXqGWndCvO/pZOFj7FFf0yd97YyEU8Us1Ltw07QU/CrN+HlTm4oVCRMJnYMwk
	fWyrZVO7Ss/gfZgp7iw==
X-Received: from edgi10-n2.prod.google.com ([2002:a05:6402:a58a:20b0:658:6265:19e4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:84e:b0:663:4c4:e63c with SMTP id 4fb4d7f45d1cf-6631a5e4b58mr1375889a12.25.1773244967553;
 Wed, 11 Mar 2026 09:02:47 -0700 (PDT)
Date: Wed, 11 Mar 2026 16:02:46 +0000
In-Reply-To: <20260311105056.1425041-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260311105056.1425041-1-lossin@kernel.org>
Message-ID: <abGSJlUHmPEC1kJT@google.com>
Subject: Re: [PATCH] rust: pin-init: replace shadowed return token by
 `unsafe`-to-create token
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Tim Chirananthavat <theemathas@gmail.com>, stable@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Mar 11, 2026 at 11:50:49AM +0100, Benno Lossin wrote:
> The reason we initially used the shadowing solution was because an
> alternative solution used a builder pattern. Gary writes [3]:
> 
>     In the early builder-pattern based InitOk, having a single InitOk
>     type for token is unsound because one can launder an InitOk token
>     used for one place to another initializer. I used a branded lifetime
>     solution, and then you figured out that using a shadowed type would
>     work better because nobody could construct it at all.
> 
> The laundering issue does not apply to the approach we ended up with
> today.

You could always make the unsafe-to-construct token generic over a
locally-defined type to avoid issues with laundering.

> Reported-by: Tim Chirananthavat <theemathas@gmail.com>
> Link: https://github.com/rust-lang/rust/issues/153535 [1]
> Link: https://github.com/rust-lang/rfcs/pull/3444#issuecomment-4016145373 [2]
> Link: https://github.com/rust-lang/rust/issues/153535#issuecomment-4017620804 [3]
> Fixes: fc6c6baa1f40 ("rust: init: add initialization macros")
> Cc: stable@vger.kernel.org
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
> This is not yet a soundness issue, but could become one in the future
> when TAIT gets stabilized in a form that allows the problem described.

Let's just land it now regardless.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
