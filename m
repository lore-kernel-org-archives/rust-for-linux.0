Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8018530E0ED
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 14:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929839; cv=none; b=rl9sH1qrofM9aWMV6UidKP1EdM2VxH876w8Sf7m0LHSj5S0iAua0H6Gyd0eP9mEWnSNIT7ggbaf8AJMg/MOePDf0zDid1JlLT5jm3YgG6wAlACqqztiafi4+DgoyXgznHmqgeya4Pkn8iWrmWXHQ4T/rFpKRJfvm+WLGTB6geGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929839; c=relaxed/simple;
	bh=gx8RCmvdAiFYTOkr4m6NBCHbOmzu8ejCqPtbUOew0ck=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JKJqvIRfoTzMSezZU2fc+Fz6o4zsRgt/u5uuIlLZNV1cH6KOWuxuvZgKmZw3Oyv0PYNmOYliG1VqPo+nAt+7zA3iNHSxAd5otft59Sj+T/HxmhCet2+pHveHXV5uivJqo3EGJEEuvdgaqI2HAPM21Rib7TeFTYCOat4Kz6aI2QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rmnveH5P; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rmnveH5P"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-485350666bfso6408095e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Mar 2026 07:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773929837; x=1774534637; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J6kpHhzX/93CTvH4OmeMUProQQx0JS3+bbWlVFH8mu0=;
        b=rmnveH5P2ZhdjOuuYsTSFrCPYbhOMfYePL2TSLM29NpmxmSGlRfutVOeQROX6KFSGB
         1reZdpP88vpMd2kcJh9FGnIyy6FfTyWvb04PRFzDBUsxAMtwUMZB12/VF3uIt2G8qQQZ
         4IVuReXpzJ1tFtYF1YQ2isWmHAK2DyqRUxx4LSNpnc/1lDHYwxd0otB7ySS+nnjEL9wG
         wDkQLopaJkBXGs8oT2iN+GS/4LY5+Ug8FeBJSn7yLC8NTRAB4gRvDvPYcH79LXuw5g+D
         +/UoX7QZB7vIfvDvxDbVQHH7me+g1o75FsV+hLK3DuVoUzc1WKHkbY7tR8KZxYUFq7XJ
         Va/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773929837; x=1774534637;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6kpHhzX/93CTvH4OmeMUProQQx0JS3+bbWlVFH8mu0=;
        b=ekSPTN8Qiqox3vm/meJ4tcoYIsGDtrpqWiR/M6PZW2YB+cNhrDcJBOA2ItRVhkcApQ
         +TY4lNh/mcNicwWHCGzPYR9+5/tk3jN2gUsnV2wWe8WsNvYvUYAa/PZB+rXQIH1JdptQ
         qnf64TWmaXCYHWETvEl+ahbRbzfVxSkU5rtyE1R+EMDXyUlPOV5RjPm9jtBuuY/pUs3u
         80XI05Fl1D0YO+B5ySf7RBE96Amd5ngcSs8SCHZ7GHFlxDal8tyqbVp5/T584zCH+zTX
         TpHOqBNUc1jsrol9bxNFxx3+dzh4wNpJwx4gw7jaghZ++rr4wYY+VMuOHbTV+z4h6M2R
         TM6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUI0csyzF8lGPw7+iVVySynzzU+55BPbDFAwUPXq5/rKbtOP2L6p0YdmzatTyLTmyJrpT3+ewqgqy4VvjeZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+xoKZTJVoC9LtPLda2GKlbfO8Se2SyjXKwPnrJwRFy3YFBXSG
	rkoLA3Wr4BrjOa91tL+dAHPbZc565IuuLK2jsp9oUg/w24Go68Z0/DOVKrfCXGY9+bcdOSRgfc4
	BNRbLvLMOt8cG5MItSA==
X-Received: from wmkn10.prod.google.com ([2002:a7b:c5ca:0:b0:485:1ee9:c5de])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46c5:b0:485:419c:4eba with SMTP id 5b1f17b1804b1-486f441fbfcmr129613105e9.1.1773929836731;
 Thu, 19 Mar 2026 07:17:16 -0700 (PDT)
Date: Thu, 19 Mar 2026 14:17:15 +0000
In-Reply-To: <20260319121653.2975748-4-gary@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260319121653.2975748-1-gary@kernel.org> <20260319121653.2975748-4-gary@kernel.org>
Message-ID: <abwFawoOI7NtrFpX@google.com>
Subject: Re: [PATCH v3 3/4] rust: rework `build_assert!` documentation
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Yury Norov <ynorov@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Mar 19, 2026 at 12:16:47PM +0000, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> Add a detailed comparison and recommendation of the three types of
> build-time assertion macro as module documentation (and un-hide the module
> to render them).
> 
> The documentation on the macro themselves are simplified to only cover the
> scenarios where they should be used; links to the module documentation is
> added instead.
> 
> Reviewed-by: Yury Norov <ynorov@nvidia.com>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
