Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F9837A4BC
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Mar 2026 10:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772707920; cv=none; b=H5pK8sOEUyDnT99wAyhvVfsyplVtVYy3g+Tw9DrJQM0MWTLEJ0/j8sXvDFAxnvr0rxS09iGvoe7AzV2JOs7KIlYjX5wxGYfZAy27p5jeVbsNNSmS8XevuUlV+DgtMZ6Ds67yPbjxnOVA2gUgyiR/llmjCFls136vrNXfE/NV0Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772707920; c=relaxed/simple;
	bh=zZqmM9VzOQ/O9cEt4xOeQgOy+8UiQys6mbbZHkCbCuo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bdyq++jO1xJ5cnTy22Ptfe34OU8RKtACBkRYI0z6qptuVnY6amQ8qUNsDbUAKP4vO9iyF+hcemP/QmgBfYHo2JnXFw55JPCdkWnSXSSmHA5XkBTavOwa0ASt6nZmiYMnZetoSD5wgHlfWfL7HQ3mqbnaaSe8yPDW/cAnr3nQ23Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gCKbRVmP; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gCKbRVmP"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4837f288194so63578195e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Mar 2026 02:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772707918; x=1773312718; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zZqmM9VzOQ/O9cEt4xOeQgOy+8UiQys6mbbZHkCbCuo=;
        b=gCKbRVmPQJUQsCwGNNf+wn+JtMZnx5jEiMbfOmtImosRGBdtp+670FuqDi0rAwAaSD
         Xr575kpJe+K1Dv4YxniU4cdqXarKXL+ZKl4zNg79U/W6kNLekXwMMuAC/IY8CrGEq4aF
         r9UzaB6QXJcShgk42gSSvXNLSBB92qqHkDegEVfaF26I+ockWO6goiuneqhOGVV7UYXx
         MfjWCXByJI17nYKNG4/sJLIxgXoi33Lxk7C22+lWNQNL5v+Sk/x2TT7gYywA8d8GgAyS
         SfQtE5bQ9wQqgRCZtbT5HChpg8r8MnJ1+hYEoCjq4ll5LqoFMCOtVe7UdsCJ8c4TBlsl
         48MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772707918; x=1773312718;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zZqmM9VzOQ/O9cEt4xOeQgOy+8UiQys6mbbZHkCbCuo=;
        b=lACRBgiyOy7Ka5XANwV5ARbfmpoas2ZiYGM5vqFZ+8SqpNsOCff6anLIw7VrK/WVWH
         wt/jgqwZsfKYjXXpatjyeLMgSU9SHmZ+sqDOR+Z6eLZWovEddX4C1HlJcgUkp7kn3WUh
         XfnJHiQ09TSGZipN29VwH/wI6fM8zaTP/+cdv4mHrZptsvXqnHOY7TWLzEc6a8PFA7ni
         h/8/tXgMgTnNY/YM3+Nd8vs8vkm2/pD2hkYIl3HkLI/gztfJl/t3RXqJh8wHe2Gs+mci
         QLJGjHozoQlrFOg581oCFof0tnGifWfnobfYIG13uhwzonAHgcmHgn1aMS8O5+Iv+DjM
         5pWg==
X-Forwarded-Encrypted: i=1; AJvYcCVkqr/LGGeiKsMo1watox9LiuUmFWfK2N6vT9D+q1HiCXedkSuSNsflOSxCWbFa7jDDRKSmiu9/5HTJXKst4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzou3cKhXq6Y1T3XnaOj7zdc/0sD+yT5ngZ23m6WPNdv/8S28gT
	qQJFau77ntYczbcC3aqS4oQa3robhhbY7WU1gSnoXCLpSO/zDRz6z3WtGd/BwTlvwzGHhrhYpZe
	MqsLpmNWSkBqAuqY4ig==
X-Received: from wmpb29.prod.google.com ([2002:a05:600c:4a9d:b0:480:4be7:3f3a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c8a:b0:483:456a:5146 with SMTP id 5b1f17b1804b1-4851989fc75mr80019835e9.25.1772707917693;
 Thu, 05 Mar 2026 02:51:57 -0800 (PST)
Date: Thu, 5 Mar 2026 10:51:33 +0000
In-Reply-To: <177270557911.104478.12699746103670684667@derry.ads.avm.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
 <20260203-inline-helpers-v2-1-beb8547a03c9@google.com> <177270557911.104478.12699746103670684667@derry.ads.avm.de>
Message-ID: <aalgNO1gRJdrWm4p@google.com>
Subject: Re: [PATCH v2 1/3] kbuild: rust: add `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
From: Alice Ryhl <aliceryhl@google.com>
To: Nicolas Schier <nsc@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

On Thu, Mar 05, 2026 at 11:12:59AM +0100, Nicolas Schier wrote:
> Reviewed-by: Nicolas Schier <nsc@kernel.org>
> Tested-by: Nicolas Schier <nsc@kernel.org>

Thanks!
