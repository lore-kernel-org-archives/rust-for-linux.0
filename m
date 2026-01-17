Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F89D333720
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 13:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768656572; cv=none; b=PXtIrsiDuth3Ugq+taip3A9OeHmyGaojEkPtu2TJfpeipex+lD8QOrFSxn+pkCRQSxrxgjR7AsK9gSs7j5rwUsxab66JkaBZWkIjCFKcIXKEX3X/6nXsWkEFHqxKMG06uO1YccSfFSM9ujJBqbQ0Ra/WM86q0e5G02cCkGYf93s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768656572; c=relaxed/simple;
	bh=yGX0/BmN4QSqMec6LsJaLEgukSwhg32D3RH18NXGaE8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YbKS36m5nYQfrpUrQWnab2XePKKlrc2ZQkZpmmf3aVNXhWo1YWorlAxcq+XCjEhH1WGly4Itmai7G8YDJDxG/dSxKt6iummQuYCAWKABl1LYYJF/mmbfcWWLUTpgcxlM2O4CEykYtsZ/7eEmNmwIVe3X/JwRXQfGajnL8VTr5B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OMmoqa4z; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OMmoqa4z"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47d3ba3a49cso31527485e9.2
        for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 05:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768656567; x=1769261367; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yGX0/BmN4QSqMec6LsJaLEgukSwhg32D3RH18NXGaE8=;
        b=OMmoqa4zagEyy7TtwRhjLszgMA2QqyBdA0uSwG+DMytf4uLSA3VnypEjrM8fvx/dTf
         HtHD+cvLn49bOCxh/fMtupnz+Z4r18KevyNKGkZo3hT3l4iDdkyuTbuWVFjM3z6DSGkA
         ZmIi0WjkrvD1ghTXhnVZnlrr94B6ZhzEctkIEN48wISPtlGUOsljfHTvOFtCliyfBqb0
         uljFDcyEqAX88ZPDQKqZ6CYSDar2SJ7KqHit1lFaZBfQgLXEAsKLU5NY1DoriZaw7/sl
         Bua8Hwk1jGkvsmEt7tnFBrvEW0caMtgGFcLLYtUtqw54lxZpF867PSit5C9aSwRtCSpP
         3ZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768656567; x=1769261367;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yGX0/BmN4QSqMec6LsJaLEgukSwhg32D3RH18NXGaE8=;
        b=K2/EI/JQ9ohr9z1zIwYei6LRbhI5UqalzYEw842ad1H1ZvvfybFZXvyEs5zeKb8uZM
         SFKKH7kRD2e6KmSTwBozRsz3PFhhE4VLpWTmnICM2WfUrGTwna0cFFWg5Z35pFLdGKJG
         hhMTWCSbxXC1DfrAY4x76/3OgMgqyFOdfHxsMsceGo4GnwjdRTUXATt0NvFMJezlmJc6
         Ij+gxI3E79wNAKSKynng5suDzGwmVjbOhTVELHNVMjIV8Nq63QW2ioSpIuApKMhb9qq5
         F1174VZM7deep3nTZqJCG2kvX5xpn5pwylFBEDGZL/O8CN8k0l17i+69xQiJU/7auvs0
         CDXA==
X-Forwarded-Encrypted: i=1; AJvYcCVrXOx52FjLEi45qwOLN5EP5IslBW5FfHeZn/F5pKv/bffC4YEjxVlZHrp4PYavlrF3ZT1J34u70GKv+1fpzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YykaZz8xAJ0To0yyT0X07YQQxh28D2YDonwQ8H3XBANaNEg58vt
	PyxZ34Ybr4cY7zqJnChNhY42xqDOrugfojuz/+jG5cAzacarUTLfMjYwfEAUcxTTTNcXycxomOl
	wnmmjDRCMq7lRHkKASw==
X-Received: from wmby1.prod.google.com ([2002:a05:600c:c041:b0:47e:ddf0:fd00])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35d2:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-4801eabf1c9mr75158475e9.12.1768656567159;
 Sat, 17 Jan 2026 05:29:27 -0800 (PST)
Date: Sat, 17 Jan 2026 13:29:25 +0000
In-Reply-To: <aWuKlR4a-VJhBeWj@tardis-2.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260116-rcu-box-v1-0-38ebfbcd53f0@google.com>
 <aWrSkAPFkdH_tvtN@tardis-2.local> <aWt4muGXbe7lBmXt@google.com>
 <aWt8Ze-otTkexNIe@tardis-2.local> <aWuKlR4a-VJhBeWj@tardis-2.local>
Message-ID: <aWuOtUa0mPDrnbke@google.com>
Subject: Re: [PATCH RFC 0/2] rcu box container for Rust + maple tree load_rcu
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
	Andrew Ballance <andrewjballance@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, rcu@vger.kernel.org, 
	maple-tree@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"

On Sat, Jan 17, 2026 at 09:11:49PM +0800, Boqun Feng wrote:
> In Rcu + RcuOld design, RcuBox is just a Box
> because these two pointer types handle reclaim + accesses.

How would that work? Dropping my RcuBox<_> must use kfree_rcu() or
synchronize_rcu() or it is unsound. So it can't just be a Box.

Alice
