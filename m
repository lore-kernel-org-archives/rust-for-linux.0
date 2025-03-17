Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08E223BCFF
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 10:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742207062; cv=none; b=YWLoEbNZjrPP8SBd8RAQCZRRtciXWPyRo+I3yOQbLayXdykT72xvk333HIXmw/Ehij1gd/D+3p8VmEiJcvmiAmgAYFDVV+7eW5imukhctq67/gT/qHaLNo+3JdyPo/5ONCn0FdkG2D6xbX+vegfWQUKJ/RXuDNWeaZB5HfkmFjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742207062; c=relaxed/simple;
	bh=T0XmXTPHuSifmlk1GQv7S8pl94t1Wv6LlKDhlqctDvU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OQ+g2yOqcQEOrZxKjaiIkbw3jkmlPZUKiTcbkYe6FSrH9ScfmqbQKtaMlT1jv3CkAMQNOa8gkytSfwE5S0NL23RCRRghdRYL3sgdRjjjUinNaljL8aJ88azQYW+oqWXpnNO9pTGbatw/TGHgGw+k930Slw0avE6SPPvQ/vG2Fgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tbXy5sjp; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tbXy5sjp"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so15163135e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 03:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742207058; x=1742811858; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8K4Jrr2cHn05wONB/FH2XsdIcr9ioXUuaymWvPlQBPA=;
        b=tbXy5sjpD4pVnpMxCVw579Xj25M68VmTzxLgZ1bUIeaZUY+7lP4u+agcaQiT4EVeY+
         9x7FOKFggZLY8zNqTP3m4bVZZ6Hp2O4jZ6DTyqnFaTKbk/4fzfbE16drDXycgHYQpFqY
         REr2ifWo5mf4NjrpUT04rSbE2N+/SlEZFlNefEjtK3VR72Oa2D+hyKmbk9VzBdtMwGHS
         vjwElyx4Zl6qvNzxPTrvR7s9dqptYh5EKosbIBCET5tYlGeR2rPeP/kUQudM/swbbdpk
         PWUwy4tj4vHkqLsP8qd5I9hdi+U0H/wLuh0jTV/VihUkj4RQD3vZf11Bqg1eAgyJd18X
         8z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742207058; x=1742811858;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8K4Jrr2cHn05wONB/FH2XsdIcr9ioXUuaymWvPlQBPA=;
        b=YMRaDauupfvE2/OYxdN7SkJQVqHy5F+kPyE9LmKAhoMbD09QXPTvcfJUiKI0saMbdM
         LFjo20CsMRR0r3zPmxgeXYTQxI56mLh00u1wl9GVXRp9c4MxLCLswEioSRrFn5Pm0Bhp
         AY5JKFK0tw5wIPr3dIcOWqSFvKsMszKgCHUmyXbWrR1bidwCA9/f3LSBhkttS0ChVRyR
         szxlmw8+iexaMSC0RSCGLZx9c0RLyhxMiDpwX2lqiaDOX/EOo1WXv/wEnpjD3sdrhiUE
         nphVnaKXgBzM9S3jBMP/5LeJGyievWYEIHU9teyBZi97tQqtQKAr+3pT/QywXTaMJzyF
         jlvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa5Dr1Ts8k6AHcv3vIV0XBKJirM+0avg3uAFnb8EvAFFYrqytUPbWjS4MpHJ7TLLTjnq0UQ1CdZEtGl/Bvfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqETdKf8uEhvKeYaBaN8iP/iytTTxolIZVo6Gk+28+VobUGJu7
	FBwhYMCx5Eh0c7hwz7QVpADVjvLcD0kne2Dd6R/3xSyT0l2wUf9+XLrhvCkDuEysOVumsqyfvw/
	G/DXjTBW4ybiyIg==
X-Google-Smtp-Source: AGHT+IGHM9Im2dqX3gfz0NV8cc0x3CfI4wJk+09faVb93t75tZtSx537hGUim5yDjXgoSpEfdSGA14kssfoPG70=
X-Received: from wmgg6.prod.google.com ([2002:a05:600d:6:b0:43b:c450:ea70])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b0a:b0:43c:f969:13c2 with SMTP id 5b1f17b1804b1-43d1ece13a4mr114040775e9.28.1742207058149;
 Mon, 17 Mar 2025 03:24:18 -0700 (PDT)
Date: Mon, 17 Mar 2025 10:24:15 +0000
In-Reply-To: <20250317023702.2360726-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250317023702.2360726-1-kunwu.chan@linux.dev>
Message-ID: <Z9f4Twvl-UaX1NQp@google.com>
Subject: Re: [PATCH v2] rust: file: optimize rust symbol generation for FileDescriptorReservation
From: Alice Ryhl <aliceryhl@google.com>
To: Kunwu Chan <kunwu.chan@linux.dev>, Christian Brauner <brauner@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Kunwu Chan <kunwu.chan@hotmail.com>, 
	Grace Deng <Grace.Deng006@gmail.com>
Content-Type: text/plain; charset="utf-8"

Adding Christian Brauner who originally merged the
rust/kernel/fs/file.rs file.

On Mon, Mar 17, 2025 at 10:37:02AM +0800, Kunwu Chan wrote:
> From: Kunwu Chan <kunwu.chan@hotmail.com>
> 
> When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> with ARCH=arm64, the following symbols are generated:
> 
> $ nm vmlinux | grep ' _R'.*FileDescriptorReservation | rustfilt
> ... T <kernel::fs::file::FileDescriptorReservation>::fd_install
> ... T <kernel::fs::file::FileDescriptorReservation>::get_unused_fd_flags
> ... T <kernel::fs::file::FileDescriptorReservation as core::ops::drop::Drop>::drop
> 
> These Rust symbols are trivial wrappers around the C functions
> fd_install, put_unused_fd and put_task_struct. It
> doesn't make sense to go through a trivial wrapper for these
> functions, so mark them inline.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
