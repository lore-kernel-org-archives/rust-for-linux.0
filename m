Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F28117D346
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 11:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742212151; cv=none; b=Itp2N8G+7k82nxO/jIRC/QHGUmNOpeEqp1MS1/9iaY45Rh9GEgWqFYCGy1YfZayT2VUNPIcrrfk12p+4UfhArhXMFrBRUBkeXye41rSNK73tjN4I42Z1r7PQAN6Gf6G/2jGMnsEtbPnFjuxtJLu7G1t04iVLVHZ9W7zDnLjTTSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742212151; c=relaxed/simple;
	bh=O4rxkACoIMr0aTpUuepWNgTVZ1VF0SUZH4urO/9sbQc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hY6WaM+HSPpUDuYTI3GJ2GLlN0wAdAs1r0CBRu0oKrUbFniIZ1FWAGGCzY5uyOD3o0kebTEBP6VyEmjv+31sxpN3uNtX+ZQJR9WBrjb1OyhEEAiNiqCLxAE5jSJ7rMC14Ql2Y4mWP/C0ToffJnkVJM5Tpoe8ZdX/uq3UQEhLFf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H3AQiK0F; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H3AQiK0F"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43ce245c5acso22830455e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 04:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742212148; x=1742816948; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6mbmNCDCe88iT3v2lZir9x9mqE4OgQ+puKOgqrIfOxE=;
        b=H3AQiK0F05zlNZf020z7weiIYyX9PSjWBRLm8jg0IJg6IafRoizmtBZ/Dt/1DiagPO
         Weoo0DTpmZqlQ5P1qBfN6ba9Ff05x2O7LmgE5/6M4IkhFlVtNwQaHQOr9nDRO6albc5h
         92ujrZ5OUIHPQtmgkpBABKzAHbPg8CfJeCZR4lyr/lPwIONfLEtKn39A7DqjiVTC7jvQ
         cSGy09UcFGt0HXEM6wSU3XMTzSAu9WgjOgdXR5q0ip6uwOfV4/A74jE0Utw1wBAvRvA/
         vAV8QQuYxqh21mMvP9wnIwC3D2EsKhTOBE9TWsh956Uq88FXZA6YdN/PsA+4IUi8kKT0
         FD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742212148; x=1742816948;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6mbmNCDCe88iT3v2lZir9x9mqE4OgQ+puKOgqrIfOxE=;
        b=NTsFb4f3HU0i16kYmqWQ6HI4QFrZVUbM6i7KQfz14bK32qamAHoNnNHtZMV4HteBh/
         tVcFOJ3DWJ8vQPOMydgRNDevESWIFmA8qo+/18jwQmLYegNabqo3on6XsS/TCVxQxdyR
         KJ0lAfqGT9hQOR16Lmf5VP4GqXCWEQCwJfcYX5J35kjUpAohzWeeOWDWypa265KMvnjK
         XKfxG3pinLExzl0TQtHW751TTE+hfQvSIMH/+rDG3bZuNPaE2CCBOGZaOdkwIaoEONFs
         N/66jkuFjQul94u3Idaw8AtOLEVHit0iYJcpGJ343+fnkiEKHa/JL3lxnldH1OOpsDWA
         5DFg==
X-Forwarded-Encrypted: i=1; AJvYcCXisHPI+jlHfbudLvQl7SlKXgeQVk/3r1aIj0L9cU/LQAOc4K8b7h0VZ2aW+5yAs8knPoGdHUN0I3JLFnzR7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFtJgn8ddkRG9iCFTs6gSymarnFmtmPyQ+f2KBxDxqlOvHQ7G+
	R6qpJK6OEuVN+s5Cm6N+VR5LvYSXW29cySFKfhwf38sBwD89FGV8LiF3IE1FqGxLt/p6AbsoatT
	22MSu/kvPvA1bMw==
X-Google-Smtp-Source: AGHT+IEiyp9+pMsEtIMrEBRP3da21dFJjvcd2SDLZI/bjIqBrdT2NJvvFj4p6Awul2Zl+CaLrkN22+RpYMsvF+M=
X-Received: from wmbbi17.prod.google.com ([2002:a05:600c:3d91:b0:43b:c9fc:b269])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b0a:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-43d1ecc31b8mr119276965e9.19.1742212148696;
 Mon, 17 Mar 2025 04:49:08 -0700 (PDT)
Date: Mon, 17 Mar 2025 11:49:06 +0000
In-Reply-To: <20250317-uaccess-typo-reserve-v1-1-bbfcb45121f3@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250317-uaccess-typo-reserve-v1-1-bbfcb45121f3@gmail.com>
Message-ID: <Z9gMMhXdzyiwxqoM@google.com>
Subject: Re: [PATCH] rust: uaccess: name the correct function
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Mar 17, 2025 at 07:43:03AM -0400, Tamir Duberstein wrote:
> Correctly refer to `reserve` rather than `try_reserve` in a comment.  This
> comment has been incorrect since inception in commit 1b580e7b9ba2 ("rust:
> uaccess: add userspace pointers").
> 
> Fixes: 1b580e7b9ba2 ("rust: uaccess: add userspace pointers")
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Thanks.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
