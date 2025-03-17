Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E951A23AD
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742207363; cv=none; b=qJd3qCoxHcuOb8rx3wUFblIs5zVMp8TMUR6Oct25ITIXcJd7ZTPmMt4IeHLoaHR+zp/lCPqWqwSh689jRmYWEfCyZ9BcTe3W7Ed4EmxehA06p8hegJe9WoAAVR8zKA3VYNE4AX2wIAfCXrH+xKI1OiidVHqen4M8tr2G8K33jAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742207363; c=relaxed/simple;
	bh=BmHlcVeyDTGath6xJ5BkH3jTeyFsKHcpnCcAQlKKzB0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=euPj7rGATezTs/sQFMatmvq2i6KjRhMwc/riOgsebMrzM025pJBZf0/enXagWKC6sYB9/vXgkbmSHdzPQfnU8Q5Ng0CWfhtUepUFsXmsZxoIvuzhBYBPH/1V8WMBybrmLjp4ex9Ho9tNk+YM0ESqPUdLOzVmXGLkCladMdXhl9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CzKNJU91; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CzKNJU91"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43bd0586b86so10665995e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 03:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742207360; x=1742812160; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yZNMaIMiKoZDo5cQ6GyfS8+tsfIDXP/+Z/RHe17Imqk=;
        b=CzKNJU91Ku7SQqzYR9j+CnBmPiR213fxwdeYYnpiCP2UJq1XATNMMqp114S55tLZCK
         FYgu856YDGjuiJXK3UOfgcpaOWQqLBONd6PjeZHTkm75xIOJvpJH8mDDebGiUrWLJci1
         bOeb1sdiJWLiw+G8kwpSrWM+gEVL9sgBCnnNauZE0kYob//9LzYJRKbA6TwFsmcy4n+w
         w8Blc0GWXkRvlXMRKaYvrnzN/3H+kicsYFPsgyOq8CgH4QMV7tHds4QuogkXb0B/vw6R
         +sbffl3QwUmTtGUQOjCO0KTTk1FB0HA1Be+1SNLfRFS0W/APSs7jhc8jMTTiHjlGWXBR
         dDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742207360; x=1742812160;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZNMaIMiKoZDo5cQ6GyfS8+tsfIDXP/+Z/RHe17Imqk=;
        b=LjX4d5KCMZy2eFsed2lSX/d0xxGQIdpU0t/OKsXKHACvv9O5P1JGm3Blnm1BY3I9S1
         Drz/RxR3qmlcj1lGxuRnGgyREAa/GwJnYHKKNHBWuy5lyyFeacB5qXwypDmrQauMsq4a
         ak/PeJS6bZ0KPQJCK8FFmm84G8uT9DtmCO1ifMpBK3ZfL0BoNc2jBnPdBCsoZS1K419T
         mAqRmNfMxQxtyYPIzl5w01kwH1ogb5OqsGjdvdfHe2WqcRz6KN1FlpuT8/eYQOhIYFtb
         AQ9aDMfsNyhrEOxgQ9ggB6R7BLWM43qHlGO3XsMC0pWLH5rXel5rty/W3Rb26wzOVeih
         Kv2w==
X-Forwarded-Encrypted: i=1; AJvYcCUKBtf+vUKWGtujMV/CrTg64ALgjO+cdeJn3aY/NxQZpjRDes9+MZMZZMZepIgnYOZUDRmswo1VVyIncUyiyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYpGF2oaxW8k5ECXHbuFM0KIFFx0S4fKOwJXtK9t7UQCy4p2gW
	4lFfE9gUc7lH9hvKBTSzEX27TonDggHh0Mw9YpnH1RlLkbwRgZCaM/fwOna4A07xbv0rB7j9yST
	oE/mTBhgR179bOg==
X-Google-Smtp-Source: AGHT+IFN0mg3rfLnL9s+jfrXP1fPxsq6jKqq7a5CxuQ9zdvV/QwOOR7cfyj2a84t+UVdZyooaIvYicO+MWpTJRI=
X-Received: from wmbfs18.prod.google.com ([2002:a05:600c:3f92:b0:43c:e51c:1a5a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b84:b0:43c:fcb1:528a with SMTP id 5b1f17b1804b1-43d1ec622c1mr109294525e9.6.1742207359884;
 Mon, 17 Mar 2025 03:29:19 -0700 (PDT)
Date: Mon, 17 Mar 2025 10:29:17 +0000
In-Reply-To: <20250317081351.2503049-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250317081351.2503049-1-kunwu.chan@linux.dev>
Message-ID: <Z9f5fehO186xoNAV@google.com>
Subject: Re: [PATCH] rust: sync: optimize rust symbol generation for CondVar
From: Alice Ryhl <aliceryhl@google.com>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Kunwu Chan <kunwu.chan@hotmail.com>, 
	Grace Deng <Grace.Deng006@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Mon, Mar 17, 2025 at 04:13:50PM +0800, Kunwu Chan wrote:
> From: Kunwu Chan <kunwu.chan@hotmail.com>
> 
> When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> with ARCH=arm64, the following symbols are generated:
> 
> $nm vmlinux | grep ' _R'.*CondVar | rustfilt
> ... T <kernel::sync::condvar::CondVar>::notify_all
> ... T <kernel::sync::condvar::CondVar>::notify_one
> ... T <kernel::sync::condvar::CondVar>::notify_sync
> ... T <kernel::sync::condvar::CondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
> ... T <kernel::sync::condvar::CondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
> ... T <kernel::sync::poll::PollCondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
> ... T <kernel::sync::poll::PollCondVar as core::ops::drop::Drop>::drop
> 
> These notify* symbols are trivial wrappers around the C functions
> __wake_up and __wake_up_sync.
> It doesn't make sense to go through a trivial wrapper for these
> functions, so mark them inline.

You don't need to send a new version just for this, but please format
the paragraphs better in the future. For example:

The notify* symbols are trivial wrappers around the C functions
__wake_up and __wake_up_sync. It doesn't make sense to go through a
trivial wrapper for these functions, so mark them inline.

> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

