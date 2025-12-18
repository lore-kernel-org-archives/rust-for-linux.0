Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF972EC0A5
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 08:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045097; cv=none; b=TupRiIgr7VE8k578YsrXslZCfH2tp6j7xqPwSSUCTKurl3YPTRKujxE9Lo1aqrasiOQ9tiHpNCtVL3ook+06pCyLCrkxP7wLCNCQ9vzF5/w4jVUB5jSXKcZFmh1Qt32i5IqLihDVHgwrWFcdMVdr6yEsyo9AUfk8T+7xX2oRjKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045097; c=relaxed/simple;
	bh=NUd5AcgRvTDuTrZ1REbyrgL+ZTzogIQHOWuhPeTgQXk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f+EwW2UIAFTGlMLo0tMsgjmx4r4B4z0tPQE///YLnAISLAhPZ/C6P10sF8XdrLNdYkCx/0vG5atJr8J9XBnhSq5vE17EU/TI01hl8DJJkVmFH0cwi4Rthkf3LsckHMoSklrNlwoP6No/ch8FBdwQ0fJHjngyLb3mbvFfeT4YI3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OUlOU3Jr; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OUlOU3Jr"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-430857e8450so200339f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 00:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766045086; x=1766649886; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UOIxGzdDAI2a7NEgY20DQg343uEALMeNLgWYcgrnAd0=;
        b=OUlOU3JrSvI0DTqvNTqNpqD5xPMpPtOe7X2XZ4IGgbZ6z1gNOLu2paafknBFMjlmn+
         4vwJgFEsrKuqXxp8wiL3rPs14HX7A7H+jGR+a4prxA3IxMgs4GJ6uLIH6tD/CsvAku21
         QCWqknOlF+uulIdGSGNJ43iF0mADi62W3YOsi+/EgJ02ygapvzzH60Xc3MjcUCKFqpOD
         0FtwrdeaAIQZmlaYHxxzg8Iq7/5QoQz4KYsb5Q0iHVHMShjWGd/2QhqD6CYBlO/Blvtn
         Qbp2TvrVoNCh2uNxHQUJMT8zVT4oCOdk6Od6UBYo6keo4P4FH9etoe79gyrbpHKjBW+w
         czyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045086; x=1766649886;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UOIxGzdDAI2a7NEgY20DQg343uEALMeNLgWYcgrnAd0=;
        b=TmXMghW+eKTibG3rG0loEUEvDtxvx3R9jAl96VJeW6OjAMlmyTFyc/hehv44yLMRt9
         QyrwMockNQhb1jryZ07N7Il0qw/BxWGAYY8LhyqxZeAVtTAlMgFqtZwRp3OenMEDJsB3
         Vf58BWyCSblIauMWq7+BY9jrq81pIRGyr+EO00gW9nwCqsDK6B7QB6SeSmiihyu2M3yc
         9HpQYNhMamQBKJdX8QKP8L7mTvD1uvFYlOSWBEyLyjEwjuY57OaoW/22RYgUxPhMCQ7z
         VQ6KQ53VNRT4RTUt6pdYVNwZv+Ro3ocv7wbvu/iAtGmBMePP87dh6jouCo0+DsFVtk3M
         tQPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN/3+SJK9XuvkgtGTX7oCmJJ0Zgd6eGh8IAlKLh2VX5yDMZK4Vwg7Ok5uUVwI7WuAwRKA/E4TGevavSdnX+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpxtO+LABqaTqU2XiP6XOolKu8bIj/mS2jlwFmVDuOKRp6fKh6
	Mw9f5eW3J77Apak+Jrtl0JR0H17XiWKiLBDXERfwVARFNOA7ENulnx3aWTAhCj6Z8cBG9cQPCbc
	0wAyJqLEnsQkPu9YifA==
X-Google-Smtp-Source: AGHT+IFoe6E+Fn2RBqAajB4oC9zY2e2q5b+lhNLjNi07Cp+Y5QNxVuJ9/9Y7AyjR+dh4y5OfdUz+Rm0XXS6gbqA=
X-Received: from wryf7.prod.google.com ([2002:a05:6000:1a87:b0:42c:c2d6:29d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:584f:0:b0:431:8f2:e6f5 with SMTP id ffacd0b85a97d-432448ca2damr2436212f8f.30.1766045086205;
 Thu, 18 Dec 2025 00:04:46 -0800 (PST)
Date: Thu, 18 Dec 2025 08:04:45 +0000
In-Reply-To: <20251218032709.2184890-1-sunke@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251218032709.2184890-1-sunke@kylinos.cn>
Message-ID: <aUO1nRdaAISMjMTG@google.com>
Subject: Re: [PATCH] rust: fmt: fix {:p} formatting for raw pointers
From: Alice Ryhl <aliceryhl@google.com>
To: Ke Sun <sunke@kylinos.cn>, Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Dec 18, 2025 at 11:27:09AM +0800, Ke Sun wrote:
> The fmt! macro wraps arguments as Adapter(&arg), causing raw pointers
> to be wrapped as Adapter(&*mut T). The generic Pointer implementation
> then formats the reference address (stack address of the variable)
> instead of the pointer value.
> 
> Add specialized Pointer implementations for Adapter<&*mut T> and
> Adapter<&*const T> that dereference before formatting.
> 
> Example:
>     let ptr: *mut SomeStruct = 0x12345678 as *mut _;
>     dev_info!(dev, "ptr: {:p}", ptr);
> 
> Before (wrong): prints stack address of `ptr` variable, e.g. 0xffffc90001234560
> After (correct): prints pointer value, e.g. 0x12345678
> 
> Signed-off-by: Ke Sun <sunke@kylinos.cn>

Ahh ... the goal here is that trying to print a raw pointer should not
compile at all. It's unfortunate if that's not what actually happens.

Alice
