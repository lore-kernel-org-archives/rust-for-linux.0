Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C42E86352
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 10:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767178375; cv=none; b=V443WIlrgwhjxgL0xjWF297MIPxiCAc38cChZEbG5ze4g5PEfJR/wJ64fr5JqeH60i0apbDuXn3dhAuR4dMbSqEXC04krhd+Sb+nZjAnXsShDMnXzA2FJ1TRh8cMykiLGYlIWAuQUV+lGs/N73mwCKp5Rg97NEVZ3BO7NScF6bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767178375; c=relaxed/simple;
	bh=EAM7JnihuGN8oaXKGUBczyvCi9zcQT5w5nM7bisSLOc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QmeNuPkCdpR8XBsDPvqQKfwa3IuXyH8BwqpP2MMFD8LYjFeUfzHYQLifsyk9yk5kXEwh3ETjnrRXSIkiBoPukUmBGPMwmp/soWO+if19rKp8Ww9W36nODAUo2pNVMkIPg17DRv6oE86Oa4y5VO7e1+YHcuAZRJ0WSXDufEguDiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l8iJYPuU; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l8iJYPuU"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47d5c7a2f5dso14336475e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 02:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767178372; x=1767783172; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=foNDBonU3UV1fR5fg0xkeRSJtzbMxQL1KVCuFNABXB8=;
        b=l8iJYPuUvzOSdke+jjNjCvT+FnoXJz6elD18jWyhvKhrISoQkGCOIEo6y8axEqWBH5
         KAtmeGRu/69PRB4sb+ZBiVuprZdja/ow6BF/X83IvTXptgiVOb0RqiR7f6NmtNyDSum2
         sIhMxlG2nKbgdWJ0cWtz74CjzPgDDs9d7ae4AjHLL6WqVFTSM4jhWSIjkDNfglxz2n9P
         vQfMjXKhwBpVFZTy4y2sAcZizVajfe17a+Ad89+HuUhUApB3Na/EvmWEcChKGm6hS3D7
         Af85oh/1S82YyRgU9zvDGeci3lWiw4w2KyRxrYoKXk611awxZPuORamLBM9E5VYGzQoA
         OZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767178372; x=1767783172;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=foNDBonU3UV1fR5fg0xkeRSJtzbMxQL1KVCuFNABXB8=;
        b=JkgUZb/P1enbBleD2/yKFj+M/QOiN2iRWUMoMJrZdRLAx8ZmALXMBmRSC+v+r+ftYf
         DNX4zgrUzGF8vyKmLK+b2e5w+VDZKLHpzy3+uhwheTDAbvJJKyQyz1ZHW0ZV5574ln4t
         pQecX/kUWFde/ooJxgkbRcaZ21k0q3kVwTdIzzrmKn5Eek7JAk6qG3z1emN95+5bjL5g
         fUYgN7ldlCWranuyVoyWZSLTl8KBI6YmYa/dx1tYTqmdZm6wr1uKCw5PpghFkBNBF7uD
         4x+TQjXFZAuNtnwQQLpfowaA1PQs8NQm7QGEMmc9HeLvAfVI6jMT0n0LNVRl4wBc5tTf
         4aDg==
X-Forwarded-Encrypted: i=1; AJvYcCX0PnDz1oTHDIV+sijPP5TibbxRaG1EMBhUs1/fuYoAq2q1ldhjpDTgHdYAk4xK5ChCMVAXH1JE8Ht8i2Y8mA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkcXYGBcK5EWr/6P6MRjlHXMZoBJsb0pIVisgWJRVCn0Sm0ANy
	CcoOrT4vX4ZSnUqcPxIwNFk/jrO9QLIiXOcg/sRxt3CSoB1EftEb3A6D/Yhzh9L+NCE34UGKfEy
	1bTZeO1A6zsDJlpxO4A==
X-Google-Smtp-Source: AGHT+IFfKZCSAga9QCo7OOSxcxNGeyfQcmWk6Ww4BHWW1bRbRPF24/3mlo56MbROXOWD0uQgnBBdCBpF38DcHts=
X-Received: from wma12.prod.google.com ([2002:a05:600c:890c:b0:477:5a4b:d57f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d1d:b0:477:9eb8:97d2 with SMTP id 5b1f17b1804b1-47d1953b8acmr384853085e9.8.1767178372601;
 Wed, 31 Dec 2025 02:52:52 -0800 (PST)
Date: Wed, 31 Dec 2025 10:52:51 +0000
In-Reply-To: <20251230093718.1852322-4-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251230093718.1852322-1-fujita.tomonori@gmail.com> <20251230093718.1852322-4-fujita.tomonori@gmail.com>
Message-ID: <aVUAg0SWldA90MoK@google.com>
Subject: Re: [PATCH v1 3/3] rust_binder: Switch to kernel::sync atomic primitives
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: arve@android.com, brauner@kernel.org, cmllamas@google.com, 
	gregkh@linuxfoundation.org, ojeda@kernel.org, tkjos@android.com, 
	boqun.feng@gmail.com, a.hindborg@kernel.org, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, gary@garyguo.net, lossin@kernel.org, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Dec 30, 2025 at 06:37:18PM +0900, FUJITA Tomonori wrote:
> Convert uses of AtomicBool, AtomicUsize, and AtomicU32.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Thanks

Acked-by: Alice Ryhl <aliceryhl@google.com>
