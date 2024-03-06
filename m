Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066A313E7E1
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Mar 2024 19:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709752540; cv=none; b=TM+ePWaL78SMZctQgajU37/QI6bFl/wP5nK9RfTkmK8mM/yuRgHWNwpouEeQN7yNJWFs4QOPa2Nzol29QnAWTxOLMJgx/Bjs3wJQOTbmM1wKXb23WpfdyTarV6nRfF3jUXUqVh2MbJd2pu81m13Bmt3xrE1+yQcbqW7tqAgnhpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709752540; c=relaxed/simple;
	bh=QuS9AXxHXDpbM5rvDh38jn2uMjdWYTRhLPk0WPIY3dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0hCpnVIBShXvBIawouOYxEGd83PRqb2bwW81KgvEUTJJuZIK6ujezq7gxdVI+L5xSsmzpBbUrhwulVtAsRrQO+pOEZJ3Bt+tdmnQuEuwaO6jE6idNtU/2U73u40RBQ0cQCqJV+rW1cakyqYBkn4grueE0A9fUsWmlRi6qZfUo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TFBZB625; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TFBZB625"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1dc418fa351so9065235ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 06 Mar 2024 11:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709752538; x=1710357338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jVzv+SoRW1+I9CQGe/RRjiGpq2ikkVRYKb843GfHzio=;
        b=TFBZB625tDAO2dwG5FHXDg6Augv7nDVXlXCvW6qeCv78fNVOiNI90uV5RUbrB+LuzK
         KkL8PqjTHY0JRUqGBIiSkv9K82NCHsY/Mk+SaCNMKbK0yAT6R8a/2Eah7f99wvqp+lzf
         Q8BFJ56Uo6/TQVYlZSQNcrlrKXQr2LxsJN6evoTa7jKqXrc99Rg9XB191HJFJ+kxLv3T
         jg0Ne6v3fhfw+kZUaLQ9zoV2gFNeRQ66qFen2kLwAJlfdYeC2eTL0aK9inNHFRn6fedb
         KSzqAMgXOnjGNDuP+L7AZbPVIxGDnIwev9QVKpqFx2MV91tlSkatrlMjvwnXRMehtH4T
         CRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709752538; x=1710357338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVzv+SoRW1+I9CQGe/RRjiGpq2ikkVRYKb843GfHzio=;
        b=DIbKF1FrhLtwMqO5V5YmQE4+7wauouQ2xyejw+UGDtb0TWCrxRTysokcZkZkPJz/kd
         cxWaorS8sjDI27Un1UdJLEKGzU8TegEO3LLd07eY8Xycjw0//FlKDj4eYyncDaqYV9j8
         j/+s6dvjYp0umAcoaWO7xtHynOPYkp7OeXixp2R+i99Xot+Qx+mydh0AAivy3kr1Mbuj
         hG8pzKzN6bR+5E6GU5UakrQDqWSDbC015onYlfgCgGmYgwYkHY2RaW9F4S5IjCMVURC/
         EMxTlIa0UIAjNCwK01cAj51E9Ls45j3nbPSp9UUWSkggTW4Q9gaSiT/J/gzw4FHKr6iH
         zWxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1veNFk71pA8F/aIkbaqH+klZUmgaJbGpXgNj4Zv/GnB1TtYjrbrPA0LmRAlFl2+trFHkGqmNMbZ1YjPxyAPTy7U4ZixHIauJbZPGRaPg=
X-Gm-Message-State: AOJu0YyVZIZya41Oacwb9XMNc/zPJyJg4TiAXzSYwd8VRobLVurDpDNn
	5qFBVCr6BlZm0X3SKAz//OOAxNNtvQw50E8L3OOtV8tYbFhrF+iXLQkZac5LHg==
X-Google-Smtp-Source: AGHT+IGuYdCp1Cb41tMReB+PFmMHU4FwyH+nvlsqKqWQhCiftNEMDk5tCFfJIakTDZEyeAYTvDWXzg==
X-Received: by 2002:a17:902:e5cb:b0:1dc:b64:13cd with SMTP id u11-20020a170902e5cb00b001dc0b6413cdmr1355783plf.27.1709752537788;
        Wed, 06 Mar 2024 11:15:37 -0800 (PST)
Received: from google.com ([2620:0:1000:2510:8e30:f1a9:3b07:78c9])
        by smtp.gmail.com with ESMTPSA id h15-20020a170902680f00b001dd090a7c00sm7520343plk.292.2024.03.06.11.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 11:15:37 -0800 (PST)
Date: Wed, 6 Mar 2024 11:15:31 -0800
From: Sami Tolvanen <samitolvanen@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Kees Cook <keescook@chromium.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: add flags for shadow call stack sanitizer
Message-ID: <20240306191531.GA454514@google.com>
References: <20240305-shadow-call-stack-v2-1-c7b4a3f4d616@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305-shadow-call-stack-v2-1-c7b4a3f4d616@google.com>

On Tue, Mar 05, 2024 at 11:58:45AM +0000, Alice Ryhl wrote:
> Add flags to support the shadow call stack sanitizer, both in the
> dynamic and non-dynamic modes.
> 
> Right now, the compiler will emit the warning "unknown feature specified
> for `-Ctarget-feature`: `reserve-x18`". However, the compiler still
> passes it to the codegen backend, so the flag will work just fine. Once
> rustc starts recognizing the flag (or provides another way to enable the
> feature), it will stop emitting this warning. See [1] for the relevant
> issue.
> 
> Currently, the compiler thinks that the aarch64-unknown-none target
> doesn't support -Zsanitizer=shadow-call-stack, so the build will fail if
> you enable shadow call stack in non-dynamic mode. However, I still think
> it is reasonable to add the flag now, as it will at least fail the build
> when using an invalid configuration, until the Rust compiler is fixed to
> list -Zsanitizer=shadow-call-stack as supported for the target. See [2]
> for the feature request to add this.
> 
> I have tested this change with Rust Binder on an Android device using
> CONFIG_DYNAMIC_SCS. Without the -Ctarget-feature=+reserve-x18 flag, the
> phone crashes immediately on boot, and with the flag, the phone appears
> to work normally.
> 
> This contains a TODO to add the -Zuse-sync-unwind=n flag. The flag
> defaults to n, so it isn't a problem today, but the flag is unstable, so
> the default could change in a future compiler release.
> 
> Link: https://github.com/rust-lang/rust/issues/121970 [1]
> Link: https://github.com/rust-lang/rust/issues/121972 [2]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> This patch raises the question of whether we should change the Rust
> aarch64 support to use a custom target.json specification. If we do
> that, then we can fix both the warning for dynamic SCS and the
> build-failure for non-dynamic SCS without waiting for a new version of
> rustc with the mentioned issues fixed.
> ---
> Changes in v2:
> - Add -Cforce-unwind-tables flag.
> - Link to v1: https://lore.kernel.org/r/20240304-shadow-call-stack-v1-1-f055eaf40a2c@google.com

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
