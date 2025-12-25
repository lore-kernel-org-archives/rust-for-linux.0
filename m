Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1563A218596
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 06:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766643252; cv=none; b=hteKrT5N0Ly+m9jGqct/oCc6E4R8eHyNzoddvhzOBN/LgmAgfMt+17+pzk8sLclgkwgDcNVHSt48sPeIWvcn9JsWxBUU4QjQdHBlCUcTLOF3kOPHii/cntv9FWql4LJa80pxfTV9eo8LXxGQ3WXOy4WfoQKoVmwzW+fMIVuE8js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766643252; c=relaxed/simple;
	bh=1AwlkcfZVvjZDjY4nYJPHlQCONjkDHy/pqctJgeNc6M=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=MAYJTJTLVzWjeiniMbcQuzCipvragBFi977JaBW2LP25BXqWtnXeEcRmt8McdgiP3bhX2x/DuALXGdzOyyWT9L+vPDJWZ95PKSzdlioyYc2PA/TmTJ0UbtuM6oYYFJB2uFcMvB6e1yF5N5tlkISMopsXLuttUqFKdmRP/m8hWxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hxdo6NZ1; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hxdo6NZ1"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b75e366866so3070434b3a.2
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Dec 2025 22:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766643250; x=1767248050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/+kZD3gth7mfEVNLG2QdLUIDikbAqwk1oHUMrXSf6Kc=;
        b=Hxdo6NZ11SM354CeESHPh+DDXaL475wdy4u1RiXgKxyiM6K1yi/EWPExcdpQXqa0i7
         wVi4x6Wd2cCt/NSJ0dramaPZNW4V4LTQvvfHseYy35UepUVLlExFh9G7gdVOtswWOW0E
         daxgrUUTpohr/VUkmXT6LLojkbhAAKVtkOnd9nmQ5/ru0fD1QwSN0/J0safMnYcUtJWV
         IvKzfiUP/1FSNlA+hVq4vyxwdGK1r0UvY1gDrxRtK+kC1v0EXJKt5ana7qMZQbM5d8O3
         qtP6D/GqwkCl3fgfzPcbybz+OUi+H8hOKpzZi0WVDu1XPd3AjQBma65xaTgRgoJblFoa
         jW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766643250; x=1767248050;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+kZD3gth7mfEVNLG2QdLUIDikbAqwk1oHUMrXSf6Kc=;
        b=USR6r4TlIN+0SFq6a8PNApQQ2RFP2mKQUMamY9T+uNe98SIOEvezDLfXF8KFDR8xa9
         t963in/6psAEfGS5H3hxhjSngIzxzJZP4qxFaRqa4eurjJXPLmeWHkIfUaNBxJ+7379w
         fTvql8TFNFsLn8Lf90d7+/I6+Q0KJOC9244mRS1up5sFe4yju0a+BFdGQwdsCzicOfC6
         dkWEmoXPH3ObKtHIOPuVT1eV3sL1fptWFqr9gjnVuYalUXDtDx0LeM3iWAufQPrrpWPw
         sg+hq6xxycyeeAYopaGpzY6HD7+LoURitLRnBih+k+8a0WqFnzxxQp98efurKC2od1qR
         KnWw==
X-Forwarded-Encrypted: i=1; AJvYcCUf5Vs95hwA7OrioycLTCix5+NcsjTOiGnbuFF9J9jbnGLprgmh7YtdIOKunhIwCJqcnk9XA6k+Ps1q0lErlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaV1z6gtJCo8hskt6dLUSzLAWjVes4PwtQ1K67fi+8b3JPf9QU
	dqFPrZLqr6+tXVH2uvL9WVUfUJS8TLpLZ/KiR4USJ2PZ++vsJdn0YAcX
X-Gm-Gg: AY/fxX4elMqVlieyKFqeK6McrMWiFlkyXZfNzflpX95KrCJQ3HnXtql3SZL0eS4HHIz
	rJq7L7I2ozW0FYg/qSXE6nsaaEiAMMnataZzftgEHOYrHPS7qcTTXxT0ScDgTaEtllPaJKyoxKk
	V/d+DfLv55/frZS79Fxwe+zlP68bknEf7vzJBdUYvpKbb1gbelpjBUFXQKtMhFowQ+3QhPn5/wr
	5gOfEwrMEbAbI88puv0vJYlXzeLQzEBaOaF2ocFwAhEsKKb/NVEXREWyym90fQK1d2VVaLSQq1O
	4WXmyzjnYV1w/q7uxwgYd5hwAXLMa14yAgcS4Jaw71L7aBK383LKEn+0SNgCWDibwAqFKJ+oETw
	rNzp/wO+FnrkjJMxzUfm/2ejTALe9g0ADgOjDfMccklwTfBAMUQVaf6+ZbODE/XwkXM70okPU6R
	2S5TiGyGR+EK2+GiKuYATyduw7JTEZhO5nUbVxujzSmfM2f4JqHYwCLgJLcDgbV7rDtNU=
X-Google-Smtp-Source: AGHT+IGws2Y1/nTMRqVk17/N3VHtrdy2RZ+bcZmqBRtBnGNMAJ4tOXEjbHz0mcmGe1RXeD1m/wa8xA==
X-Received: by 2002:a05:6a00:438d:b0:7e8:43f5:bd5a with SMTP id d2e1a72fcca58-7ff67852a95mr17285279b3a.70.1766643250302;
        Wed, 24 Dec 2025 22:14:10 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7ae354easm18393835b3a.16.2025.12.24.22.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 22:14:09 -0800 (PST)
Date: Thu, 25 Dec 2025 15:14:05 +0900 (JST)
Message-Id: <20251225.151405.1520374941153185311.fujita.tomonori@gmail.com>
To: gary@garyguo.net
Cc: fujita.tomonori@gmail.com, alex.gaynor@gmail.com, ojeda@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, boqun.feng@gmail.com,
 bjorn3_gh@protonmail.com, dakr@kernel.org, lossin@kernel.org,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v3 1/2] rust: Add support for calling a function
 exactly once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20251223121814.0b00f725.gary@garyguo.net>
References: <20251117002452.4068692-1-fujita.tomonori@gmail.com>
	<20251117002452.4068692-2-fujita.tomonori@gmail.com>
	<20251223121814.0b00f725.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 23 Dec 2025 12:18:14 +0000
Gary Guo <gary@garyguo.net> wrote:

>> +/// A lightweight `call_once` primitive.
>> +///
>> +/// This structure provides the Rust equivalent of the kernel's `DO_ONCE_LITE` macro.
>> +/// While it would be possible to implement the feature entirely as a Rust macro,
>> +/// the functionality that can be implemented as regular functions has been
>> +/// extracted and implemented as the `OnceLite` struct for better code maintainability.
>> +pub struct OnceLite(Atomic<State>);
>> +
>> +#[derive(Clone, Copy, PartialEq, Eq)]
>> +#[repr(i32)]
>> +enum State {
>> +    Incomplete = 0,
>> +    Complete = 1,
>> +}
>> +
>> +// SAFETY: `State` and `i32` has the same size and alignment, and it's round-trip
>> +// transmutable to `i32`.
>> +unsafe impl AtomicType for State {
>> +    type Repr = i32;
>> +}
>> +
>> +impl OnceLite {
>> +    /// Creates a new [`OnceLite`] in the incomplete state.
>> +    #[inline(always)]
>> +    #[allow(clippy::new_without_default)]
> 
> Maybe put the reason too? Otherwise a reader who hasn't been following
> previous discussions closely might be out of context (like me).

OnceLite is intended to be used in do_once_lite macro so this needs to
be const and no need to add Default (Default can't be const).

>> +    pub const fn new() -> Self {
>> +        OnceLite(Atomic::new(State::Incomplete))
>> +    }
>> +
>> +    /// Calls the provided function exactly once.
>> +    ///
>> +    /// There is no other synchronization between two `call_once()`s
>> +    /// except that only one will execute `f`, in other words, callers
>> +    /// should not use a failed `call_once()` as a proof that another
>> +    /// `call_once()` has already finished and the effect is observable
>> +    /// to this thread.
> 
> Nice! Thanks for putting this in. If this this insn't in this will
> definitely be misused (I won't be surprised that it'll be misused anyway
> even with this, though)

OnceLite is intended to be used only by do_once_lite so it's placed in
print.rs (if someone needs something like std::sync::Once,
sync::SetOnce should be used instead).

> Reviewed-by: Gary Guo <gary@garyguo.net>

Thanks!
