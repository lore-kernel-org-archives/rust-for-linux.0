Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D8529B8E6
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 11:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753097338; cv=none; b=CxycPTJLfvEOS3hq4PUa+h6aeNm6shleAKPKwdis9nyR9LQYI43xFWiKqWa9efjUzShnbtGDPUoXC437ec8P95aT9VPcHvch+v10Ar8tMKN7FuP6gCfvCPHMleC3pduXIuP42fS0tRHjABzMjqf/to/QO734zj1ilVZqJ2xhMqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753097338; c=relaxed/simple;
	bh=NWPyE/oXXwV7jbclRZg1Z5pKRCbwyvtDaAna5RhNTZ4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k8zdRiEdsmzNKOv3RIcfI2RIo0jmvp0/5j8WJsBe3HQm80kshnHp7lpLGkKK6mIbONNjaXvcvMvKTBvgTTB4xY4x2zsnuqjVb6IQlU7a8FgRkB/2aCAVguSmVXLESRi5eyjiiAqgsa4K6fw8T5qLXjil3F5VAiiQhENW0Uvegnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T4bd4cv2; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T4bd4cv2"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a50816ccc6so2727139f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 04:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753097335; x=1753702135; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OLDWY+AZ8TsQpkCn6ZpTAvHwd+IywydqS2wN/CqvQc0=;
        b=T4bd4cv2mNj30D1EkL0NobD+x+++oWN1mCOv7sUmYWvgzZlIl8gBcFZUNAd+9mFGLW
         h9ZBqpDJuGPd9y9nya12DQZvc87rzy3wwgBhu68efuij8C6+4qVECR1f/QY/0jhdCQbg
         Xfwhp6AhYVCb6AvyxSGHxxymnnQ3SQOuY5OH7tUD+IQ2llfDS9TxBipP3yz7LYbgBUpa
         EotUdjenHkUK+trVnHrwn1+4OmJPV1KJysD91Eu/w1M42CRQq3Oy11NGByDdmQrqg1FR
         +zK9yokq5RDEsdkfYF3+3YbRLIUEyeOXwJqlCx+TuhuEXmsE+APzyJ3nxtgAxYtDrLDc
         9a4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753097335; x=1753702135;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OLDWY+AZ8TsQpkCn6ZpTAvHwd+IywydqS2wN/CqvQc0=;
        b=T1sLVA3Gix5FqpaUvvM9mG1kA1QJtbL9/jY9pNEFUEYCFeKBRAIRPV3jt8rpJk2ud3
         sOl1StqewMT2WQzize0YOfKKGIP7GXfYUtQkixx2mvAMuvaM68uYqctZldHv1wmzSxkt
         3xs18QbzBGpKs/SJIR7oKTBsnyMrY09C4R6CJ3qXsI/ZMS6JbOTiYhhae1u9q1I1EO5B
         HhW9F+X2HlpEErV0jq7DydOsDSnpNeZew9kCVGWpmMr+zp0Yc8XsID3aAhtrgmlVdG7X
         0LT51GSm//Es6jvvEsqd7lTwLtFEgwHV83yfszHieDUwtR8ksQUiFXvz6pBtFsCZMv1C
         3iJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWByp3lfSgmhNVuTF2RnhfCHWqBxQo/KlT/KNjsaQwMc/YXq5hmVET5oTriNRhwlftKlS7WOqcEM2Kqh9pbLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy53o1xGYNCoImIso68ExIt+k8Gmzp91jt66VH5vBrbwTvi/vEi
	/zcgNCeLLDGmI+ZWUJX7cW3M8+xbCQPAdkmXKDYFfpx6T18N3CfFi/CVgQt6UGl/X11JVBx1e/o
	Ne2X5F76odBRHYhrPqQ==
X-Google-Smtp-Source: AGHT+IFajS90MhfIY2BBT+gKlJwX+dM/eN8Fmozuq1by1tOiYPEzAnvjApRieaWzEaiqLeiQxI4Nz1plEKfqeso=
X-Received: from wmbz14.prod.google.com ([2002:a05:600c:c08e:b0:456:1075:9202])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e19d:0:b0:3a6:f2d7:e22b with SMTP id ffacd0b85a97d-3b60e4d2a3bmr12301878f8f.18.1753097335224;
 Mon, 21 Jul 2025 04:28:55 -0700 (PDT)
Date: Mon, 21 Jul 2025 11:28:54 +0000
In-Reply-To: <20250629024310.97937-3-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250629024310.97937-1-contact@antoniohickey.com> <20250629024310.97937-3-contact@antoniohickey.com>
Message-ID: <aH4kdk5wzAw6PQdr@google.com>
Subject: Re: [PATCH v4 2/2] rust: uaccess: refactor to use `overflow_assert!`
From: Alice Ryhl <aliceryhl@google.com>
To: Antonio Hickey <contact@antoniohickey.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Cote <danielstonecote@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Jun 29, 2025 at 02:43:47AM +0000, Antonio Hickey wrote:
> Using the `overflow_assert!` macro here adds documentation to
> the intent of the assertion, and avoids local `#ifdefs`s by
> encapsulating the conditional behavior to the macro itself.
> 
> Co-developed-by: Daniel Cote <danielstonecote@gmail.com>
> Signed-off-by: Daniel Cote <danielstonecote@gmail.com>
> Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1159
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

