Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653062E9725
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 07:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755069686; cv=none; b=rgDDugstH25T+0OFaxv/WEks+zKLS/jEU017YJ7aagVRGwn2LIc8CYX/9eLmr0uv8C/WTKk48FYKcW4Ka5u9LJZSfQbTsvpch2T8hIdzCebjJ9Q21cL2JFL4cbvGN4Q/3dj35GPPot9sb3JMi5CjmlyGaABx20TN3EpuryhrKJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755069686; c=relaxed/simple;
	bh=yYtc86jTqQuPqXSQG7t/PuhwvRbJ/TjC3YM7JlrgQis=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YjdkMLIiEIcs+b7S9E6skZ2vKFnRGH5HOEdWIlBbiAaamHLXqhoM50PtsOq+1pKlbSz7+Q3qjzIR7pyjI6s2Eu0oz8CJiYbwpg5vJBaI0yES1FpgOj/UW343bzVhgEHHCOyNZb9Skze6kv7PLJgfX1iBjNee92XwNtm74bx2OCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AnKapQiv; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AnKapQiv"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4595cfed9f4so28460185e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 00:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755069683; x=1755674483; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6auZLdmjrU9XvvBQvF7iO6sbfbUfX9sDWwrhFdoryBw=;
        b=AnKapQivXVs34H1YWSRid2s/9ImyCzBp5v+YrliZiWR3hBrH7kTGtareYVsbInDeNV
         MBRjSxSYbfQ31vtC86mgOv2jSNcQ+C4oNSV7ZL/m/8RlYHu7XssmBKbMvzf8q7h4J462
         uoLfm4/w8jIN2mmqgAYxwdzycDB2Vik72QDOcrcKJ7UpMfja3kD2HI+O6MBCh7FNekhT
         2g2WX6sdDWKguqnNXF9uEp792g88yRNZdJfFSZYanLqyDoVu/DHBDjGLGdUrqUjczrxG
         HWI/vbZahyvNrjy2tAEF9NH2V4bwdm19TCs2xLK2mzw0FIhwbd5ra6LlSbYbXUigmxSE
         JcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755069683; x=1755674483;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6auZLdmjrU9XvvBQvF7iO6sbfbUfX9sDWwrhFdoryBw=;
        b=NGfWpRfsu+d/7YHKSkF20MHNmWhpzCpM7mgBktW59YajOqAfbK6gVl5xKdmG89BbzZ
         s5Unfs+LX2147coeHAMKuaPRcRCD5Qey7xzNDjQgoHsG7d/11sGU1UIftaW9y8oRHsKW
         2kr/WZdmqnSJsA9KhfpSu/8Hv+Z0qHrlTe/X43KvI3ELO1coU57al7EgJlw/OLbeDRni
         S4PEC5JqJJAhQrN3yN+mCMP6actcBB8q5MjfpCZJVgeqDGDRl9BY+Oors79hsx74TKoB
         MJcCrH1XfpU/a9c2mivO26U2NA1N3F26Qy480tybkmTu3pqLUrP4ZRe+aUzfVbnRtCOD
         Tdkg==
X-Forwarded-Encrypted: i=1; AJvYcCWcqPg/459FpsgJB1nqt1TOZ5tRrNDqoTkOtIo1dnXWdypC920042dd9UNjV9RqXSqxRs50itGvb93BuFezmw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsc/vxxHPy942aMJheLN52QHVY6F+VqNmnVAQnLy1ZSibB9dh9
	pB82/PtYpR50i7ncMdypAfAR4U0FLXqkrtQqZyOokT1XqD0zp9iAwTMGzOWCMj3bPMkvGPayO4g
	D784pEKzSAnuVnvdD4Q==
X-Google-Smtp-Source: AGHT+IF0Y//cw0eQBZRIh69r+ikstzcZPTKfdKKV7ybr3e7Hu/OWn7hC8UwPmHe3snLhsQgpFa+DXwZzHEcEXCo=
X-Received: from wmbes27.prod.google.com ([2002:a05:600c:811b:b0:459:d67d:cbd1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:548a:b0:456:1824:4808 with SMTP id 5b1f17b1804b1-45a16602c99mr13135805e9.32.1755069682800;
 Wed, 13 Aug 2025 00:21:22 -0700 (PDT)
Date: Wed, 13 Aug 2025 07:21:20 +0000
In-Reply-To: <20250812-rnull-up-v6-16-v4-4-ed801dd3ba5c@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250812-rnull-up-v6-16-v4-0-ed801dd3ba5c@kernel.org> <20250812-rnull-up-v6-16-v4-4-ed801dd3ba5c@kernel.org>
Message-ID: <aJw88P7K_6GFmWvW@google.com>
Subject: Re: [PATCH v4 04/15] rust: str: introduce `NullTerminatedFormatter`
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Aug 12, 2025 at 10:44:22AM +0200, Andreas Hindborg wrote:
> Add `NullTerminatedFormatter`, a formatter that writes a null terminated
> string to an array or slice buffer. Because this type needs to manage the
> trailing null marker, the existing formatters cannot be used to implement
> this type.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +    #[expect(dead_code)]
> +    pub(crate) fn from_array<const N: usize>(

Don't you delete this function in the next patch?

Alice
