Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B77330FC23
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929579; cv=none; b=gG1e7TYTY+xTfPMBO5NAm6aW38QPxd9dOwXSmwJkv4NMk1vxk9oWFhTAZHFiidHYnlQpYnahQ6uPRj6olNDnZ5/S0f1R6IcFNroIr9qCOBh4apSHQi+Z8wKgUwwSMbKuLk1E92oNhLpnJYFi+Cy34TDi0pUkw3T5Ab9Ry/7lrcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929579; c=relaxed/simple;
	bh=6oDozfjWuU2JdTVQdIAUYptmEQxfVQtWT3t+6SmU4sI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HQ2o12ELGEPpicOP6CRJEDri+WbYQHX1TX+DVcNE2bu8+ItM9Evd1/TShMjzYyCrfQFH9GQwNYo4v9K7YDgUTodHiS6pj1vxaWISAn1ULCp26x81HNFODX5TCc/EASHJ98LFi4r/X+aWtjcuki59DVHgalEIGS2pY1J+gD912qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XvmMUncT; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XvmMUncT"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-485350666bfso6372895e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 07:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773929576; x=1774534376; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FBm9v0O34/XbskwEKjnyG6Sux+grgN+yYKoW6CPKPzw=;
        b=XvmMUncTeV3+sgzb/9H80QjW0rVgvU//YBDgFZtGe3hEB7/zOSrokKMu6TfGrVDLgp
         APYE/1OXSbV7L8lyeCFyHyEy+dGV7HonRz6uWfY8CUb4jBLVlG2UFtvQcSUMdQlU0Ufh
         hEDaViC+YosfI/w7IClkgPviR24DnRwdX8efqi44Ob56bU/dfbtndY3Qj+BR9f2SzYQ6
         e32WYuqqgmIBVABnksM2R6s2+/NpJcojrB2Fy8T2DiAWniSnzc3zmkk5Wd6PtiLR68Rx
         vjPRaj7i1jhhFHk6b7dxbCutf1gQPMqL1ZHFo5p2l5dVnzZ/fiY3KaymdjRr1ywrfSRX
         gdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773929576; x=1774534376;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FBm9v0O34/XbskwEKjnyG6Sux+grgN+yYKoW6CPKPzw=;
        b=CRVMhFH/3vRhq1f9fzlzWkF5A4kW1jupCskMu39acLme3mlCmt7qdAnxwQdzt/ibRL
         Mjcg7lr/pjvW9jNQcntdfsX2JJM7hgmNfrZJzsYG/5HnIzg4vYl7l13RARsqN4Ql+NvB
         mn0B0PETHuY8micCO2MLdFhvub7p91TVcgpjz4NEqioB7xF2fBHs/xcAQU4qdjlbABXE
         1GkFwptPonqQ9T1Y2/kc3aeoMt8hQ8C9hMgEggBIBbK69337iPefRXnGpOG1SksPj7vS
         yzOTL/GjcGkAjJKcnQSZdZvmzdkB3Z34C8lGfu6Do4vTRfg76jgr1HWnzLrUy0yzbIpG
         YGZA==
X-Forwarded-Encrypted: i=1; AJvYcCXt8t+PKXGb1h+9PBbm22AnSOXAAV+AggbYObMVZnfL1y/K343mflaYZ4OLPY7aDi50Jgfe/Ur0cIv2juWJiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOuOkJBVi1NSCU44flv/0qGiJjyycNR3UR+1ylfBgIodSQfHev
	vuEUyV3Jfnxl8lAYZEGVZfH/2Xtm6eiJVEzIyygC1vzzTDYLEk8NYa4FUL+LQcoEJxbp4a+EXco
	OiUNwHrpSjXW4ox0suw==
X-Received: from wmqn21.prod.google.com ([2002:a05:600c:4f95:b0:480:4be7:3f3a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4703:b0:485:ae14:8187 with SMTP id 5b1f17b1804b1-486f441fc66mr125201975e9.2.1773929575614;
 Thu, 19 Mar 2026 07:12:55 -0700 (PDT)
Date: Thu, 19 Mar 2026 14:12:53 +0000
In-Reply-To: <20260319121653.2975748-3-gary@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260319121653.2975748-1-gary@kernel.org> <20260319121653.2975748-3-gary@kernel.org>
Message-ID: <abwEZaOSqnuwQCux@google.com>
Subject: Re: [PATCH v3 2/4] rust: add `const_assert!` macro
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Mar 19, 2026 at 12:16:46PM +0000, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> The macro is a more powerful version of `static_assert!` for use inside
> function contexts. This is powered by inline consts, so enable the feature
> for old compiler versions that does not have it stably.
> 
> While it is possible already to write `const { assert!(...) }`, this
> provides a short hand that is more uniform with other assertions. It also
> formats nicer with rustfmt where it will not be formatted into multiple
> lines.
> 
> Two users that would route via the Rust tree are converted.
> 
> Reviewed-by: Yury Norov <ynorov@nvidia.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

It may be worth to mention in docs that const_assert! may only be
checked if the function it appears in has a caller. Whereas
static_assert! is always checked no matter what.

Alice
