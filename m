Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EB11D31A9
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Nov 2024 23:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730849593; cv=none; b=S3FXNBEK8crsuZyeXUKF1pgjOU6EKYm7dvkYlPfrAzZjxv7BoHxhzLrYDj2jnzc/SW6tHjtEbOgzUOe5lLLQgsc2AXVOi00PG+nwFDGHXnAjA/HwosDjw1jEOo0Z5hJx6W5XPTKoJi5TYrjmf4rQ0SZv7CfILgyypxqT4X5IWdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730849593; c=relaxed/simple;
	bh=ArQLqOvo6W0Rc64kT7CqFtGXoZm/lDS3ffgXWhFJHVM=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=eQr7SacL8AS5/1IgnVOPtCl9lK0PfLcJ+zsr0FLeefCkz87FYYK8nq6xICnKkWfA0zbSP4jIvgO46d0aTZVP7THCeE4EApTF2A6LJl2rvFjjEDkS9t8jcnGfZGnA/vKD3qJ2JSNE7fBGl9eQ2Tze//1SyMus0PFCTJz1phSMeVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzWuquV0; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzWuquV0"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7f3f1849849so816766a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 05 Nov 2024 15:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730849591; x=1731454391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwaJKi1KLyQ9UtNp13m2uA0F+fnn/sB9hq4qyMbORnc=;
        b=bzWuquV0U9j+y4bPRx2SzfqYgUvAXQeovLR5/yBYxMrpeKvhzTyzuRWEUOqfdOj656
         gUojGRnq4owSgCOVLgbGlp8AyCF7tueXEew89oW3eYJnleC4JmLkhMP6450yWsKfI024
         Xu6Kx0hKEPHBThqv8XZoUJyrJTz4dLMfbCgsICAcmKHPqw5H9mr7XklhsHAV6AGNtKuT
         SAK4vUca2kuAyitZHaQCDgqg8rCEb/0+U6UBJKAo+25Rtt7/ztWUCXBvpUtT625Mxi0D
         2PNkRd/Ugr9XnOTYFt/VnsmU86OHUIB0sQt9EohhB11tK0DWaaOvJ+4rHOPAbdR4+YyU
         qlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730849591; x=1731454391;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TwaJKi1KLyQ9UtNp13m2uA0F+fnn/sB9hq4qyMbORnc=;
        b=bx0MRuerB8UHvBc2cAnnuH3wSlcGN6fF5WLTNfS5qo4EHBz9EU+kjMbATNq4/dS7uq
         AcVJWOKaMMfJqBi4AisSiKQ4XHZh26csv2S4WYbsUTKMGF+iKLTNkmu523s74EAzLMXo
         zIZ6m8F0NsqWVrsXRyKRkygWzhNVHvAfwAiHPBOzXwK1BGZPMacGf7/gDn9O8iEf8sof
         XxlvV+gTMalSHQMpLRSCKG0bpyEMXs+2hIECX14/KJ7E5xnH5ECQUQmWd/YbfrGsXYx+
         +gvvkAXEoGtkEFkzRhJkm5Ceryc04DqlW2Rgb8Jl5itwsujpwJV9L5gPbtQnQC93iR0N
         DVcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuaCTf44F+GapgWG3+r2tyq4P6LW35QRJrZ4oBQxceweGYpz5vqtHK0gkHEkJ3ghbBbR1zFGYPdas6Z19MpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0MojMYd+1ojZAUmXUgpGbk0x5HcxSGsf7kNg1d2O6QTWbiKWw
	/4kHATXEXwFV4UE9RHu352jkIyKPqh5hCy9dltuOC0JYltBDMxo9
X-Google-Smtp-Source: AGHT+IFjUCaDhhpcAIPrxLUP6IC27PlOT2LY9iEdwQEwWPiJCl73Gg+JMulmmyCGr/iatJhtm9NhQQ==
X-Received: by 2002:a17:90b:1c86:b0:2e0:db81:4f79 with SMTP id 98e67ed59e1d1-2e92ce2e05cmr28625150a91.2.1730849591158;
        Tue, 05 Nov 2024 15:33:11 -0800 (PST)
Received: from localhost (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a580662sm98169a91.24.2024.11.05.15.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 15:33:10 -0800 (PST)
Date: Wed, 06 Nov 2024 08:33:06 +0900 (JST)
Message-Id: <20241106.083306.910585553963629836.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, jens.korinth@tuta.io,
 rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu
Subject: Re: [PATCH v1] rust: Add pr_*_once macros
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72m1TrB=HpxABWEvOaYwXn6yZOJFHtyYnnvDLVyCSLbOcA@mail.gmail.com>
References: <OAtDBYR--B-9@tuta.io>
	<20241105.083343.2243442761267649401.fujita.tomonori@gmail.com>
	<CANiq72m1TrB=HpxABWEvOaYwXn6yZOJFHtyYnnvDLVyCSLbOcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 5 Nov 2024 21:20:48 +0100
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

>> I assume that we simply can't cut and past the assembly in the C side
>> so it will be complicated.
> 
> ...we will have (going into -next as we speak -- Steven just picked it
> up) a `RSCPP` rule that we use to expand C macros that end up in an
> inline assembly string and then paste into a Rust file (cutting the
> part of the file that is not part of that string).
> 
> It was added for jump label for tracepoints, precisely to avoid
> duplicating the inline assembly.

Yeah, I know. I was thinking about a way to use that approach for
assebly used for WARN_*.
