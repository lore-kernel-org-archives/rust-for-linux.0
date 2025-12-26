Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068571CD15
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 11:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766750280; cv=none; b=AHPpmBLSjM6nCc3qJ3cg7nHFj0qg2PAtc935AmvuH2nrz78a59i9YBUkoQnaoycYWmQrefFsfGPBeqrBofxVgge49M4nJOT5lYRbggOsBjZFTMfJCqzcEEvgDdFTcqaBfTGXkKBQn+CqmOh0rskBZAzNklZrbJg8xEKV11DQOMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766750280; c=relaxed/simple;
	bh=2eCh1IHhOXoELCHXFopo1o0ETw4HYL/sE/yrzU31V+o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hsrLMrNOrWgtjpco4Umv/EQUBFuEP7MymyaOmJggyv10orPAd85vOOaUF83chlhlY/7ur4KVJvugJ0dTIYwqUxye5/34oa+nuxIZWTyq9x+lVo+0aJF7gcm84ZxTutwAgJYM1RvEPW9M/3i2QIaavDltfMXBiPTS7UhdQo3KW5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CSzMn7pm; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CSzMn7pm"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4779edba8f3so51764265e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Dec 2025 03:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766750277; x=1767355077; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=agJeG/68xEvD7M+XiujPBsFRXTwXs+TrLYyYOqNfheo=;
        b=CSzMn7pmKHfQ/nbXdFbZ+T0Mwoq3zRfbY0G9vSNDKVyP0jIsAwosmoWlUQksXQTs5e
         ZbinLKISgPVWCc9Oh5BzsX3f4ta/S2j0flUOprCgcmkXA/SxY+bYadCel7MDkMUOAhSO
         8s7/4kdBlv2SZ5HS8Hpwte0zEbTGu0HN1gVhDGbAxoKveO1uQC9RbpXuwdLnU2dibn+B
         S78GbT/R3Dy5iw10cveuQ+/Cbh/0CzknPNKM7PS9ZhlizXsyhNhZvQhxUqsEIV4culux
         Npb0t2hlq8tDUwwFV0ySSzwDm2we+ajQmocOIJiQzPaM1f+cc/X1pV+w35qF9fGfZKXA
         96yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766750277; x=1767355077;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=agJeG/68xEvD7M+XiujPBsFRXTwXs+TrLYyYOqNfheo=;
        b=MZrq9cnGDeQcXFsFzpNRyXlKg4WVAJhxHTRclMw9WF3KwSqdeBzqcf0cLCplVAtOD+
         UDIof846EweggBVDOJ54+NklvBIjpvuELKYu47dpwOFvTfhznzNwWxKWJVb9j1ClxeXU
         mYWzwRv9W/oSu3Ikp3Lodv09jFYx8jcKLXpZj7jonJJEZKLVCOYv1ouz+z5mZBn/U25S
         ilz7ASPVYkLPT5AsFaP62J/FGzaKWu2gc2MtQzw0huoQmEFt47/8jH93QKf2SCq/pSK5
         e3FvxTtcbmesKXQOB5sm48Kw79Sui9wsDJbLl7cHpT3X+FG3Vzmjgam3pc0Vc/rpz6XJ
         uDEA==
X-Forwarded-Encrypted: i=1; AJvYcCVZlTT3X5jIXWicPjKjCEN8X0cvZafBXhM2HKgdrTiFyWeSUQwEW2+30H7EfHfA103+d3uf4DAKaShW/ONDAA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi3RDHCRsfPh0XCWxC5Tu/izOzZRk26ADPBP7MHLhvBxOc4otn
	92aVzrBAEDps1v8fEJ0Cm6Kw3QKRyWhob9dYD1rhzzjnB6rfn2VfkOC1pcn4nqZPRwMxj7Joojr
	miINAFaMSI5gS50ekyg==
X-Google-Smtp-Source: AGHT+IEbqIEGI/b1VDJLNhzir/U0axGf5D71SGHrV4CnW2da77fCnh39hYKVZWXul5BaQBGLExP2Ubn4H+3gPL0=
X-Received: from wmoe6.prod.google.com ([2002:a05:600c:4486:b0:475:df4b:95a9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c494:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-47d19582aacmr248025035e9.30.1766750277529;
 Fri, 26 Dec 2025 03:57:57 -0800 (PST)
Date: Fri, 26 Dec 2025 11:57:56 +0000
In-Reply-To: <20251222-cstr-staging-v1-1-974149ba4a79@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251222-cstr-staging-v1-1-974149ba4a79@gmail.com>
Message-ID: <aU54RJw2ZHImrY-j@google.com>
Subject: Re: [PATCH] rust_binder: replace `kernel::c_str!` with C-Strings
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Mon, Dec 22, 2025 at 01:22:17PM +0100, Tamir Duberstein wrote:
> From: Tamir Duberstein <tamird@gmail.com>
> 
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
