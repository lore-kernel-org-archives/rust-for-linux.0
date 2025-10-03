Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E192A2D4801
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Oct 2025 17:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759514330; cv=none; b=RgEGp9icSegtaicRN4HNm1n2EQJjwGWJ3sx53ha/L18kamsBRAG8ipzMJeiGGZ9UKsDgA0kT7uQhcNZRJ5K2sreykZWERTbdH4pZigGLMFZLdJyvvVUh7rzTP0LsWUgjKBAn/CuzEqcphts4l918cjwrcguEkkqpxLKDMFXfp4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759514330; c=relaxed/simple;
	bh=wt1TJp1oWNcsWsdk26sG7pJIbwrONFNB6RBEylZMk+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZ13DEQ8pEerC++vKI38ICp3VdysAVNWHqrUfr++Ateqx9bIe3BO0U9A6dV3HubdB1urNKLzSbRHwy4yZMHDjFU2huuXT5/2yClr8w5S3ok5av80cORMXWpkuDSJgCa9ppfImv6xTvM9njbwsTozEMF4qgkQZEf3+laGUL7Ol9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2Bu8Ed3Q; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2Bu8Ed3Q"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2731ff54949so14525ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Oct 2025 10:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759514328; x=1760119128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UaDYKs66LP34CduEkv1EiCiVmEjNuJqNpCfLGQVzrcg=;
        b=2Bu8Ed3Q2U/qdQojH5e47rbOKM3oBQxCcSjYjGJowPTl9eIW3B6ESRH9hUVyq6quK7
         ovMbMYndL+g9SKICQNOH/6YEdUURdqz+6rg48rd3R51yuJPrfGXeE6bI/fn50Qxcuu4c
         K4aJ8mzHOhJK4oPN3nxAl9+RJy/8uWaO+8DpEOuAM3Ummpvf38bUYVFmmJFSVais1KXB
         tkClT3GaK8RfY3XoICIqxb+SvZu3IgT8zio0YQpu3IbVkCWKt9eeK7/B3VcukabmKT6A
         yBgdByB6iKsZC6L2qlrKSqFKJ8TLJt/XtXnpADpenxrGbAWJ6pSyDGSVTNRbhsEgcb15
         OUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759514328; x=1760119128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UaDYKs66LP34CduEkv1EiCiVmEjNuJqNpCfLGQVzrcg=;
        b=a3ullOaJtmeeo7anJE35S658tTJpXuWmx//xe7PGV7G4TC/bhOcppREudIj0cTeePb
         gc27/bIY/fSwDOLn/oObGjkPCVS/FRb8eJmuOyrZCDMV6py+bX/fPPu1mjsPwTRed/rQ
         Pf7qpuXTxUJPzf60ZGMn2U4UQ/56aLtFEUHqXm8GhFo4lWQ1+tYpAYvelTzNBA3OpfqF
         xI5nomt5YcDrYkrEX7yqp4Bfwk/yeolS5NZXMUQnAdldU/HxfneCQ4qraH3FRWsJzm1/
         McDBVz7jWCyMSgY+Kt9jQFvJ1tBGaf97LZ8LKl/QqEDCwrmffQftTvN+u5XPeubQ7Pil
         q+hA==
X-Forwarded-Encrypted: i=1; AJvYcCXyscvQmxchZQgYIq0OvkMPU8XI0rH05x/wHaX9GHJL7BX7UGxaLdN5cv1PhFqVZWL9UsijAZEkqRxdL72x1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN79i+qyu1eUFxa52hNterwTuhBFK7ywaZ4stjZIDo98z75XsD
	0XORkne0aLrHZTkBvzZTFO4NvFgn4CJMLpH2p/xUSssmuzhShSnkNIj6LVymMD/klQ==
X-Gm-Gg: ASbGnctYVG/qJAZYJRZMXJxVNGI368rueX22q7txBSmN33UZsAC5Pi7L2ECiNJw7/a2
	q2dAbqxAJWgxd9ap4j+h4DlEvmBbBvdvXx7UTT/Erf1au3e7CQ+cJUF2AoErqDSttTHcGbGFX9d
	XwR7kcEc1kVxHyy+rwhFRDiHg03vjfvxIkWTnziVL+r6DggoJnz0MBdTHr4ebIuF0+THjHR1XVB
	GLeNtBuMOZrn44/6F1J6L+qaRj6lVys8ZXWah7UJ9ammz7AKW6FEgXH38hVGyu5OhZtrZOOiiCp
	WASzB9p7EwohEyadQLHd1dz6p1k2npFGlcU5+U+Qz88Gum1tpobH1f4TsGz9NGBqggjt4TWBbN5
	8NeN68BiwPLgBcFxPP1VAyGukYucMcniMAlxL8X+Eh0TA83Zg4vQpmUDOKT18tgM45XPtfhpvn0
	52Bn3ccrlfk3Wzi+mMUDmVPX2XJJcKmFmWrVnoAKj7L/RLFRG8PXmooLJOdFBhXt38tvuH11A6X
	Q==
X-Google-Smtp-Source: AGHT+IEkysZQevkBeX/w0QWXf8n+7czeDxOHR/GVkR68sXNL8qA+v98FUl5T5iaeaufxd31jHmkE8w==
X-Received: by 2002:a17:902:d2c2:b0:24b:131c:48b4 with SMTP id d9443c01a7336-28ea80c1031mr246835ad.5.1759514327897;
        Fri, 03 Oct 2025 10:58:47 -0700 (PDT)
Received: from google.com (235.215.125.34.bc.googleusercontent.com. [34.125.215.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ebdac1sm8814355a91.9.2025.10.03.10.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 10:58:47 -0700 (PDT)
Date: Fri, 3 Oct 2025 17:58:42 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust_binder: remove warning about orphan mappings
Message-ID: <aOAO0kQtjovUUXQ-@google.com>
References: <20251002-binder-orphan-v1-1-cdc4cffff992@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002-binder-orphan-v1-1-cdc4cffff992@google.com>

On Thu, Oct 02, 2025 at 09:25:29AM +0000, Alice Ryhl wrote:
> This condition occurs if a thread dies while processing a transaction.
> We should not print anything in this scenario.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/process.rs | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> index f13a747e784c84a0fb09cbf47442712106eba07c..d8c3c1ae740e0eb3bcc8aa5e7faf4291f1cb69c9 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -1346,10 +1346,6 @@ fn deferred_release(self: Arc<Self>) {
>                  .alloc
>                  .take_for_each(|offset, size, debug_id, odata| {
>                      let ptr = offset + address;
> -                    pr_warn!(
> -                        "{}: removing orphan mapping {offset}:{size}\n",
> -                        self.pid_in_current_ns()
> -                    );
>                      let mut alloc =
>                          Allocation::new(self.clone(), debug_id, offset, size, ptr, false);
>                      if let Some(data) = odata {
> 

LGTM!

Acked-by: Carlos Llamas <cmllamas@google.com>
