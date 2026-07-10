Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F28B30B517
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 20:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783714525; cv=none; b=BXi1aeS9xdlYFYQhIOiJoYEAIbW3u+uvAL7L7Tvbme7AdhFexPD0Kk9SQeDlT0ZaA3lxTAxxQiGWThB9ZVLpwAEipzJCQV4G92TN2eNcasJ+bmbnCtVJlSDXfZoYIXtgA9YMkQvGKTHQe29D2ztM96lkJRrx0DFAEQkQF+NBHMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783714525; c=relaxed/simple;
	bh=KuZDg0eCVT9Z3CeTW1Ff/JuAaxO5g7BAjv0kkqU4YNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u921IQNWSpII34uv/Zjh1zHmZPL7pmddaJtSsiF6V6NsezADqx2R/ba/vt09u+g0YJ1U3pRg5YpRV82x1vz+jwroxTUFDJo2yofnciRhz6rEJvcv0Tl/7tjy8DCOhdFufn0peJ266nWUv113WZEqeKl7Ff5YTJAdDPQJMq/JSio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JrEQcXwA; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JrEQcXwA"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cb59f6ba26so25155ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 13:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783714524; x=1784319324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=elTBM0D9EKhIMYy39tYRz/l1mx9DXpQbulorlRTf4WU=;
        b=JrEQcXwAz/Ual+gjvru72BXr9D3fRnvRWdG4fa3YjpQ/4t8OWfjKe+lcu8e+7rtkjh
         h78fZ6N2VS3VD8EgigmL2Sa8OBwF9gDbikhhGzZnoqD1d1SCgwQ1iqicYwDCBS9UXTrX
         xwPkN9KkxgVyd9cHet08sJyK3jeIjDsEV4eMH8JfJk1zJxlMvYmWD+iJ+OscoHpz067g
         X4X4oHmZG+j9lVbvu4DLVyHnI9OWfYKN+k9txW4zCdC/UnWRv/qo+6rPM6ynOerKaszJ
         U6UGUQu6HZzfW+Vo5tZ9wwZfbxXD36qrorJNIi1+oB1caec8YMy6qJUVbuQc46Na7lkl
         hxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783714524; x=1784319324;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=elTBM0D9EKhIMYy39tYRz/l1mx9DXpQbulorlRTf4WU=;
        b=UUESurqmpLfTd0oxBLdeKN+c4Y6i7QEFrCANag26Vl/6EYTyiK+uXyVT+blWns37i+
         CJ6eZ1L+KIIyex0DqBS8i9GwwYEox6nRbHGFH3psE2FcXNNuORjnihVkMNxFRsaEaXNM
         KY3JEba7zE5lOY6Sm6O5XLgIWd7pXXFhqdAASLBmCPXanoSa4QV3zpx40vfb8nIFuv2f
         Njs/DM8SGhNUm6SFtup5K49J1kHMDig9MAdsJhdBVgHRUALTHnB0iaKs2emxXyLNX0qo
         2H0jltJqKbUg74AuZNQhaLFZ0RtE1zwX5dlZwAxKG4oTUL8sIrYyLLwhTjrSfv1H+JY3
         5l8A==
X-Forwarded-Encrypted: i=1; AHgh+Ro2VuI0WjwULAB5Ra17nJ3gMHq2KJx+3ikHXtYbQFTycigze3+Y0C7leTAPMbA9Z/IqbJUDbMsXdqBlmKozyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUZ/WBjB0F4wdtQps/Q5iwIxqcoZY96hp0N59ur+UPVQ0HilvR
	pfbJVhPOBMS6gR5c53TGQVfHUkpy4BDvYfko0TvgAxyEEpjwkTJ2en/zx5Sjowdxyg==
X-Gm-Gg: AfdE7ckLqGQ/HbnFPCywgG716lrJFLlny/VPLVEXmuCX54c0cDcXeUo+E/MyWTuAqqu
	xjC++ioYxmllAgztltMDL9DxtRnmdoxyjVeZTrevI1c2SCjkQEwOkk3C+VzExy26zHC+ANayVVB
	Bjc5o/4B9oNy35PbC8gQ/aKRxAUstSHePIzzCrp7PHs1N8zeNRM9erBD3atuxLbwUnaDbnpNf6P
	WiQ+8PFgt+ALA1UIso7cF9/3OyRKAymeZhrRyrxt7HHs8WGUvsTfB0ef/l6taYQrDyzliszqinP
	KtGVTHBoJzo50Qsdn2imRMQqCnFvbuhplKHWY4yThvpc8BW2D2S7L9CPuZVCdE/Qw7SQUDFnS6Q
	rRTGOlMUxG2nPSNkBo5XlIlhtFQzNNAzFJf6dOeWJiVFy5oSvVbPnd8mmsJteTINXf3seT6eiNq
	DXwoVOo9YiV8I0LxnarP1gZlaAR6zC7X/hWilq2dhH1m9xghNOouQKrIB9qxSiV2HjZbsIjFjr4
	JoJc3bigMaRa8OHA8fMrFUZs1ebdQteTRHw
X-Received: by 2002:a17:902:ecc1:b0:2c0:bf57:8746 with SMTP id d9443c01a7336-2ce9f2944d2mr756865ad.18.1783714523174;
        Fri, 10 Jul 2026 13:15:23 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84854bf8c9asm3523352b3a.41.2026.07.10.13.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 13:15:22 -0700 (PDT)
Date: Fri, 10 Jul 2026 20:15:17 +0000
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
Subject: Re: [PATCH v2 5/7] rust_binder: Implement
 BINDER_DEBUG_FAILED_TRANSACTION
Message-ID: <alFS1c_60udLh4uW@google.com>
References: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
 <20260710-rust_binder_debug_mask-v2-5-2846410e3ae6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-rust_binder_debug_mask-v2-5-2846410e3ae6@google.com>

On Fri, Jul 10, 2026 at 02:32:56PM +0000, Jahnavi MN via B4 Relay wrote:
> From: Jahnavi MN <jahnavimn@google.com>
> 
> This adds dynamic debug logs for:
> - Failed replies, target process deaths, and error code deliveries.
> - Detailed transaction failure diagnostics (including sender/receiver
>   PIDs, TIDs, transaction IDs, buffer sizes, and error codes).
> 
> Signed-off-by: Jahnavi MN <jahnavimn@google.com>
> ---

LGTM, thanks!

Reviewed-by: Carlos Llamas <cmllamas@google.com>
