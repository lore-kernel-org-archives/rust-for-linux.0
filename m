Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CD7371067
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Apr 2026 07:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775718835; cv=none; b=WeSTf9eDYihD8RQDkUbRGyrPZUf02w3+4s08XbXdH6sUcSs9dRwpMqe9yQ9cHH1Vg+6QQW20Jgk9WmRKZxlzxyrudn8nHLc6dEn5qtO2rUVsh2CWbL0KnilSOo8jhxH5VlLnNeeSm62nHYseIVzfrOjgKuwbD2YswItJVgBmszs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775718835; c=relaxed/simple;
	bh=PVvb/RIn+tv7V4C/+1ilfmq8sRV5Z248MllMmaEHMOQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bBeZ1IiMjemlNuazh571u5uuetZIpt+Sv/a2AZrtTF2ZA//eUBZ4CmjYPbGo2XXQY5orBQOkoOkx6hYoC6JrNHWniwlORfyOl97h4Gs9VMgDKUxmfI5yo2Ju7NGxAyKKjP2NgKxkfdxPVSZ34xUFJvzye7dvfNUqE4kGgeWZXfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z60wXDyc; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z60wXDyc"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43b8f9374dfso242181f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Apr 2026 00:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775718832; x=1776323632; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wjFIjIvSR/JMqi+QOHbrvOa+nrKiEs51+m9xjgP0D3A=;
        b=Z60wXDyc5kl4RHMnKfUijtSDd+y6YkdepZiXzNAr0KFitopFUJG/EpDCFSeA3Wj+lv
         dqKFd4y07ZjZfH+lXlPq8zqG2VHIXhdAY8Ls1xbD4r6iaUV7vhpnE1kzcG73Bt6iOvo0
         N9mBGM9wCE9oadLYYd75f7PkWmyUwEkRWuDTw0j+PiCe0os168ZQNo+hKuJ8maBoOShW
         7vxAwBlr+oJKw2uq881fHbOoXtLu/+XeAQV8FrwAR9Aoe29wZxSoKqphOw+ImDHXonWu
         7P+qly25s3LSvI8/SQ02Ecsh74Nop31JPJLsIP9cvP4Rab/TspY5Rjt2Ex0fDsMhmTPZ
         +PvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718832; x=1776323632;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wjFIjIvSR/JMqi+QOHbrvOa+nrKiEs51+m9xjgP0D3A=;
        b=oAf5G0NnYOY19ph2hAQBDIoZUgMGT+oPgV44ImEEQYLvhsODKqGjKqvzgChTzaKUJ0
         mlui5wjnczuhEkifRcHoEovs3Nm/F3UBmMvFG4bPIWP6jBqgJ8JEYOBY0aq89PUyip5x
         8Wvl7pnz2TK1TH1ZOuQ1skDlScZOTAxuOJJSFzGJ8MuvPi7t4PQ0F38Bpj7lGqfdG6tR
         btTXBlwwZpv/tPoNxNa+HPGXm0bq7cJCtjbaf7W+0nelP47ZgEbA4NPt9UjBVgUBCAd5
         bF2g5/C3t/Psd7TKYoe+ZYXIlm45INdo385Zdy/SI/stkpoWk5jAXjN3jQn6H6OqXs2h
         Wqgw==
X-Forwarded-Encrypted: i=1; AJvYcCUpeoM9rhvJGVDHlyyQXB2XlTOMbpmp4Kc1pTDDVzu3l+Ea61O/9YXTrlyX/hOr3Uwf1hzlW6CDPpisLkUb3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb13238z9JPwFpfHcn1yoat6hnmksoufnfdbo4iZRUG9PZWSbi
	k0oDpOlIbR66/VW2b5B7PaExiulXSGHjQVVW+jg4aUO3csvCgH/YEbXK4yOe0xlDLuI89feJ7cB
	7nW1SZ2Gzx5wyyinWGg==
X-Received: from wrxh5.prod.google.com ([2002:a05:6000:5:b0:43c:fd36:a1df])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:15cb:b0:43c:f952:4292 with SMTP id ffacd0b85a97d-43d595d9fd5mr2639438f8f.27.1775718832392;
 Thu, 09 Apr 2026 00:13:52 -0700 (PDT)
Date: Thu, 9 Apr 2026 07:13:51 +0000
In-Reply-To: <20260408200949.99059-1-delcastillodelarosadaniel@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260408200949.99059-1-delcastillodelarosadaniel@gmail.com>
Message-ID: <addRr0lfeThLsmR-@google.com>
Subject: Re: [PATCH] rust: macros: Replace match + panic in const context with
 const expect
From: Alice Ryhl <aliceryhl@google.com>
To: CastilloDel <delcastillodelarosadaniel@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 08, 2026 at 10:09:39PM +0200, CastilloDel wrote:
> This patch replaces an instance of match + panic with const expect,
> which is now usable in const contexts after the MSRV was was updated to
> 1.85.0 (it was available since Rust 1.83.0).
> 
> Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Link: https://github.com/Rust-for-Linux/linux/issues/1229

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

