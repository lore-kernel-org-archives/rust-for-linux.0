Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77292820D5
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Apr 2025 09:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744709251; cv=none; b=jd+z4Saj3qseO5OjaeIvuy17LgKDAjbF8ZRf3dCIgFLhAZ9yif++WynQI4tow5wZJnM+zC6bxiIh/IwbR7n3MGv5/W6MLZSbX+rcGoDbmmoJWy8qTTYSkhDVCjeDW5MHEqaY5D4GZeRltg6ERBADE8ovpJkteETnoshWFlbbnA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744709251; c=relaxed/simple;
	bh=ACQuDtLySJGUDdPySwcX9laZ30nm6+nLm5qXV88Hr4g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s8fApPM6HDL+ZADF3yMgdsAvssu4g8epcw3SZkSR5wkfRArTG2utkidH8a90ZM8VBM+yZXLdTVpPVam4NgsxmkiJf3zzrZDZEBIlmQeFDeKECzQ+pvlyo+4ir8hGVJkVtZPRZZp3CDfCBTuZW7+i8jC89DCelM81jiET1wQ0wZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TTscjFax; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TTscjFax"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d51bd9b41so41877105e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Apr 2025 02:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744709246; x=1745314046; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xNqTolRYwEdQ0xZi5RcJyGoxOrWsQ0mEIGkr1N9o2c4=;
        b=TTscjFaxJJTBmBvktlTtVNPIhW4kOtmlmtVfJDUya0+0QptH5G6TO616jAkxIYgWzS
         VI/HF3KEb5k4gwdMtOubR51cHOTkl1SH03800okzDCgX2fj5lte064eD9JqOno+O+yuF
         A0MWFpMghyouF4Xj30Jjc0WXNd+iG84x94okp2IL7OEmND9nNAwlawQzB+cnoSsSAzTg
         dynNN2//ZE9c7Kge33bJihgvJyW9OX3J4XWIKFMdJyAM5AymCN/Qz5VFBgbwA/e+xsEs
         16EjoYYAfV2lBEbKQzXQceIdSBEcE01ozo9KvyYahcbovRGrFmlzEj9lQGIE1YbQYsxr
         HxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744709246; x=1745314046;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNqTolRYwEdQ0xZi5RcJyGoxOrWsQ0mEIGkr1N9o2c4=;
        b=gCRjmtn/JUoLADtBqXURqS9u+BbjnUTXBZUzZXXETs77/ha513wFvCCsHas5HslNEj
         1C4Wpa2TsDs/ZCeRQ2y9DRFDCTXqyFgjdYyQwRxjxT/XoBtKyWeZpVRp9EpkdqJccNcX
         pGbX5pwzRFnJyKNIKgNizP5B3TKojATyX2SeSTUmdgcB+XjWUOcULNCx+/T4j8V1mrNu
         v86je5HWfV8MB+hmkRQUnSfUogh/fP+aPgtmsk4ksTcnidRDTJkg4JQ2Zt/NlHNl5RSV
         xX8hUyjdgDTnQT7LeZx10TrWgA/qtIRVXv8uSIhbCplJ4TR/zD0nsOteOJe4iD/XHzwu
         88jg==
X-Forwarded-Encrypted: i=1; AJvYcCVqBOB7Av9XkAamEJ25my3p4C56r96vh/91MLwdLtmglxFCyUaort3p8oiIQS1Ts7zFlXVD+8GdfIB71P2hRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YynufXU0kfFfpo/5DniQ+2dm9uAjySLaDHvMWPnTjdFyAnJDati
	mRst+YTzIAalVTw8w+nwSmRlkdRXZMFhZ3p9L7MudJielFpZr4sFmxIwPWtNdxybnpsCt/lbd9t
	MJQRr2Dv0dW994w==
X-Google-Smtp-Source: AGHT+IGNOnYD9JWXHsjrfEKTxmUhjAQDAgXAWdeq5XqvcbzsPrWDx2ckJ/DQU+m/oiKaf2kSydGbCqfW3XxRxAo=
X-Received: from wmbz6.prod.google.com ([2002:a05:600c:c086:b0:43d:4ba5:b5d6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b86:b0:43d:db5:7b21 with SMTP id 5b1f17b1804b1-43f3a9b4865mr111301865e9.28.1744709246233;
 Tue, 15 Apr 2025 02:27:26 -0700 (PDT)
Date: Tue, 15 Apr 2025 09:27:24 +0000
In-Reply-To: <20250414171241.2126137-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414171241.2126137-1-ojeda@kernel.org>
Message-ID: <Z_4mfK2MK2xclvbW@google.com>
Subject: Re: [PATCH] rust: kbuild: use `pound` to support GNU Make < 4.3
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 14, 2025 at 07:12:41PM +0200, Miguel Ojeda wrote:
> GNU Make 4.3 changed the behavior of `#` inside commands in commit
> c6966b323811 ("[SV 20513] Un-escaped # are not comments in function
> invocations"):
> 
>     * WARNING: Backward-incompatibility!
>       Number signs (#) appearing inside a macro reference or function invocation
>       no longer introduce comments and should not be escaped with backslashes:
>       thus a call such as:
>         foo := $(shell echo '#')
>       is legal.  Previously the number sign needed to be escaped, for example:
>         foo := $(shell echo '\#')
>       Now this latter will resolve to "\#".  If you want to write makefiles
>       portable to both versions, assign the number sign to a variable:
>         H := \#
>         foo := $(shell echo '$H')
>       This was claimed to be fixed in 3.81, but wasn't, for some reason.
>       To detect this change search for 'nocomment' in the .FEATURES variable.
> 
> Unlike other commits in the kernel about this issue, such as commit
> 633174a7046e ("lib/raid6/test/Makefile: Use $(pound) instead of \#
> for Make 4.3"), that fixed the issue for newer GNU Makes, in our case
> it was the opposite, i.e. we need to fix it for the older ones: someone
> building with e.g. 4.2.1 gets the following error:
> 
>     scripts/Makefile.compiler:81: *** unterminated call to function 'call': missing ')'.  Stop.
> 
> Thus use the existing variable to fix it.
> 
> Reported-by: moyi geek
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/291565/topic/x/near/512001985
> Cc: stable@vger.kernel.org
> Fixes: e72a076c620f ("kbuild: fix issues with rustc-option")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
