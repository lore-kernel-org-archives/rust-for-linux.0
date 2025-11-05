Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC4B2DC357
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 23:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762384364; cv=none; b=kiB0oayvDyIlKhDR/WkobQhU30XHTC1SZLfzelNMm7sPTJDcAjw3wG/KxFUQVP0zUPZzIFbyly9yBay/rP/RDqI2SmwmJquGSK6Pfao8h2eFjhrkBDmqaIMbsR7WrNKR0A9nPu+nAvkMhrlwgJh8fdzdbGaCkLwNO1mYuAxiGN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762384364; c=relaxed/simple;
	bh=dvMaeqdRm3X0eBwmCQUmVUo00FGHV6YO32OYrUAPaPY=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=tMoL0XKXQdDvNqRJP+PXl4HKZPpM5vns0WOhzQ1NjNpvM8FZeeXqLKtstmQ0Agw0ctbjpkzH6n2W2VblqKinS/yoWHQcpfIXcK0fv9dFAWTZXTHr55IM6wMxlmwwr9cErR+4JriUgbSc6/9kFzKHoNl1A0hZYGxwCzwfBpb8fPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrP7XK+4; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrP7XK+4"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b9a5b5b47bfso184556a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Nov 2025 15:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762384363; x=1762989163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfsckXkWvCxUkzfARcgHLQ+q8T9kTH2pn6qvOIriOrM=;
        b=nrP7XK+4jVRxGs7O7m+GiA7U7EORyTxT3MAPW/Uq5Wl8xGSu3nvlOlLeT3pwaZQlX+
         P5O2CLJ7Pnpc/cwoPJvAobX3H42goY6/CGH0wIQzr2dhLz8mY/UcnUb2VRqKX0X0UvTQ
         anp1t85kyfn2Hs3uaMqcIuV55YFnLBRg7ytEfGmtLhr5mtflJ3mmcgCJ9ABULVHgdlUD
         KSRHR/JEMSKET8vDFOA3ljR4zbId/sBQGuoYjDJyVPRBE5sPHeWOYPuIWs0uAaJ9Z9r8
         BQEnheYLteufTMty+U/+4XpnubQEUXmgq85l2aZPSAVhVWnB0RUj5Y+4IhKQO8W6Vc1/
         Di1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762384363; x=1762989163;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rfsckXkWvCxUkzfARcgHLQ+q8T9kTH2pn6qvOIriOrM=;
        b=RjzHoFOFdsFlpOc03RyDMg212moOjuWN0O37tMnR3LWV8XNkcoSdBnr6Ff8WXF7B2y
         NgHuCaSvgTYq5o0fivJdJHZE1L3/W2Wk0fbNcExF1SHJACMPLAdYfaJGuFjdNpfM30m1
         U04AaCa8+QNEoUelKF+Irk4cH40BnCVDgixKhFj0ZDJIONuvrajFlJIONFENFkYqehOK
         LJdYP7pxncVpiMGbWmYw15Li+BosEeK3lP8zcFsQzG4ZutMIMDc/DlIFIGJ16JEnopYf
         HCpQKP5YengklZv/TKI80WKc96g397YKLhx/g/oMzWNl9JWMSDmr2UeqwyW4dzXhyHE3
         pULQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+K+Xhb1G8YnaUZtARCFR+aLTTQva3TzgDGy4IVgZ5bhWlStkZIVrJC/1xi9t4tQ3M4Bvu9U68X2TRBF96hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFUZzVaKU/mWLF9/ark1W5urK5Y8inQaVEMPzn3mfR4y//vmBY
	ukiwKSV3B/AobW9AofaZkgPI4jdzQXGAlbFfAm5Z0nBMhE9nG+00epBZ
X-Gm-Gg: ASbGnctuxzEjHbMOcLZQUN4LejszRnBfUnLbrK0/C4rwKoVe25E6cpjqexXMz1DVoqg
	DRnpkYwLQV+mgSkevAJtikcUOfOyLyplBPSDtAw0ypfVZsVKl2Jsi0VQelKHTd4OnpWEAA48PfZ
	vDU9vSFQFkaPPiOl5HCp4mDPf8eJOoMFhRTINhVRm1rGHOCU7QiEo5UAIk8sgg1jpN3QXI2r6KR
	bPRNwCowo0Rr/upMjmqu0kPh+EQ/dkaOCyMN4VZS4lVVwGJkoxm26rkpUP8UPcxy30dfB9KzXAQ
	pAt5dqgJh12LOMlG3aOy3DlacHJpRHMeI8EYjDHVW6+XIdjikxxWFMCzn3yQs8c3Wl6r3hI4c6g
	I27QR/BzWF58+8/IewD8/hwgN7IqrbjeLHQe4jhLSCvGqnW91V8qsZ6uTYf2oyYMjg/Q1XsOM5j
	e55jbqtvBHrO6Ok6crHKQbcn2K802LfAlEOlowgddPD2c1NOWgkp4w0Q==
X-Google-Smtp-Source: AGHT+IHFc5NL6wBpD10jThR3g94MU/wyYyeAa/6H1wjAgZn5hjOSfdijuvyZ0f1/1CQfJ4xUY2w/gA==
X-Received: by 2002:a05:6a20:1584:b0:334:a9b0:1c87 with SMTP id adf61e73a8af0-34f840087e9mr6508959637.1.1762384362701;
        Wed, 05 Nov 2025 15:12:42 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7af7f7563besm567338b3a.7.2025.11.05.15.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 15:12:42 -0800 (PST)
Date: Thu, 06 Nov 2025 08:12:31 +0900 (JST)
Message-Id: <20251106.081231.149919562701074305.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, aliceryhl@google.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <87pl9w6vs5.fsf@t14s.mail-host-address-is-not-set>
References: <nsSZZk6z9Ia7Gl5JS9LVNDRjc-9eFvtSWyLI4SSjsHNouDkDV-GmXnixMYlIpGHryPfhLr8Z2W_CkWd6D2frYQ==@protonmail.internalid>
	<20251105054731.3194118-1-fujita.tomonori@gmail.com>
	<87pl9w6vs5.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 05 Nov 2025 21:59:06 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
> 
>> This adds the Rust equivalent of the kernel's DO_ONCE_LITE and
>> pr_*_once macros.
>>
>> A proposal for this feature was made in the past [1], but it didn't
>> reach consensus on the implementation and wasn't merged. After reading
>> the previous discussions, I implemented it using a different approach.
>>
>> In the previous proposal, a structure equivalent to std::sync::Once
>> was implemented to realize the DO_ONCE_LITE macro. The approach tried
>> to provide Once-like semantics by using two atomic values. As pointed
>> out in the previous review comments, I think this approach tries to
>> provide more functionality than needed, making it unnecessarily
>> complex. Also, because data structures in the .data..once section can
>> be cleared at any time (via debugfs clear_warn_once), an
>> implementation using two atomics wouldn't work correctly.
>>
>> Therefore, I decided to drop the idea of emulating Once and took a
>> minimal approach to implement DO_ONCE_LITE with only one atomic
>> variable. While it would be possible to implement the feature entirely
>> as a Rust macro, the functionality that can be implemented as regular
>> functions has been extracted and implemented as the OnceLite struct
>> for better code readability.
>>
>> Of course, unlike the previous proposal, this uses LKMM atomics.
> 
> Please consider if it makes sense to base this on `SetOnce`. It is in
> linux-next now, but was on list here [1].

Data placed in the .data..once section can be zero-cleared when a user
writes to debugfs clear_warn_once. In that case, would such data still
be considered a valid SetOnce value?

Even if it technically represents a valid state, using data structures
whose zero-cleared state isn't clearly valid, unlike simple integer
types, doesn't seem like a good idea.
