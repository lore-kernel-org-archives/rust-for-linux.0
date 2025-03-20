Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D481DE2C2
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 07:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742456815; cv=none; b=rHBOZjwob5VT2L75JAzEiCSKoetOIFMCFATRliUbQz/Q7CEFPMXoSbhuQPBBbvpJTICfk085xDtKuOWhKLQnYZMmntr3R6DAA9BQtGJtsXAp1rNKNGwR4Pg9Bor9w2+dZWUFzZ6Kj0gC2gtYhqKZP0abfEcbb0KaizIZWLBWOLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742456815; c=relaxed/simple;
	bh=gj0T5HuZKUF4LsyqYn4Oi6dgRfTp9BHyFdoHpQ/q1xw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lKCcuszpmZ4PjG+Vn8m6Mp1XEh5ZsL9Q7Rcoy4fMm/OQGuX9xU4IYjVXFc2Mc+kS3L+oAUd+znVb7DhDI42exJUCI8cAtZ/HskgyB4TyuW7FfeEWYoOYFu95Ak8crEgUiQBUauXidroPfUNii2gsRSBUqaEG7OYltl9ZuQoswzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=137+w+Jj; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="137+w+Jj"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43ce245c5acso4869665e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Mar 2025 00:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742456812; x=1743061612; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RWnZOZ4G2UEQUs8BB1HUlPKLt/pxBX0R0xeUfMvdz+o=;
        b=137+w+JjAsT8S1thfJb8gkG4RpmM74D4J7K13fU6pX4xCGmi6w140CHtqg45aDa56U
         J+CvBClmOgpl/kADguZoAOuU4QFDyKx80g6LmYbejOqPgowxnY1ki+HHHOROu7HJXTe+
         tbkJUsNerzzBdA6ox0gNCirUrD+ELJgZ1gZBzL6k+X14w7flcSYorr6kjk/cNCIgNHZq
         Nwj8uMBYrK+N/cB9+SIGbX33b81MXEZHxWGRmhhx475BwFP+POJvQPBZDvmIlgwnD9f0
         tPP1JuZnpOlwhpReE3dpDwUyuEc+Ux1DPXhX1UvQvOOCH7vgG6tZiTDeKWPddJhmTuQo
         MVTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742456812; x=1743061612;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RWnZOZ4G2UEQUs8BB1HUlPKLt/pxBX0R0xeUfMvdz+o=;
        b=YJ3gN9hzjZGeg4OQxx7eHg1wELNkOks5ktKmGLbf6aCzKURYlPxdqCoLkUBJMY+KlJ
         X7DQKS6yKaBGj5PMRFnEOfNUqITSKJhzzDM0rBWofEMI7wRwJnyaZKmvVaHQ2GWWCJAj
         RWxIpRbkJrN4G6UAfn1dfC1DS/m9eN9LrU3YmJBok7FXUJCgVfKBdpdGGQlzBkfpRbqL
         zM/exRYyDL/51a5/fYso0IJTbA2BV33ioxw4b5PT0NuHNrc3wNMtz5hfGAZdEB/XEOXT
         Xmj+DaZJFeS/dtX0U7CUuhSRDiSGoucfTCh1SR8dutQHeP8ZH0iDFTodD88qRVL8t0bE
         xKTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGAHNx4s32EntcZmyHdKeQV0aWeZZdrXg5LTLtI86BmrtuMKW7NxU3JWy7sidPJ/SgmcqPyD6fQbFSRSgQdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxotWExOXeS5D2KK5nVEzXW4+Yj0hMZdlOqfwS3KDDAx3uI69El
	z6OIU0PaI+5+6YyujuzT39is3ooVFGcitZQJ10fRV8WD51bQuxpOQb2WiuS4DYLlEnvrFUeb/Uc
	qvZ2f86mM2aFvug==
X-Google-Smtp-Source: AGHT+IGPFtgrWNwVI2qhejZwBO5cZfS5Ix8SCkNN3ywkYIRQi5Uz0gg/ddHWAw7vDTz/ahAJLiPwu/mwevGIzv4=
X-Received: from wmqa14.prod.google.com ([2002:a05:600c:348e:b0:43c:ebbe:4bce])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3508:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-43d49547751mr12399505e9.13.1742456812739;
 Thu, 20 Mar 2025 00:46:52 -0700 (PDT)
Date: Thu, 20 Mar 2025 07:46:50 +0000
In-Reply-To: <20250319-pin-init-internal-quote-v1-1-19de6a33a257@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250319-pin-init-internal-quote-v1-1-19de6a33a257@gmail.com>
Message-ID: <Z9vH6qSAx2Hps3SX@google.com>
Subject: Re: [PATCH] rust: pin_init_internal: fix rust-analyzer `mod quote`
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Mar 19, 2025 at 09:35:40PM -0400, Tamir Duberstein wrote:
> Replace the `#[path]` attribute with a symlink to work around a
> limitation in rust-analyzer that requires all modules to belong to the
> same "source root". This allows code navigation from `pin_init_internal`
> to `quote` to work properly.
> 
> Link: https://github.com/rust-lang/rust-analyzer/issues/3898
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Are we allowed to have symlinks?

Alice
