Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84D314A4D1;
	Thu, 23 Jan 2025 18:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737655485; cv=none; b=bkJF1of3F6yJhYBqm8NYytWwdZEqQ2EsPEDgQml3FbrGcPsZdfrknMGCRHJAg8XRjsCDChI4jBMbFWStTbWDA36VyD9r+RuLtl92ItNmtLXYpmuBl9YEUI+6C+y4z+PDcDB8uzCXN0CYrA0vde/QKElxHi6f0+6uT6/OOtUg8R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737655485; c=relaxed/simple;
	bh=ekR2lisEMRvEFByPDKbpi6P/ISPwSf30ftMlpZ+LZMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iS749l53M+sSFgrgki38lji2NrIQuDkc9y+qrHdvh4+udm5SbQCD4d1EC5a4V7RbQ4OB9PQR+j5/Qv5FfNYoTpEsLgFLipjiKuaNFSroIfnlgggZ7Mnori7tZXNhNagwDSMeQLRXHyfEHN8AVEv1kef3q1DjSICR7OydTA/DXoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfc3XMDg; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfc3XMDg"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43621d27adeso8528885e9.2;
        Thu, 23 Jan 2025 10:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737655482; x=1738260282; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zwv7xRTPCbZX92XbaTjCeDcKRwnFKHzW9665B7NqPfs=;
        b=bfc3XMDg9sar2EnnYnarudltxs8t13uCW+b+h4J+xO52Pzw9kC1gyL7y/zK+VXt1iJ
         R96HqTbg/puhjVRosXJnF9ultF6n8FHp11A4UHbbjVlNH+Gyiqcni6779yT9+cvuwl4m
         v2LlSBIpsreFNwxiNVUUa0FGGmxpPLfuAPHRUcH+rX1iay8A4B2P7vvCx6VOxW9oiXIs
         SUVfQqq1rwOBoThAQJgaU4TZvONN6tElxiV7q4Pmf3Hay186isUbkqnEelZYYA60MItz
         om3nelhzSdi8Fp9KNKkX93sDKeBYp3ruQndE/q8bi3MdlF+pUCPhBVYl3wAozea60H88
         tbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737655482; x=1738260282;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zwv7xRTPCbZX92XbaTjCeDcKRwnFKHzW9665B7NqPfs=;
        b=agK1EyVFfMo1bsUSO9GDNILNM2MVsMnOxdq7OZyBZ1Sh8BFTRiDWwcs2N2rq9tsugH
         un9d8XV68I8WDNZvVTtA3ibH7WP9lehRlVGz4r99mZ53Vc2JTmnCi1lYv+6CYP9modkY
         XpeR+0RqwrIXauxuHI0b/XRukeF7ttMCIOIKFjTF4pqr1m5Yoa0Ula71G8X9VhNg+lYu
         /jcZOTuuRrAI/4FwYfMQqJ0pxoLdc+BKLzyMTK8XmYvHfgO5WH6nAW6bPgOoPSEFkUdG
         ughTj25LkbSiOBwoDX5uOHkpsAEQjNgKO+hh6cdJVKifrGFeeV1JpHKlzf3Y7MacGgWG
         Q2ig==
X-Forwarded-Encrypted: i=1; AJvYcCVTMjo1GMRoq+DFpvlB4wqDaggMtGI6gNvqDx3nTV0kSTOt2HNfpwb4AsR7k4IYKO+k0UaXwk6hrZJJiFmcXWQ=@vger.kernel.org, AJvYcCXpCADolFi2S0ClJF2FN7P3+ji4AKdKkY4wrMfmx5PYob/5S+nLZsrB3NDWegDM0cc5tLlzrywDBZUfDAE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/y5LZwf0bVC/WU79Noo/bvGq4lJiojR9C6bJN0raGlJUguLoI
	MNwM7WcZbxC17jJEJTfUWP8UVdj3JKQggjtNyK5mib8/MxxcGwB+
X-Gm-Gg: ASbGncvIdLi+u031bEw2Oq43ARyZyb1C8c4pYlVWl7uSCAveJ7SD2+PlxP8uVICU/my
	oEtfoNPVn+n9lnFslLiVUF/caY4VZcT/BuRjHwkAoLqWy+pkh2zz4fHhCYqJZswZYZtPuzyrPxE
	Y2DHlJB/c05vAPwfOq445oPKYLSUVwwDaEitJCE5X+9Oe2l65m0fmds+UGTFeNLseW4cGdsOMBT
	dhxIPXWYJbi0C+NML0n+ofAgf0YdaAPIAcVL1xcF0Ou7CL3rTGsZI8uRHPhJNdeJdH11WsO5az5
	UXfM++Of6MvT5I7C6w==
X-Google-Smtp-Source: AGHT+IGOV5+oFOi6lTyCGPkgn685kKEFZoL07fp1RX22Ocg7YeezgebEDlBu036J2U7NMSUZ+x+Ptg==
X-Received: by 2002:a05:600c:5125:b0:434:a852:ba6d with SMTP id 5b1f17b1804b1-438913d5f4cmr230672965e9.9.1737655481557;
        Thu, 23 Jan 2025 10:04:41 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b319e900sm68715935e9.11.2025.01.23.10.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 10:04:41 -0800 (PST)
Message-ID: <760f99ab-e5ba-417a-a918-4d191c7f3ec3@gmail.com>
Date: Thu, 23 Jan 2025 19:04:40 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] rust: add Aliased type
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-1-edbf18dde5fc@gmail.com>
 <Z46Gzg_5kv-MwZNL@boqun-archlinux>
 <b7492912-3e58-43c4-aa0c-e6bcd4925e24@gmail.com>
 <Z5KCuct3QmgGUkIU@tardis.local>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <Z5KCuct3QmgGUkIU@tardis.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Boqun

On 23.01.25 6:56 PM, Boqun Feng wrote:
> On Thu, Jan 23, 2025 at 11:21:23AM +0100, Christian Schrefl wrote:
> [...]
>>>> +
>>>> +/// Stores a value that may be aliased.
>>>> +///
>>>> +/// This is similar to `Opaque<T>` but is guaranteed to contain valid data and will
>>>> +/// Call the Drop implementation of T when dropped.
>>>> +#[repr(transparent)]
>>>> +pub struct Aliased<T> {
>>>
>>> As I already mentioned [1], the name `Aliased` is more reflecting the
>>> fact that this wrapper will avoid generating the "noalias" attribute(?)
>>> on the reference/pointer to the type rather than an intuitive idea about
>>> "why or when do I need this". Moreover, I think the argument about the
>>> naming of the counterpart in unstable Rust (UnsafePinned) makes sense to
>>> me [2]: this type alone won't prevent `&mut Aliased` getting `swap`, and
>>> it has to be used with `Pin`.
>>>
>>> Therefore, I think we should use a different name, perhaps
>>> `(Always)Shared`, or just use `UnsafePinned`, or, as always, looking
>>> fowards to a better name from anybody ;-)
>>>
>>> [1]: https://lore.kernel.org/rust-for-linux/Z407egxOy7oNLpq8@boqun-archlinux/
>>> [2]: https://rust-lang.github.io/rfcs/3467-unsafe-pinned.html#naming
>>
>> I don't particularly care about the name, I mostly used aliased, because that's
>> the name that Alice originally used.
>>
>> `(Always)Shared` seems confusing to me.
>>
>> I guess we can use `UnsafePinned`, but most people won't know what that means,
> 
> Hmm.. but doesn't `Aliased` have the same effect, i.e. most people won't
> know what that means? Moreover, people who already knows `UnsafePinned`
> will still take some time to realize "`Aliased` is actually
> `UnsafePinned`

I guess I'll name it `UnsafePinned` then.

> 
>> also I'm not sure if it's a good Idea to use the same name as a (future) 
>> language type.
> 
> The benefit is that we won't re-invent the wheel since `UnsafePinned`
> already does what `Aliased` does here. If we don't have a good name, we
> should use the one that most people are already using. Honestly, at this
> point, I think we should just use the unstable feature unsafe_pinned.

I think that's not implemented in rustc yet.
At least no implementation is linked in the tracking issue:
https://github.com/rust-lang/rust/issues/125735

Once that's implemented we can use a `cfg` to disable this 
implementation on new versions that provide it.
(Assuming we use the same API)

> [...]

Cheers
Christian
