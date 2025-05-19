Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ECC1BD9D3
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 18:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747678155; cv=none; b=rIxHer0zJcirDIIwbQ2IDPohqTn5wlEEnKT2/z/s4Y2vBG8a0W2DEakieqg/2OpzY8d7PjCoi20334+K5letv8rBHVI0qXby8gj5LKTNR/Nou7sOW9PdEoZgtMPBUEK1D9AFcPq8jVgIL9uDNs7OeUTpLNyTsLYbdDbeZZQd3tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747678155; c=relaxed/simple;
	bh=u/tmxn+5eqp+VdSE5wKksVymiHu0AjSdWoEF/OApVmk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=b9IILf+Y2gy9BYWirhZPs2oTCoJAn+uVPGQDxNCnQC4bjnPQpmUjwCAAq5lMrSKXKGDAbsj+5tHHQUVdymSugYJGNqRILb/MOvqVYkoox1rA++TeF5zjR0TY2Rkg+galS46WvMqigjUIDyuvhJEXaeRmiq5SLoN+KhOf6WIHQGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rIFZZJSO; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rIFZZJSO"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so37390585e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 11:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747678152; x=1748282952; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p8ugYTMPHKs01bBy5R5swrgkEkyFY3tbNTghcSYsUMA=;
        b=rIFZZJSOrUJ2GsxeZgOHbdEOkFY/BIUVnB0nR4ZH/zGSvxWInzcaKoFTsXPxkFhlUf
         cZqXRmrHJKdyu+IV5qjfwqc18BbMvvrozT4x8aK5aKa45v00R6COwwTwWe55wScpHuBg
         F6o3w0BH0bRNoGTCQeOY8XzV1Hyu2vTZ230f6BIxCtAmOIT8a16ISY4D4XqvJGmwGH6e
         E7UeU5X8iMJfh4OFTfFoW39oQs2mGlrYn9cujbjyF6bcfwyJPnNMifS7WSEDoyg8r0q0
         k5aSB6L/zhKkSNZ2UnQBy5IwJBs+j5pHN+gYl9QPT53Kqjvme6QBkJvLl48nee8SyPaB
         yxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747678152; x=1748282952;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p8ugYTMPHKs01bBy5R5swrgkEkyFY3tbNTghcSYsUMA=;
        b=lFV48GvlRrjVa9zPJ2Szdlm51RHABegc/mmHE6hA+tQqnI/ICPMdu4HwRCj+Z1UiQm
         xZ2V1aeT6d+N7B9suAB/9zsQFRJZHyJFswPdaQPWbWQ+q9psvA5ZzCkuYWBmKGS0r249
         sMmieeqvaawu+j/4kbdCl1x4cmv6lm3RHSHftPwaQGYr/kmqPhHrAdSTSbJDI3DAZp5h
         1KVr4Kh6qQQXRM0Z1PU08VaJ3cenPUTFKlD2ffQDIvfyMezSVXM/n74QD5uw+TyVgn3v
         Ibs+tBbdSkkH+DUudnIRpDcGAhKWJlj9f6qeETLj4GMk3EVqdgYGw6iXuZirdlaA9jIl
         aIYw==
X-Forwarded-Encrypted: i=1; AJvYcCV5bcayqsouSgjxgo4h31rrOW1VNoGDuLqbggVWPHWFxMBlpBb9SVzIuTbBryJl+Iw4TOIiXAqkdqHBxa6b7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl4XhRb7ZYqVShSsj/kJyv6spmsTh+fuozG97DXJDlfQHr6Ai+
	UxKYCjc8LJxzwu4A9hJ/H/6R4SPuCT3trSNXzMejWam7+XLahERUuHklM+mvVusEJerFN8T7UjY
	k/dbwh70GIYeyCWMCyQ==
X-Google-Smtp-Source: AGHT+IF78vY08ijUVxcrC434NFTFp34Wt3hbrn7MEAXPgRZ1rgGBTAanpl7k+IBDL/WroIq64Je/9M4LQsPVu6g=
X-Received: from wmsp16.prod.google.com ([2002:a05:600c:1d90:b0:442:e9e9:c2a7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3554:b0:442:cd13:f15d with SMTP id 5b1f17b1804b1-442fd67197dmr130344045e9.29.1747678152353;
 Mon, 19 May 2025 11:09:12 -0700 (PDT)
Date: Mon, 19 May 2025 18:09:10 +0000
In-Reply-To: <20250517-rust_miscdevice_fix_typo-v1-1-8c30a6237ba9@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250517-rust_miscdevice_fix_typo-v1-1-8c30a6237ba9@gmail.com>
Message-ID: <aCtzxoDeo6boMQMT@google.com>
Subject: Re: [PATCH] rust: miscdevice: fix typo in MiscDevice::ioctl documentation
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, May 17, 2025 at 01:06:15PM +0200, Christian Schrefl wrote:
> Fixes one small typo (`utilties` to `utilities`) in the documentation of
> `MiscDevice::ioctl`.
> 
> Fixes: f893691e7426 ("rust: miscdevice: add base miscdevice abstraction")
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

I guess this should go through Greg's tree?
