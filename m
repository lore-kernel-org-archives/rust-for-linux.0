Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437FA2E4279
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764583527; cv=none; b=mZ1F3M2/KvN5/FFRn80+jnutnfzNDMiba0wepvRce9eIA2BIWU3h/3AsSPKuhtjw9NX8AK7CNj30KqIr1Fzt0aBKuuzd7PTDLDQC0eXx7RBuHWHOg8MKLX8Yw+r2Q2KXJJebixJKwFRgcVGYJ+ZWIjuOw01MCw3ELf2hjrGxKvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764583527; c=relaxed/simple;
	bh=QW3C2xm8tqFI7avgttrCxfznYuX1TOfUYkhhTrUEOm4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ik/HbCVo1zAVSwlCRrvTM467c9nJ1ThwrlR8QZYZ9kgRvQHmv4v+pii5jeqN5hJchEj/jQIi61RAb6q4oUaCYMNyGoONxoN1qeJLbHSm1wjMuhH2u2Olt33Z6bxddjI/+jW0oqI6L40OVVOvCuNNDguIctXzF4EiaOXNXXKDJzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XdUjiSIH; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XdUjiSIH"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47799717212so29388385e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 02:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764583524; x=1765188324; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hokwNu6IaYMbmwrE0WQgJHcf6cEHAYouUTPDe+4BPQQ=;
        b=XdUjiSIHgge83SweaK3PWr793p1PEBHZ/olWEHqUEkVXTEq/eRBBtBZBbxkitO6l2I
         vwjUYdn/Nk3P++G4ZFZUWkY3H93KOgEEZaDi58Ph8BStB8s5L8jjGI1RjnT+xu4Ls58M
         WY26XrcBj5RCNz0AaJxvl9RrHk3xi3K6ayydgj3yVDjC05tUEFi1PzUvYoYmJ1f8b74r
         MlmUJqeQUgLV32SZ9MH1DTR/K8OsQ62ddohxLaTJtOb6GSPtyrbOHbUEZ4Tp5sXug3J/
         cOeyA+AP7qFRL44W+SZe5LTMlqGZQ9xOBUa6HsbhwlF3beWShfHNSnL52xuEbqgzvdWl
         Fdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764583524; x=1765188324;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hokwNu6IaYMbmwrE0WQgJHcf6cEHAYouUTPDe+4BPQQ=;
        b=LshbUTXzPahi2vmKNy1XmYi0hekbu7ASqXhmvF5cMl9+PUvhJSQBzP9QdgEk2/jXhG
         cbluzuZB3Kkc4f5yiLMJC37PdAWypki4zX77JFlByU4eKyXB8f3FJBeX6Tor1mZP1TQk
         JOYhI/F0Ler6m4eh/+H1yMj/hnoI+cZTM3zKIqRSm9soFB+VIs4BT1IwzZimSDZ7l59Q
         +s7qpsSGDbj6r9jKODrF5OIQdz+1htDJV4wN68IGQMfJQYbUtRchTB93n67ZCjVK2fHy
         UbSXOPRnRKOe2z6ILULlU2WWLYXV0d+BkTeahho5SelTzVos27bN2VjADhpAXsABBAU1
         B98A==
X-Forwarded-Encrypted: i=1; AJvYcCWRdFqTZU0zVOKXuPEbZA8PcoMWDp7U7xtqvKpI1tmZueK/bnbFTk+DSRZR72n2iw85iIprHIhC+Sh/+d/eJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Yh6qbZswPcr78BdEvpZuNtPoBnL+r+pMiruXGJOblbIUL+91
	/s+5j+6NehBr+Bfx31C4BZ1K2siAQT9F/WozwDpEu+2cm94Y4xvqxK9e31zqUsCEz0BRCCgyyZC
	h90O3pjXl84Tci8Sijw==
X-Google-Smtp-Source: AGHT+IEuJJnomH91tNowPcxingIui9TDaWLt/RdsMUdASyq1y4L96SoNxyEjJqbWxxwvW7pcu66mrnWs+f8ljRM=
X-Received: from wmgp1.prod.google.com ([2002:a05:600c:2041:b0:477:9f92:40da])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e93:b0:471:9da:5232 with SMTP id 5b1f17b1804b1-477c10e1ccdmr386141335e9.15.1764583524562;
 Mon, 01 Dec 2025 02:05:24 -0800 (PST)
Date: Mon, 1 Dec 2025 10:05:23 +0000
In-Reply-To: <202511300859.35d9m0hj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <202511300859.35d9m0hj-lkp@intel.com>
Message-ID: <aS1oY_RE06wPmaOR@google.com>
Subject: Re: error[E0560]: struct `bindings::file_operations` has no field
 named `compat_ioctl`
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Nov 30, 2025 at 08:47:52AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   6bda50f4333fa61c07f04f790fdd4e2c9f4ca610
> commit: f893691e742688ae21ad597c5bba13bef54706cd rust: miscdevice: add base miscdevice abstraction
> date:   1 year, 2 months ago
> config: arm64-randconfig-r073-20251130 (https://download.01.org/0day-ci/archive/20251130/202511300859.35d9m0hj-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511300859.35d9m0hj-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511300859.35d9m0hj-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> error[E0560]: struct `bindings::file_operations` has no field named `compat_ioctl`
>    --> rust/kernel/miscdevice.rs:161:13
>        |
>    161 |             compat_ioctl: if T::HAS_COMPAT_IOCTL {
>        |             ^^^^^^^^^^^^ `bindings::file_operations` does not have this field
>        |
>    = note: available fields are: `_address`

Hmm, that's weird.  Use of compat_ioctl in this file is guarded behind
CONFIG_COMPAT, which should be sufficient. And this doesn't seem to just
be another UML failure.

Any ideas?

Alice
