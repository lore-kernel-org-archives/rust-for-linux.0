Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26263A4F20
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Apr 2026 08:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550288; cv=none; b=f8BZjBfffj557Jn8FGd6C3s58jDgxD57byViiHm1V7hVGK1BuRwKCl1K9SeQDUK9QT2op0jx2tKrp3uXcXwPi8u1Vt8Q9suV6hfSBZBtEdCYJXxN6kGuY50434BxyKyyVQx5/0oFJYhKkdqlSF9Nhubt+O62xyvzJRKD6BPjIUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550288; c=relaxed/simple;
	bh=+skoQQL+0SkGcmfUQ9vZIS0EWRvemnZIqCiWOxo9mhM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=btKbdiAHUaVJjPjeWpJRwkSLs/AQEGVjuplUqIpFmdXcJx3IfdvdXz8tEVydt8+aa9bA0qDyi1ESvk+vxT8Oh4Dn8mp736fhHbqj4H/8FYHgc63p3N9ugSuF+MISCvwhmepQv7rxQetRdeg+a40eQOdYH5MpxaFXl/W96q/jGn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=As92XQ0+; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="As92XQ0+"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43d02fa5860so4851941f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Apr 2026 01:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775550285; x=1776155085; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bhNet6S9OveGRpRTuxmVLkafAYGIjoGgLPLTKLJXNzw=;
        b=As92XQ0+fSK9IwFIEoT2ABDHJMEJF5HtYg8vUz220uhpP6OE/MM6a8E4ns2B8iEEtG
         TroiYwXXWX5KlT5OfQz7Y1tMUqJ13I/7eulAZTB+v9AAES0/1l5CRvzDvdTI26zqm34h
         jYR+74Pr0FczV/1etHdcns29Aud0+gzvSxk4crKV0pojqIIw9KnCnl9CqAy3RhMD7auh
         zCE6tEkTyIR5KrYfGQwY0UYQw70Omz4xxr73h9aBFU85RM7JI97JmxezxovaTwJ6VUPa
         Gr2JzVsqPnM+FM4Ufubn4j0BVzMLGmWunYbbKac+QBghPf0d/CHK4wZayv+6/tF5e1lq
         2YSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550285; x=1776155085;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bhNet6S9OveGRpRTuxmVLkafAYGIjoGgLPLTKLJXNzw=;
        b=NBQQUiTBu7PqpeKPYkbMrc7C9c0zbGKSWaV6VcdMBAUuuAB/Wj3fjcdFMra4VurUIp
         VbHdTWnPPnE5CagQYTL09KuzP7vWPE6rgaYeoPTuPGUDm8bir2vFIOg8Vdgea+CReVyL
         k2kih/Vfz5g3Ro8ezcp6GO763yg+iaD3jq7cY4m75jyYZkD5Yy1aukYdaeg7bgxFUPhh
         /9tzcdHYEpRyZ4m4vBLLyG5pfS6d735AHIMr76qhSsZTzNSAbxXQCbKCiF01vuD86WXF
         9FSQXfaRbXMWIvQXlphyunXCSVG7mcKTlNmz1hpuvS1nQJ1w3pPaGZC5xWL3kpt3z157
         eiOA==
X-Forwarded-Encrypted: i=1; AJvYcCU382w36LegUdajEc/O1AYQjEcnqqvDanE2Be+obOiVGzK9SLjQpi1tSc5Jxol47NJIChAQRhlFejmcsbi3cQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXFdYRNACjm7xtdal+1flQODchaFKdvLF6fOY9WdQJr96M8ids
	1y3ooNNLxJdBtcYjwZvwFVqSwE03WcY8g49lPm1OcePJD+iTPiBDtUQXHHkFnGfpYJRKkywYEjN
	QgWKsvUokhCaVc/mhhw==
X-Received: from wroh12.prod.google.com ([2002:adf:f18c:0:b0:43c:f758:33c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4010:b0:43d:1c7a:8b59 with SMTP id ffacd0b85a97d-43d292df72cmr24103016f8f.40.1775550284819;
 Tue, 07 Apr 2026 01:24:44 -0700 (PDT)
Date: Tue, 7 Apr 2026 08:24:44 +0000
In-Reply-To: <20260406095820.465994-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260406095820.465994-1-ojeda@kernel.org>
Message-ID: <adS_TAj5X5yDcrhh@google.com>
Subject: Re: [PATCH v2 1/2] rust: kernel: update `file_with_nul` comment
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 06, 2026 at 11:58:19AM +0200, Miguel Ojeda wrote:
> `feature(file_with_nul)` [1] has been stabilized in Rust 1.92.0 [2].
> 
> Thus update the comment to keep track of it.
> 
> In addition, this will help to sort new conditionally enabled features
> (i.e. `cfg_attr`) around it appropiately.
> 
> Link: https://github.com/rust-lang/rust/issues/141727 [1]
> Link: https://github.com/rust-lang/rust/pull/145664 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
