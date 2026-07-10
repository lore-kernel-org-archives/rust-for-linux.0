Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0A23911AA
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 19:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783713544; cv=none; b=E93HZZpymqqMdtV831/tTCZ+ojx5DIw3bDilCgYztcYFTaKsorZGZO+uOMliDV9AsPyr3OQQvJhZflwLGPV+vR+NiNjttvynKOgPEGsl/t2QRZcq28C1RzzbwiKoGbV83upWoMIVu0lQz1VACkaw+uCrizBqwinm37tayHlKJX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783713544; c=relaxed/simple;
	bh=qWzvlV7X3JEDaJvqOVxdiWvtWE06C6bVAA3DO3yG+Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOHXlTQKihC2bixoGOILtTLIqR+TtK3V9atJMbEBmyXdtoaTGY0uJo8uhnEyCuCy1t8Ao5dR/rIzj9RQqn7aT3wYNFYosVGMxRGu1KThtxfp1yUF3lASC4Sl+csKQqBL7ho1ppwWzC6eED7YPA8DXisFUSENlUeHXQnmUmmksCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ThhsWNlt; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ThhsWNlt"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cab97c86bdso735ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 12:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783713542; x=1784318342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mWYZ9D/LgjNHZE1ttPflKV1ra6LWo0KS2YE/FLfB05o=;
        b=ThhsWNlt7G/ekfBnxkIiG6I4APQZMNC7LhXoEc+bp++LqHnvFj1YkJ/L98v1MrcHxe
         V4tOuPQ5G1cJ+pnZFuaLPgp9gzmZMB+QpVyqI0WxUbLkZX8ldIWVQQORj0lhJs+11lhl
         zeVVE6wx/a74xFS7NJQri7/BdvhG7I8GqSCEf3DooFF3jmJLYvpNAg0Yu+S1t6+h2Spj
         CXZeO9HWMSmwGlJsOrxJeYD4dUp8WtmtdoaAXZPrPgvwc5reVroTxSzLKZPtnJ95SU3+
         YI5/aqZOhqCjqKYQ21pYQN17CSuniwK8Xyl8Ir7LPxd4TI611FolkbwprBkzVLQRFTP3
         Qtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783713542; x=1784318342;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mWYZ9D/LgjNHZE1ttPflKV1ra6LWo0KS2YE/FLfB05o=;
        b=pw6IBskPnu255PfY61i98FvoX/aRuMoabYOJPyZ7CyhViJCK+n1OBFxINLNwSRCCYA
         jOMvgzsnoKd2kvjE15zkWpjhkpyaaham3ILUMhzXeJ6nPquPQF/r/IUAhFZDZWit5q3z
         o+wOW5WgnS8hdRl/m+Bbw8taSldU5w+MBLX8YeSQuzOZp786hdHbaG8Ipj4AzsoDGdU/
         clqlgtPtSVs6HCMbIzuCxCMQ5L+iXy9Ujv+LJorurq9WjpIAlalbaKLb4oaQGJCzNwfM
         qTLQp7/x8Xq9mKCpst9AW5PxCEHgKZYgkTg3ybgSHSVkjX86LbK/Y8Plr8aScBOn/3J2
         jvow==
X-Forwarded-Encrypted: i=1; AHgh+RotPIrcDjNkw8/UCFuGQ6M6aaED58VFtybyBvL3eLBplKFeWY2qMUoc2IvLxP52ypF6gy7WYZhoziOzMuRrJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG4ICD9pzDWX2/Zsqc3mMuBqK6RS/Z5oFNJainU9o4nVqEoUbB
	Bb31EoKcdT9S06a2uESlV0T6w+dnBjBiCDwFrlaRwxRaVsJuj1zWCChILAawbmg50Q==
X-Gm-Gg: AfdE7ck35/BFC3vayVQ0hRCWk2ZrZa9B0RDW5lYD8JRZLyYoFRwe/ofs3Oyv9AEfcsL
	FsYW2jBDxFguSARfpi7AlVG1opgrFBR238cWX57le4BWfkxjOchc9NTVihVS0V7MvxOLu3vejkG
	PwVCClCmQ+tEzWNmWtOFle0xTm9Wm+fMv3MueqwiNvsKTLHlQ4vyzg/Pv/Na17hzLh/P6U64ctH
	JUYKWVNwJmmTvkdL9BathbI01Ztrn2cEIolyb0WCYrMGbt8so5eKHFMTLxqp1ZOdaa4ze55vQ/W
	Zo5oWorVI0/ivmQmcVpqLX+anPRH7c/iq2yqKmYDfN1MIphh8fOZyZQDnM5gy7XG/yHxD0TJz0U
	QhUlGQTJOATQ2SmaW/wHvUB0N1Rix1dPcXmX535n1HQevNJkVZEjsYmxhqGbbhYNE3oazS9lnvo
	EZ4029LGw6BtqMWUcuO7twWQel83XT/Y9178BbC+tlA0JKRsDV4UomOpkCl+EIvNVoLOOVO9+wM
	xRvzBksTskmT4p3wsVoot33jX4LmqM9cLQC
X-Received: by 2002:a17:902:ea0b:b0:2b2:70ba:305c with SMTP id d9443c01a7336-2ce9ec002c3mr774085ad.8.1783713542050;
        Fri, 10 Jul 2026 12:59:02 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afbc1363sm5531826a12.8.2026.07.10.12.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:59:01 -0700 (PDT)
Date: Fri, 10 Jul 2026 19:58:56 +0000
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
Subject: Re: [PATCH v2 3/7] rust_binder: Implement BINDER_DEBUG_USER_ERROR
 for refcounting and death notifications
Message-ID: <alFPAMFcpGNbksZV@google.com>
References: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
 <20260710-rust_binder_debug_mask-v2-3-2846410e3ae6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-rust_binder_debug_mask-v2-3-2846410e3ae6@google.com>

On Fri, Jul 10, 2026 at 02:32:54PM +0000, Jahnavi MN via B4 Relay wrote:
> From: Jahnavi MN <jahnavimn@google.com>
> 
> This adds dynamic debug logs for:
> - Decrementing handle reference counts that are already zero.
> - Mismatched reference states (calling inc_ref_done with no active
>   inc_refs, or using a weak reference as a strong reference).
> - Requesting or clearing death notifications on invalid references,
>   already active notifications, or with mismatched cookies.
> 
> Signed-off-by: Jahnavi MN <jahnavimn@google.com>
> ---

LGTM, thanks!

Reviewed-by: Carlos Llamas <cmllamas@google.com>
