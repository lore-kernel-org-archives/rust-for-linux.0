Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B03413230
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 14:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102902; cv=none; b=uf41cwXtikXW2IBFJv9NxzZl3XTrmri2xLJs6N3sMX6fUVHnQ69zzsIehmFOChu/7e8J1RPfRuY9oha3YuAMrLbQXeaCULY9pdvScMO4fTWqlczeDIW8F8lmXBXi0cLnzr2u6ho+wc/ksQtmy2FuvWM/SGoMVgAqtgg4p7knyhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102902; c=relaxed/simple;
	bh=wPnpLp8Tkf1EcxdmimD9podW7Pj9Kcz4BTuowIEiEmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dB3AJ70WzRX9hTV4LEHlSHULsj94lF466TgczV6ISLF7Bx76qaFskooy9m/uAX2TygcehJmrEcpzHX5nHaC10vI4uccrzRu4Pziu/vR8F5/g1Bc55moJbRlXIPa/qcYAsmBvy9BC+HsvgiMOhi46Yx0Aw+ZAH9+xmq4s1EFv5hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FNqcUa72; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNqcUa72"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490ac10e337so57372945e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 07:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781102899; x=1781707699; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=arsHl3hytXvoPGGCrzWJqM/sm6/JUsgdcn4JlpnXn2E=;
        b=FNqcUa72ScWLu0CO27P2nrHmh9XlvJ8GxaOtJAb3/ee4tNYLqEckT0lSgidX9zbI4d
         qaO1NgQjMRNywFo1Wa6LDjPh9M3hzS76eire4QzHtFg3tL1WrPzGCoaqAB2b5OuByU5t
         K++Ou7KeluGyISAkCbps3u7DN+NILqnK3e+SOCD+lvxYqtZyvmXX0JXfhyRILkhtM2T/
         L+mbi+f4QpDN+tuOhJ/h0/Uu/0mcqw/iRK+mRO88o4d/bNKcNYFBftnlnMT3N9cG++MD
         q1xzNkadajAlTo8AAVFSIxhim4T3wh0t0UGEVl2czjA2FMAhKUM9S6TxbwgHldAgZeEW
         aDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781102899; x=1781707699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arsHl3hytXvoPGGCrzWJqM/sm6/JUsgdcn4JlpnXn2E=;
        b=Rb9fSfdMLHIWMS582b4qXFB5wxu9Lnf1OQfZJkjcXFeLXGb9RLnGpyT9WmDI51mXi4
         AV/5AoG0k5jgciJKFIZtNHxSpbBnBNCRWtftRVoLDjFOjTkK2r8iE/8OwfPQY7XBmQC1
         sRfLB6JJ9RBR8ZBkMFfkAALSBbBGjhGQpo/nLDH5i0QPb/7gOlFrIoCvOqqN7Qx4SKPd
         Cj+DLTMwG3ihsNul9f+mni7n/oWqqmEfLThBwocD09dGf5tEXnQFoCEiIQvlXLYyEAwm
         PiWUA8GT5vhtbBkXfNLjGa1bSQ7dh9/8dPxdaAzt35QtXuoipW6jzNV6QQo6ZYOHdlZX
         ms1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/LS1z5aoEEMJ9ibVhsZ5uMbBWsMANYmdn3wFd8gXPrG2sef7FOLhCmX1TaUoLLUvXEBMTiVoTXaLgVQIOibQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdBUTxSoa80tKn4Fzo6LH4MFoEfpvCPuWu7y9qMg85fg61v+fy
	vGMUoKpmZcSbDrmKZBfI1GiZvnBwX7Q+GNorVyh/d3ykn2qOKKZHw1PJ
X-Gm-Gg: Acq92OF8KWs6U5M3edW9PAhmAx8NuTdtm7fKAc+xEHnqpNSnitPvCv1O9X0A7HOt2+5
	g99RGXkImcoNVN+ZaDOSuzltAa9T9D6Em3cTSrUEGT9HAvo9V1C7ZyS5DJ3SnijsB9G+4jTVNSx
	5Do7czaqIQ/MlIvhtqFIB9z09SU3RaPzzNAoSIPVXiDnr51hhpZOg4bd9kF5SOhoCwFs+cVHXT6
	OkdXmLpxk0QP4Hd3oVnyfUAIo4GZyqCCz/xSk9Vekad1A77KuixjV9mNDrxLqVaEAVltRt5wWeD
	x/plIuBf3YpVE0m4dNlKBcnzxWujqgjw9qtrcb2uwTnNtLpqU+lgK5x1IpOLP1B99mGOza4JX1n
	+Q4bao/HuvrcGRa6AQvVF9d/OVp+loNanNcBVvQyP5o4wnAEC5Is+595YOZ2lKw+zNlz7+TL1Yk
	uCBDJAhtP8gc7r+Aa902XEi2HsDGEQ9YRt0vJKJPPgLV4jUpwOg0dAKm54ZdDKnrjxm3xkhNj5O
	Q==
X-Received: by 2002:a05:600c:b93:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-490c4e0414emr409860885e9.14.1781102898732;
        Wed, 10 Jun 2026 07:48:18 -0700 (PDT)
Received: from [172.16.16.15] ([195.100.225.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dcab44dfsm69288225e9.2.2026.06.10.07.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 07:48:18 -0700 (PDT)
Message-ID: <9627f522-7d94-48c8-9848-30761c9234bd@gmail.com>
Date: Wed, 10 Jun 2026 16:48:16 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: add procedural macro for declaring configfs
 attributes
To: Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>,
 Breno Leitao <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-block@vger.kernel.org
References: <20260603-configfs-syn-v2-1-cb58489c2647@gmail.com>
 <DIZHKJSZXQ4Z.6SPXJVGDV9ZW@garyguo.net>
 <f6a513e8-227f-4b22-bd4d-81d88536eff1@gmail.com>
 <DJ5A9HIJ43EJ.2K3SCFI7UR3NF@garyguo.net>
Content-Language: en-US, en-AU
From: Malte Wechter <maltewechter@gmail.com>
In-Reply-To: <DJ5A9HIJ43EJ.2K3SCFI7UR3NF@garyguo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/10/26 12:05 PM, Gary Guo wrote:
> On Wed Jun 10, 2026 at 10:15 AM BST, Malte Wechter wrote:
>>>> +
>>>> +        Ok(ConfigfsAttrs {
>>>> +            container,
>>>> +            data,
>>>> +            child,
>>>> +            attributes,
>>>> +        })
>>>> +    }
>>>> +}
>>>> +
>>>> +fn make_static_ident<T: ToTokens>(ty: &T, suffix: &str) -> syn::Ident {
>>>> +    let raw_id = quote! { #ty }.to_string();
>>>> +
>>>> +    // Sanitizing syn::Type::Path, this is safe since it is
>>>> +    // only used as the identifier.
>>>> +    let normalized = raw_id
>>>> +        .split("::")
>>>> +        .map(|s| String::from(s.trim()))
>>>> +        .reduce(|a, b| format!("{a}_{b}"))
>>>> +        .expect("Cannot be empty")
>>>> +        .to_uppercase()
>>>> +        .replace(|c: char| !c.is_alphanumeric(), "_");
>>>> +
>>>> +    Ident::new(&format!("{}_{}", normalized, suffix), ty.span())
>>>> +}
>>>> +
>>>> +pub(crate) fn configfs_attrs(cfs_attrs: ConfigfsAttrs) -> proc_macro2::TokenStream {
>>>> +    let (container_ty, data_ty) = (&cfs_attrs.container, &cfs_attrs.data);
>>>> +
>>>> +    let data_tp_ident = make_static_ident(data_ty, "TPE");
>>>> +    let data_attr_ident = make_static_ident(data_ty, "ATTR_LIST");
>>> Instead of creating identifers like this, just scope them properly so that
>>> a fixed identifier is used without colliding.
>> I believe it is nice to keep the identifiers unique, especially if you
>> have many fields
>> you can easily differentiate them.
> What make_static_ident is doing I think is quite hacky. I'd rather not having
> them. Plus, the identifiers are not seen by users anyway.
>
> Best,
> Gary

I will simplify the naming of the static variables greatly (removing 
make_static_ident), but still generate unique identifiers.

Best regards,

Malte

