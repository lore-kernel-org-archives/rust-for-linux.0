Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6262E7394
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 19:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783713332; cv=none; b=cLkbAdtJUzOHd1Q62M+jGW5RnUBceqL2LYbcZPCKNWSP/8g81i908I4o0MNcb9toJn2iGvZAUbO5cVw/CiC/jMDCvw94+Go+vb1U0nyZDZj0nEobW5/d59J9/0zTAgCdrPLCxIVIX8dXqOWSqzEJnnTS4Amhnzpq+ryJ90SBbB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783713332; c=relaxed/simple;
	bh=74yQpHWj7TVJ4ijceO1yo7CRJg+azfKLGfyokj+r52Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RrrB0da5LYXIp+TTeVmrJeQr1hJWLCa2MEZLyy72vr2f0tyzShs/dpD7J6ep7rWa/R9Jjv26k1C9JPJSj9ASQBNSh24fhdObH2rVGryb43O0kWX5vOpDHMFMafuMylJyL5tg70/tLMeP3Upv/cU9Qb6GLikGPUmdX3SNPTKY6p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MlPvjsoa; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MlPvjsoa"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cab97c86bdso305ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 12:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783713330; x=1784318130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M/os59kS+KQ/B+EaA/yP6hg3FHSgOfMSekYi/qYdyo4=;
        b=MlPvjsoasaoneVSXd+we5zm0SHMN4RkEJLfZB+KdFIBhMesnJTd4YK2LYmPLDdNzaY
         QWC96o3jM5ZzJHnZE1LQ7eoSaj1A9L5DZGnMLZke69B/E7B45i85GXifnMA7rmFGIJCa
         luobRXPi6SF28cR+xqLIFggifVUetVpSdtx0Y5SISWv1Wqzhh2DSPnas09bm1iJCcsq7
         FTghOVwR824YmsK1jPZAfQaVVK42nftJChe/XF8BZZL3tyrRks0cKtngEar2f+LTJ8Rm
         sSXWGpiY/2XDj83Et4Z6jGTXlVLa8jc99n13ISFh548JniKFW/4fk+I3++1QrA/TV43T
         ZlWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783713330; x=1784318130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/os59kS+KQ/B+EaA/yP6hg3FHSgOfMSekYi/qYdyo4=;
        b=RVhuAfftIF2FrXCFUQjRkmNxfNfEftkbf9QlWjYkwKdIP6dy61Pee/SeAlh/QUQhDF
         pOpQ4qHSjSUUOdaSMK6ErUtU4a+TNlzOzLwJNxW7wye997/8AFIQW2rXgAybCqX24niS
         54nGwFFTyLOv6+s27qkGvCn8Ri2MQZSY4EaD+4SbsBDPKmNKaoTvs6iP3q2scwPzFuJt
         nt2ZycP3LVKbrSW8bCkFfSEcFVcm98aMOVPppPMV+QDVT4o4f6KUpxyYgDVQEft1HikG
         SkyTLD5jP116w6Zy9PaYERoQNvwnU644dRcOICCSYIs3oBLIFrBhena3GK71DeZw4WUT
         R3xQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq4t2cofl4/hKPLU4sk2OE4O4uPPTH+IWVLYnHltJ66jgw5kckH4SorJmEO9A1oBrtjwRLUaiD7ibXNnJXfTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YypcDf7+N22vlCSZu/oaYe94gzdIltHy/wj72Hndqw1q4NjWT8u
	hAC22xD2/SsrxPjTaNzNaz6quKpZY6YqP+WI1CEGEu4Aa9HcwyC0wPmqYG41In1eHg==
X-Gm-Gg: AfdE7cm0Jcbw/6RsqDPUw6XImlWZx/VeZIYHFB4gLwY5QT4PFJGgSI0fpKyJtLW7WYf
	1ZLP0M568seuuNYhlg7pEzEEg2NiWVQztk8KAW9sPuLUQKbzTzdZb/zdWsMVVkEBVr4oss3fe74
	ArB5EC2Rnb6dxndeW/oBGecSlrA9fV46sPVl63m3Vl+pxF3Q20iHm2T6rb7Qi6UnXwzwyYl9bRj
	AqrScyGmJ4twB6g9N4ysybb08cGV+n0JIP7IMYaMvnN6ZZJaQtsYHQH0B0BrE9xELYJCMa6dSxa
	LyZF/tzdlp+HdGeo6J+6WzXnoCkZ+ZsinKRCHwu982WEDkBpmQMcI0Yrlc5BM3rUusCJpBaxzts
	EIlpEbzHdvvpJaHFegmK3LRCm/yrRAWEm7CPb04I8tCP42BydAXSWtvc7Dsfjt7jpGyAxYVoyA2
	aTd9y2HJ8T9R71FCL2hfby4BvYRXMP+eH8qYH06x9TrivGMSCiBNc63LC8PNLFKbnE3ih+kBr2a
	5JR7P39yP6NmBiXFukGUPjfvzCVVI2W8rt0
X-Received: by 2002:a17:902:e88b:b0:2ba:73c3:49b0 with SMTP id d9443c01a7336-2ce9ed153e8mr799595ad.14.1783713329985;
        Fri, 10 Jul 2026 12:55:29 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847d4134fsm4439605b3a.0.2026.07.10.12.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:55:29 -0700 (PDT)
Date: Fri, 10 Jul 2026 19:55:24 +0000
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
Subject: Re: [PATCH v2 2/7] rust_binder: Implement BINDER_DEBUG_USER_ERROR
 for freezer-related operation
Message-ID: <alFOLMbft11e7WDk@google.com>
References: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
 <20260710-rust_binder_debug_mask-v2-2-2846410e3ae6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-rust_binder_debug_mask-v2-2-2846410e3ae6@google.com>

On Fri, Jul 10, 2026 at 02:32:53PM +0000, Jahnavi MN via B4 Relay wrote:
> From: Jahnavi MN <jahnavimn@google.com>
> 
> This adds dynamic debug logs for:
> - Requesting freeze notifications on invalid references, duplicate
>   cookies, or already active registrations.
> - Completing freeze notifications that are not pending or not found.
> - Clearing freeze notifications on invalid references, inactive
>   notifications, or cookie mismatches.
> 
> Signed-off-by: Jahnavi MN <jahnavimn@google.com>
> ---

LGTM, thanks!

Reviewed-by: Carlos Llamas <cmllamas@google.com>
