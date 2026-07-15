Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CE2466B53
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 12:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117804; cv=none; b=j2gybbkAHZ5Z1R4qzJqv1g1ecBvYzcHbwOvyYEsA8PkL48Rj98FWvogMDgQy2GNB4TFYOSkycHrkGjCS7ecC3VNP2EXutrVN9TtgPnthK9TGcn2V4eXH/xDbnbaTLR4P5TSlr4cFCPNCyd7GUukxPOhh/Vn0tGe5rsoX6FkqKI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117804; c=relaxed/simple;
	bh=uUSaFlBnceoGE3f0wNcqJQFnA1GykMB87/lSwPUtmIg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ahtAPxPMqOa7Z3dPOwOJTmEakbLDQBZnpkR/7qu0zYnUW4fyMD9nUhO9k2j3ti9LT82Nh4s+KAYSbFWtZtg8RZuJmltt5J+5L87ziap+cj75UFLFmj49D3k6gk/7Ep5nO6pffel4rXoXK6Srd12yJl4FmVenFLTsL5dUfLwJLrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E8CWY73L; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E8CWY73L"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4953ca5716aso5112175e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 05:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784117800; x=1784722600; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uUSaFlBnceoGE3f0wNcqJQFnA1GykMB87/lSwPUtmIg=;
        b=E8CWY73LLxyLIegDV+TgfpjSAB0T0NW3agJR50miZfTrO0wVq+OKr/TQeyj/rMTsZv
         NN6WknHmvp6s0TXJAmvCrUUeBmot5ZRs17VEThCANtjwClJAFFI+CmUXBL/4/e7KOck5
         o8kLpZAOFMHo45cXCtfFHpYZYP9g39BplFOPq8T/dN2TLBpBjgrpAzCsWSj/L3za1KGF
         i13ZWkk6Lm9UFzRQPTIIICquBmeXk2XQcPMMkNT/XPwngiAwnVasa0UiCaznjqp7Repm
         1lTlw1CNYC7rMZ//hlJg49zbjQxM1QT38UBOt3yBJ1Gp4wmS1AFXsPgYlLpxJ677XEoF
         G+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784117800; x=1784722600;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uUSaFlBnceoGE3f0wNcqJQFnA1GykMB87/lSwPUtmIg=;
        b=OClp4TXUeR1TU84pbQ7P8+f0SRt42c7hYF3z9NZDjKzbPL3F2OCT7MSCB7IF3tr3+O
         ADVluVCemGCY6PiJW8dERKFbVl2pfKzjdLQEnekAgaljHFHiu4+Vhro7cquZnoLV2wiX
         Q/ZVmsnVDIODm4k1OXDVhSs/+yZawRZFVtv4LGCwBG5SE3S+PB6q2C4CqYsT+fUJep5I
         kHEIhkhEJyDEFhkhhhqvcaNGpc7xoZMIjDOr7PQRFJ88OFHX1BD3pHIgfMHF0K7oPwwt
         uRfaNaSN4dsxlzC++hAQRJIeAuBR1dEv/cJp3MPehqGFn2OrjlgMjMUwpVqcT9IdSjIA
         lGlw==
X-Forwarded-Encrypted: i=1; AHgh+RrwvQ4Ji3mr8TXSNv2r4aiGFl6gKdsF+BNKebICy+3pf+UWK8z/F+B9JqOGAabSdc9xerFgcR/JWvATIqUwZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyurfWdXXy4+P3Qyo4e5Yj8tQSH4CvUKXnV6hhyyqOD77UYarB
	rSZ4k2NLGE3tRfXNg3wr0oP9G8zauVEnxzhceooPoV5IfsOY1H8M0SXWPSPwITw2KlPW7Jsy/dU
	Mr3uPDl0+jrr3FW8uJw==
X-Received: from wmps26.prod.google.com ([2002:a05:600c:319a:b0:493:b40f:b55f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1391:b0:493:d117:18a8 with SMTP id 5b1f17b1804b1-493f88bd849mr181106995e9.9.1784117799286;
 Wed, 15 Jul 2026 05:16:39 -0700 (PDT)
Date: Wed, 15 Jul 2026 12:16:38 +0000
In-Reply-To: <20260713-rust_binder_debug_mask-v3-0-0de91bbbbf69@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260713-rust_binder_debug_mask-v3-0-0de91bbbbf69@google.com>
Message-ID: <ald6JiykrvSDxzWj@google.com>
Subject: Re: [PATCH v3 0/7] rust_binder : Implement dynamic debug logging mask
From: Alice Ryhl <aliceryhl@google.com>
To: jahnavimn@google.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jul 13, 2026 at 12:35:22PM +0000, Jahnavi MN via B4 Relay wrote:
> base-commit: f8d269390cd2a7a9fb5a31f153e7c7b709defea0

Greg, a quick practical question. This doesn't apply anymore because of
the merge commit, and it actually also has a conflict with the fix
"rust_binder: only print failure if error has source". (Both conflicts
are in the same chunk of code.)

The rebase of this series that I'm currently using for my development is
this one:
https://github.com/Darksonn/linux/commits/rust-binder-base/

That rebase happens to fix the conflict with the merge commit in a way
that implicitly fixes the same issue as "rust_binder: only print failure
if error has source". So with that rebase, the fix patch is only
relevant for 7.2 and the stable backports. (i.e. merge conflict fix is
to keep char-misc-next side)

Do you want a resend of this that looks like that?


As for my other series, the netlink series [1] applies cleanly on
char-misc-next both before and after applying the debug mask changes (or
at least, they cherry-pick cleanly after 'git am'ing on the original
base commit).

And the ratelimited printing [2] and synchronize_rcu() series [3] both
need new versions with changes, but I'd like to base them on top of the
debug mask and netlink patchsets.

Any concerns?

[1]: https://lore.kernel.org/r/20260707-binder-netlink-v7-0-42b40e4b1ac8@google.com/
[2]: https://lore.kernel.org/r/20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com/
[3]: https://lore.kernel.org/all/20260707-upgrade-poll-v6-0-4b8fae7bf1d9@google.com/

Alice
