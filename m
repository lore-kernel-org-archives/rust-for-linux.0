Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1D522257F
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 10:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742206773; cv=none; b=u/VYkKJBF8SSW6UQHWqfTidQQBKPh6vaPLxksolAp6v+HfnJt0ZlRBZuTloiSsL/AQyYkILEp6g9+nEDQ32t7jCrugQR+UAm3Nn4OWD1WSaThhQvFTc78dZ+Zz3ys1BmbB4WDwS23aPqsuBz4MpGy87Wjwa+LTV0KFWiUXRIMXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742206773; c=relaxed/simple;
	bh=Iwj0e2LLnPw7i/f1rAreoO+5epTy1IjpFfElT38VN8U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RR6o4X6vUv6GA6qLhZpo+MSG08CjSs21y4FKa4L3hUGm47e+1ffPE/lhAN106kfG6wpv1kAN/0tFV3ZUidIPJ6h5Tl7Sm8efggdDUzADitGyX2pVlvOpRRdbHbEWEt1GuR7ZNAWptZk2AS2sFzaknqyBBC4+lI9HJm0Iy7z7Bxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sfdqCt5B; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sfdqCt5B"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cf446681cso10414775e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 03:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742206770; x=1742811570; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UyBjonNo415kXWmYcrkf94I3VLgp6hodTxNY4qR8/OQ=;
        b=sfdqCt5B02aPiQ/UMpCrVxPGdI9yINBLnaQ+SSbUmCctCGDzNnZ5VnlBPNeSC3Q5ZQ
         ZN0IlrLQ4K/R5mUWaBulGmH7xIMG11C7kIao/kl/KCFl3JB6Qk0UZ5bGEGRt56B9aqLL
         W4wlHYsLNSncBb8XalLxnzQdH2KPEevUVh3OCYUT5iTPeC2axgOHyBnexnznGymVniL9
         uSl+47P4InWCQLkG/TqO1TJmrn3eUpIX1+DMET1HyanFCypt/M3E0hX43hvBAd4yCPng
         XqsQ1agau4Wz0csjZyh2clN+DBbsU4PlJzXUx5haA8dAPuF6Uci+qd7AY9mbP74o0oDw
         Jm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742206770; x=1742811570;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UyBjonNo415kXWmYcrkf94I3VLgp6hodTxNY4qR8/OQ=;
        b=b86hd6+G83luZKDPVbcN5NeE4TVKS+wFrI3UM4ROGN3BJ2ZkyWDrNoU+s32eTzgX6e
         4n3s+L2ltiARY8Woid5HWM6qzGBGY3+bRSdh6PTAUv0nkGWjvfDsumQtqw0AG7YBrj9q
         vN9B+5LayZNSdY0U/zo2d9dm0mgR1xgvjUa8UVek5feVtnp5KbRmfKyJM3SJ4CPFVXIU
         WbU1NUBP6lskkWBilwtRIsaniaFR7ClF0mILh7Zb1zhQ8URRy/h46rBDLdqSiuzHDBCf
         YHtZ0t4VFX9s2CloYQAnhKJiz9F80x2vOUOnGt/dlVk6VbaetGk8R6QIXRBxNdlC+JdI
         9FHw==
X-Forwarded-Encrypted: i=1; AJvYcCUVyu1L8XcoW+F11ltkuPAMtW3QnAdpDleOfMFglJ35B6PdrEq2QCMmmvIXcWr/eyhk4YGDo6MIMUWlUIxs6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQuLNF0xqX3FEeAcc/rIZQ4v5vU45TwKZyv7k1yVExFPkf0ov1
	EyjmYY0+Gls149Pg1Uan5U51TsJV2JLI+1Hev63rixXBBtBM4FoedJDcF68tHDckep2/EJe0SUI
	zPBQpbKC1mb+j5Q==
X-Google-Smtp-Source: AGHT+IH4cxN84B215M1UAe4+/jph+2Nk4x9GxEmSR3WxXCDSmdC31PWtarZ3LPk2IW+EPSEcgTTVyKj24KKAZ/o=
X-Received: from wmbbi13.prod.google.com ([2002:a05:600c:3d8d:b0:43c:ec4d:6037])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:548c:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-43d1ec7795fmr117870085e9.9.1742206769859;
 Mon, 17 Mar 2025 03:19:29 -0700 (PDT)
Date: Mon, 17 Mar 2025 10:19:28 +0000
In-Reply-To: <20250315-rbtree-comment-fixes-v1-1-51f72c420ff0@posteo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250315-rbtree-comment-fixes-v1-1-51f72c420ff0@posteo.net>
Message-ID: <Z9f3MFguHNVBujw6@google.com>
Subject: Re: [PATCH] rust: rbtree: fix comments referring to Box instead of KBox
From: Alice Ryhl <aliceryhl@google.com>
To: Charalampos Mitrodimas <charmitro@posteo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Mar 15, 2025 at 09:48:11PM +0000, Charalampos Mitrodimas wrote:
> Several safety comments in the RBTree implementation still refer to
> "Box::from_raw" and "Box::into_raw", but the code actually uses KBox.
> These comments were not updated when the implementation transitioned
> from using Box to KBox.
> 
> Fixes: 8373147ce496 ("rust: treewide: switch to our kernel `Box` type")
> Signed-off-by: Charalampos Mitrodimas <charmitro@posteo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
