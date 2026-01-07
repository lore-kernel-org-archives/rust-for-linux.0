Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C42C36AB66
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 16:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802909; cv=none; b=l9kTKbl8MbvXWvPWVTOKPjPeDDyTjcnFo1P5tPNzhAajiD5T7fyCIjsA4Q1LaHVqK9bMbZdVB5v9hC/+m80U/aUCFvkLWKnxM7zZMRMzijtWczFAyHr0gi6tiyqhhqtl/nJ6RXFTfZTJJmzuD7fDRNaThZrw1L/KqTknYo2Dtik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802909; c=relaxed/simple;
	bh=LdWHcolCrHxpHVadV8iCe5wJ6t01NEAX/ncvOB+5z9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VxoswGHL6EVoRqmEJltcJPW92o/8j6shWFzdFP4ARckslUc7DhXw2Wqx0l74j+HSQL9wSa4dNlVE6XcSLcbHtUG4y+GfDIMgVkhOA4Xrj1Xlu5++0w9ez9VQ3ZUWdkmsUophD1wFAgdWgCb6P41k3N/SNxqidQgCHkR02+FHAWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i59x5kRf; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i59x5kRf"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ed82ee9e57so28080111cf.0
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 08:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767802891; x=1768407691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZr81RrhDU/EmN47aRYnauj1Iguo4qhRxtPs1Zlz7rQ=;
        b=i59x5kRfO5WQCvD7i33BdEuwn88skITSIWAsfKZnj/i51oUWR6LnCDfg98eX2TzT4t
         A8oojclYVSE02cozcobdDmUB5ixGFvdd9D9Nju0PkxRSTGrBbsH071tYnfoMAIPHHexZ
         w+ozaPoEckhm+CZVmjCNzWJR976qFgMRcKQ/Dtrkk//REM65HiqcgoS4cA7Zg97h07nl
         zv/AY9Q7DWrCpeq0I0Q7mQcXGILORGx7BUQaXN732iAS1aS3SVHgZlQBftQhqWRF8c7W
         MuLg1oC6zBM1XHdGgEdLWsC2oHa3xTPepKzxcf8x8BI1B9u18NSVUViBWU2N4+WvyvZR
         xD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767802891; x=1768407691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qZr81RrhDU/EmN47aRYnauj1Iguo4qhRxtPs1Zlz7rQ=;
        b=P5hdvbRzp4Fp8fa8sva4yn3AwFy6P8g0PWZwc7R0F00QgIox2ExV4BK+gS5GLuyLbH
         MISJM5IQ3u7go0a51/30kP/9mzyGnkvKPGnjZ2X14c74Zpo4/FZiZwdrDOoxAlkjtaL9
         LiqlAdiggsuX9QuwK/TqFeOUQgSBNBSdFoZmHOjEE9El3boKBlId9qIC6kZJtczM4zYK
         Ns1AqUcL73bITCSDO3bsibCETwU4A2sjjS/t95E98/BMmpcUUMnnrLlr/MafOg1nYqSR
         GLP+w3sOt/rd4toecqtMT+Hi+ddVX/spZ3Adi+1oagAILHQasUKDcwSxRbYcvl3cmuW6
         0B7g==
X-Forwarded-Encrypted: i=1; AJvYcCXoMt/lOoNL+gz3yh23e8BNGBiG1N02E62uu2LMhwwO5SHCIZC/k0+All2d/Nk5ZrD6AHalA2J5yU1l2avG6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb9KvZWMeQWk2CKCdF20Esk769ByYZiclavDOM3iZ8xRMnG+t9
	IcL1ecNwqe1HWbrfc/yjgIejmiDPKAfJE644P01Vptiq8JkXJcglsJgw
X-Gm-Gg: AY/fxX6NH4aYmrLK9SDdBycp7caAY5CzZ64XAYXyXsEE9XpniUbV1/tZz1eRC3TNH3j
	swndUSDr04Mq8y5k0yUPwieMWJ71oFtNGsDBROfvmTmxYKaXDJA9kJ7bzxCH/L8v0LKkjzEJSyp
	dLyM25kYD08zPym02Jcs7Y/RZdinvNAxymyBWZDPsPjYm+AihGP4b7Ghqs2ISSM4GzHK9Fi+HOw
	gLplgvL+Vd+4uj1K5sQ8ohleNXLWQQi1MN3tRBzjQXULQXdZ82UFlydstshiehXucTggYLbKW2N
	9EnrHXBegnQDCP79KvvN0EEZmR7lOvUgRki8bIxNSoWQT8Ihd5AzzyvcNQKXRplCrFgMQ6DRqAX
	GwOY0d3sMrVNS39N/+Yq14t5XNXBZwWn0Q+xOgqV+M04oQsZvCpxnpqXLLuHuZltNr0fDEXP9Ak
	XkQZp+hPwOcU1H3Ncxr56XJHAriny0Ww1bGsRnLqm3z0yw72gvztxcrgP9gn+I8DtrRxQc3dhs9
	f6IPfhcgIG5uGI=
X-Google-Smtp-Source: AGHT+IE4reJRN3+W2D6hKzt1hGCqifi4pTDYQZH2Y2C9sX1Cq7RkI2HE70OwnNRsWLelNxZART6OuA==
X-Received: by 2002:ad4:4eaa:0:b0:88f:e9f0:77b9 with SMTP id 6a1803df08f44-890842b2851mr34841636d6.58.1767796678362;
        Wed, 07 Jan 2026 06:37:58 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8e61a33sm29950971cf.29.2026.01.07.06.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:37:57 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8FBD3F40068;
	Wed,  7 Jan 2026 09:37:57 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 07 Jan 2026 09:37:57 -0500
X-ME-Sender: <xms:xW9eaRNnd0cYZ7Ful53T0y-LOnvweD7YY9naArJEebmT8UVSA4CtTw>
    <xme:xW9eaZI8dmTVwZOc7q6quZSCrqAFpQv_6E-HV7-pJQog79mZvkKo6COvaeUhijV5X
    KfO9QMyIXAmd1UDCzT-LWIpE3IX-y3-oyxvPMTam9hgO0YGAWq0>
X-ME-Received: <xmr:xW9eaTp-xZJUHpfwNMpt4_8p3l_pisW_OoQ3YDYp_yMMvO2-MxMOWwUV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeffeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedvvdeh
    tdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlhesgh
    hoohhglhgvrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnh
    efpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuhdprhgtphhtthho
    pegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlh
    drohhrgh
X-ME-Proxy: <xmx:xW9eadMZFTU8Z184lS8gX3XTNBJa_PExNRWFXs5MmmrX3xCnGfL57A>
    <xmx:xW9eaUgkLzrQyZY6AkT0Z6fz40vO9rhobok5c1MR9omCL1a3XMEs5g>
    <xmx:xW9eaZai60PKZGnww2R97cZTt-fwYN0URFsTwY_1jJcbfNcbdqkt6Q>
    <xmx:xW9eaQiPathGsM7bw9LyGjd7Yg1xfTGWc_rnk6GBJgxl8ySldU5WJQ>
    <xmx:xW9eaTYrdTQ7S7oLnxVGNTUPt4jvezcix0IcHnM3-gUHBfG4ECHLu47F>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jan 2026 09:37:56 -0500 (EST)
Date: Wed, 7 Jan 2026 22:37:52 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: move #define __rust_helper out of atomic.c
Message-ID: <aV5vwMe_AiyQ8ePB@tardis-2.local>
References: <20260107-move-rust_helper-define-v1-1-4109d58ef275@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-move-rust_helper-define-v1-1-4109d58ef275@google.com>

On Wed, Jan 07, 2026 at 02:14:13PM +0000, Alice Ryhl wrote:
> We were lucky that atomic.c is the first file in helpers.c so that we
> may use the define from it in the follow-up headers [1], but this is
> fragile. Thus, move it to helpers.c.
> 

I reword a bit to make it clear that we need this changes for inline
helpers:

	In order to support inline helpers [1], we need to have __rust_helper
	defined for all helper files. Current we are lucky that atomic.c is the
	first file in helpers.c, but this is fragile. Thus, move it to
	helpers.c.

Let me know if you have futher suggestion.

> Link: https://lore.kernel.org/r/20260105-define-rust-helper-v2-0-51da5f454a67@google.com [1]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> When I send the next version of [PATCH 0/4] Inline helpers into Rust
> without full LTO, it will be based on top of this patch. Regardless of
> the timelines for the other series, I think it would be good to merge
> this patch soon.
> ---
>  rust/helpers/atomic.c                     | 5 -----
>  rust/helpers/helpers.c                    | 2 ++
>  scripts/atomic/gen-rust-atomic-helpers.sh | 5 -----
>  3 files changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/rust/helpers/atomic.c b/rust/helpers/atomic.c
> index cf06b7ef9a1c559e8d7bdfc2bcd2aeb8951c29d1..a48605628ed73ac32aae2e6280481407a670e88f 100644
> --- a/rust/helpers/atomic.c
> +++ b/rust/helpers/atomic.c
> @@ -11,11 +11,6 @@
>  
>  #include <linux/atomic.h>
>  
> -// TODO: Remove this after INLINE_HELPERS support is added.
> -#ifndef __rust_helper
> -#define __rust_helper
> -#endif
> -
>  __rust_helper int
>  rust_helper_atomic_read(const atomic_t *v)
>  {
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 79c72762ad9c4b473971e6210c9577860d2e2b08..a86fab743d1dc951373e5ff05278c6c7872ef491 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -7,6 +7,8 @@
>   * Sorted alphabetically.
>   */
>  
> +#define __rust_helper
> +
>  #include "atomic.c"
>  #include "auxiliary.c"
>  #include "barrier.c"
> diff --git a/scripts/atomic/gen-rust-atomic-helpers.sh b/scripts/atomic/gen-rust-atomic-helpers.sh
> index 45b1e100ed7c63108ee6cb07e48a17668f860d47..a3732153af29f415e397e17cab6e75cb5d7efafc 100755
> --- a/scripts/atomic/gen-rust-atomic-helpers.sh
> +++ b/scripts/atomic/gen-rust-atomic-helpers.sh

whenever we changed scripts/atomic/* we need to rerun
scripts/atomic/gen-atomics.sh to calculate a new hash value of the
generated files, so we are missing this:

diff --git a/rust/helpers/atomic.c b/rust/helpers/atomic.c
index a48605628ed7..4b24eceef5fc 100644
--- a/rust/helpers/atomic.c
+++ b/rust/helpers/atomic.c
@@ -1032,4 +1032,4 @@ rust_helper_atomic64_dec_if_positive(atomic64_t *v)
 }

 #endif /* _RUST_ATOMIC_API_H */
-// 615a0e0c98b5973a47fe4fa65e92935051ca00ed
+// e4edb6174dd42a265284958f00a7cea7ddb464b1

I queued with this change for the rust-sync PR of 7.0, thanks!

Regards,
Boqun

> @@ -47,11 +47,6 @@ cat << EOF
>  
>  #include <linux/atomic.h>
>  
> -// TODO: Remove this after INLINE_HELPERS support is added.
> -#ifndef __rust_helper
> -#define __rust_helper
> -#endif
> -
>  EOF
>  
>  grep '^[a-z]' "$1" | while read name meta args; do
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260107-move-rust_helper-define-63edcfb2bff3
> 
> Best regards,
> -- 
> Alice Ryhl <aliceryhl@google.com>
> 
