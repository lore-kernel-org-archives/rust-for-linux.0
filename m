Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83911331A7C
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 13:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706528; cv=none; b=ORPmCL7DdaSCFGaRwGAJSWciNuZSMjCkr3ooOaMYw537vBzMF3P4XvUGs1AQr7q1XV6axr5E/urwX6XtAS3nsr/+EpeAOVc0zooM+H3aGqg7p5tG3tnyFTcaPX4pybOoIfb2CwGgpVjY+4087kjc7NqCdTFWOIQGUvxdXcO3Els=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706528; c=relaxed/simple;
	bh=YPT7YaFxJr/DP2krd+n0zCPmvIWHZQOhW/R2XbFhEDo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RSCUsyMwHH6WAltwVbVt9KZ/aYra5F+7KsOfYUD21Mo4M9ALcCIxyAY2dkU1JrYDmtFWEJ1yK8bjVrflqQqzJph5zLKPcf4jPf6n4Adl7gut9yFwcypZO1v13KWoZwbxN+z/Mq+45el0cuZEvddxEOuEM8eFCH8v2af0AilAaew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i1xG+71F; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i1xG+71F"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4710d174c31so23116885e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Oct 2025 06:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760706525; x=1761311325; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nSoaI0Nu4BM4dbSgZ9LtXWIMvqWvuCY8C+cLR0Gw67Y=;
        b=i1xG+71FPl1VINMXC0UKt7vue4mGJfU2csQuPwsKs/VCb/tDkhJYa3K/K77QwRLE4z
         P9WmVIzo6rnYxNt9otYoubXHFwaNqVk3G2eHONFsBlcB94W4vIufBb5LYL2Z6c9kFbC+
         ygfdl1i+wa9J1cyl65fnLBJBZogh9J26OzSHo6tXgimMPKQDSjnBbqyhQMDzYAixJQFq
         jq+BrnWGw2D0L8iY1U0XgZkrJpwnkUpxXwIc2QVpr19HGNPCGr0uSkTY23/aJc1uRu++
         JwzKq6IIKjmvl25j2a4RzQZh3QdzgbKF6wWc+K2TbKDZ+oSRygR9pY8WbxPafdMMIcry
         SKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706525; x=1761311325;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nSoaI0Nu4BM4dbSgZ9LtXWIMvqWvuCY8C+cLR0Gw67Y=;
        b=i1nfMpoyzyGZ46vjjfgCton9sR3dSqBwykLiDzLWhWUwTJLU/Q6p/d4Mb/dGBx0qzg
         vCi1dwJqVB5p8KdCXmm0jzQHkWUpWrddqI+GV3BxbGcyPWRWpF0nphG7VYFblkG8MMek
         Bgu4+vPrkcvCULCYW3WSwujRNh7DT2MLUA6dXYsoGxctYY2mbrTsUau2Io0ccxKrU5BG
         ENOXBQ15jxQAK8gD8N2f9GgEYuy1ZAHvIxrng7IkS0GkZi4rBax8GibsFIrLf6uSH4jV
         D5ZQKCkDFhFQGeA2pJQwaZcs6igCVapqo6Vf6p0tVBgO1GuNn6tngudUf3cAViyP+K65
         JTLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFPpfTXS9Ua2mzurcwUPaspy89PDo8w2craj6yane1pay6y0bJTdy1nTCPp+4hlYr/9R/DLLQInELLNfuWQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsbZjHg6r8ZIjsn00LpuRocAVd7SmsN2PEyzbRa21FlpozgCNG
	frhQOuZAT/DI/hUyxnlc/eHEr+x2+hhdzQtSaxCKggHA5tkB7KrlqfBRKFe00+Gvml54/qyb/Tw
	RNMC6oUWp1T2ERsBrZg==
X-Google-Smtp-Source: AGHT+IGfS/GiLnB3eiTHz9v+40BS/boW4LbipGvMYHkAEl/D+2dbSk1rf0yTiwtqOLvzpgJw+OmfNTk1aMxX91w=
X-Received: from wmmh11.prod.google.com ([2002:a05:600c:414b:b0:46e:4943:289b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:350b:b0:46e:19f8:88d8 with SMTP id 5b1f17b1804b1-4711791cd8fmr37761135e9.34.1760706524883;
 Fri, 17 Oct 2025 06:08:44 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:08:43 +0000
In-Reply-To: <20251016210541.650056-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251016210541.650056-1-lossin@kernel.org>
Message-ID: <aPI_2ye1h_yeExgF@google.com>
Subject: Re: [PATCH] add `[pin_]init_scope` to execute code before creating an initializer
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Oct 16, 2025 at 11:05:39PM +0200, Benno Lossin wrote:
> In more complex cases, initializers need to run arbitrary code before
> assigning initializers to fields. While this is possible using the
> underscore codeblock feature (`_: {}`), values returned by such
> functions cannot be used from later field initializers.
> 
> The two new functinos `[pin_]init_scope` allow users to first run some
> fallible code and then return an initializer which the function turns
> into a single initializer. This permits using the same value multiple
> times by different fields.
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
