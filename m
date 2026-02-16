Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277A9273D8D
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 08:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771231925; cv=none; b=B7V9VRW2zMXxmFnaAfADtDnpru9wzResLjaOirO1/61IZ+PqNCbde9cRpiJ3EhLtKleSnw6VfrBblPzi9f+tFd5mZkqbEMO73eYByCVz0NRcsB4RKGrFoTpWkT4SXspXb1m8Mzr05m4EwNNmZOd3j/y6H2NUs3xbfKdj9eozHoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771231925; c=relaxed/simple;
	bh=Mm4a36sb1UZxgVEdUjrkBvqdvl5PSflqiquLY7npOW4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Voa1l0gEuAajidptHRetMBl3GKqLpBkqve9GWOUl3RPkVJXtyGxw4AxUDl+AUAFQxsPMSYJhDMQxn4xLZiKPlSP8/Qztiu8hrSxf02fytYfWS5Yo8DoR/092hW8EI/0VyOPNWvvoGsv5ds2Z1FN3D5oUvC6xszZWqWXCK6Fo0l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ES4AwBmz; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ES4AwBmz"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43637c70876so2309740f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 00:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771231922; x=1771836722; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kjj5IXbObxNi606Z5qjJ0Qk+HGDfGi8eP2D19UZKb1Y=;
        b=ES4AwBmzlWbwunZTh1JNnPykwwuqG2mL7LJYj0nbFp529CYAQ6KUEzjPrmK51oM7HW
         9vYY57FRVjcEFLpVk2k+YaiUt3ePj9jpYma4OqIqtO49xPKO7bmwnIlULlreFkdZoKm0
         wgps9vkR3BzEC2PlE2QbKTamPhOtGXH8hH5OCEYcnKv0AhtCU3sokPbxI7B4EQUbrVm7
         hLb4/QSYGpNgKwVTOa/gHBxSSYyMhYn1yHn5zMnyBhYYVZY62grWt9o8TVq3y+/9ji3D
         kI5LRMwxYwuWAXkPCSUjGMHHmLejMPoq3vMsiABuMqPcgN2rwI6Mbd/iiWwnGER8nIXH
         HH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771231922; x=1771836722;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kjj5IXbObxNi606Z5qjJ0Qk+HGDfGi8eP2D19UZKb1Y=;
        b=LEcVRBwwd7LOq+0c6UNWujBjn7ONy5jDxfd/tkgjMMze8nUjoV3tr00M+MC9TrPpvB
         okthsprkKeNgSl0+djMsEWtVXbZAuR7AS36kF4Qcezppm83Ep70YIMvRsOohGM30LcKV
         chjKrbAAuqxb7HpoxtG1H9q7m4XNNKCyrf7DIowbIa2UCUQF0bUjcX1R8Q+jTv2fbwJn
         CNO1H5A9pcVdCKBdCHs/nHjgyjwTWng5GbkAy2GJBYqgSRNspHrH1T1OQV87frMzuNeF
         xhRuaCHC6QtPoDX5ketoWdIdVZQiobKCvp1ahGDgd+KmTwteldLFQeTx8/4muVBCF/R0
         rRsg==
X-Forwarded-Encrypted: i=1; AJvYcCUYxgWTFh602RmmoC+FKVzOFVSQVSSpmQtLlK8Q1Z2QPVF+U86kVfw6U+kz7gg5FHVFnrbAkOEclNTuMP7NIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfgj5ijgJRk3jqvAjTJJLyKgcS9UVHrCCL2FgLW7bSrvVyR4cp
	yHlWzsDr9lwusU4OZY7F5RiSH2qGrrqJ5UWg6c4gjiauA3zOFdKdXz3q68shEkRXtpX3rECmd+F
	d0usRparwGTR9eo7gSQ==
X-Received: from wrvf7.prod.google.com ([2002:a5d:5687:0:b0:436:d0e7:35fd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:240e:b0:437:6906:8235 with SMTP id ffacd0b85a97d-4379db2576fmr11778027f8f.3.1771231922263;
 Mon, 16 Feb 2026 00:52:02 -0800 (PST)
Date: Mon, 16 Feb 2026 08:52:01 +0000
In-Reply-To: <20260215-page-additions-v1-1-4827790a9bc4@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260215-page-additions-v1-0-4827790a9bc4@kernel.org> <20260215-page-additions-v1-1-4827790a9bc4@kernel.org>
Message-ID: <aZLasQroRyhfiplu@google.com>
Subject: Re: [PATCH 1/2] rust: page: add `SafePage` for race-free page access
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Feb 15, 2026 at 09:03:30PM +0100, Andreas Hindborg wrote:
> `SafePage` wraps a regular page but adds an invariant that the page data
> area does not incur data races. This means `SafePage` cannot be mapped to
> user space or shared with devices, and it becomes simpler to directly
> reference the contents of the page.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

>  impl Page {
> +    fn alloc_page_raw(flags: Flags) -> Result<NonNull<bindings::page>, AllocError> {
> +        // SAFETY: Depending on the value of `gfp_flags`, this call may sleep. Other than that, it
> +        // is always safe to call this method.
> +        let page = unsafe { bindings::alloc_pages(flags.as_raw(), 0) };
> +        NonNull::new(page).ok_or(AllocError)
> +    }

Could potentially just implement Page::alloc_page() in terms of
SafePage::alloc_page()

> +/// A page whose data area does not incur data races.
> +///
> +/// [`SafePage`] has the same usage constraints as other Rust types. Thus, it cannot be mapped to
> +/// user space or shared with devices. This makes it safe to reference the contents of the page
> +/// while the page is mapped in kernel space.
> +///
> +/// # Invariants
> +///
> +/// There are no data races for the contents of this page.

This isn't really a great invariant. You could say something more direct
such as "has exclusive access to the contents of the page".

Alice
