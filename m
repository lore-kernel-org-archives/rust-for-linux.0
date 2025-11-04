Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAA71B78F3
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Nov 2025 08:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762245812; cv=none; b=tKOh0ErM8mUDqY6VEOy2oQq+zKhRybKGxeOvG/WsSjioS6n9vKRITvrtIId2OSzq4M0ONr7EyXavy9ruLtj/hJbJ/ifmAFc1Erh2ctDkG9C8qqlfZRDVC7SVGjm+85H0ySwNxTgQ2fWx8F+kVWbVTscVvbfYMbAx2NhgXCcfCUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762245812; c=relaxed/simple;
	bh=aCZn6ff47Phi13st1KZjBEeenbiDArdJcDNAQTj5X2Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oPxIWgO0VUGmyT5EhwiOz/cHzrjKlMfQvW2+InX9yCWO1v5Rni5wptwDEvl+QbsepK3wk609Y7C7dFuGTW4hYANp17ZPD5MIpdxbsG2nD7xOqhifXHnZpJH10b//EeZGXrvtft3KdSVnm7gxWNmHGdVfSufbmZifRJv3jF9i/NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JhQ1b0rk; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JhQ1b0rk"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4774836c376so14458165e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Nov 2025 00:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762245809; x=1762850609; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q52MEZmU/u71Q2fxLMiAXidd/2SEiVk+mC1uS2okEF0=;
        b=JhQ1b0rkReLwatsxhycmPG2f3/szTTX8ZR5D70UZxs/Dpk6uiuIwS87p4W+gp/Audm
         e5yMuDHePa+QsvFF1pMFK+BPm7ZDOQ1FxRMj0Zh3GIRk8uKI/XVOZEMo1dB94u5tHJWs
         W9dV2aMvunWFRTj37bQ9Ry2hJGvaoMwvjj1mkR7bmLy2dzgMy9mjRgcOelNfsQyhgzOi
         oxWtXyO4XKyL0z6ddDrDe9RcIrOqjZAm3GSA6awjVebhjYF/X/SqkchVwIBcPobD/fEM
         IxZIeI/KHzgZ+KcMgqqO0zorjpYiYmR1POVTT0M553rp82KrL+qRgjsZ/SIVJ0HpGzZ8
         BU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762245809; x=1762850609;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q52MEZmU/u71Q2fxLMiAXidd/2SEiVk+mC1uS2okEF0=;
        b=fGPht1weVYDXFLMbwtS3za+651o97IdwzqIriJXFvoqQnda7cLAm5++lgIHmo9oi/O
         WAEF3v8LoEXaKjliJmZQ59Y2CgQ7iTR/jNhk4/64EKXqh2+VrAEvhSSVWBNVzXjqN6A2
         rJmTP1Abc8yUlFcrEhC5VhNzJ56yX6gq0UeYkW5aRHZ5RNZUKhcBBPv9gPvGyuCbEq8J
         Eq4EVLkCKXbFktycN+4XK2jYm1xZxHbsgD7IJi2nbGAazD/ivM1/ab9uep1uzmcEOYrD
         SI0AkwTWTKjM/9BWQA7wARcsZSAbWpgkAcqaqcLeYXT/32JxGEH/0Ziuz8j4BHodjNyV
         K01Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjbctTHpZCEcpl52HCjlropVm2Rj929Y6m/2s8mlSPZ7/TCWGrzEhGyDo5QZ1Z80H/vXWS8XcDbnbiX2OFDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEgIkuvbTueyd5bDvyxDYHteg0DJPhkz7LMn7REIm3UcPAmLIh
	T2siGhFqVg3P09N1y6wfyLkmvxgV+McTpM9vxEgk9er5kwwCjcHgTpvnwH93yxkcuNIV8hKROuA
	Ib0PeW7ETs893XNkF6w==
X-Google-Smtp-Source: AGHT+IH9Ofzy7IHR33bFDyjQrzC2PFRdiKPrUsc69skOdCa28cMYpVlp1wFV4OsqJjaxDKWPch2OKGFPl8v9u4o=
X-Received: from wmhf17.prod.google.com ([2002:a7b:cc11:0:b0:475:dc85:436d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5387:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-477307e6f82mr124823895e9.18.1762245809686;
 Tue, 04 Nov 2025 00:43:29 -0800 (PST)
Date: Tue, 4 Nov 2025 08:43:28 +0000
In-Reply-To: <20251103203932.2361660-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251103203932.2361660-1-dakr@kernel.org>
Message-ID: <aQm8sNvcunHF9mPr@google.com>
Subject: Re: [PATCH] rust: auxiliary: fix false positive warning for missing a
 safety comment
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, david.m.ertman@intel.com, 
	ira.weiny@intel.com, leon@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 03, 2025 at 09:39:18PM +0100, Danilo Krummrich wrote:
> Some older (yet supported) versions of clippy throw a false positive
> warning for missing a safety comment when the safety comment is on a
> multiline statement.
> 
> warning: unsafe block missing a safety comment
>    --> rust/kernel/auxiliary.rs:351:22
>     |
> 351 |                 Self(unsafe { NonNull::new_unchecked(adev) }),
>     |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     |
>     = help: consider adding a safety comment on the preceding line
>     = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#undocumented_unsafe_blocks
>     = note: requested on the command line with `-W clippy::undocumented-unsafe-blocks`
> 
> warning: 1 warning emitted
> 
> Fix this by placing the safety comment right on top of the same line
> introducing the unsafe block.
> 
> Fixes: e4e679c8608e ("rust: auxiliary: unregister on parent device unbind")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
