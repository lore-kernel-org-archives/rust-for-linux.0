Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB6A2E8B7D
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 10:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770461; cv=none; b=QOrrdqq2AX+nu2fa4Xb1jeGMeBJbU8suPelG13ue/cDZ5+Dxb5SZnxs8GaPQUfLX3Uc4hL8f/UqQJzIrQHvAROXmqWGjOs0glF12E+R7KH8tOnPREoqASkTA560IYBVETFUl8jfzRepvBfOJY7Osa4bWGXzNjPQ1+S0xe9S30D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770461; c=relaxed/simple;
	bh=qOc2Yc90dsMYkDqxDQPjAtDHWYmR39nkh+FTIYhuNTo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Xo0BcPRLJ702pi6X69XYj9H2vL2mEaZ0nf7cXy9ZR9F1vycT/ZX1nRwK8nEQMscaUgPalpUBKQaxvw2mIkzbAS7JOzxmC7ntjd3byLc1MHK8Y6v/4S5UMwDjah8aLpJAtMMMM0IJosqJ4MGvrbSK2WdSywFKMoejQwQb9uSDX+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=14uCg/K0; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="14uCg/K0"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-640cc916e65so3886845a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 02:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762770458; x=1763375258; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Egm6bH8haTO66pWlj9ItuOdMEFY5snjzdOZKIxF5pdA=;
        b=14uCg/K05sXC7gfX4vga9G2yabPKBdqsO4KoHzBNH60iLvtW6bzLwitFjNBTVJlXoX
         3MC/R8xNtWBssqSDJEKj995QqFgQznCHfSOPd17WK90k7amx8MT1mUHZNUnLdpr33tmv
         tLB154QCX93MF9M5pq39XEh4/RQONltfx7HYlu3rSFWJdYD+19pjpp07deqgsVydT57x
         +nl6dj+A2ggIdFLBL0wUpBdMwW0OfUfo03ecFmhgb7Pb1e+BQVZ5Qv5nTXuAECufCOLM
         ugoSntFqvY/AKRVKHIi3YV7h950/zTeduP+4IQU5VMhKKeXage53x/QPWJuTixDKC81X
         Ikhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770458; x=1763375258;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Egm6bH8haTO66pWlj9ItuOdMEFY5snjzdOZKIxF5pdA=;
        b=sqV3q26D/obDHavZkVyMthb9gpdL1vqB/62uZU/hyMxhQw3W0hMvOZjlFjih6EFPj4
         sbmXaroocYKuMryH7yNbCADiJzgxn5f3fJ3W9uzWPPrToSbXim4V1SyzMfJjrl1i0yJj
         yS+w812zEEEKB5gjLNa2dv3/pCAKLm31b/jo6ukZPbXWSuEfOH00zIWW5aPCYVwy8YKp
         /gAlbuvIIeL3N9Uop2cdwsLzCnXb4Rg/RvqT0LeolWpBmfKFq+mM0Y5jKxogIOODxx21
         Srea5Hh7x0peyHrnLbOsu6QhfPg5x+Yar7YJVU2VVyWf0MTrYkodlVKmyZYRi7LN7K2r
         PiCg==
X-Forwarded-Encrypted: i=1; AJvYcCV15wI51k0e2b7k37Qv5jkD/GwMAIiWCkFqlniY8YlegWUmiM9yks+tAmZWzZk//8ZPRke+/sdj1sO0ukwg0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLBixgeZHOV9VDB2k/Eve6+JdsjujY+8O00m8T5xX6oEy3aPg2
	JCCt7b8rEISNUsWeM0JDlD/+zQK5ofGjhu/FWKL+Li2D5YbXQzbZiWkManwcJHsV8uQ2/RF2Wj4
	Blyhu8D3y7P2vQkXhVA==
X-Google-Smtp-Source: AGHT+IGusiuHZLT3Jzp+Pn6pR0ClVUPAC/bjvfmAH1j2yaYh3CBjTcnQebjmD6hy9yf32AJb1ySOZAn3SaTPK0g=
X-Received: from edhr13.prod.google.com ([2002:a50:8d8d:0:b0:634:4a04:b8ff])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:84f:b0:640:c95c:be17 with SMTP id 4fb4d7f45d1cf-6415e6e759emr6717600a12.16.1762770458616;
 Mon, 10 Nov 2025 02:27:38 -0800 (PST)
Date: Mon, 10 Nov 2025 10:27:37 +0000
In-Reply-To: <20251110095025.1475896-3-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-3-ojeda@kernel.org>
Message-ID: <aRG-GU_I3MjT46dQ@google.com>
Subject: Re: [PATCH 02/18] rust: kbuild: introduce `core-flags` and `core-skip_flags`
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 10, 2025 at 10:50:07AM +0100, Miguel Ojeda wrote:
> In the next commits we are introducing `*-{cfgs,skip_flags,flags}`
> variables for other crates.
> 
> Thus do so here for `core`, which simplifies a bit the `Makefile`
> (including the next commit) and makes it more consistent.
> 
> This means we stop passing `-Wrustdoc::unescaped_backticks` to `rustc`
> and `-Wunreachable_pub` to `rustdoc`, i.e. we skip more, which is fine
> since it shouldn't have an effect.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
