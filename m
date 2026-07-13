Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F229C2D9ECD
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 21:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783976654; cv=none; b=VCr8UpGz8WlAzYWxr9XNDw+sTovNWCS31N/LtlclKyxXdQBO4jbQ0NuZEMFM8CztiVKB5hXOFjveFAxUE73xetPZ6vupCE37W8AiRH86nUNYHJtwRLqrddxCYJUnHLN9EE0MfK9yKWSfAV63QvtEjuEatuZNWnoH9s/SjeM8s1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783976654; c=relaxed/simple;
	bh=V/jFJBxpxcBZsKbeLLzevjGS81iEgBjYXn9xBkxpl58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CNxfjb8pGTGbscRXKG88S50DubUPxOPzcYeAfB9BdrMQYVAn8VPM9D+KGpu3p/uhcME7DYtv9fMG5QFpN3tiEHswy9wQ+vCdU9tuFB+rjzcVMP62yFx9c3Db85M1Gzt4xKphEv08cogRn6x5szlvE3eI3OEkxc1hMAU2O66OTUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YCKm7j2T; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YCKm7j2T"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ccdf36f63dso42735ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 14:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783976651; x=1784581451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O1jwfrJSgvkJGqlKhnOnZPVsVcLy5HRFyyaAe+4iYsc=;
        b=YCKm7j2TwvpGcfMje72j3+DBB4w8J2rnPix7xjJCX4se07dnl0g8tcTY0r6L6D3uJP
         +5+OVaYo8Vy/ixMdPAR2TZen3sbeLVluoSFUJ0mcgurv46Pjqy3yyNaGXby8jF7dWdu/
         WNT1qvdkwLbAJ84W6815RGTAYLx+d+/V7yQUkzZf9ZzVp+90a0CI7mJ7hHbLaM+doRiY
         vI8QL+ZtFlkxYuAZWHcEQW7fd8CttSg1YWB6epUY129fWRTVNJxScpKOxZ1iuETizX/3
         VZRRuI6O0MSiW0vsbKpQwSkJ0ruXOCP95jG2v+G1owEafH5wcHl36KAGIPgXk9nPPvbi
         NMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783976651; x=1784581451;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O1jwfrJSgvkJGqlKhnOnZPVsVcLy5HRFyyaAe+4iYsc=;
        b=mBPhfLCrxCpzAAWQsYW3SpHkTCueV+6Qb8I44ulaUD5cPKUAO5E4KzVxWO/ssxCg3I
         ScaO4hyEz+kG0Qb1z3TYpgvG6lerEakWwjBGkzmI1MOeEXDl64BB5uOSwZW4TldVg1nJ
         R5VPnXGJLjK0OYVr/JVGu5cswkGUGAaNi+nnqL4qMX0j3yijIMxOCcU9jFV9z7QtOoJG
         UxYms/aULBBkOtWXQyRiP86HOU9ul7fs0U26WGmUDW2VhYrBnnhu5GCzwdBBtl1JL2CB
         3JqtOHcclIoMFCQuSm4a5Z8qO+CsLsXz87TzAMjMuGu0MEsiCMN5N025aqaFQKZRnAmk
         0sGw==
X-Forwarded-Encrypted: i=1; AHgh+RrhwS+1d3TEKhhjlcrB47H8RF2iPJuCVJdBqHqheDkHf1Kn1ZCOP1hJXe4dcvFpK8be7/hJkLvJBiEWdB4N2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzETjdxET4cAT5aWM97Cr/sKUWd3LgQUuDMEqxemrFRkcPRrBOC
	P53U7YM9Wh/uMPH/FliyQJ86XorvlGYJxfuJeS9Zgn2Qu+vjzYDZOaqjpVSwQuMVsw==
X-Gm-Gg: AfdE7clBh9Mmkdx0pHHJ/N7Ewl2PqP8T3fmhgNeFwpj2kqfStkEmHDwEWLvwfz6c+XG
	SaSwzc+0KbDBjaInbmWS0jT3hjbH6hOOWYVcbCGLsMC/D2A/u1+OMP9xP5Iw+MJcSUPNHIrpdQN
	NBhwnFQmiOy5PmnnaeVtM04I5vcbtbulLIB/ye7JIl9BvTPKpKRkMFRdN0sJqwtRbf5csqrr6UU
	q8vxCpjVihXx62MRBX+c6/q0zRiABwLbVXfqLfcvXvqqOqAs8tqLV9j6q2InDwJQ5J7kJ+szC+W
	pT/k5L/CkzGCTzQ2eTGyZmAiY8jQGwzDwuK0oU4xLZ9ygRAmLETVW8WqP9bIQJuu86MQ7s/KD+X
	asc1FpHhlXQ0y7TRCFZiwINfdYWPgDXa/MGh+OpF0nKJeNRFyAQULO9+8S40sHrU3VrrlYVixZS
	RtbjxGrmkjznF6B2dguf6zea8XwA/epXa7I9bNkhmm63Y62EJSAryWTVa3Z+Pa86B+JcslNclZf
	4iWyTLCJMBi9f9ecOoF3+nuGE3ADgYItYU=
X-Received: by 2002:a17:903:943:b0:2ca:6bf:5bac with SMTP id d9443c01a7336-2cee16948f2mr2903665ad.8.1783976650846;
        Mon, 13 Jul 2026 14:04:10 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e172b6d2csm415096a91.4.2026.07.13.14.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 14:04:09 -0700 (PDT)
Date: Mon, 13 Jul 2026 21:04:05 +0000
From: Carlos Llamas <cmllamas@google.com>
To: jahnavimn@google.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 7/7] rust_binder: Implement
 BINDER_DEBUG_DEAD_TRANSACTION
Message-ID: <alVSxTzCxvWCUgzB@google.com>
References: <20260713-rust_binder_debug_mask-v3-0-0de91bbbbf69@google.com>
 <20260713-rust_binder_debug_mask-v3-7-0de91bbbbf69@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-rust_binder_debug_mask-v3-7-0de91bbbbf69@google.com>

On Mon, Jul 13, 2026 at 12:35:29PM +0000, Jahnavi MN via B4 Relay wrote:
> From: Jahnavi MN <jahnavimn@google.com>
> 
> This adds dynamic debug logs for:
> - Releasing active transactions during thread stack unwinding.
> - Discarded transaction error codes when a thread exits.
> - Undelivered transaction acknowledgments (TRANSACTION_COMPLETE)
>   upon thread exit.
> - Undelivered process death and freeze notifications when processes
>   exit or die.
> - Undelivered transactions canceled due to target process death.
> 
> We now store the process PID in `ThreadError`, `DeliverCode`, and
> `FreezeMessage` to ensure the correct PID is logged on cancellation.
> This is necessary because `cancel()` runs from background `kworkers`,
> which would otherwise print the wrong PID.
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Jahnavi MN <jahnavimn@google.com>
> ---

Thanks Jahnavi,

Reviewed-by: Carlos Llamas <cmllamas@google.com>
