Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C9D3385BC
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 09:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652709; cv=none; b=YZkAOdZDwZQcMSWO+OkeSNR9Rs96fzBLnE8zOQLbk3ZUty+lgDAkCTGvlqSfpNPkjWio5EGHoGwSIyTD10qfUz7Ip2kfBRT6Dt/EJwTYE52sxASdCjAsNUFB1r1Z75CYwcvEDk2RaTNuoGXjLF7A+8e1j7tpga1f0eaN38p+XI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652709; c=relaxed/simple;
	bh=Y/i+Kp6k0H4GN3F29K5jC+Y2S/PowNU8GApKouEwjFs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LP9nzAlD8j8N4GtAXpb638pZYGfgOlofBz8blUkopyOqGOd8s07qdf4Wz4JHkISZikcSXOeWYD2OhQ3s6wwHEfk7VQfcdzxX5SMhMTPQcr5NbZTmR9flrX1IIcx1LEENn5q/1Dyw2gNo8eMHi9z+IcokeFwcEYhAzl+B8vU7y4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uNKmhvnU; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uNKmhvnU"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-485345e2fdfso23602465e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 02:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773652707; x=1774257507; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uQL4a5h5hztheILgUGktpxEkb7l9DORW+uY33oC+48Y=;
        b=uNKmhvnURPyD1GOvmtDDOFbIxFTmBE9jsDPe3o6YzoukCPei5x0VTuCBFEY4Ty1Wyv
         pOtNaicB1I0yb1cZe9FDXtIyaQ0YcLBma4tcicPqh7O+/zmHgnPJHA160muxPxcs5k93
         ky8GWFlZ4JDai1y0/8o7V26WdqSQjDU+3kAs0HZW1IK0xr8R6AKNZSfZ/lACWLjTF0TA
         k7q/nfBqbgCOsYpSM7SzTi3nx2uq0EkP2p33tmXYDsBEhIjMNWxJnM+Lbhh+13GGqZB3
         Cf+M+Qw0Q4NKmp5T8sTWRnSeaERwFb/nQxOInF5gLf/NoMVrlspTkcljJlM3EKjSqPIc
         H3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773652707; x=1774257507;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uQL4a5h5hztheILgUGktpxEkb7l9DORW+uY33oC+48Y=;
        b=AgZ+009FncEFeLQAZ+AHkAiKVzhVvgyMAvCOgHmtCy+2ZWQlpG+JjMVCMSZ1wakZ6g
         zhB5oEnG4JziLn0+3oVUJzvm5KfJ1bX8r/bRBWMm9DTWYn1XxnuJ5Ttm6YkDSvXWjwuh
         iZdxzo3B8wZDrKhUIUhFxfENeUURJmtKSjXMtxz5u3X3XP98wiM8DIdw2xE+wyPzii9a
         fW+gipXdjonGkX7iUDuIRe12u73JKti0Q0SA+QFp1C+1WiNPfNwJW5THOC1R34BBb/Ba
         fdi2w8DTwMcJjCEURGHJYTRj/y+y3j6KSY16cywgwRfvV6sFu+uwzDgFWMJjiMJQb4OP
         ZYTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAzVxcxOCoMW8nO/b2XTuKXiOhpzMju0dc8OthpEHSmNntip8dL1uBqf9Tf1SGH+2rfdYzemEh+M6c6bC7pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJWprAx76mRiozVfwfSRxhd92gNFY8CcuEb5xKoUxcZD1WOb6o
	xNMzml9mWa/5VBNIJPZ7c8nognz3ZuiNAIhoRTc8PZl0lEHaMHQ1TdVflmqKof6FZ2r6HufgS1S
	17xfrzZxg6kyshO+dig==
X-Received: from wmgi20.prod.google.com ([2002:a05:600c:2d94:b0:479:2d82:5535])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3588:b0:485:5d25:81a9 with SMTP id 5b1f17b1804b1-4855d258656mr167384855e9.14.1773652706667;
 Mon, 16 Mar 2026 02:18:26 -0700 (PDT)
Date: Mon, 16 Mar 2026 09:18:25 +0000
In-Reply-To: <20260216-rnull-v6-19-rc5-send-v1-2-de9a7af4b469@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260216-rnull-v6-19-rc5-send-v1-0-de9a7af4b469@kernel.org> <20260216-rnull-v6-19-rc5-send-v1-2-de9a7af4b469@kernel.org>
Message-ID: <abfK4eji5jKSeO_W@google.com>
Subject: Re: [PATCH 02/79] block: rnull: add module parameters
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-block@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"

On Mon, Feb 16, 2026 at 12:34:49AM +0100, Andreas Hindborg wrote:
> Module parameter support for Rust modules was merged a few releases back.
> Add module parameter support to the rnull driver.
> 
> This allows the user to control the driver either via configfs or module
> parameters, just like the C counterpart.
> 
> Please note that the rust module parameters do not support boolean values.
> Flags that should have been booleans are parsed as integers and compared to
> zero.

Since this is uapi, you probably should support booleans here. Otherwise
it'd be breaking to change this to be a boolean later.

Otherwise lgtm.

Alice
