Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811AA3396E9
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 09:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769765818; cv=none; b=A/afPJn1Tcn1zBVbaEnh1dYQlAs73y8BnbLgHAfwf6lT+KcLS/X3lZxVWEuo8SuYpsUnqvqjOW+dbpa5VIYLCysv9WAy1TGk2D64rIbI0TYojMiqe9gvVK2BHFkxiuDwgIHkwZeg+P7IB+ojxM/SJ0BxygSDSzL0z6dzPUcm1HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769765818; c=relaxed/simple;
	bh=BLz6J8sxyMrE62ZOAa2vX3Jaiyx1D5+eYXHfqLUktvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vDJcpmyR4N9LxxHioy45vb0ujOhy8j7qJq2Oq9X/uDPyxBRb5mauuaeEl2XidojVoTDa4XHMjRRSts7HymQq3BEN0EiOXNymPzKMSEuD+dcD4al/2s4SRN63Mjlbpt56g9dUszsGFHPCDlHLRXQ+FT7HnG4I7tnfzHxWOUTLMn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdPpH9Xt; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdPpH9Xt"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1233b953bebso2089924c88.1
        for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 01:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769765815; x=1770370615; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8zq5baMT7RWrdtdglgJK9Mog541Ficeysb4gE2eqeeE=;
        b=VdPpH9XtohA9p2n9a7j6WWxpctarqOQJEORakk2W3PeZSLU6gyQuRdcQfnY33tGbJB
         RDU4JSKBf2LcXxpUpCo0PChH0W8PlBEmIvKeQXQqDetBbAZcHGGbeWqLqVph7PPwrI0k
         CLBk60DxjrFJBVEOSOvnZ3wiOoYA4Sw4jzJm0J3M+XvFxjT81hAIJQ5FzEI2VGsaOOt/
         IVQDbF0hs6NPX2aSpGxpc4W53bV5Y4BdsAtj6h+VLetboPLRcSn0zJ+FZnXLIM9T7N2Z
         9F0Xo0Q+PKIM3ttZBWg012TleCz8fyNXFOjBH6zeidYqltuUu4lnUGMfQifR0kcaOSnA
         cCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769765815; x=1770370615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zq5baMT7RWrdtdglgJK9Mog541Ficeysb4gE2eqeeE=;
        b=k5VaG/A+K4s9fuUhoEyfybpS+HkoJ4/ukVUBfIuVjr+T+KBJ8dEBPkB/e5rXMuglmA
         58WKIV3gC37od9LYPpb+fmt72b+0HWuve13KujiQbH7rt5yRFSeCpE2i/cg2NMvkfOUp
         jrpO4GI/ldm1Xxe7jrLzNMFPp8/c/vXkpzd+xpgBKqW+Yfq36udw501GnDjw85+qxKEK
         4bltj50ddpAxIzDTQRL7rrXFvhfSjCRRwmykmoDrk3RfNyOgp+xU0n5IkVdZj/vTkdCE
         iNp46l4XQNP3kgpVFRG8kwRmSAi8XPmpegWVvPFUrrejl3hHvCVSLt2tMkQYemhQNpxd
         KFdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeEn3VZA6kziekfiaAGiOb001/i7zFs1X9phaEJB3pQdZRtTAgawmLM69VWSMhSc6upAdBlZ0qp/hSujRwPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7uPNBlnyPfDJexrRPnnjSITOoLfrKaAq8+9sXx+hMFMf/93ve
	DKDBYYOUVYeFkZYxthVZm1DA2qXPH4/hsZR/ncLdWGZ4xCqAzInbj8Pc
X-Gm-Gg: AZuq6aK9D9C+wkbXotIoTrrSth+KcNvmqw8DDoxJJ+nQNNh2LQeLFU+R8rkLAiVJhNm
	+BBlcQRIG/Fr6PjZhoU5ET1L4/SR7PExY8PnZYt0tp3qj/phmOQR3ohainw37YHwoJV5KtjxLbk
	LF9z4oW1YJ/hc5IhMt3qOZb36nR5uQ/JfYoiY37RkdWaFwEoUi4ugVfaE616MmvJtnDe/OD1wvs
	TIOVL+OPT62UGqSLrz2pqRwP17m/iLve7JU8pov+jpC47PPCj33+8W6GwH8l/ko618u4fe+fyuB
	HMfvT6Gs93QalsYy87+C0eJbkJaS3MsFYOcudpNdxSQEyiywEvLyPJ7wMffoQqGz9pjjKVqId2Y
	14hw0s5EReDAQ+AdL65pkz/K4+6Uh0DHJhXYz7mJfuUVHeM4MfDcTzrpHOAZomljgJqXY0c324b
	qFguUDzDTI+fBmAiU/dYaypiQ2JVZghr3PClWKKz81stHo8EJHxawHpROZQrYAEw==
X-Received: by 2002:a05:7022:fa6:b0:124:abaa:7ff2 with SMTP id a92af1059eb24-125c0ff825bmr1381141c88.24.1769765815326;
        Fri, 30 Jan 2026 01:36:55 -0800 (PST)
Received: from ?IPV6:2804:d57:4e32:d200:d9b8:e236:f824:3578? ([2804:d57:4e32:d200:d9b8:e236:f824:3578])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9de948esm10422746c88.9.2026.01.30.01.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 01:36:54 -0800 (PST)
Message-ID: <a6a0a98e-d2b5-4245-b146-d2268b471e4f@gmail.com>
Date: Fri, 30 Jan 2026 06:36:48 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] rust: add new macro for common bitflag operations
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org,
 felipe_life@live.com, linux-kernel@vger.kernel.org,
 Lyude Paul <lyude@redhat.com>
References: <20260117-feat-add-bitmask-macro-v9-1-45ea1f00f846@gmail.com>
 <CANiq72=GtVTbjuJ0g0+aUr-Ae91oK2PGVXqCkgch4MVL=ydgsQ@mail.gmail.com>
Content-Language: en-US
From: Filipe Xavier <felipeaggger@gmail.com>
In-Reply-To: <CANiq72=GtVTbjuJ0g0+aUr-Ae91oK2PGVXqCkgch4MVL=ydgsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/30/26 2:25 AM, Miguel Ojeda wrote:

> On Sat, Jan 17, 2026 at 11:41 AM Filipe Xavier <felipeaggger@gmail.com> wrote:
>> We have seen a proliferation of mod_whatever::foo::Flags
>> being defined with essentially the same implementation
>> for BitAnd, BitOr, contains and etc.
>>
>> This macro aims to bring a solution for this,
>> allowing to generate these methods for user-defined structs.
>> With some use cases in KMS and upcoming GPU drivers.
>>
>> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/We.20really.20need.20a.20common.20.60Flags.60.20type
>> Suggested-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Suggested-by: Lyude Paul <lyude@redhat.com>
>> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
>> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>> Signed-off-by: Filipe Xavier <felipeaggger@gmail.com>
> So I was about to apply this one and I noticed a few bits (no need for
> a new version):
>
>    - This was added to the prelude -- I asked the team and they felt it
> wasn't needed, so I will remove it. We can always add it later on if
> needed.
Sounds good, no problem.
>
>    - Is `BitXorAssign<$flag> for $flags` missing for some reason? I will add:
>
>          impl ::core::ops::BitXorAssign<$flag> for $flags {
>              #[inline]
>              fn bitxor_assign(&mut self, rhs: $flag) {
>                  *self = *self ^ rhs;
>              }
>          }
>
>      This is why I like to have tests for every operator... I may open
> a good first issue about it :)

Regarding |BitXorAssign|, that was indeed an oversight on my part. 
Adding it makes perfect sense.

> I also fixed an intra-doc link and tweaked a couple other bits.

Thanks for the review and for taking the time with this.

Xavier

> Cheers,
> Miguel
