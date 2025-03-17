Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A384923F39E
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 15:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742223636; cv=none; b=kdD7REzfla7jhS/PpecSudFZ36pYqiDEhsNeHMD3EsMTDQC4AbnU3mh+QB73dbNKFR2cqG3oZSEZqk9q2sy6hHX79BN6jkUwHHZSI0kATQZZQmCP0M+OMK7q6Udok8ew1nepyESP/A4d0RvvbJv7gy7zpZMvAUOS6sgjP2GtG9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742223636; c=relaxed/simple;
	bh=mAKB0Zx3iVxZdShI2Q5YUUpwKTajXMRBDowwuz9uqoU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nDyLGXfuVQYPGlwzwgt0usdANp9X+74VImeKHgxn1Jy6UUQFHAaPkO0Pklbup0s+SyvxWNQqlv1EtUkZrI4DyeVnqVlH9ivUwkZjk24olmWr4vMlN9dF7ONlVxx2xpwWTJXsPCO+JLhczjX8XbZFnBkSDWx4vKuYY13oZEH6qPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BGCpThJh; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BGCpThJh"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d01024089so18765795e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 08:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742223633; x=1742828433; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+zsksQlsWDcFEtyYBbIuV4LzPqQIhMHHBTrQsSMgKk4=;
        b=BGCpThJhbR05ZRZPckiqHMjUITaBfyz1zCpna7ohbpz2jlIvy/ZuVkfCcjol9N+SXc
         XnNn73NhdNNSbYDOL/6RhC1TD+yZQdWLHqZr4dYrK7yFRe050AKMJnWARAbuhEJipMoy
         6J5GftRTof4ZZl8QU0aZfKRGfVcZFzFQMX8j5Hs9uoU4znld/xcZVDV1fHuHkC10AJu1
         DGHiChpodXvG9GGDPgMbmaauhcXTtI/VmJ1lCB/llM93cEVOZtChEXf1otuMlwB6vUBJ
         3M0/HjbrfP7jkoenxYFxs/Gdx0DRhcInQNdatJLbzHUVmHR9RSb4B6VWx2jwnjlng8Lz
         wOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742223633; x=1742828433;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+zsksQlsWDcFEtyYBbIuV4LzPqQIhMHHBTrQsSMgKk4=;
        b=imh9EE9q+NP1DoEL6/Z3sFoIfz9tQbFfrcpZzgrexEm1PHW5c65kvQmgnAY2H8jlVL
         3KiGxN+JvTMZJHDA9Byyml3YRLk6Zr0P7RUuYPgCysBqqC5NBd2qxZaHgtN0vwjq+WKw
         A1QXBl4MCkSwoGxZf7MwbSw3fhJgTncNUYyv5n8h54FcyITljSWL3y4Q465zSX0CcHMJ
         1f+i/ou9paFrWIFFAFgTDHvtlTnHDBJBtoWp+U5hEf1JC3x2i7AtuSSU3vaMfK36fm1A
         kbYaIUn84y5cRzfJNRFJzy7KwGKpbH//jD++l6vmWE6pOJR9ukIXm1cRWTp5Mvf56YLU
         o7FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVamd4FJUSLNniKu4kYfgTbzWXgkGt/pRI0qyuQR+ikPJVZv9wT8wl8gpwm76gxFWE23BGYJJg2fZfdVe5wJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxmcbgkenwxpMKkYYi6D8BNHRC62skQrAhwLFy1YTqZf0TO3Jw
	/rbNpyc1lNYRAW/CcLKJCRXhnIqekYcKXGB94LkD0FP5kazoF88D5PnwApdUepkXkeKtJtx3g9M
	MUlwU6sxg9dIB0g==
X-Google-Smtp-Source: AGHT+IGswhad3nelG5lK7EnJ+sAaTbYpeBborq/c2wWdagqpaRvsmk52bv4iWMs4SjsHpwflIii6ZpkjVpLr9ts=
X-Received: from wmqc22.prod.google.com ([2002:a05:600c:a56:b0:43c:ee49:c14d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:154c:b0:439:9a40:aa0b with SMTP id 5b1f17b1804b1-43d1eced557mr116630355e9.25.1742223633034;
 Mon, 17 Mar 2025 08:00:33 -0700 (PDT)
Date: Mon, 17 Mar 2025 15:00:31 +0000
In-Reply-To: <2025031444-acre-boxlike-8af1@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250304-feat-add-bitmask-macro-v1-1-1c2d2bcb476b@gmail.com>
 <2025030439-sharpener-overkill-ada2@gregkh> <1A434368-6B92-4C64-8B5A-17499C8E2F1B@collabora.com>
 <2025031444-acre-boxlike-8af1@gregkh>
Message-ID: <Z9g5D6X5k1fpUwuY@google.com>
Subject: Re: [PATCH] rust: add new macro for common bitwise operations
From: Alice Ryhl <aliceryhl@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Filipe Xavier <felipeaggger@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, felipe_life@live.com
Content-Type: text/plain; charset="utf-8"

On Fri, Mar 14, 2025 at 04:02:35PM +0100, Greg KH wrote:
> On Fri, Mar 14, 2025 at 11:18:56AM -0300, Daniel Almeida wrote:
> > Hi Greg,
> > 
> > > On 4 Mar 2025, at 11:09, Greg KH <gregkh@linuxfoundation.org> wrote:
> > > 
> > > Nice, but why not use the same api/names that are already in the kernel
> > > for this type of functionality in the C .h files?  That way we have
> > > consistent names everywhere?
> > > 
> > > thanks,
> > > 
> > > greg k-h
> > 
> > IIUC, there is already someone working on that [0].
> 
> Great!
> 
> > Can we just leave this macro somewhat as-is as a mere convenience for driver authors?
> 
> Why have multiple apis for the same thing?  That just makes reviewers
> confused as well as developers.  We don't do that for C code :)

I'm confused - the Bitmap type seems quite different from what this
patch adds. I don't think it's the same thing.

Alice
