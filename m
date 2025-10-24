Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59BD3090CA
	for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 09:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761297180; cv=none; b=njiVzok6W8NT0OrxPHCl2QsAkaJtSbbUt2hmIf8KXegDbqWG+G65iZOMi3+JRnLxiGpWlyfV3JBD4gdQRHjn90uDNskBQ0D2ftsVBU86EiA7adNl6owFlFvg6FGuLoWV4wWg0XYXF6cCgPfikOQctQz6b+WcNbzVc3Q1eHB271U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761297180; c=relaxed/simple;
	bh=Py5QyIQVFVTx1zENh9xQwV4btqftsrDbHkuKSIYauzM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cc5jjKMV8psvIM04PYarrF9K+U5mp2h/wAJ456uPPjC1OvIgiPneHefXJ/sbKcPUjZZwvtS0W+BP6vdyAMrMq9u1VnjV48Ad2OZ75UxxxqXsPzslomwsTU0dPHez65vWpSm5IvaJLJQcuHPu8PsYgrrkyiQ/vdZviF3GFXdWGlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cxEZX7pB; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cxEZX7pB"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-471148ad64aso10498025e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 24 Oct 2025 02:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761297177; x=1761901977; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ulo3Id84Le+yseyETzGns1OxvWpuudj7+L+eKB87WfM=;
        b=cxEZX7pBkAACAuCU4lcVeGsAh6yLq4skBY4Rg8Ht0/tFqALP/6TQuDIbieMqyt65Q+
         WFQzBcc/Ovsqh8XV+mTqugAE7vWoWNs1LJ4Me0MpY5UY5reqUNNYnPmShdXUaAeHMBQ9
         ip07pZrZb4uB/CRAjMyHN5U2nyMrg1b1wXoCim0/I196VEub3Jwnktl2R0QdIukkA1Ys
         PdXM8bhe8FcJD+ABx84e167UX4otd4ThSc7NWb4R5qmwcOtqkHf93D4i6rBpDxiIX1LS
         PrjZ62JPI10X29+sPaU0glc8TbmuqB9YXN45mHOrhUrTTJzP3vY63q1wsT9AYIYsJak/
         m7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761297177; x=1761901977;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ulo3Id84Le+yseyETzGns1OxvWpuudj7+L+eKB87WfM=;
        b=qiymmZnycdwjUcyHh32T8kh5Uk/nYeIw2zrhVMUZIib0xyzlHXiaJLo4x1JCOKEaXF
         zPAJ6CREu/PeujAi+9Cpv/voCpDgAxaitSAFzu+uoE91pZAJo982p5scrZGILertGkiC
         JGzf74+h+oqjVXqFQP9ZzmXU0ItCBepFi8DNryCMtEGebcNlcCI/lxLuYQ+dtWJ9uh9n
         Tf41SmO3Cq5+V+AyoWAWUosxD0kIxImkCBXlso6qsXmezdMF6VFhZQSi0Pd462ysGtie
         rvblnz3t+1bqNWotY/NhPEv/Gl/L7liZsMa+wfdrHMLuOsMQ0Wm152+C/HLktGF1izjw
         r+Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWX8Tmop9bARhEWDtPfD0MJPlKOZJ8KmUBj+D2mxBhus7kYQD7utN6E/xEchrRFDLJBYjVIIZXkU9GD32+jGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy34SXoTAGwtbavb7VmchByeKLlIUKkGN9uphNGW4UKzNdnezl3
	UhpN+MpH6sH2OAgIOxxZeXJLmc59H6Um/DBYOIhKun20oipT4Z03QoFXikBegMqSA/gyubGOmXq
	MDHXeH03hFyP6Bwdy4A==
X-Google-Smtp-Source: AGHT+IE9kXnufXu+7tMdDMKWy6sLQPlsvxtyBst07CdXVQmNvgRG+EcaYQNuGz8TSy0rvIW8NN75riZMgHZERlY=
X-Received: from wmbf9.prod.google.com ([2002:a05:600c:5949:b0:46f:aa50:d711])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b8d:b0:46e:4883:27d with SMTP id 5b1f17b1804b1-4711791c8d3mr219334345e9.30.1761297177194;
 Fri, 24 Oct 2025 02:12:57 -0700 (PDT)
Date: Fri, 24 Oct 2025 09:12:56 +0000
In-Reply-To: <20251023171607.1171534-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251023171607.1171534-1-yury.norov@gmail.com>
Message-ID: <aPtDGA0JjmfDvxXd@google.com>
Subject: Re: [PATCH] uaccess: decouple INLINE_COPY_FROM_USER and CONFIG_RUST
From: Alice Ryhl <aliceryhl@google.com>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	John Hubbard <jhubbard@nvidia.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Oct 23, 2025 at 01:16:06PM -0400, Yury Norov (NVIDIA) wrote:
> Commit 1f9a8286bc0c ("uaccess: always export _copy_[from|to]_user with
> CONFIG_RUST") exports _copy_{from,to}_user() unconditionally, if RUST
> is enabled. This pollutes exported symbols namespace, and spreads RUST
> ifdefery in core files.
> 
> It's better to declare a corresponding helper under the rust/helpers,
> similarly to how non-underscored copy_{from,to}_user() is handled.
> 
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

Overall LGTM:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Tested-by: Alice Ryhl <aliceryhl@google.com>


In include/linux/uaccess.h there is the comment:

	Rust code always uses the extern definition.

I think we should reword this comment as part of this change. You can
say that Rust accesses _inline_copy_from_user() through a helper, or
similar.

After all, when using LTO or other mechanism to inline helpers, it is no
longer the case that Rust always uses the a function call.

Alice
