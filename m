Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2566253958
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Dec 2025 23:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764804328; cv=none; b=ur6LSHG4cs5j8Xoh1qxB1aEGIbVtnAaFFnoLhFM15+ZOqjmTQOLE8POSvRkSsiJaumLApZze4JpiuaAdbQ9jtLNCGcgKDTcLe1KAQnvaKUyG1lM+om/D8y/ZjjQtdQ/UTPXUz83HLXG+HIPlL04l66m3MA/D33CGX85bPzgR030=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764804328; c=relaxed/simple;
	bh=a6uoVhNguoRPRGf5uoEhquoFovSI0B7deZMJWzTJLAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDPKYTTQyRpDuM9vmhbfL2gTql62i1CgAcpNk8+81CQ/kT3xFjEFuLpEPm43vmvFlJv7n/tuSdJxZ8Xv3LSDoWtWNWR5zubvA7CrAGs2fEuY88c8Qw2zVVOZqVhl18G4+C+boiSQziZcRRexszS6kE8Soz++jqQyC0xKZoyjGRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EGIAwTIV; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EGIAwTIV"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-645ed666eceso1756a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Dec 2025 15:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764804325; x=1765409125; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a6uoVhNguoRPRGf5uoEhquoFovSI0B7deZMJWzTJLAU=;
        b=EGIAwTIVZ0g0Zf9JpBudMRt6GBFnFPYT+c7lwenqSmGPvpv4jtMgQIhaHNs3xTZMRQ
         d5+lGtakOPA9jpG8VfOIt27YQVduOLmGa5zgJ59rSH13C9TR3fzvYEJ1+RXXdL9itKw0
         uR8BMoanMJWdnv9BEU0zGduIuufOQiSOGEqnlsgckicdV3nAi2fOZN7u7S1P2UMsWJbx
         Js3Sb5GZ+pt0HWTJZ1e4aasThz2CEyVkL6tAuyXxngx81unPu7LFk1vq+cWXUR6X1okZ
         SAmgbVsBHxORmsaHxJtKF6YGNqqqRBc4qRX3f7TV5cbW2uJ+FappvDwLp5lgnJgiqHr9
         xX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764804325; x=1765409125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6uoVhNguoRPRGf5uoEhquoFovSI0B7deZMJWzTJLAU=;
        b=wyzlAu9Ih6H53B/yElPRqi0C9PZ3trxeU7gdfpZbwOj2DEBFmlZb/ndp2tl+CHzplq
         IGE9feBbVsVzOkb21IHoXcvex/TynIgIy59PJowgQH0Radg1BP5s2JYpTK7AbZylSMWX
         OR0RhMf3+XNbFFOgW0+Eg4iUyXuXtBcox5gXFEG8BJB2P0KgdIAlrpUm393OJGHW5OjN
         Gze1B+PgHq+w7BKx7W9+GwMofb4aJLEFjPXvVwCH42WM3yYmlu1GjYBtMC0gcV8EaTfb
         UVr4Ev1LQReGrbN7CZJTgM6gan9fTM96vvcMmtibw+Nsonz0geWSRySD2TIhcTbEzyPP
         g1bg==
X-Forwarded-Encrypted: i=1; AJvYcCUtdzxk9IeVSQP6j57CRDKB0Y1L1cOsJ0ALABMOKbaIlWwplEdBrI+ZR7kn5DejE7opvNuR32CGMq+FHAp87w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp5EmBgxPONcyWWukhVfidvUMjJG1kXd2YQBOQ6ZHGsbwLcp4r
	c+M3SgItvCvZLjj98ZwCvvepj4tooRaFjusq9+/IRC2bowWeFclhNpNO5t5emRrob0lqejg+eNl
	nKezua48/uaGw1iYkMirNaWGpz0LZ8HFUshrHlywR
X-Gm-Gg: ASbGncsm+1n0V2UGLHoH8hi7E5Vm+Jt84lJlgW9iyEWP+prlpANOvuzmUn0DDxalpZK
	E6UY1A7AwUpIq9nup8zsOXX6gjQG0OyOpwXt/RrGurn2ZMHo/Z0r0W/h5wdIbsKp5Dcxx6ZCjwN
	zYi0Fb/WwOwtIx9OBuZAJKuAEkZh5ee7/YYH03D5a8CpF/HzxX5NBym2cOtQ8c8lvQeRWyMQxi7
	4hZ6VnK8iitFxj7r0pyXqR6c+T/PI/5QJ7on21dfUdnDyN4N/NkXF1C4rPNDU9QTSjsEeqzjX5P
	F5XgsjrqlU7vx7bZZJ2vV8pa
X-Google-Smtp-Source: AGHT+IEXEQTgoa3Tuakna4skmZg2pw/mrECwMwVvdW0fQYVmXvi58ZGexwzvZpC2XAuu5b911WZjF7TrDbbogWoEqU4=
X-Received: by 2002:aa7:cf02:0:b0:640:8f9c:af3a with SMTP id
 4fb4d7f45d1cf-647a7728a14mr14606a12.6.1764804325007; Wed, 03 Dec 2025
 15:25:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com> <20251203212558.GB3060476@ax162>
In-Reply-To: <20251203212558.GB3060476@ax162>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 3 Dec 2025 15:25:13 -0800
X-Gm-Features: AWmQ_bmE-9G2UW0Equri3aRgg0NngGho89_DAwKEs6T1gQOz1p2ws5lgLkHiDf4
Message-ID: <CAGSQo00bG7QF+u2WJQwMTiq6iGATcSfaAurkkppykkn+yTL-TQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

> I am just curious, why would someone want (or not) to do this? This help
> text does not really indicate the point of the option, just what it
> does. Is it just the standard tradeoffs with inlining (potential
> improvements in performance due to better optimization opportunities
> versus text size increase and icache pressure) or something else?

The main situations where someone would want this off are:
* Not using `clang` (should already be covered in config logic)
* Out of tree module build without the whole kernel build tree (the
`.bc` file produced here would need to be shipped to your out-of-tree
module build environment - it essentially becomes like a header file
for purposes of building an out-of-tree / DKMS Rust module)
* Don't have matching `rustc` and `clang` LLVM (kind of covered in
config logic - if anyone is using a non-release version of LLVM, the
config may indicate them as compatible incorrectly).
* Requires out-of-tree / DKMS Rust modules to build with the same LLVM
revision as the kernel was built with - may be a packaging concern

While the usual inlining tradeoffs apply, all of these functions have
been explicitly marked `static inline`, which indicates those
tradeoffs have already been thought through.

I think that if we had a reliable signal of "`clang` and `rustc` use
compatible bitcode", turning this on by default would be reasonable.
As-is, we have a mostly-reliable signal, so defaulting it to off seems
reasonable so that people don't get surprise miscompilations if they
use a `clang` or `rustc` which are not using precisely a
release-boundary LLVM version. People who know their toolchain story
for x-lang is squared away can turn it on.

>
> Cheers,
> Nathan
