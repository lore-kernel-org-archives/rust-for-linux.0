Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9D421CC58
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 10:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762338814; cv=none; b=pX2QRY8hHfiYbl9qVG8lpgS95PUNnobwOvDt18KzoslIkizByFuq73NQqJyeXmGHLUURk/QhA2ElNF3ZAKG2/fUUlApHcuS+enqAOWyL2DxtpDkcEmklVYV5Sh8ivaR02J+6u45poo7SgY9P18ZgZeLb+Rb94qAosgW6TIQNi3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762338814; c=relaxed/simple;
	bh=hTeme1kuwZTVoVeEso0KIxIZUKbspeq+uDyh0sw0kV4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=plNQqZDMC4TEOi6DB4NpOgMtqggIrmnzXIP5IbC8nKNmz17Tc3aOC3jshBXLUNrc5PRgl13HVVxKNUnj9iRX2rQaEF+tYM+8MJr9nICUpLNjV7uRky+ifgfJQLS/Q2mgJ1BWYGtDlSmu7OcWuzkSM5kZdLteNqTdTmiWHNPMJoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FoMjb41r; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FoMjb41r"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4775e00b16fso3645695e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 02:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762338811; x=1762943611; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZZpyUqsKllDBzfMr8cN3N54oy7a6Gyr5OjBzwoI+lE=;
        b=FoMjb41riI7z4u6HRvIa3/r+1zc6lPUkU05myQz9p0ze/O1LI1/J3EW+3xBi0lqWUD
         B47FI2piSVUleeyLWchd5K1suOyrjx5J/0q6v5CURmHA+DurtCLwmfEi9wABam+AFCtc
         Si8UCef37a0AXobyUowsw5XBfDJhN9hTGTBXU4F+TkWnv6592c5lgbw+rb26J0nUQylS
         FcyK1btkXyyNLpmcdoC2gWsLrwAxOeluRAFTUlX/0ZOAGJxmS7QTWlO/OdqjZnWFcFdq
         bvG1NSdtBvonf67oCrGbRV+2i9il63NHNEV96g8Ns44CwYiESR75OB7B9gbE25MucTwg
         zExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762338811; x=1762943611;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZZpyUqsKllDBzfMr8cN3N54oy7a6Gyr5OjBzwoI+lE=;
        b=tG0LS2RiR15tCusjcFbWzUOsiPRD9MLB1abKobOoUM8j4b48m+A3fUInfqjRM5JOpx
         4RKvy5pLUqGTzgr0Hj0onVaePMibamgC7UrPlDS2+n7sNzh3/aeJj1qiqPQbFaonCaeE
         ajFJOC26X10nfPOua7IgTGup/e9gr3j2AMcBN3s7y8zUPPINI0cio8gqpxi5IWuCepD1
         PX7PohdB37xC+OaEZ7OrAwL/kFkha9Hz+83RQQwiMDEWEC/qgkmsT2PcWblQMCQLXne0
         9+Ybysm22mQ990QYaceMczQ+HQl3+qXja4W+Szmb+JQcS7YM4Y/socKjJAFWCWJAMXZi
         wvBw==
X-Forwarded-Encrypted: i=1; AJvYcCVsC81ZyumHLMxd5a/butgBQOU81QIoL22iQKwBe6SmxMmxznlWheokWF4nvvaypyz+uXuyMC0gZ9wne65jkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPfXtaEiGshewZXHU7C5e/u1HMjcdowt6sutgV5B8hoLG9c2sC
	vaxwASf7X5avyJWvctaaqeGU4WGHwRKty6xZCFDrghtgWCQ4IDr6eNRc6ANbsq96W+/1i3Zv6rY
	2cJzL5ibQpamGsA0xUg==
X-Google-Smtp-Source: AGHT+IHgstTh5pJGX9N7lEjdvFfQcV7+grgKMGCLn7NEAnwNCLMITty3k2L2BhhMLScN4VD02OBgsHbykfqigzc=
X-Received: from wmbz16.prod.google.com ([2002:a05:600c:c090:b0:475:c1fc:f10a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3514:b0:46f:b43a:aef4 with SMTP id 5b1f17b1804b1-4775ce26f85mr18812295e9.38.1762338811442;
 Wed, 05 Nov 2025 02:33:31 -0800 (PST)
Date: Wed, 5 Nov 2025 10:33:30 +0000
In-Reply-To: <20251105054731.3194118-3-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251105054731.3194118-1-fujita.tomonori@gmail.com> <20251105054731.3194118-3-fujita.tomonori@gmail.com>
Message-ID: <aQsn-moqxL7RXX9E@google.com>
Subject: Re: [PATCH v1 2/2] rust: Add pr_*_once macros
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, gary@garyguo.net, lossin@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	jens.korinth.tuta.io@kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Nov 05, 2025 at 02:47:31PM +0900, FUJITA Tomonori wrote:
> Add Rust version of pr_[emerg|alert|crit|err|warn|notic|info]_once
> macros, which print a message only once.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

(also applies if macro syntax is changed according to my suggestion)

