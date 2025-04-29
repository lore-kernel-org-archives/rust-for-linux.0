Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AF1221295
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 15:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745939905; cv=none; b=ULglE6RO/Cfp77n3qk7vFM1k0n/KTmMr1d0kO1CYQNppI4iIAPhTBvzYcnoAhSqCWxJ2yC0sHe+Zl/Htlx/PSBDeS8sU04ljBtab2WrM4lHY/qG+S7S/8Gp3X1jijEivZAYqhfuJ6brfRymZqPGJrP4ldhD0sNp/yTDgzAGlbUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745939905; c=relaxed/simple;
	bh=/PCu2WNCG8+pXYZ1IyFXr8HBm165qrsZ3+TmCh3ue8Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qq8HisnhVK1YlngzDaUaFmmHNZomija1rvV0B71OFxMsX44nMyWPDNEPz0v/gI0cbup3KuWynlfg/Nr61Y4jN3EJkK6+JiGYthjM6MNV1ocl8jYE/+Gc5CTY72XQvnG5G9VP9XPOV14eHwn9gkSyJjvwxENmwci4SRopYzHyS2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dHK5M8QG; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dHK5M8QG"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so36322795e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 08:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745939901; x=1746544701; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JPDHd5nmuz8UCmPYQ1xuDtBVeP5aG1Pr6OYzhTl7aQs=;
        b=dHK5M8QGUqYFw4jzSTWfl9ZAo9/5iTD7xurWOfS8tL/PwpVn7BHLcNNcAiiI+Q0CG6
         Y1vr2MO0hO1cLMHeduVDJAQf1PfMtDI1/UEWFzbe629Ke8tr9quN9RdRi6a+tH4F1VYe
         Rg3y5Ssp9Sq7/vW57KUwubgbfGy5HfL/R1bUBHmRjCqPqBD2IAlL9AMEDK5eT8ParzsP
         IqVVCtamIihFfWUr+If5D0+F0fyZ3Ay8mYXeu3nDv4o8Wrz8gEP0ijWMncXCgLJE87ts
         e0zxs8Nnn8msOSKAZe9dpV+BKpfqcheixMAwkrrowNwtGXaToQm/lbhm/cPuy9XBsRxA
         8BHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745939901; x=1746544701;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JPDHd5nmuz8UCmPYQ1xuDtBVeP5aG1Pr6OYzhTl7aQs=;
        b=hspaPTdM4TqK+IkctDQltFEBmRndeAXkrZlhK1+tuklnK/yNtXV8cy6iFjXkhl0XA7
         QXEPiD9T60yiBrtYUoD2zKuPmHZk1ZKqn4et95ISvE2ZabA/J6knrOUG2BKV5Il/MBtl
         XaShqcTkaOPCXg+Qjb9T5HB1TL+LtmQO87Hdcv4WmYrxgowJLcbMZW3dTfzF7NL9bY8u
         v4PS97Kc6lvewF6X9t9ULpztcHBtff+74IH0WMoXUS9JS+8EY4i+9+sDHmmg7rVrTc5J
         oJrYw5Wi9jCO0aRX6AJdJXon7VANqxp92Lke6eD6XTMOdPtq3u/pzYNEIQzUkEnEE0G6
         OdYg==
X-Forwarded-Encrypted: i=1; AJvYcCV9PwmINCZXKIN7Nv4FivdlqU7yZvcgnKFssP2+TQUM/lrOybwTf6gjXJ+W5Il8P48eH4XUXgVFxfpnXVM6lQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUW4uVokxNX27yfYyiCWEi+KnJvqo9rGASHLfCiG+zXdnYzjOR
	qh/6HemqKgdKHUt0zTu0nQ73ZOVXKDd6u7UwvBPRDWUe/714WM5znWVf55jDoyp5+4tNyO+4hOl
	QQEEVwdr35g2hKg==
X-Google-Smtp-Source: AGHT+IH0OQ3Fn2PmiC3/SXJZlwPP2g+GPNm02BRczf+LepVg4s9KBAT779yrqPUW/iEFczZ49lueIXx+4oUVZKk=
X-Received: from wmbgw25.prod.google.com ([2002:a05:600c:8519:b0:440:59df:376a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a016:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-441ad3b43a7mr28023995e9.8.1745939901572;
 Tue, 29 Apr 2025 08:18:21 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:18:19 +0000
In-Reply-To: <20250429151445.438977-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429151445.438977-1-ojeda@kernel.org>
Message-ID: <aBDtu0oAlRYNa5l3@google.com>
Subject: Re: [PATCH] rust: uaccess: take advantage of the prelude and
 `Result`'s defaults
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Tue, Apr 29, 2025 at 05:14:45PM +0200, Miguel Ojeda wrote:
> The `kernel` prelude brings `Result` and the error codes; and the prelude
> itself is already available in the examples automatically.
> 
> In addition, `Result` already defaults to `T = ()`.
> 
> Thus simplify.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
