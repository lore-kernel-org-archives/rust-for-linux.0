Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BE32701A2
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 22:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745359962; cv=none; b=Mv8f4sqzQ4dZj1Tw9mtYtCyUtdfXJ/Dk/T6vKOHmfvjOQ8n9r4bx7O0w8nWUvB8bi2JjO/4gg9VaDpBvfmDBuZw+jaEfQ7rAHVdHAKSE7p6dQUFTpHgeSdWpR7e3gnW2l+9UNOEQKJQyRSskEFb5m4/HlRLWaFbe7jSvIQQZSJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745359962; c=relaxed/simple;
	bh=nmrsmhBGitfT2wbyNjP0t5eYG10xyWJ/E8zRXaQ2IH0=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=HN0/Ro3HnX3vMjUm6tAyIacYeGhRvyT6P40qFlgMMoHXbTkDPpfv98/TLfwUsm3vKtWiMArDKsCwuiF/dpmT1nkYcwWdP9A0dmtsILuuDKDwEIC18xW5kLVroEWTM3kWDUsYifhoY5geRguUKh01YW1GBOCOIy4hvyz6PCTRsX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/jptO2P; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/jptO2P"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736a7e126c7so4971113b3a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 15:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745359960; x=1745964760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CrhKzHqw45SXSup89c0rINyZtber/7akN5Y83vdV2Lg=;
        b=k/jptO2P8VBJu4PcnolonmLsld7Kidj4RkODyYlKteI9NhJXjSjXi6t0mEOz8bwLUO
         7rUF66jHgxndnWZo2ZOfWf6Qa2xm65o/v6QL9Scw7BrDPFlanL7vQ6wHYqyr7tT5w03S
         +DgMyN+YhFu5LHBFYvsNe/+KgV/rOtOTVBfjjrf1zvOwnrOi/3M2xMmlhyI4z6VbX4gm
         t9EAhgi5tszCMisElEW9YDMnicjAGNIEXBN06T6BDA08p/SchvPip3rjdTSyagCUqiHt
         XJv9S59gqR07fRRizVpQ8+i5bgyG9k5jZUSCJMBxo3bsJU9n26uPWrAtf/ASsRfJ71A3
         OgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745359960; x=1745964760;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CrhKzHqw45SXSup89c0rINyZtber/7akN5Y83vdV2Lg=;
        b=Aq4LWjvwzfbyvncANL0wxDZRNzBKMl8p1EbHIPuPglVdR5XQuw0UC/Ztc5WWKXGsWY
         MxxSl3qE4JbL2Qf/L/a6aoliAQ5+iUvCLW18m7DxKTInK3WIdLpJJNz8WC+y5YRJYWic
         XPm2zd3h7K6P75m0PtIs6z0lSDDqteMg7KzWXtRH/QlplnVuhS26Uc7UJnKI5LCs/red
         QIHyzTxQ/i7EYj9xiCGwUgs+7ZJ93oKfVo9ifmYi11baLqSps0k0uA8uVQbxGfWq4+sW
         olT6l+Zot95Q3O9E6nMFAzVCksBWnE8tqe0E4D5J5vg65gTFmw49fV3Zmp+URbMwkspj
         cE1A==
X-Forwarded-Encrypted: i=1; AJvYcCWrkpftKs7Rq7YK6CCVyEvV0EUqNxTqkyW0tbt5LK4lr1X1V0zEE5mNZWL8q+G0O4K+wrEzs01K8o6+rCfmSw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yylw2lsz8aeR8mHgTohZcOv9GEGegkfMO3v0iO9cj0lAbSNFmkj
	rQpMJKMnIZSmOaFLTCvj4qjcar3xUOCA9aRHzsbWhYSReDOx8V/PG14KZTh4
X-Gm-Gg: ASbGnctX6hd6r+F9bR2xTtW2wlXVklHS8tCOZzMEzfT/bRiZCF0ts8E0wlVr/ueyNNc
	DhVAgeHGx+5WYezJyaUemAEi2URtHem9t0Ky1LfIvqUVLfCc48GQHUJXmPYd1Vt8hyNCTSEvPd6
	egp3ijicnhDeLfYgrH+6Zk9nqGXDKDbusy1RRJNuIt2wPozVJKCmq2XA1hdHjAWxJIVWpyXJPt9
	sesfobUJIih3XeypCHLSC3QgK34FeJyh5LNsMEiU9btGiykE/DXibLeKoHDLJOlKVL2pX8v0Th8
	ii15gQFMvFwA+dPATnv8P123gKfTSxtORRAVU2lBAVp1GHdgudTFicDYByNyAHl5vs8pKIOSexz
	p74xdqB6z0ICZOe8mwCLLCe0=
X-Google-Smtp-Source: AGHT+IFlLFRo6/rR6LrrxilUQBi7RLOUpWH7fdWnmlQYOmh5iMOFjDcSw0/exSVehhghspzITSY8Uw==
X-Received: by 2002:a05:6a00:3991:b0:736:34ca:deee with SMTP id d2e1a72fcca58-73dc149727fmr20676171b3a.7.1745359959835;
        Tue, 22 Apr 2025 15:12:39 -0700 (PDT)
Received: from localhost (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm9174567b3a.24.2025.04.22.15.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:12:39 -0700 (PDT)
Date: Wed, 23 Apr 2025 07:12:22 +0900 (JST)
Message-Id: <20250423.071222.2152802938667652061.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 boqun.feng@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
 frederic@kernel.org, lyude@redhat.com, tglx@linutronix.de,
 anna-maria@linutronix.de, jstultz@google.com, sboyd@kernel.org
Subject: Re: [PATCH v1 2/3] rust: time: make Instant generic over
 ClockSource
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <87jz7c9w8u.fsf@kernel.org>
References: <yeL5RAonA5iWV8-p-hvccynw8VTkb93O2c97FNfT0TZuHhD8n_zNmf12REZhWwcr2id8751ePrpH48LyDr8A-Q==@protonmail.internalid>
	<20250413105629.162349-3-fujita.tomonori@gmail.com>
	<87jz7c9w8u.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 22 Apr 2025 15:11:29 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
> 
>> Refactor the Instant type to be generic over a ClockSource type
>> parameter, enabling static enforcement of clock correctness across
>> APIs that deal with time. Previously, the clock source was implicitly
>> fixed (typically CLOCK_MONOTONIC), and developers had to ensure
>> compatibility manually.
>>
>> This design eliminates runtime mismatches between clock sources, and
>> enables stronger type-level guarantees throughout the timer subsystem.
>>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> I think this patch will allow creating an `HrTimer` with one
> `CockSource` and starting it with an instant that uses another
> `ClockSource`. There is nothing tying the generic `U` in `HrTimer::new`
> to the generic `C` in `HrTimerPointer`, right?

Right. My plan was to make HrTimer generic over a ClockSource when
refactoring HrTimer to use Instance and Delta types.
