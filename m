Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795286059;
	b=xW+94GIXFDluy6S2XEwa1VM7RHkFxRTIhjFwfoMNZsjWbX3OUrJt/p0exYO6pK1kCO0p
	 j+E87z3Y/eb9o+zAlFjmgBR2cPhfQuoPjgHeqqQSsYox0+9e3bZvemuGX+Wap0bF7QMMw
	 sO2Eynl7qY3ZW/XWtFYOG1JIRz9UV/1rEpnKOtsMQX1gzavC3WNDxr1YboJ+wGDCwelgr
	 A7YPK0sdTq6mJve6tt8/ATs0UiGHi3D4lgoExK4/HKaUPTEacBoh0zYvXliu/YNmFc/Xx
	 VH/o4QKTgSRNwdbcLgfijf9hONqx9I/AYPC/hNijwv5tmPd2oG8d27TCFhaUE0fH3kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795286059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pZwAAsxZcP3F0DIRuj83h9LceocBWHM2k4wu68EYJlk=;
	b=d4Cz2IFI35Rt0LHMqmiPK69vJFz0448Gm5ZuuTnjyX75Fr7Z1/Akw3Et4vRI+4oSADjt
	 hufw12crj5OVkV0DDnaz2/AvxvyZ/NWPj56P3wWhVuqoy/GDE10LZ+Bvs/Ud0X1HTMUrv
	 YnTmtguZaDzv11FX/snFtu0F8c4bDFIUPbslCNVu31JYSPQuWQ1TGcd5I18rdVR+FxFXO
	 Y+qaD6f3DkpkkF25ePXd5d6UooRiBANgySbX3kLVGlKaairYEQA7yEsZF6t5+cSgvSuI4
	 Ws7p5SEjQmc+iWHPnxPywwVlprjQxZ7If4LlZsmBYj6v/9yeJwMw6+zWM2N07vf/Q8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ib6aRbCf;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B738606A320
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 18:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B738606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ib6aRbCf
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ee254f6eefso46755ad.0
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Nov 2026 10:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795286059; x=1795890859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pZwAAsxZcP3F0DIRuj83h9LceocBWHM2k4wu68EYJlk=;
        b=ib6aRbCfOGwQE6/BATIR+ceYurjtyrXkoCQHVhE028ha+RoKuL8pR1qHFqJyREFiKp
         z8p0CuAQU2n88ax0i8wGZlB6nXui7WzmCSc2h0hXq3v6IsM2CXQWpqyyv1iALwoW9ZwQ
         NvataTs2P5rQ8WJAEEhfk4cuMQ3PG9jA2yrPBuWooin0pTdFTUTZ1coIiZTEa9+r7lfk
         /QPClRGwXRDRWTQToXdR4j3aUxsV8XrJ0tuosKcEP/cfY524JSaePMdH0+JNm6/o/sx7
         xw+9VJpw6BCTn+81JZihzC1VDOlc+XArW/7P8L2u8Sv1dC3L49WMbrDg/NKIXjBupZvt
         KuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795286059; x=1795890859;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pZwAAsxZcP3F0DIRuj83h9LceocBWHM2k4wu68EYJlk=;
        b=DaNa0/4Pu3gpOupIDbi1MXGDCCE1TzrkIM5kOLbKH5CGg/gIMnal8S2nQtc9/Xbi+h
         pEgKK989Ql3ObIknC2NRJ0iJHVPain5zOWsGxDfHfsNzjUZWsnNGFl2XuiveeEgb/edd
         ao8Tq9qKqBaaWqf5yZ169fgB43czAs+xdPF6h32W81fl9DzWTkWIMz3Fm4MoK55WwmoP
         txMSbX9bBiuwVHmwVs8sybfZ4qmeYWXo069LPemFTdQfC75nqDrrNB1ugXEi/+xs+nBf
         0cm0+1L3OY1yG5JXgDJJijDQqbbc15MteYad1phaYK1bQ4znhnbw9oNtcSGwB9LQlXhg
         TygA==
X-Forwarded-Encrypted: i=1; AL+hErGNUPmtbRd5+CgZlnrXRbNiZRFReBZPJ1zLA1/C9gKHAMapUZWqaSVK/l4BfLMZrfyPTk4+JcHlekVGNo4v+w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9YH1R/s99j8ydKP2EqgDOpZqzYlGc9BNT6oUxEthF5DN7SbdgV
	ubh+DSvbSWmM/UllhgxuBHxDKErWo4uThjNdT5qDpxbdDuiS0E9ePfAFnjFa9lgrmQ==
X-Gm-Gg: AZFdTZciOB9bfbvP/hyhXnFYu6oTbp6Ggc4Zblc9RUkeStdVhXClCp/ZSAgDlu8RnH4
	/EYGe3seFYZWPmthzzphBjvaTakvFuZOp8jrtY6v2AKaCpANonxwjLcDcAcoY4C/uHZKNGQV88X
	G0y23bLs0QIVDTto6r41g81OTDu1lzGznCwJMUdWkoNGEvoWFG8WOvCrq3w+4lBJDy97sQAk1tG
	Kr5kPLU9VwTojn7OsNPPJE33M0ZoXjxvvIKyUvWOJHjJWZxYWzlEXGdIAyxhYxeWtAckCq0GtuM
	qAD6HWw9MESQfYb9wjXelz/25nbEh3HpFmkCjFAoss4tWTXlIw7OiuigHxjJf6kqUfpnXWc9FCo
	BWbQ4nu9Tdqspmq6IJ7YPlXGUGpQfFRr6fB1duuuRiMKpTsrn0qenDrpVqvMuYDiQa0VnX6at3i
	1tmTgK8KKnRJCQ4iaaZDXIICCIRVBKVXyNvTJkVADOvcEaS9mr/PogSf7blNbObNVNkMN1rzjyL
	mZxRFWlPiXb+1hW10h9Nd+d3PPSMd1IUf9yZ/M2ZyPIgeZMWdlR9tE0NWST2pbwfR4HF5F8VweY
	V8LIY7Nhw8cglUl2+BcEcz4pCGDnDcKTNcGFzZtAMVBPgLuYFa+f7hORDDD14KrSOR08jnq+CtR
	RCVDxG3OpNYwkXZT6tTsCg5djTmUbL1r1FBcNBs8k9JydmHN/Wm7P/bFVY2I6SROcy9Q5HFtVLF
	2kRRwuwnAnuWnk44xrj7QY+WLPduAVR3gP1SZ4KuovCmGuBstKqH9j8VZdMcpLz5Nu79s0
X-Received: by 2002:a17:902:e950:b0:2e6:12af:5b04 with SMTP id d9443c01a7336-2f0615b8824mr3806955ad.0.1795286058213;
        Sat, 21 Nov 2026 10:34:18 -0800 (PST)
Received: from google.com (130.155.125.34.bc.googleusercontent.com. [34.125.155.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fe711sm2350677a91.1.2026.11.21.10.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:34:16 -0800 (PST)
Date: Sat, 21 Nov 2026 18:34:12 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] rust_binder: report EINVAL for unknown handles
Message-ID: <awHkJIAjp7FuTxia@google.com>
References: <20261118-binder-unknown-einval-v1-1-ef4ece277b26@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118-binder-unknown-einval-v1-1-ef4ece277b26@google.com>

On Wed, Nov 18, 2026 at 11:25:40AM +0000, Alice Ryhl wrote:
> Currently unknown handles are reported as ENOENT, which userspace
> doesn't treat as a fatal error. However, providing the wrong handle is a
> fatal API violation, and indicates UAF in the userspace process.
> 
> Thus, change it to EINVAL to match C Binder and make userspace treat it
> as a fatal error.
> 
> Cc: stable@vger.kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/process.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> index e97213250beb..406d80cfff08 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -958,7 +958,7 @@ pub(crate) fn get_node_from_handle(&self, handle: u32, strong: bool) -> Result<N
>              .lock()
>              .by_handle
>              .get_mut(&handle)
> -            .ok_or(ENOENT)?
> +            .ok_or(EINVAL)?
>              .node_ref()
>              .clone(strong)
>      }
> 
> ---
> base-commit: 917fcbf033154a6c8d83cfa6c88f012b71eb37b2
> change-id: 20261029-binder-unknown-einval-10407d1ebb1e
> 
> Best regards,
> -- 
> Alice Ryhl <aliceryhl@google.com>
> 

LGTM,

Acked-by: Carlos Llamas <cmllamas@google.com>
