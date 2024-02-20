Received: from mail-lj1-f202.google.com (mail-lj1-f202.google.com [209.85.208.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F325BAFA
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Feb 2024 09:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708421749; cv=none; b=jUbdCWFtbU6NdU0MFaQXb2mXfsN4ZZkDZgWdiPZPTDAAyi7hscH9TBVPA35Es0YiPeTB3WdiOh4IbHBc6CX9fQKNQACiBmmely7pZU3S931pi4nwtYSx52SIyRPSyqpeNwE3vSrTyqaxLtJuv7jnobALYhFV58pLV1xaAeGs+DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708421749; c=relaxed/simple;
	bh=Hq0Cmy5FJkYWn0RlKLg2mQTAvevk9epBCAsv3Id1SNs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZDhKz+QqltQ0YF1O8c51vjc/5ue2p3ZpfLaus6L6KDPc2SbSJcKYb9fp8U7JM1sAC/DHTsaPvZXVbiAfsi92Ayqxe/NiaU+I9gKhJqskp/YPU/Pa+2RpbFlbZU6UMC8NXJshFw8bmTXcyEJq8rVjOwqdCRwWRXMSxdfpPu7H56s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mJ7JAnEG; arc=none smtp.client-ip=209.85.208.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mJ7JAnEG"
Received: by mail-lj1-f202.google.com with SMTP id 38308e7fff4ca-2d10d7dd7ddso47875181fa.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Feb 2024 01:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708421746; x=1709026546; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eGvW91C4grW9jhiVdhrUhasqpBxGbw0RjsBpYtBt9c0=;
        b=mJ7JAnEGg8quhRSBGZ0cFaVNo1ORtCAEQZWEMIGqwIjqTLBupG1hH1fbzd4RCNCIH9
         3shfCSFinYbnuVbmsA2ECa+cvBNE405ALB00uVo8yICpYHibHgcfdoEaTlXGBrdLpHNL
         kwvvagJ+nvbu04131o1fgB+Lan7DkatzkPhy5oM0i7i7kjBMrDjXqw8opTiKhQo3M+i0
         H0WFhVrjMOSniRIcB+DcYgzXHysNgp0f/yQ3CMbZdE31n3BnP0PzMUjvxnqbzW5zQF80
         F1JiKn2I8y4HHFGZQPMyjl5tRwWVOfFko5PcwwKRMV6Z7Ib97hf3r4Qhr/KRh479WXl1
         Ieuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708421746; x=1709026546;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGvW91C4grW9jhiVdhrUhasqpBxGbw0RjsBpYtBt9c0=;
        b=TL5kWmaIBrNVN0tXdaC4bgrfAKAdxycpx1O9C96eYe7W1G7fBVbm/Bv6UD6tr3SHzi
         LcXsrq6vv7TvJ6sfioGD+TbAC+flp6kv1ylfTkjBL0IFf3ywZPlZdVUaxBnTT4MfqfaX
         Cm07/Yt+ZKXy5UwnSPDnAIhhtvPAJRrm9yZNuHG7/fpJBOSyxPw9CiFq8BUBgIdyl2y9
         22lXAkWwZItVYLhw4BvH0ZD9tnVufIM59ywHJaQ1drz7+1+9B3h4vAfOwYEi5jYPjZnr
         RB8caInnMYyw8MLEqqHecNqF3qDmRo18ltCAKZJft89A0JxD5R+9ZBJ6yUCdBo5EGOb8
         LY5g==
X-Forwarded-Encrypted: i=1; AJvYcCVlFR6qQwMDS8WXRV5bB3J4Mn2b6W/G76ouCh9bdqaTSMtQVkpiYBwm6olqVor3PKgcvMxREmVGE5qeUnHGt7JBrUxOGXNXHnIDEKU/Eew=
X-Gm-Message-State: AOJu0YwHRMtdDfSn0Sc5xHNJPkyZHJyRDY2D+svb9X4v6eXjk/1KRehw
	k9d15smZKNlBCoKI7wAxUVIRoYFKsHHfSRzkU97rk0nCzxl0y2h7lkucn1J/E0+k/7zir/eKPBA
	op97luFQySXRJmw==
X-Google-Smtp-Source: AGHT+IFMRTrmb0//fhvPOtv3qog+JWK2GyME95bme+y5LFmL0oHTci1rMmg42oFwzH8JNMisvGMZxgj0+++A55s=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:651c:104e:b0:2d2:c6a:5731 with SMTP
 id x14-20020a05651c104e00b002d20c6a5731mr15606ljm.9.1708421746047; Tue, 20
 Feb 2024 01:35:46 -0800 (PST)
Date: Tue, 20 Feb 2024 09:35:40 +0000
In-Reply-To: <20240219163915.2705-1-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240219163915.2705-1-dakr@redhat.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240220093541.280140-1-aliceryhl@google.com>
Subject: Re: [PATCH v4] rust: str: add {make,to}_{upper,lower}case() to CString
From: Alice Ryhl <aliceryhl@google.com>
To: dakr@redhat.com
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, aliceryhl@google.com, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, linux-kernel@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"

> Add functions to convert a CString to upper- / lowercase, either
> in-place or by creating a copy of the original CString.
> 
> Naming followes the one from the Rust stdlib, where functions starting
> with 'to' create a copy and functions starting with 'make' perform an
> in-place conversion.
> 
> This is required by the Nova project (GSP only Rust successor of
> Nouveau) to convert stringified enum values (representing different GPU
> chipsets) to strings in order to generate the corresponding firmware
> paths. See also [1].
> 
> [1] https://rust-for-linux.zulipchat.com/#narrow/stream/288089-General/topic/String.20manipulation.20in.20kernel.20Rust
> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

This looks good to me, so you may add my

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

However, it looks like this patch has some clippy warnings that need to
be fixed before it can be merged.

$ make LLVM=1 CLIPPY=1
error: unneeded `return` statement
   --> rust/kernel/str.rs:267:9
    |
267 |         return Ok(s);
    |         ^^^^^^^^^^^^
    |
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#needless_return
    = note: `-D clippy::needless-return` implied by `-D clippy::style`
    = help: to override `-D clippy::style` add `#[allow(clippy::needless_return)]`
help: remove `return`
    |
267 -         return Ok(s);
267 +         Ok(s)
    |

error: unneeded `return` statement
   --> rust/kernel/str.rs:284:9
    |
284 |         return Ok(s);
    |         ^^^^^^^^^^^^
    |
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#needless_return
help: remove `return`
    |
284 -         return Ok(s);
284 +         Ok(s)
    |

error: deref which would be done by auto-deref
   --> rust/kernel/str.rs:677:58
    |
677 |         unsafe { CStr::from_bytes_with_nul_unchecked_mut(&mut *self.buf) }
    |                                                          ^^^^^^^^^^^^^^ help: try: `&mut self.buf`
    |
    = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#explicit_auto_deref
    = note: `-D clippy::explicit-auto-deref` implied by `-D clippy::complexity`
    = help: to override `-D clippy::complexity` add `#[allow(clippy::explicit_auto_deref)]`

error: aborting due to 3 previous errors

Alice
