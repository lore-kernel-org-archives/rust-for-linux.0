Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1E31F91D6
	for <rust-for-linux@vger.kernel.org>; Sun,  3 Aug 2025 20:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754254405; cv=none; b=PZVqp5bTeLLW/ZQy2qjgzNLVQ10XgWHXmlJu4LutWPjJEIvcDrKdiVi6FD0f6tR84xTL1NEv5xjXFaJ0HD2EiI4NZSdxFLkZhs//mg+JRWJ127PDSMBEcZQiXWQrnux08q9FPluezR9NaHR6ajSr8FkeeFGNkcH13/zWoi0TaLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754254405; c=relaxed/simple;
	bh=JY5x3SgVtiep2jP8UPpmtr06GtJ6WbHgPKYdAee2gXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ec6/jF8/FBXHkxK7v70tyo87C4CK4sBA4MWMvMjlflvUbwWAafTePOGOhNHQ+CmxXSJWGxPoiyaLyvkDHlSO5ijMBNGWq+FRoSnEuuB3I/4DvcyaVX4Dlu1iI5FFav+LX0aCxYB0RByHIqD2F55UPLBN3r59eOC22Kq0+svY9NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RMCEs8M2; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RMCEs8M2"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so4371425a12.1
        for <rust-for-linux@vger.kernel.org>; Sun, 03 Aug 2025 13:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1754254401; x=1754859201; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9esa6sfZgyweLh1Ljo1EEi6nMuRSy+goaDjQDKyf7I8=;
        b=RMCEs8M2ik/FjPc1FZdhGmBTbmhSKTpFrV0bTP8NfR1uxl40wReABGXj+39p1yYSYI
         UzFkkqvujspmi8s0TpXkCLQ8QaNchWVbKdaCKeswF20H2Q7+cKN5C/So1PqRmGY4yLsz
         DJZWqxWQcE2sIREyzavtLqQYNrzwbfrOwDqlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754254401; x=1754859201;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9esa6sfZgyweLh1Ljo1EEi6nMuRSy+goaDjQDKyf7I8=;
        b=LZIpRosFqAaYidHRSsB6+B9s+0eVTh73NmiP4GDlG7OQwmcL0EftRhewbx6PuXvcWq
         1R4rv4L/Fb7Wvpq501ocvRJyUv+7mwiSvhWmEI5eIrAYLVaVh0G2CnOnKia6L/Ob5np0
         aGO/WyuROkwp340L00p2Suig/FGDYWoUbOtaDf/3uswBUvOqE7/f+VZlI5HZU8b4Mtm9
         LqFjzZ8a69IPGebfA473oyscJNWfJNxVEB2aZpgckw3gROiOkVh8iwWcw+S2l4L42JGz
         T8BkSWvl7+/7GsnR5TcU7NjFTMrYwjSn9gB7AbyEyPhwScQIdKW07ohKzN9eAdEUvGFr
         xn4w==
X-Forwarded-Encrypted: i=1; AJvYcCXkSuCjoeQ2QXWitToYy/YWMuTwf/iJQJnEsrVhe/AR9yFQEzx5PW9vV+uUz4KgalniXv/bT/i2W1Y2+3dk0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yysrc9okzgf5IWYw5PHPpf7l+KIwMrmIRT/pEXHM9qNoi2VgTO7
	naqUtAnx41OBcK9eHJ6fTj885YpwageVolGG3Gm7spPRSF9F5tJ804JpBoIAzhuJmdqfQ3Eza+E
	NeKQWvng=
X-Gm-Gg: ASbGncteD0JrjAhfr86V2LpGD6KkFazMGCIYXCTrE7Rn4mLLDPUqvnKyBSO0Hz2K4SM
	mRO+qS+RkiZKRlgjiaYnA8bIaSMr5+VhMtOuHzPQEgXWHwKd9oftvhDgtv3Z5RkrrBD7dJsJiTW
	DIuWcWWJvoaHKmr9FrJcCpp6VuPTnH4xRSBaD12EW/ZeHEvPgOY29Ty5/sDhlCqbbN93+4toOJp
	XtbxKRg9t6J10r15Bf5vpFiW3cCnMMYkGQc8vP/zkejN5/Su4HuBLQXRhUGfR5PIZE05fpH2Tga
	62LRnMbYc3xopqLMiMYqnClDnaX7Z0Wl+42hS6gvRjp9o9LaV34YWDd35o1W1PAujq2VAxBHb/Z
	EJTZw4o+erS++KNm2Utvzm33rNvxBBHLHxOO9W5WywFMD7vq/CG2jSX7XlYqyGV9asBKLQqLx6C
	VzrexqhsM=
X-Google-Smtp-Source: AGHT+IH+LeytfBTzr+mGcchVs9NmOo28u7QtFDx/cHmY9T/Lcn+lyQSYs7gBiW9YQYWV0W9L7HSJtQ==
X-Received: by 2002:a05:6402:4402:b0:607:425c:3c23 with SMTP id 4fb4d7f45d1cf-615e6eeea53mr6181836a12.5.1754254401399;
        Sun, 03 Aug 2025 13:53:21 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f00066sm5746772a12.7.2025.08.03.13.53.20
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Aug 2025 13:53:20 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-61564c06e0dso4896916a12.3
        for <rust-for-linux@vger.kernel.org>; Sun, 03 Aug 2025 13:53:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3qFeIRsvVhy+sfC2EyFWwtmeS4iC4yfKsrEafYPmemWDSDCWAPirLpPAzCv4nHcQF6s2jEFnuN/P20h8n5A==@vger.kernel.org
X-Received: by 2002:a05:6402:278d:b0:615:59ea:f218 with SMTP id
 4fb4d7f45d1cf-615e6f09ef2mr6692426a12.8.1754254399833; Sun, 03 Aug 2025
 13:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250802211316.875761-1-ojeda@kernel.org>
In-Reply-To: <20250802211316.875761-1-ojeda@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 3 Aug 2025 13:53:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh4SfHyQAunGwspwO5wngSQTHqeNZ7Fo1Wub5BkDso4yA@mail.gmail.com>
X-Gm-Features: Ac12FXzojhLEsGBw2wB7LU3rM7G257WjVgv2kKvwsEDAfjbTPYGQzu9bOiMxMLw
Message-ID: <CAHk-=wh4SfHyQAunGwspwO5wngSQTHqeNZ7Fo1Wub5BkDso4yA@mail.gmail.com>
Subject: Re: [GIT PULL] Rust for 6.17
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 Aug 2025 at 14:16, Miguel Ojeda <ojeda@kernel.org> wrote:
>
> There are a few conflicts, including a semantic one, but are all easy to
> apply. The resolutions in the latest linux-next are fine -- I also did a
> test merge with your state from a few hours ago:

Ok, apart from the semantic one that I entirely missed (until my build
failed and I checked your test merge), I got the same result as your
merge.

Well, apart from rust/helpers/helpers.c, in which the conflict was
from ordering things alphabetically, and then the new 'regulator.c'
file was out of order anyway, so I fixed that one too.

And I have to say, if this had come in one day later, I might not have
merged it at all. I'm about to fly away, and this was the kind of
somewhat complex infrastructure thing that I *really* would want to
see early, and not in the second week.

             Linus
