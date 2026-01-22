Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169D9357707
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 08:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769070519; cv=none; b=qJ2bFIl+NP+Jp8yfDYlC9wVFWjHrh7kndixEEser16eVQODpRCtlr+hHtCoJ2t8Tnu8bH1Kedn1Ko44ojtJChQctw5HNtDLrRPEQr6V0fQTqZqKLaDl8xoWvENQTT77akmEUT3c/9EVXMmUutdb+/YxoYUbdZxrnd+v/YcMnLyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769070519; c=relaxed/simple;
	bh=e5SHl9tdfe7U9tsFeacyHLMUAVT4waohJ18Yy+KpQfI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nyf8dpAPHSpub8Pwl5kV/TMLpwiENBHiT+bjscznLrHuRq8STnFqf0ntYWu2wB4rO2VLsJDZo5IeipfhARnqmGq8MGBu/qm5R56vaCaah9WAj/t7cj3N9KAtJrIESJueYobuir+9R0i8L+xC0L9uyB8pirKuK6kyNlArCwwE6PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T3xxb4Be; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T3xxb4Be"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b870d3327baso52310366b.3
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 00:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769070516; x=1769675316; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QwqQXeBUazQtYA5jTKcA+ISjgjVSs2NRoJVqymEav80=;
        b=T3xxb4BeKatIDdG51O7pAtOiopDtu6Urxbu9kLGeIjBse15//JfhvKyPrxACnaPCFn
         F5j2FV3OOjPEY7/QQPmAPHQPvsfOjWWKo8IHtjz7ICGST53c0A2/kqavo5ZplVAteYnW
         wy80F+EqYAGx7fdC+i5dIwKO/q2IcxWdgYZ31kBZY0HqnibtA+qLUoiRd9g2A7Pn6DS3
         xmuDD5eGlNb0k7RISytsLvokc/mIL1R2Bvi9mFbaL63DNHqdpWbzk9Oo3wQ+aTtDMmdf
         SqqWBy3oRBSBR+OSiT85+be7KtZ5nETjcVwg2nJmCmmOlfazBNd85AWVfa1wiFonI9kv
         Qfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769070516; x=1769675316;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QwqQXeBUazQtYA5jTKcA+ISjgjVSs2NRoJVqymEav80=;
        b=B0Q7dpp9WJbsWq3CHtyN61hDjgCL2xZtMwuJrTULEuegVc4gTAu2r57fcB+zizNs6o
         /59ECq7vA683hcBXi++mjNfvCqkVSC4wLvE8dYp9L24gI+yR/Ol6X8PS+LjNedYQKZLy
         r/sAW7/O3aLOSjdpcEqxKCBBZHEDar7U//18tfBnDBRXs/Ynm8eMU7d5l2L2NHQLt5PU
         7uumCEjk3OiSA7/JXs+LsNSZzCTqjKTypS0/hNBmH9AZ6RicpQK9i4rlcSSj/CbThQ7g
         UdkPznArnLDn/8LS3ii43hKvsBOUPQDcPBLw+yUMyQugG98vZTICIGTEDrB+4/Ogb+q5
         vmxg==
X-Forwarded-Encrypted: i=1; AJvYcCWdTA3pyeTvpcSvoaS97Xt8RkhI//2dFHB3Tm78YUs+nO9N3ghaMqGoJFmLFXxhzsiFfkr9u90VJbjQoUXRZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxSzeRh72KEf0vrNrL6/o0Hd9gX+k1NBhwzzex8hyjuWjMvNiX
	mK+NM1cutv1Rpeaa/7Py0D9bA82tZQLuMR0ZjpEJGma/IO4+/v07vLXG/sg+oI4+SfYY434ghwc
	Bi1MdA9abnPIUQ2U0xA==
X-Received: from ejcts11.prod.google.com ([2002:a17:907:c5cb:b0:b88:397e:3a7e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7256:b0:b87:4c37:7fcc with SMTP id a640c23a62f3a-b8792d3bc19mr1712231466b.5.1769070516343;
 Thu, 22 Jan 2026 00:28:36 -0800 (PST)
Date: Thu, 22 Jan 2026 08:28:35 +0000
In-Reply-To: <20260121165835.4097975-1-gary@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260121165835.4097975-1-gary@kernel.org>
Message-ID: <aXHfs9XoRrg3hoCF@google.com>
Subject: Re: [PATCH] rust: disallow use of `CStr::as_ptr`
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Jan 21, 2026 at 04:58:14PM +0000, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> As kernel always use unsigned char and not the platform ABI's default, an
> user should always use `as_char_ptr` provided via `CStrExt` instead.
> Therefore configure `disallow-methods` feature of clippy to catch incorrect
> usage.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
