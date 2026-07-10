Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE4438E8D6
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 19:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783713389; cv=none; b=DEcigdGwuHYtlR+R6rls9GYI/TIzILm/RT+/qjR0OZJw8ak7mlFjNf33dSiRFYQL7FxVGjzgjuPotTArIMlSt3YiITGcvKEHLT04FBStvgnl9EaOt9Yq/ZQkLL82SWl4xrMzCew3NHBqxx9JPIGTwWyezyVpEJU+6qw2ApgvtJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783713389; c=relaxed/simple;
	bh=qWzvlV7X3JEDaJvqOVxdiWvtWE06C6bVAA3DO3yG+Tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3dX0I7vykCe3oJjW87te6mByZ1hNWqGa2Bo9yssjPjLQhkwt4qVmirPvkDJJEY5brncbOnJZhIBAuMoVWlKmIICHSNUm98NNyx74/YvXPIFbuS2ri1YYMZ4l2RTAiU3HGsB6ex1qFkLWTo+QaJbVTy/kU+Ngv+w0VdU9hFmheo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UyBUo31O; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UyBUo31O"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ccdf36f63dso24295ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 12:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783713386; x=1784318186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mWYZ9D/LgjNHZE1ttPflKV1ra6LWo0KS2YE/FLfB05o=;
        b=UyBUo31OVhAqIEJUzbn+7KfYvf7mKn0SvLj+yeaMm4JIVHpAvhypNW5NefPogeO48z
         tvk57iudeSSZE7N9jSrQFC025xdap8VLNpn8/ZGZBUoKGjLvEMwLiBkc4Gg45pEueJzn
         aMTzivpoW+tGc/RxIktjXcYscnAd/e2YxuANcwi1PraZx0FKmsNctKU/QZ4ExCAGsIN4
         h2RDIcSYwh2rQ30ffQDcYNkkJB2n6xmREeBDeiRzHvdcMWsiPk2vcskY/ZRJWrpAD8S/
         obJioQDBzFCFBD82Rlr1STAr8+qS8+H841zuxDuPyViceVUkxVfuA67ZbawXC4BQgqeM
         Sy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783713386; x=1784318186;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mWYZ9D/LgjNHZE1ttPflKV1ra6LWo0KS2YE/FLfB05o=;
        b=njvsTbJMILhvmiguArqxw7jbtf0bz8nDvqubVbkrv5HxKLy/Vx8lQznstvlqEUsj4f
         7kwWPJY9v5Iv2+LzvuypqNuc1UVafbMGgCYbFYsqzV7PyfPJbSf4jYyrKd0a6Gx0db6T
         /aF5RIIBT1AFA7hGRiZZ1NMKEhx4kIxLyNFhu7ucGe1XG/dKdTc+2IG8kvZUAgMJY+3w
         fuN70T/qPA9iQ0gASq6ejSRosmdcLFDsy4MvJ7GAoQhR8i+Hk677SHaxwYTVL9ZApqPO
         xFlSYXfHr7auloWnThRhsTyAXwyvjvgZkJ/cya5iWTH5Tb1eQuxT2hxxYJPtwu7L8ove
         ktfA==
X-Forwarded-Encrypted: i=1; AHgh+RppyXU3Ic3L7wujsQZlWCZ9xlcdxgBng48AfhVsYBxcSVWNc5X/el4XBItDChHfMHLNcFgN4LRu57aAFlCKhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLuyGf3+NDt9jTq07yOFNFNnMvu4fRy/Var8xABmI2vvDzKffL
	KrHhAabg7ugK+wNOErzxPSjoV0Rk5KJNAWTCDP9a6CaSdm5LXy727gYuXmTeGrVOxw==
X-Gm-Gg: AfdE7cnjtDLCl5YeUaU+k7xTMT41WQlZcKUr28C8PEo3wHAyPZfzcBq4QPP5Fo2xZTh
	mBEFsU/ohUml8DfJO8lJ4WDt1mTlcMlEtlt7XbxBH+sSHUlbfQcSrJOIJrQgU1Lms1+MbXhxTsc
	N8+TkwUzYvmUFo9LS0HUquEjRhXOpSuNa+fgzZ3SgG3BJXg0hx2h9HLuZRV2GU2qeSEF94P0qiL
	t0mrJLTqdbnfGAivZ1mJ/OJvXAdmbtl5OfJqTC2xpOh8+p++CxE5GQJSEvtHcuCLV5jlw3ErSv3
	73snCNR9axNgT9Db/hvxIHYp6QDESfmJqHtWTl3YNZqYlyByzs7dN16OEtQSAUdjXsXtRwdV2of
	dBs2ihZSV4VeOrbmyvFSwW1UuHYILTw36j4HzBaDaErPe8Z8CoEutMrQfmBhAjlIScSNSRjc3ai
	Piv/FtVhk1TPvYcJSjQWUpiaF4a313lMZUP+UjTl5Z1kCFHHeViNH87IsEuQltPlsIBBcQ+jt2t
	Rpjqx/MxgEHhVtFbsP/4bBZHtf3E5TlB7EIy8XIjG2ON84=
X-Received: by 2002:a17:903:2a85:b0:2c9:d89f:fd98 with SMTP id d9443c01a7336-2cea1d79204mr127125ad.1.1783713385675;
        Fri, 10 Jul 2026 12:56:25 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf8c12sm64919605ad.26.2026.07.10.12.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:56:24 -0700 (PDT)
Date: Fri, 10 Jul 2026 19:56:20 +0000
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
Message-ID: <alFOZNqW-mcfZSpq@google.com>
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
