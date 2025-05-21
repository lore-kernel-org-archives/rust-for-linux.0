Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6675823A9A0
	for <rust-for-linux@vger.kernel.org>; Wed, 21 May 2025 23:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747868893; cv=none; b=JVJJbYcYPnqs5GZl+q0Z14TrBnvbjpP/4vZQFoSfjB4MYf2f06Sxq0d1LwSEQSZrceerT6JHzQTM/eTYpydMzRaClGPKAI4acqSrBA4fHw284+tqE2UHSxTq7g/EnBVHPbkVmW/CHFrC5jnT95nrpjYssdFCb6jg895UviSHq4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747868893; c=relaxed/simple;
	bh=hMM6ZBbu1Z03i6mNXQssFFLvBk0seumlrn1yafMIhGM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VhzzUa1ZPIuDIQM4wBFDgqSiiF15DzZBrLzPpxOlqTWaqMQbmcsMWnpAya9q48uGOBK8tatGpw/p4WbsiPC2aCCz6jv0Vjrx5fxX08Ol/xhN02L1EdDT/sg3k5mfzn87ni8JeIVYYFPsjv6taVDv5ZazmjLUjLbzdLxQN2uJHZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ECZVUJKe; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ECZVUJKe"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a363beb5ebso3376261f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 21 May 2025 16:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747868890; x=1748473690; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bk7nkRmDcObELLV9MxxzQAakXc5EAbtIqWryuUZfAWw=;
        b=ECZVUJKe999kjhp1BabGxJNk8wNze3PPeoxzeuHUcrepj/lrff6zhLxcTD0sKsUQFI
         XV896lGzFSb8Tou7Ze9AGXMZ2gDnWeopgcykR9bxBny+MKmJstNviZLOtquPGdB6nIw1
         apht+GRCPwRVGZLF9dHKDQkunDbxJhsr+4qJ8IiAChLxBPUEUf8NYlA20qTj+RMTXW9q
         sYJ9jhVSZVT+YA8nOhRH8JEomhdnLJKW7fpJokZCXvTgaSE8EeDQ7AQlQYxB8EgSTeyl
         7OVS/zcesw46plVJTII/lHTpjZt4UTW8nUYn/vELrq6Q9iu+SWCEQuOM30eelzFCV48o
         82aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747868890; x=1748473690;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bk7nkRmDcObELLV9MxxzQAakXc5EAbtIqWryuUZfAWw=;
        b=SEvekfiGBzgaSOSaalmCK23OMloww2UKTi57QTs+pRkX2I5ZhCapdWnNSOk6JFf8Qt
         jVNOXMd+z6wsWM3IQ9VGUR3e8P6WS92rINrfL/GGBk3Lh9saO78vbOfzDdx7X4oEBbSH
         zKQWn5mT7KNSvYI0BS7nLIgOYXycxRI1FXbEsKu1jWoAii6w/i6yovzQvYqENrgROCU+
         bO6oVHs/tLtrh9vGSYsWWutTQGrcNpkS8kT1ZAEaYozv+kxvhDNeNLYfo309u+zDiTdf
         qDU+/it41HUqE0aJXR6U2k1yVScAnJrt4QcyDJc6pBxzFWG/nNqwBjn28ImDoqVbKj9m
         1c0A==
X-Forwarded-Encrypted: i=1; AJvYcCXVOh7m0nflzj2Zg1f+Wxd0AJjDMivl6FAs5yLrKOe9ioAaWoyOYfK7RLEaqVe1BHyuhgPU3uSaGhA9L7TCHA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4f3hDOAJ57E7FSqgnpk168NFYSr6If8pWKSPG4U+zSMlKk76v
	V/vgeTa33/vxp52bc1eEj3h5BgIYVgvyvwq6SXLibByXhEG9hFLyRyzysC11Sp8IteVHAOTvYO7
	o4ATbGsioeCZAPjK0Ng==
X-Google-Smtp-Source: AGHT+IG5Ak+y0NsqThQ0r4o/665aH/C7btSt6+oGGDb7eAP6t0rwrL1Vx0qKYWSkRmlwXLgAu2h86m5nPyQnFjU=
X-Received: from wrs24.prod.google.com ([2002:a05:6000:658:b0:3a3:6a36:d12])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2288:b0:3a1:f937:6e7c with SMTP id ffacd0b85a97d-3a35fe67a7bmr21858924f8f.22.1747868889839;
 Wed, 21 May 2025 16:08:09 -0700 (PDT)
Date: Wed, 21 May 2025 23:08:07 +0000
In-Reply-To: <20250311133357.90322-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250311133357.90322-1-richard120310@gmail.com>
Message-ID: <aC5c1-VXoAIctyRI@google.com>
Subject: Re: [RFC PATCH v2] rust: list: Add examples for linked list
From: Alice Ryhl <aliceryhl@google.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	jserv@ccns.ncku.edu.tw
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 11, 2025 at 09:33:57PM +0800, I Hsin Cheng wrote:
> Add basic examples for the structure "List", also serve as the unit
> tests for basic list methods. Including the following manipulations:
> * List creation
> * List emptiness check
> * List insertion through push_front(), push_back()
> * List item removal through pop_front(), pop_back()
> * Push one list to another through push_all_back()
> 
> The method "remove()" doesn't have an example here because insertion
> with push_front() or push_back() will take the ownership of the item,
> which means we can't keep any valid reference to the node we want to
> remove, unless Cursor is used. The remove example through Cursor is
> already demonstrate with 'commit 52ae96f5187c ("rust: list: make the
> cursor point between elements")' .
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1121
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>

LGTM.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
