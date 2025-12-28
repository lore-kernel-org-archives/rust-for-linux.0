Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B4824EAB1
	for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 10:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766917892; cv=none; b=LewThMahzYq8hlieCU+WAIC388/kXzY9zXua8GHnpRtTz6hNOHV+8xrqSP0oplG3FedjzHXkXHfDsqX6nhYMHEsHFAVDXvnFBLP6K2uD1//EEEciddbWaBoFq6VeDioBthY3jatf9YOtIoah2a617RP7hWECbODY4eLv5pG1Asg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766917892; c=relaxed/simple;
	bh=qyGQHEmEsGbJgNE/M/ybMUYEI0btwGxgH33+xLqiu54=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DBMvD2VvhtNcCtKTbh2hkGH3v2KOO575FPSlN4Kz+s+3ptOFaW0IWiXBnydcoN3hWHbTo2UcVT0GNuEEYBEhPYDKKC9BN+RptnJabGWczlYOGjnFLAupZMbtLaHM1cXtsFcTxUVVYO9y6lf63leL3XH4KWlgK+oBiiOICqftzig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KWneE1uk; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KWneE1uk"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47775585257so58075645e9.1
        for <rust-for-linux@vger.kernel.org>; Sun, 28 Dec 2025 02:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766917889; x=1767522689; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pKQM7b6CRI4zafuP/i/EONNCT26PKjjinf/8iebdRgk=;
        b=KWneE1ukxAjAyhwyns2pMtyh3Zxf1/zjpoCSVB8zVKLeBnyAf74cp/C1FaEKPWKRJS
         0S2ioT14fhSHt3LjBTtzVLpzOHku2/tul4vkPgGRUK5z/RpzkNTGiZGLYqMvwi6IVMOG
         xf16EQvLeMpJGm0UjmeE1gc7liy1p9HBt3670eo9GS1GH/Vl0PuZzrFVCVdQW9LvyLFq
         4wamJvI4QnQ0tQbxEQSQgxtU8ooxga9LsC+bjUPlUVIHNaRwL6jAealXK61aWzAouUNo
         Xj7a2HL3VrN1ES2pMp1mZzM2233lgwPOHRo/OGfxCWvaQQoEbg3c5ou4XmhjiotVHALW
         N84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766917889; x=1767522689;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pKQM7b6CRI4zafuP/i/EONNCT26PKjjinf/8iebdRgk=;
        b=Gn7yxg/UoGLZBscu54Yl0PXdFbkAKD7kRMSJlMhUBFOeqr5ah21ileLfGEjc4sSHec
         oIDZRzmhIR5cJ/nYSZhS1sVWCyrfZrXECEJhWYnT7BBl+KTwGEFsjw0tiTWJe34Mt0vj
         +XACgCeP1jdCD8iN2jykUkSCXx7XAb4Inx+rDpIE4638an+Ig+jdV2TeiH0woLXUOE5E
         nk3h5h6QLf1dZ+fiIajhO+E5XrIJ41bEn8pLrPjboESoIr7bvAEIFkbnmf2ZlGaUAFHg
         XUx3+3eiaGlrHLwRg3Gih8LjkVzqw7p76dosp6QY7sVXLoza6VIJ5CKZiFzKk7uCHuNT
         eesw==
X-Forwarded-Encrypted: i=1; AJvYcCXee+83yrC1xfUECvmW6OydIx/TuNJGYwQ7stvfpNFI8/5bsnJLrh5Fdx41QXC3GyhYJM/mTWdpLV0QT0VaIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxFl4os1z/V2zmPE7vlabenWePuF+FyWeeKUcwF4G7HN6iwidA
	2YyMMQNmQZpegS9QDDpV0SGLJobxzIOOTFgFfk16AKF0KgOlP5obaaVAC3i3ggMjGPdR+a27GlU
	KoOVcZHozOVJlAR1m0A==
X-Google-Smtp-Source: AGHT+IHd3D7CDQiDL/ySlOUsjCGLmb67F0V7FNWODkMNzdGVw1hGfMwIsMk9jNGdvE3BSqeFXe3ZY7y2ShKLroM=
X-Received: from wmxb5-n2.prod.google.com ([2002:a05:600d:8445:20b0:477:3fdf:4c24])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8208:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-47d1958d960mr313996355e9.32.1766917889192;
 Sun, 28 Dec 2025 02:31:29 -0800 (PST)
Date: Sun, 28 Dec 2025 10:31:28 +0000
In-Reply-To: <20251223113538.1016078-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251223113538.1016078-1-fujita.tomonori@gmail.com>
Message-ID: <aVEHAMrk5RzSy7Yn@google.com>
Subject: Re: [PATCH v1] objtool/rust: add one more `noreturn` Rust function
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: jpoimboe@kernel.org, peterz@infradead.org, ojeda@kernel.org, 
	a.hindborg@kernel.org, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, gary@garyguo.net, lossin@kernel.org, tmgross@umich.edu, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Dec 23, 2025 at 08:35:38PM +0900, FUJITA Tomonori wrote:
> Fix the follwoing warning:
> 
> rust/kernel.o: warning: objtool: _RNvXNtNtCs1ewLyjEZ7Le_6kernel3str9parse_intaNtNtB2_7private12FromStrRadix14from_str_radix()
> falls through to next function _RNvXNtNtCs1ewLyjEZ7Le_6kernel3str9parse_intaNtNtB2_7private12FromStrRadix16from_u64_negated()
> 
> The commit 51d9ee90ea90 ("rust: str: add radix prefixed integer
> parsing functions") introduces u64::from_str_radix(), whose
> implementation contains a panic path for out-of-range radix values.
> The panic helper is core::num::from_ascii_radix_panic().
> 
> Note that radix is derived from strip_radix() here and is always
> within the valid range, so kernel never panics.
> 
> Fixes: 51d9ee90ea90 ("rust: str: add radix prefixed integer parsing functions")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Tested-by: Alice Ryhl <aliceryhl@google.com>

