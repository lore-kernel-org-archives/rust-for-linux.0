Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D79B36C9E2
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Mar 2026 08:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611986; cv=none; b=EBxqMoAkAJTKzr3yKuCd5VCen2OGqmj7p83Kvc+esJifacAchlhywfF3bbvYyJHx7NjA+EL6t7jCckEosqsqUOM3CXRe7+llSez2BA8XgL9G/1TFYa67NTdcgbfJuygiquFkgSN6Ayo2VUA/7g/rwF+k53j2gSJrBikiGzTKke0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611986; c=relaxed/simple;
	bh=crWmgNqlnMBQ03nDgNxxQUvIWj21atNNvKm8ubqqak0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eX92EH3fkEMA4l55NoUXAEKyqQyT9eh5lftGHmWc4uoE26vbPGl/Gzvd5IjBZDzWlAay17NmU2UdQkvsiex9roQzNpWk1yNo4j9FsIFBISSeooBCxeJMDEztPj9jfQ2Vr97pTHqTPm3T1TMDnFRZMYzk4VyAoMsWC7LlhNIIHf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RNHuSUO8; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RNHuSUO8"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439c4a93841so715228f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Mar 2026 00:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772611983; x=1773216783; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lkljEEI7m7cvv1eaHcluPEw1Mfpi3L3tnqN5jye2x18=;
        b=RNHuSUO8Nix+PnIrKdsux+HzYnBwJJzG/fUSeLzNICww/skyl1gwIGV1OfoxYlJ63Q
         f5uk1WA3nsukO8gRf7+eU9/xeasxp3bA6GLdDzzkboFCLGqO+uThKdfgXHf0xjkZOZKk
         vIJQ6/3pYuLReI992EkGhKchXpg8RZjJlj5cUZ+wE6qoWxeAQouVPcHlSowxAJ25Mp1a
         aCcpd/Cv6uEZuG6SY4zjGOPPsflDR8B04kTi1cBEBrLfzA1TH3DbtpP4lOYP4G2LfNfK
         ifv8W+LzNoadTtzFxiiXtr7pkIoUim+PqZA2NgyqnJbv/A3VWeetLAGxJV2BaeZ3GQm/
         zteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611983; x=1773216783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lkljEEI7m7cvv1eaHcluPEw1Mfpi3L3tnqN5jye2x18=;
        b=rKiCVnos4X7z0gSwM9jxo7aioJfiRKRHiWTSapE9QSvfLWGcnG5HcnvQ86nhGqwm+m
         eJ0HypkHZthaV7Z5y1tukkt5gGPBFm9ONGagww+o6PSFlPLugwM3p2PP7BpEa8jSj3Ab
         Nx8a1oMpyaK4JxH/j1jqRiHV54/pPZxFXR09GYeCcFmTyNj5EdbNma9zgDbmglczPUlH
         vmbH7M/+LXgXSpJUx0IpEuuIvynual2J3JlgFJBftm8EPRM241vhxz79otjVFTdawb3x
         Y6NRohR7qMPhU7uGZ/dv0prKnpOZVKUFYGY2LsB+fuj47pE0uKbY18KR+cD0IUCFiSR5
         cbQg==
X-Forwarded-Encrypted: i=1; AJvYcCW+KnWiYt+Zf717yo2jkeJxHTXb6X+/QQXlne1gUKfTV3dB/ENq2EYfxxiNl+MVcZWuWBDTZs5Qxn9bByFSeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxF59Fb1hhQJaz+hMCpHVIoIm4Ml/Nply1VKbtl6hhUz9JQGU70
	tXUSWExcA2JLtwlO2dB4JxYnK6VfAAM9AMiaFYmtfHgt2lY9KS3M/wcqRWu/zsDCDzs=
X-Gm-Gg: ATEYQzzhIjQOo5SOI6MufeUMshCCJtpel7QiInWrTRZr0RJPp6mFiJ+GMfyYXCpd+p/
	IXbnAM8M99uG4PG7ack5Abwq7adLZQRETGtJ9Epu18viC2Hh+VoBJdldMWJgwqcNX3oHka/ecRR
	bnX/BgpOcFvepncAmcMAfjH0DaXL0r/4dk0LveRRgjOjUrek0JgLb5g5z7puZRtC77Wu8tXY8kQ
	/VJ11iSdNY2kVjfUF513ykMbZ28JS/WeoexiPgD/oIpAN0pFuZuHzQJnUSfd7a5Y8INncLy2DIb
	oCqLxLznsx7hkZB/N1PspuU9mH+ti4BV7IuvZdiFPlLosn6gxQq/77Wo2Q+smK241I8DcNMtAXu
	AAon91V6Rav+ffZhdl5ZjLJFC/eelKsjixPoesdcs4Tl3QDkolcv6ccsz0QngcFP44LmrKOX4MA
	RopTG+h0yWgZ3lJmzSFX5uxDLnCcXsnGtalbRCHFduRyeZ4S+CcALdlOEOEdEof+m6fiYsTmrPF
	BsCZQ6QUK6mukDkgZ3nPJ+gDts1MGNm3Dldn7ryh01uGMfkkj4Ctny6OCV4neOGIC8WxA==
X-Received: by 2002:a5d:5d0b:0:b0:439:a9a5:d3e9 with SMTP id ffacd0b85a97d-439c7fd3cfbmr2326625f8f.30.1772611983540;
        Wed, 04 Mar 2026 00:13:03 -0800 (PST)
Received: from ?IPV6:2a00:1028:838d:271e:8e3b:4aff:fe4c:a100? (dynamic-2a00-1028-838d-271e-8e3b-4aff-fe4c-a100.ipv6.o2.cz. [2a00:1028:838d:271e:8e3b:4aff:fe4c:a100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b0549600sm26602877f8f.35.2026.03.04.00.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 00:13:03 -0800 (PST)
Message-ID: <f88cefdd-3366-4be1-a1a1-3b48d500138c@suse.com>
Date: Wed, 4 Mar 2026 09:13:02 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] rust: module_param: wire StringParam into the module!
 macro
To: Matthew Wood <thepacketgeek@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Aaron Tomlin <atomlin@atomlin.com>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Tamir Duberstein <tamird@kernel.org>, David Gow <davidgow@google.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260226234736.428341-1-thepacketgeek@gmail.com>
 <20260226234736.428341-3-thepacketgeek@gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260226234736.428341-3-thepacketgeek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/27/26 12:47 AM, Matthew Wood wrote:
> Add support for `string` as a parameter type in the module! macro.
> 
> On the runtime side, add:
>   - set_string_param(): an extern "C" callback matching the
>     kernel_param_ops::set signature that stores the raw C string
>     pointer directly into the SetOnce<StringParam> container, avoiding
>     an unnecessary copy-and-parse round-trip.
>   - PARAM_OPS_STRING: a static kernel_param_ops that uses
>     set_string_param as its setter.
>   - ModuleParam impl for StringParam with try_from_param_arg()
>     returning -EINVAL, since string parameters are populated
>     exclusively through the kernel's set callback.
> 
> On the macro side:
>   - Change the Parameter::ptype field from Ident to syn::Type to
>     support path-qualified types.

Why is it necessary to change the type of Parameter::ptype? My
understanding is that this token can currently be "i8", "u8", ...,
"isize", "usize". Additionally, the value "string" should now be
accepted. When should one use a path-qualified type in this context?

>   - Recognize the `string` shorthand and resolve it to the fully
>     qualified ::kernel::module_param::StringParam type during code
>     generation.
>   - Wrap string default values with StringParam::from_c_str(c_str!(...))
>     to produce a compile-time CStr-backed default.
>   - Route `string` to PARAM_OPS_STRING in param_ops_path().
> 
> Signed-off-by: Matthew Wood <thepacketgeek@gmail.com>
> ---
>  rust/kernel/module_param.rs | 48 +++++++++++++++++++++++++++++++++++++
>  rust/macros/module.rs       | 42 +++++++++++++++++++++++++-------
>  2 files changed, 81 insertions(+), 9 deletions(-)
> 
> diff --git a/rust/kernel/module_param.rs b/rust/kernel/module_param.rs
> index 80fe8643c0ab..67ff6f2ea9c2 100644
> --- a/rust/kernel/module_param.rs
> +++ b/rust/kernel/module_param.rs
> @@ -86,6 +86,36 @@ pub trait ModuleParam: Sized + Copy {
>      })
>  }
>  
> +/// Set a string module parameter from a string.
> +///
> +/// Similar to [`set_param`] but for [`StringParam`].
> +///
> +/// # Safety
> +///
> +/// Same requirements as [`set_param`].
> +unsafe extern "C" fn set_string_param(
> +    val: *const c_char,
> +    param: *const bindings::kernel_param,
> +) -> c_int {

The safety comment is somewhat inaccurate because set_param() says that
the input value needs to be valid only for the duration of the call,
whereas set_string_param() and StringParam require it to be valid for
the module's lifetime.

-- 
Thanks,
Petr
