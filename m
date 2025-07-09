Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2036A2DE20E
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Jul 2025 13:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752067584; cv=none; b=FbW0fqIhpbEl9HeLdNDRhEK+DivGf64dIdlet57/FeQ2jErAC/SNlfi2HOFUFFSwWRk2R6E2Eb7o7RAvnSExvNT79hvSPLe5xxLBMvn52Xsy7GSgaWFU79Qbj86/hwz6cedKQUteNhLy6COwtkLKVah9sJB4l7mzZ0FxuZJRwm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752067584; c=relaxed/simple;
	bh=EpIPSnFL3zxtw4E9KyJjVoSQ5FEr+FAlGgdFcHUVawA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mUdVTAtVVuq41o34gqX/yiKmWSn594wcMK3+Dsf1sC9ASJJb/rcaH0xHRdMYNW9V4C31o8c2CBU3UqIN8ON3sIFiwOx3cAMFawCoS/xFCCOXcVjzIO7hd5emTmoPfIiROI7qUfnZ0vmlzv+tCJPnthQ+/yngO4Y18RlItVj8ojo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hdfwN97u; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hdfwN97u"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4536962204aso24066385e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Jul 2025 06:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752067580; x=1752672380; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/2XZ5Qh0Y8/xBI8hFk5wtj+oH/ehg5gQNl0hSLZ7V4U=;
        b=hdfwN97ueykNPqM9h7gIbIpwras/T9IxChYMMHvdZLmjnZU0Fj/Cz61jMSuuzwxPfU
         PhzeQpzO+B+jVYmC/l+KksYF0PEhbTVBK8S0gCoz7Mi6eT/njDRjYB2oiM5n+1+o4NQu
         QupOVJrgqdlm7k7RBxjh54/wzOcG6zpe+3VhH0c1iJxBCHzyZhWyROUPO7Cs/tAz15vO
         44LziQSzP+gVT+Gtm5GVKJcJ1aTaLieYAulRzg/LNGyQ6vFuPthUGdwqeULWDijSNmBf
         DW8UvLd0LBXD8znDbHnNDPZXkDYMjFDJRFq74FGCeFXDYMbi32CSTx5J1XFShtXkaU8G
         VA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752067580; x=1752672380;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/2XZ5Qh0Y8/xBI8hFk5wtj+oH/ehg5gQNl0hSLZ7V4U=;
        b=rFN46r+3yOK3Z548fQzYQXXdDPwj3+Sj6ZXHit2nvjWYvcBZZCRuNTbyArEof+aMxo
         s+QcbDYhOy+b3Wwrw5tsIPehHZAH0S6m9S0xnNLhcS8RvnUOXY61ljmrun0OKc697iCo
         FAIIweeiZsv+quwBX2heFQfuqQlvjkGlM4kFn+Ue2jJcJRmXhLxBBAIfOvpFdEdSkBlG
         Bu68cB7pLp5WEqoI23lXD8g0mWot8U1voD7wy218X/53JKn0EpbaBUWl4N7DdLWXe3wy
         HyTDJJ41/D5mhjZAOJ3SiJjo5cXA6Qp4acCpze00CAvk4t/9GGANeJAOv3AI2XCFBn6X
         Cg1g==
X-Forwarded-Encrypted: i=1; AJvYcCV5bBk6aKPTy/6zc9wxLZS8Dx80qsqT3xVgjpCqsv843p/KOrVU2BSb3+0s02OHhqaDLPswxcZyyq5vd3HGYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu61KlHDTcEWdv5O6NiQXg/hYlBFhL5go0zRHLLzCVV1t0/XT4
	/PZknWyjCfUUmsEbA21NkxBbw/WJWHVkNw8GGgAhNzGDHsZqIHmChICrSCmqhPJBCYL3TyRgZkW
	WuWq7Ks6PiRYYVix3Mg==
X-Google-Smtp-Source: AGHT+IF+xK3vC0GxnM5YgdFqU78a1/83sM+KndWW9pR/GYUNx+a3eu0I/KM87az6bLdBJy/RPRIBoTlPLaO8DO4=
X-Received: from wmpz13.prod.google.com ([2002:a05:600c:a0d:b0:43c:f8ae:4d6c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4287:b0:3a4:f66a:9d31 with SMTP id ffacd0b85a97d-3b5e4514e3fmr2393240f8f.16.1752067580535;
 Wed, 09 Jul 2025 06:26:20 -0700 (PDT)
Date: Wed, 9 Jul 2025 13:26:19 +0000
In-Reply-To: <20250708-rnull-up-v6-16-v2-4-ab93c0ff429b@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250708-rnull-up-v6-16-v2-0-ab93c0ff429b@kernel.org> <20250708-rnull-up-v6-16-v2-4-ab93c0ff429b@kernel.org>
Message-ID: <aG5t-1nadCfvD9uF@google.com>
Subject: Re: [PATCH v2 04/14] rust: block: normalize imports for `gen_disk.rs`
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Jul 08, 2025 at 09:44:59PM +0200, Andreas Hindborg wrote:
> Clean up the import statements in `gen_disk.rs` to make the code easier to
> maintain.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
