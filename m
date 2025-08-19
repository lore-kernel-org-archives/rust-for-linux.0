Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DED32A3E2
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 11:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755604396; cv=none; b=Iv1QC5Z6izd7ug39PwmbhZwrkPCAKXpvfYXiu8zk94FFd84kt+k0O0M2Jt58zvd/QH89FhBTqtrrA+aWoQluiTRadVRUF4JYbnZgoM/muC4GJlk4UNJWzk8tPuDMU6aGa2CV1rMSZJl0NYB3CJE3pbYGvsy9QCq5kxc4l2qaiiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755604396; c=relaxed/simple;
	bh=I9kaocHcpdjExnXypb8WpQ01pHs47QTzq4hV59I9qmE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bbVBq26XWawawg452VYCNc6h+9FCLWjnRzyMgSK93Cg320Y9VOymW4PGJgNiLPkY4nkxGDwIvt4gGUt+iEqTtYBEQ+Rr15NoRRgYR2pD7FAoLc2A4dOS2xptrcniSIYM8JWXFeQiw2daZi0TH2Vm3F0ZulKs4xRmVYnt2kvVYrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u1jUQrQB; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u1jUQrQB"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3b9edf2d82dso2758963f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 04:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755604393; x=1756209193; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v/n/RzlOnOSbc3ctN8YNH+OqdETSM7TkL7IcD9MY3wg=;
        b=u1jUQrQBDTl0D2ti/e69cdqFDgCQrnV8s4xt0IBGovtlx+1gwMxOK760V7EkQGu4Af
         jEbZ5Q6x3/pn86zcckZzvGH6WXPJylCkhbnlic4JVrK8+b7f3BDEl6aZN0426OpK3aZG
         vFlXqOEE2qTjDcGRJlFq5uWIKourXDjrPv98757bRv7WnNec2LyAe00I4l7jvmuwxJRE
         gqOZ+sJBQt270OALtzv8Yrgdb5xMI9R5m+vbflc2P5poyMs3M6ITxbjW6dlxc6Oy82kz
         w24iGE/2la22bLrJwLGANwV9LTNre1Xk4CxOzbFV055RFF+/vYY59OyzfXio7GVlqONo
         XjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604393; x=1756209193;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v/n/RzlOnOSbc3ctN8YNH+OqdETSM7TkL7IcD9MY3wg=;
        b=Po3q3N46YJGQE7u+cYbF3xWSPHZLsQSCxw5QUrt1O8/dBBcwTmlNi7VwCpTfKhOWU3
         Eetq0TIsQDuL+XVjRr1EYcPe5IRFIt9btvFxtk9lRUp4VkHSj1NuCcDs5k/Co64Ly0ci
         jvlaARO22WoEWu3SSxsVWXWi+fqU8urXiTnPa/pHpMQhJeyvYzXO0v4cZ21PbyFbZvCm
         oJQRXYy0YX+yWsYQTTm9/jtew8WKPQddF4w5EfOwYhliiHY4m/xt0L/tk5vbMAUHfHgQ
         8tAUTBvdRU3mTjy855I5X5eh9NLZAOUtvmbMwjJeND0DaltgCfNA+rZGu2OGzO+i9J4Y
         3A7g==
X-Forwarded-Encrypted: i=1; AJvYcCWPANecZaLayWfGZOLp08fwAbDxH33Ue6C9VDdudzIYB29DJUO2FX72mPMYfQ2Y8FogNq+xxVb00hYAo3bVJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf2Bq7vALBO33qTUF381E8e6RVVaF6jv/Yfr5s03UUij6mpPAA
	fbTfhzxnHUu8VbzsPke1YZ4/csiYgnlwYCRZiXoF3jAxxN5SP+D1MupDNVujTbDaKcS8r9qLa5O
	kXz+evXGakmemLBqgDA==
X-Google-Smtp-Source: AGHT+IE7f2O72gPFvlZmpRhidugQTwHJ1mrZUd7dkrJhh6U3uYwMjLdOZbZZsES/4VMDcuQwJoHeY0AKWrYXu7U=
X-Received: from wrph13.prod.google.com ([2002:adf:f4cd:0:b0:3b7:7461:467d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2909:b0:3b9:16a3:cf9b with SMTP id ffacd0b85a97d-3c0e00a2289mr1865237f8f.5.1755604393422;
 Tue, 19 Aug 2025 04:53:13 -0700 (PDT)
Date: Tue, 19 Aug 2025 11:53:12 +0000
In-Reply-To: <20250818132806.134248-1-shankari.ak0208@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250818132806.134248-1-shankari.ak0208@gmail.com>
Message-ID: <aKRlqA_Xa3S4_P1a@google.com>
Subject: Re: [PATCH] rust: miscdevice: update ARef import to sync::aref
From: Alice Ryhl <aliceryhl@google.com>
To: Shankari Anand <shankari.ak0208@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Aug 18, 2025 at 06:58:06PM +0530, Shankari Anand wrote:
> Update the import of `ARef` in misc_device sample to use
> `sync::aref` instead of `types`.
> 
> This is part of the ongoing effort to move `ARef` and
> `AlwaysRefCounted` to the `sync` module for better modularity
> and type organization.
> 
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1173
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>

Greg, I believe this should go through miscdevice. It's not going
through a shared tree.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
