Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D953719E7E2
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 13:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731333221; cv=none; b=s3oACl6qOrjl2+0guA+7r9ZCt7cCvXygdPmwAZEX5uIljQlWQnDHCURIb73kGmzk6sE6lddBkC0RVxUEOWnFLGgyS4VRGE9rrPjTXv3gLATKTv6Io8TgKEirUnvWZEqH6kHHQyJFooT34xlf+tH6lQVj3NMQ2ThkZmqcPVfTCrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731333221; c=relaxed/simple;
	bh=JG8SJoj+MCTSCKgmfR2cSNIIcnZD6wq69TSbkCc9sH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QswwfH4UCMcc5lxlwI/CAByewLSCeLXAW8bEq1+r+pxFuw1NkxqVliL3GwVIrpcwcl4xkX73d8c++tkw8kuW4M5CwOTcg9DhuPYV2Eay175CmYBd+g7surJHkeqQ9fBqkQNbpX8p1bjtqSA8nUKcrexMf04NUb/oz9eEdhwFHDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=32qkJ4I8; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="32qkJ4I8"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71e4e481692so4484745b3a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Nov 2024 05:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731333219; x=1731938019; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JG8SJoj+MCTSCKgmfR2cSNIIcnZD6wq69TSbkCc9sH8=;
        b=32qkJ4I8hsA6Gufi0Ggu46u/3sbDJHcdZnzCLrdjAclHJXMH3zGMnOOQ5+KQjw6tOA
         1QjeGzl5LwoKfP0tnXWtKTL82lij8Aw9NlSMx+3P0rUJPykVgvBKrLi5ADRnoFz0QRJN
         ok18VqVmbyl5ZoJlPLZgRM+psoLHk82Ja2sT+2aqDUnD6oW7i678NevXGuiH6g+lO3lI
         LTmLEOIdOrVh2ysJiPrI5zPnF6VMeOJAu/BwOnD31JG4X0f/dm6b2606DBmmo562n3z3
         YReUf4Pu2nRbQXvY8MXA9vBv+CWDePBaHOn2pubqlwjlJ1t7c58jThh4qNjDV/PBsI4p
         FYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731333219; x=1731938019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JG8SJoj+MCTSCKgmfR2cSNIIcnZD6wq69TSbkCc9sH8=;
        b=A02aDa1VSYZlf7wAXsybnxuzp2/+RZROfPFxmxIRFWVtx+qTt1Lnwhl2o39K7D76yY
         zY7w1ZMhQyUogb1BmW9P2zuL2oViaNQEuGuG0kFVXcNfdqAPt+Wl0QgTq5kV3pWskC2t
         Ja7/d+VHWN1bAvr6msQuxN7gFsoQSS5x/Sf3TfwqwXKjuHgGBfeL64g2q/Ye0jNXorb5
         p1DlDu6JkUjq8TWBXjTIbLRZBeTX9TTPQzjNnj4ut6ASoAZx9SuWedQXSGD5o9EPtfXl
         2g2xJEZYOElQpbInC6XXvnSwIOlEHgLjQu3yzNEdx808kdeMSdtCNyG7KdDDvLyF9bIi
         Hpdg==
X-Forwarded-Encrypted: i=1; AJvYcCU0Hjz0PPcHZWvacNM5S56BEZaZvm4VpmTpksgNK5maafj14KJXAipMNw/0xjuvlG6fdgJ7OZKpOfu5OCeaCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSimziQmcM92753Ms7GCKGF0SzWO6Y9aCG/JYjJjAEScSHWQfg
	2V72W2+8XxX2o3bMD9NwO+w/4mtK/E/nOeW/GQa+2/eHsifFL89f2AtrF5skA3PL2C9n/Xhc5nn
	5gAkFra7b9FpRcmQQvEZYxC/gvmlUqEWOS/sU
X-Google-Smtp-Source: AGHT+IGAOut2v+6Xu+q1dAY+2XWGj88PBT7Mswizh6kr0rPlyHLvOgTOpdosc3K4JPVPHgcS5DgYytWnOu39nSrhKfk=
X-Received: by 2002:a05:6a20:6a25:b0:1db:f519:184c with SMTP id
 adf61e73a8af0-1dc22baa0a0mr16072588637.46.1731333218933; Mon, 11 Nov 2024
 05:53:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241109-pr_once_macros-v3-0-6beb24e0cac8@tuta.io>
 <20241109-pr_once_macros-v3-1-6beb24e0cac8@tuta.io> <Zy_oj_k-qUPLSVEr@tardis.local>
 <CAH5fLggOJ1QMdzS=hp+wEGDSKEMFuCh=VPSga5jRy=F+knKE=Q@mail.gmail.com> <OBQQehb--B-9@tuta.io>
In-Reply-To: <OBQQehb--B-9@tuta.io>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 11 Nov 2024 14:53:23 +0100
Message-ID: <CAH5fLgiSBFP66LKtTJpZEPxiyag_VQWfE3BdoY48oWWaXwYHDQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: print: Add do_once_lite macro
To: jens.korinth@tuta.io
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Rust For Linux <rust-for-linux@vger.kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Dirk Behme <dirk.behme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 2:34=E2=80=AFPM <jens.korinth@tuta.io> wrote:
>
> > One advantage of using a Once type is that we can use
> > core::sync::atomic until we have working LKMM atomics and then we just
> > swap out the Once type without having to modify the warn_once
> > abstractions.
> >
> Ok, that's a really good argument. I'm a bit perplexed why the generic
> `Atomic` type has such requirements, they seem unrelated to the semantics
> of the interface. But since it is defined that way, `Once`, or `OnceLock`=
 etc.,
> seem the way to go.
>
> Question is: Would you still merge the pr_*_once macros with the`do_once_=
lite` hidden in `print.rs` for now? Or would you rather wait until
> the `Once` abstraction is available?

I just realized a significant issue with this plan: The standard
library type called Once is implemented such that the calls that lose
the race will *block* until the closure finishes. That's not what we
want here, and it's also not what Boqun's godbolt does. We should not
add types with identical APIs and names as the stdlib type if we don't
match the API.

Alice
