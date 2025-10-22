Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A183200C2
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 02:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761100024; cv=none; b=ahRC70nW1Tf5TShaWhbuGcge19uvasNFS4xx72gh/oeUQi2cNF59dogJArJB+HBxspv02IjVS7l3qJn0Bm3q7LI8h/ncY8VRNxRR6aNLtMRO7IAw0aZODFKUsPgd0oh1PGFIPT98PhX850SCe8cC9u0lPpFDjHcQqKzFSphbXIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761100024; c=relaxed/simple;
	bh=GHDQMCS5dEWxKn+0Txm/veOfLoI8l83ajhIWcN5rWOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k27h1QakzanFZnetmGyEA+dAZRDLnsfNejitCI2n4RB7jScwibUpYtlnTNInECeZ1IvGvhbKITmbsU0SIVyZLHH0g1vKoRA5i9xxscVOgCKyrslY08VqnGvJmCy9xHrBzdbTh84WijqJODAs5sMbmAEp0C6GsvB0kOziy2ovmB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mg+cjNtW; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mg+cjNtW"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7835321bc98so5664451b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 19:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761100021; x=1761704821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WqQzNiLchpkg3pgwyuDiy5UGt+eUDtmLfbzoo0ne91s=;
        b=mg+cjNtWy85MJ5yikxe1d5u3CQrZAjAaOamlRzfbcdkFc85wGXMOx7OimDEizRlL13
         txfW2OZvUMSY5eFEerqT7QTicfB804oqCBqCynrAlYUTxnsBqONIs7uIKiRQx1ktaOGA
         loKeDRjhNZyPV5Rmfbrl4X3ij+Zz7r2XmLJX/ilOvwgPp6gCuFVfiehV2L5iKcnHSVjP
         5PCELIx8MNhXM6fFehUhXBSUX35G/sCuqZ9nS7oBOqa/UsJPWmIfs5B6s5xwP1pBkLYb
         sjSYn6ux8ztx2kOSkpyBJ8c4L5WvphtjFNHRtAArdgUZ25ChBq3laCFW0RNTBtCty38g
         hTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761100021; x=1761704821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqQzNiLchpkg3pgwyuDiy5UGt+eUDtmLfbzoo0ne91s=;
        b=Q4MgPwlndFm6g0AzaGFgRH7WtN1MC9BeY0TzPnycMhEK2Rj5tDqG7E2WT73+WhX+0Q
         WtubdriWgbjQ/cHW9AYGd9iojATCuhKY81mp+CA6Pjxyzbs0XckAEGMuE6th9xwExDIS
         WzKLx1jBxWgPwtuZSPkhvLlB9XEeOHDe1+7s5cwtZQ8FNEp0d774/v+aSHfaQs7EovZ8
         edG/5KjL9QKhtYOySAOryJojNgwNOfj45ns7M7MJBqW8Ci7uwXoymneAfc8aGXRao9e8
         e3GzxBZquy9Q1lEQlO8VlltJHP+UTwZdxnnOtto3vHyi1hTqYhzwJ50PclsWuh9nIe7k
         mAGA==
X-Forwarded-Encrypted: i=1; AJvYcCW0qT2YcM4ZntwdIRj19vCZUAeKjT3UfmrRrA13XH4BFDbULMUC/TZmqPiIKSNRO5rX2zVzMn5PTdaYwivgEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2V79T/kLxzLvP6MRl2puxrv18J5/SgDBCWI5/S10dRe3PMj45
	7owAwypkfGfzLabjOurd4IROSD02o9DbmbfsS/h4RRIYqYd1F6u2KLc4/DfWUlW1L6A=
X-Gm-Gg: ASbGncuH+oPJKtPZjhOrNkvhGl/TAjrGvWbAHtmeRS/xvqxXXnSBK9NTTcX3UtR8OVv
	Qk9Vu3OEuzNTkxdB3X6LEAVq2HyFw3t+R4JSXphLkDlaibTmgg7WUQG8GQADNKn/ElNao0Ei7Tb
	Uis9ab4PA9MyPjZGc/FrkgWjBsEBbNYzCOtkW86T7FrXHmxNXBYKEO09xuyBEfjIIIV0fn8nrD1
	tlZarIyF3OF5XQtoLiQCknFQi1KouHP77zk3e21OlHklaet+a9nc3OE3AWT1cqhf6Opa70Ocb3B
	HWKh12RU14IaX47Nm+2qTjhGA2QfXpkNSrcTgyB0EIxI7WaS4sZl6QVSyjpm5K5Jv8YK1oPrTf2
	zdQmblv+rv2cG+A4BR/56Yn3ggRBbBCt2YiyszZUT68alvWHv9kEwywXmBs1hT45HuXnuTf80+T
	QkwA==
X-Google-Smtp-Source: AGHT+IEiODVZTmpBKH4GJGfRgQpdF+p0v4t2QcX4SapXa+98D5HxqE/HG1opMUzT/b2Bq6W9RKZPmQ==
X-Received: by 2002:a05:6a00:2e1f:b0:781:171f:df6f with SMTP id d2e1a72fcca58-7a220b14d80mr26349244b3a.18.1761100020948;
        Tue, 21 Oct 2025 19:27:00 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a23011088fsm12778187b3a.65.2025.10.21.19.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 19:27:00 -0700 (PDT)
Date: Wed, 22 Oct 2025 07:56:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v18 10/16] rust: opp: use `CStr::as_char_ptr`
Message-ID: <75keuxnrpd2p2lumgmoxpwt42ovsx4xyltq3dimarvlspjq3gn@cmadekc427tk>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
 <20251018-cstr-core-v18-10-ef3d02760804@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-cstr-core-v18-10-ef3d02760804@gmail.com>

On 18-10-25, 13:45, Tamir Duberstein wrote:
> Replace the use of `as_ptr` which works through `<CStr as
> Deref<Target=&[u8]>::deref()` in preparation for replacing
> `kernel::str::CStr` with `core::ffi::CStr` as the latter does not
> implement `Deref<Target=&[u8]>`.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  rust/kernel/opp.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
