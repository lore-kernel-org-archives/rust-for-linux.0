Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9EC327206
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 18:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769538705; cv=none; b=GUCgy0mlfoTnejxt/K4q185iTw7zE2X/w+LJmqvvjvT/rD0daGSsVyl6/vKn4ShZNwOmpBz6FUQsYG4oIFwnl8P2SA0BFO1mgqozo2tUMWBeqm09R1iG77EDEReTlYVYhPqqoZaOglJfVvM59bgu7J3J6KTvxIx/GiMEmrKw9AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769538705; c=relaxed/simple;
	bh=h26afcKOHIVNnzkGt0ZdZvKmdm5p5/NPbHS+3QBbrPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R25Dkwewt0pY+9Uonc5TOplydapK1Vc7ptHSzaME2n5eQ55rU3dl+uBma0byGb/ByVrzYP4pTs6lHsJYivm8X//si/0qzVWsPr+o9nRGIvLSDorwnZyEaKjH9eK2SM3FBI2Zaf2R7ubMdaPa0tUcq7KtYEEUkQdjEj5MEarjIuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dxRAU8Kh; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dxRAU8Kh"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a76b39587aso8135ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 10:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769538702; x=1770143502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M7H/8xfB5IYsah8RhOLV2MePrkEzYaBFh1rOK2YldAs=;
        b=dxRAU8KhslJocLzcAVGwR+vqSEYqpg8Ysyi0osRbrHcf/xSeWJNyXtHVgJRWpREJL6
         hOlp4NHzoH1DMXNUcLAY0TKSt+1/Bp/4idayQSHWNkiE8QgPpPi0H8PzKmmMxbbRucNE
         lMvZjSCFqb/Uz2NRbq9hHYpp+b+MNo3056c9PmXEggtCBtcCKFDCRPIMRMYPwNJ6bHvI
         xdVRx83fvZUduDu4jrGHPCUYZRw+IYgAokzkVQWeknFO7b3YJxEfMIUh3glL0s+jS3yf
         liDKSUY2ilfAhrpzQHS/ukk1RGJdV3TMynt16xvmxgpGYy99/xKmdCth+r7jwJOq7KJP
         2sFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769538702; x=1770143502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M7H/8xfB5IYsah8RhOLV2MePrkEzYaBFh1rOK2YldAs=;
        b=hr5gxHAYcHFQAbgi6DYSTxEn51YeA9sqReo8EWdx6wSkWt6RjprakYstZ14X/yQI4F
         05A4MFDuIShc4azK9STFt4gP5Zsw2BeSn5Yt/Dl2RMB39pk2DBXGZX15XDFreeDsmgbx
         z6nhl0yDrbfL2DWXsHoDh6mVFMyINrn3DJrQQTdnuOjXylZ6im1aoimsDLdVEWEipeYp
         K8SLx+dLzTXwdMl07AKbCSKLuaU0hgI1VGoHG8jfj6vU713rw3rTQBQ2++j9k1PqLT9P
         pH0Vfq8cCd7+tfolZH+27N6Za2qyNian6ZqriCUlvF0938b4gxKR5Wcjnwb6RZds2uWW
         4JNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+HalWIl9xx31/iQOZIe6Hir4ODGcBO+6RA05K4iuPMDBunuJOL4QJEEuHt0JjICHrKLTSioY+a9fYuxDEAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgm6DGUU6ITfCcIpq/uJP8nynB/PmSMOkDZWNTs6K5atNnw6/i
	lGqATaaecYuD4D371U9sRA6UXOUnE7kbbQytQI4kwz63e16haBwsYK6zU/rwCZvEmA==
X-Gm-Gg: AZuq6aInUs33WCMO7eSJaiQ/MkksPW4VTGiExClaOmmJtsF2B2BligwhRO3en0OwBT5
	4/s5/brBYtnZcLokDnJ1aTIPYqCGcgtyfqsB7u7fj/m1b5NYXMPwlN/2xbfCQqQJ6DuPmnx23Ad
	KHu+uAZqJStH17BpjcHseEc6/coT/ioRNVBj5OMPY+Az4i9IFmtc5dixdBbDqCmRtq4Pj3FcbfY
	5bJWRLEdRJ0pwp/wiyNlMLYVe6mKrZkGuKPmsxXkKdydDN1UorGa7Rz0tc/5odJT6kshxpaTeQU
	Hr6yaWLJE2ONaNp+NdfAQ1DejfLSvmhH6xsXgUxSnunLvUz6MVVZiE/YhUf+AWM3M2xFjAzGVhf
	qT92GN9Yru6LQrtf4BzD27vEPygTtgzbqPkWUOAO7/rQhzDwfk1ea3hKVgSepvhgXBmHbKm5XPE
	6Slu3tkB5bluHcXNgaRiMKqctlcynQ/1RILaWQNKXimoLM1+IXqw==
X-Received: by 2002:a17:902:d583:b0:2a7:6fd3:c11e with SMTP id d9443c01a7336-2a870b4f72fmr2828205ad.18.1769538701664;
        Tue, 27 Jan 2026 10:31:41 -0800 (PST)
Received: from google.com (28.117.125.34.bc.googleusercontent.com. [34.125.117.28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3b1esm605245ad.63.2026.01.27.10.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:31:41 -0800 (PST)
Date: Tue, 27 Jan 2026 18:31:36 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	rust-for-linux@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rust_binder: add binder_transaction tracepoint
Message-ID: <aXkEiC1sGOGfDuzI@google.com>
References: <20251203-binder-trace1-v1-0-22d3ffddb44e@google.com>
 <20251203-binder-trace1-v1-2-22d3ffddb44e@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-binder-trace1-v1-2-22d3ffddb44e@google.com>

On Wed, Dec 03, 2025 at 02:48:09PM +0000, Alice Ryhl wrote:
> This patch adds the binder_transaction tracepoint to Rust Binder. This
> was chosen as the next tracepoint to add as it is the most complex
> tracepoint. (And it's also an important tracepoint known to perfetto.)
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

This approach seems to work well considering the limitations. I wonder
though if it would be more practical to simply pass the individual
primitive values used by TP_prinkt() from the start? I suppose the
downside would be the extra overhead with the tracepoints disabled.
However, this might be neglectable and the solution much simpler?

> +static inline rust_binder_node rust_binder_transaction_target_node(rust_binder_transaction t)
> +{
> +	void *p = *(void **) (t + RUST_BINDER_LAYOUT.t.target_node);
> +
> +	if (p)
> +		p = p + RUST_BINDER_LAYOUT.n.arc_offset;
> +	return NULL;

It looks like this should have 'return p' right? Sorry for the late
review this has been picked up so we might need a fixes for this.

--
Carlos Llamas
