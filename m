Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2242038DD8
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 10:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742208620; cv=none; b=h//YK3pa9fK0yJ26XRbDsF2i/P1a8M4lmpWjWst3O5MK7JLSEMxp7TDnH0YvZflIsA4lMAxka1H/OD3/SfEl0Yq4ayLkBmHlJM14Bq0wwU4V93IfY9NxMH4YeHmgD0QJe9zA7zGVvKrBk78HwKGKIRimnoyzr9JN9ivNr2YXPaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742208620; c=relaxed/simple;
	bh=apPmjzBp15h6BuYlIx9rExk+T2+yeZP997KXyoYkzB8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QY0aMDXYs48XNGQcspfDoDgsr/ZDZiS1K0wLHox6LB6/nZJqzDKX5B8vIdwehUslLuLVakruBMDF55rRDCRdJuhG4PsYHU04hPzxXFxZv7sgwAlJwmFvp60/ww/lZF7qSMrvQ492lZVcmr5FxnpBAy7TCHW2TPfuhxh0bHKlmCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eW4txa4L; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eW4txa4L"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf172ff63so11458325e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 03:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742208617; x=1742813417; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Up6B4MdDWj2/kfMDXbKASX6Gb+BsCApF2SDLkxZErAU=;
        b=eW4txa4L/DFmFPOhbq4NDINaMtF6ioqDelHNV792lyzp1BDzxFEEn7VrTZHLwRP3HU
         7w+Q6+ydGfhJTSDShFwYnkCqFoY99LQASx0Nr5hXAXav1PafsYX9LsnhH8Lw5TTOPvwi
         K+JfZMHWDzVi/dQxscRrhZZOSuObhZHTIcsXdS5UMjR+l8V8QXXH0pzw7uC0O2ZlNR9W
         9fP04x+xdXssO0JaDBlb29LIvo5Bi6Gtzo+2zrG8ZfnE2E44UnAZp0OgzDbL8chSnocX
         l8b/FG05DClaRFLbAs/Ifi35Hbc+Q76aK1DtytAi9lkev8Y50cQbChEL8+F+TkbS9sw/
         GP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742208617; x=1742813417;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Up6B4MdDWj2/kfMDXbKASX6Gb+BsCApF2SDLkxZErAU=;
        b=u/JjWn8CRpWzngC1KBR1eOTChhHZ6fEbOl9oQpV4By/LKCQQCx37LEJbTMwAS0Ra5L
         c2ekPKp/8klJ6KZ1mZdKuPnYxSK6XQWjqZ4xS1h+NzgVsnNiMimlUBmKK0vXw4dwlhiE
         Bv6l2E4TdyhstuQvt7UoRcKWVJ3inVGTlWeyfifxE8vu1vJpFUlhujPu9J3zyS7Phrn+
         eJsp63tjCm5KdEXtyE1CS3RHMRZAEQKw2lk9i5mXjI5hsBtgf+Zz/SuvBBRQqulyEgjf
         x+nY1hyih0LvmuemqmysN2ylMKGdS7500N8sklKyFcizAtGSz4UyK6LLkz5ql9ZBCyXO
         NIWg==
X-Forwarded-Encrypted: i=1; AJvYcCUXbc07fY167uDwNPzPd13hYvjPDhiJ3I+gToISwC+LPX/2TdHqS0UNluYzm2q9Mom8TjNg9F2jglZac3PoEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRSGWOpQq+kdlUPvvF2il/D0rceE5LJRd4SHo4lqB1Cimx28wa
	VMREzvLFt7JHEpmdWgFUGPHBJgI/14VW+34inJOVnoGw3OdZ6mkdiqzOUajG8ovCrcHMlVHrNk+
	mur1T2CLDNbLwjQ==
X-Google-Smtp-Source: AGHT+IF6IFyAlhN/n6Py4z3zsZpntW/Ns0z5jtqY9dqdYnp9Rx4qA7n2aFjUa1uf7DGmwKc656C0SK+M4oDPlBk=
X-Received: from wmqd2.prod.google.com ([2002:a05:600c:34c2:b0:43c:f6c0:3375])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c86:b0:43c:fa0e:4713 with SMTP id 5b1f17b1804b1-43d1ec66826mr115790365e9.2.1742208617612;
 Mon, 17 Mar 2025 03:50:17 -0700 (PDT)
Date: Mon, 17 Mar 2025 10:50:15 +0000
In-Reply-To: <20250316-vec-set-len-v1-1-60f98a28723f@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250316-vec-set-len-v1-0-60f98a28723f@gmail.com> <20250316-vec-set-len-v1-1-60f98a28723f@gmail.com>
Message-ID: <Z9f-Z15bSh8MA1wJ@google.com>
Subject: Re: [PATCH 1/2] rust: alloc: replace `Vec::set_len` with `inc_len`
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Andrew Ballance <andrewjballance@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Mar 16, 2025 at 06:32:00PM -0400, Tamir Duberstein wrote:
> Rename `set_len` to `inc_len` and simplify its safety contract.

You're missing a Signed-off-by tag.

>  rust/kernel/alloc/kvec.rs | 19 +++++++++----------
>  rust/kernel/str.rs        |  2 +-
>  rust/kernel/uaccess.rs    |  2 +-
>  3 files changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index ae9d072741ce..d43a1d609434 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -183,17 +183,16 @@ pub fn len(&self) -> usize {
>          self.len
>      }
>  
> -    /// Forcefully sets `self.len` to `new_len`.
> +    /// Increments `self.len` by `additional`.
>      ///
>      /// # Safety
>      ///
> -    /// - `new_len` must be less than or equal to [`Self::capacity`].
> -    /// - If `new_len` is greater than `self.len`, all elements within the interval
> -    ///   [`self.len`,`new_len`) must be initialized.
> +    /// - `self.len + additional` must be less than or equal to [`Self::capacity`].
> +    /// - All elements within the interval [`self.len`,`self.len + additional`) must be initialized.
>      #[inline]
> -    pub unsafe fn set_len(&mut self, new_len: usize) {
> -        debug_assert!(new_len <= self.capacity());
> -        self.len = new_len;
> +    pub unsafe fn inc_len(&mut self, additional: usize) {
> +        debug_assert!(self.len() + additional <= self.capacity());
> +        self.len += additional;

I guess we could use an INVARIANT: comment here.

Alice
