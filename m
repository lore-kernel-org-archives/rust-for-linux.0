Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793EE3264D0
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 16:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777308002; cv=none; b=DcV26x9nVLKrbVh5/L/wS8TCddYxyVcONE9gv8zOZep7P6K5HwzqNfHT39fwQ+JD2SSFw1fXeiOjI6vqK9kIC9NaRGse4xyWyEYxtrZkg+Omc5QQwl8RtQBvCx/GhUBPndlxifsd+Sbjermrf3IuzMxpWeAwSndEaURRXtUViMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777308002; c=relaxed/simple;
	bh=ELm9WL56BWn8XsVieKjsOyOl1nxE9yjcplz5KpQGR+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqmKzC6YM7teGtQDo46PiiG/LDuko9Dby9kEn3rFe2xdyDGr4UGLsmpoQ/nQVO41J6DBx9u4Hia7LFnjRr/FFAi36ddajrPuh2yL2uxWytmn5l9yjA3kSxEq7rTxdtugTl9QsohZQFcNSFWsyVCSLQuM8cqemLVp/NmKUP24tV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hTpk0FJ9; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hTpk0FJ9"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso2325ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 09:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777308001; x=1777912801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T1r6n/7OP5VXencUpZp7irvZXo3Q7ZpTXl+NYS+r5PI=;
        b=hTpk0FJ9t2VFhHQo9poiVlDfvB/MP0HWGzTReU/fkQch7YMciUlebXw+yxT2yA71Sc
         EPVDGe47ILw5+nLeJQGh6egPq2+Q/TCWfOmAUf1e7buUreTX1F05KhiSklsVEGyA6y2t
         oOjxM+JjNZG+3Uy63obuiFksdLGoozNcHocqEKz/lg3Zt2mTSi1KGGiS0m4jPkLwGewv
         nSuzFNQp8ZFD7XN7FHIrAG8fsxNxKv/j6gLUD1SQfvUf3+nZwmC+zZaNEaFVUMXAlC/Q
         0POe3MtdGr6Mb1/jHn7a8E+Y/wRLsIBKRrCne1yte9ENGdik+o/AQc2EQYySbfDJIBN6
         zWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777308001; x=1777912801;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1r6n/7OP5VXencUpZp7irvZXo3Q7ZpTXl+NYS+r5PI=;
        b=it3jRcTHZsv+GXWcmKUwz2V3erwNxaj969pmTOvPJ3gSEqGOkdffisp5jAk54IEw3R
         MmbDcIyuRXwLtjwaX8kKDksamrldnLXjprtIB1hhDp3e9qdnsCgCS10M2csosz7BkM/A
         hp9HFWTUaE2ZwxwWHLfL7dTdZSy2yc84393kcnYEce0svCUCW091SZJ5fLn+SV7WUdAp
         W5+DsFeqigzYqkQr6QAwXWOZkisPG/PKspTmvcClGRjys8yNdVKShlb6D6lsl3PlzKdP
         nPkJznqchsIqg2bpKyYSGR8Iy+5uQ7pquJWGu2EVxPESRLs/vX4IW+SO/M/dD/AzBb57
         A4lA==
X-Forwarded-Encrypted: i=1; AFNElJ8R5KURJgzo2yy7cqeOcldwKjTHzMCGU9iO9kuRcRKDHA1cbrmhj2c6iKj7+Ks5Ko5vWParmpUUlc46ut2iBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxa8wlCCkrdX1oQwfh7QEb23wY8zwL+vzs9mFT84Ze/OewLrsy
	zASrhd+TwVPnBJtSJ8UY11Gzjc/Y5Yv7dM1w3fn7EOB6RaYACppFphWeiTdVuCO2fg==
X-Gm-Gg: AeBDieuzJVp47YzbIeYJz4JlmPmOUGT5mnrpmF64A4W8ZSJjsplRjei4h0FMv+4V5HB
	3LHx7xgc0ACV0r2EwYw0D03oX76PznkZ+BKtGBeSxOThKzd35y38LWtno/xnP29A+lxYlYy9RYI
	mgycIyAWL5OhFlzvbP0YuvQerI/1Fu6/H26ybXQ29kK8169KMf9anBtxktoDE3WFVj3El6Qj0Zp
	ZtJvkDwprk53iBDAacsx7OSU/U2mj+OKIkVkrkoAfrGX/Qi1J7ps4LO87inkxK4Iy7UsynlztWm
	3YqrgcELtDrztgmCkh41Raer5Cwixt5susLD2so7h1WK/cZnKaoKu/c1oXdZRUilLtjLF88bZIK
	DC7drE2sPnAVd3EhiBG9S0WkWqA0kz0TIFMV0NV8dJ0yS95pjcKSJvleFW9KFKN8qxpFHq4/+pK
	ayRC+6F/3glZcM/kVmol4SEPHnjPLDp2X6aXnRPC7FSv9Jg+UNBHMzcPPuX9Xk8+9ZRHU6NIz5e
	W9veJmFUgJQ+XCTmEOPDI3q03tu+rdeQScAkhUVXua91yrTVU0Cu6dvq+gxE1mR0oM=
X-Received: by 2002:a17:902:cec2:b0:2b0:5e19:1862 with SMTP id d9443c01a7336-2b97a407e44mr259295ad.5.1777308000438;
        Mon, 27 Apr 2026 09:40:00 -0700 (PDT)
Received: from google.com (210.53.125.34.bc.googleusercontent.com. [34.125.53.210])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976fa40b2sm23658373a12.13.2026.04.27.09.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 09:39:59 -0700 (PDT)
Date: Mon, 27 Apr 2026 16:39:55 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Matt Gilbride <mattgilbride@google.com>,
	Paul Moore <paul@paul-moore.com>, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	David Stevens <stevensd@google.com>
Subject: Re: [PATCH] rust_binder: Avoid holding lock when dropping
 delivered_death
Message-ID: <ae-RW3Pdw7-sN-Dt@google.com>
References: <20260403-lockhold-v1-1-c332b56cd8ae@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-lockhold-v1-1-c332b56cd8ae@google.com>

On Fri, Apr 03, 2026 at 06:18:58PM +0000, Matthew Maurer wrote:
> In 6c37bebd8c926, we switched to looping over the list and dropping each
> individual node, ostensibly without the lock held in the loop body.
> 
> If the kernel were using Rust Edition 2024, the comment would be
> accurate, and the lock would not be held across the drop. However, the
> kernel is currently using 2021, so tail expression lifetime extension
> results in the lock being held across the drop. Explicitly binding the
> expression result to a variable makes the lockguard no longer part of a
> tail expression, causing the lock to be dropped before entering the loop
> body.
> 
> This was detected via `CONFIG_PROVE_LOCKING` identifying an invalid wait
> context at the drop site.
> 
> Reported-by: David Stevens <stevensd@google.com>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> Cc: stable@vger.kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> ---

Acked-by: Carlos Llamas <cmllamas@google.com>
