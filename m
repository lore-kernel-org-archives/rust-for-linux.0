Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE621B80F
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Apr 2024 23:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713222321; cv=none; b=cqp5TlOM6oR5Bf2RG09EBB/SwgBWkK9V6Z4T2IaUzn67WaZ3Gtlkaun/PpVUIK2A4LqULN5a8jBrvnmN2uqj7TGmw9B6DYinpU9NpLQ+okEhzXQCkZLYtjeu5PNNR3SbqKMpXuWTXCKmwj8PHX0AMirOOuYSrJFVAxrJ9L7F/m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713222321; c=relaxed/simple;
	bh=0W2WWM+WXMki7GHsigtUNVnOpWEGnshZxotBdbsJZ+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zq2yhQlJVo83gqy+C9AsyN/mSYzSMt4YDkfXul6E0DSHzB7+UHV1pDRqBQLS1b9LNBSaymODNteEAJLte4LiIs/PuBjTWjnlh0JN6Nofbwa/A0skR+8wsszGoq4S9keazKHwwqG1zFd+AtY+td3wgkB3J43notPPW1/iJJwAJXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OO3BEPOA; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OO3BEPOA"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6ee12766586so2474161b3a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Apr 2024 16:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713222319; x=1713827119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yo3EV3bfEx0E8U36ciba2hXn2Sc3b8SZ2s8fl04bgqI=;
        b=OO3BEPOAYipo0Xa+PU68F2I+F6RFB2ginNYj5MUILjvMpwS0oc2w9MQVhxzQAfL7z3
         NMSecf1vTZImbiPvN4crZIBZlLg8QH9j/Tag7FpDnRiGmZyE9cLb2ItEU6tKy3HvJTUd
         xSRdE/w+OrCiQN3YXuKAT169JHf019DlzQVy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713222319; x=1713827119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yo3EV3bfEx0E8U36ciba2hXn2Sc3b8SZ2s8fl04bgqI=;
        b=jWDufbGmVe1lnBK716DpWklK0EnBXKR1Zp5B3oCUaoap8EIBEVrMi88H8EUHaR+1xg
         PU35G2XaBu02NNW9WsbI76ocONGqRP3BFqEQ9FEu4uFOxV4egbmk0R0LQRGsJrVj/sNp
         b5Yb9aiXRjK7HOT4pz51gJ/GAllkhKxxNwJz4oyJWGCRJ/D3FYJ7XUPjn0rTfpd/WOZK
         EEA+c3UMLrL3FjC4/TW73k0K832z2dyXqr0YALktsOiDYmj/otoCIG1KArqLT9VMe1Aq
         N+gXXAgJaHWA4dQoVsQ1/N/21i0hMrBxc7TcNmxd5J2rAWdnxxlNBzWp9M2RvTIg+/wX
         6Uzw==
X-Forwarded-Encrypted: i=1; AJvYcCULJsrnRlJm5rjSwd0AHtRC3zRPSmqOf8PcEPvkgVHzYLiRYWRo0VWwgtMMNxT96SFMAiA0JJqUYN8e9emuSSQuL94iS6A9FBmJAjpieug=
X-Gm-Message-State: AOJu0Yz5dMoJAKE9sB4yciNCbB7hjH0Ag9xqBgDmdMd8WTVT2q4RmNIH
	Hr08bRGJOJlg6fPqegMvUA+iFcTQ03bXnrduBDqc0t4Ue6PV32ZqCcB5F04elA==
X-Google-Smtp-Source: AGHT+IGTBq9q7AM8q4+LZ3+6+QGsHiulh5UsMTdIVVs8PznllX0dxzqZuDAxGin0wxHjpYsY0HUEZw==
X-Received: by 2002:a05:6a00:1787:b0:6ec:ef1c:4dcd with SMTP id s7-20020a056a00178700b006ecef1c4dcdmr541831pfg.6.1713222319125;
        Mon, 15 Apr 2024 16:05:19 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id go26-20020a056a003b1a00b006edceb4ea9dsm7679876pfb.166.2024.04.15.16.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 16:05:18 -0700 (PDT)
Date: Mon, 15 Apr 2024 16:05:17 -0700
From: Kees Cook <keescook@chromium.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v5 2/4] uaccess: always export _copy_[from|to]_user with
 CONFIG_RUST
Message-ID: <202404151605.6EFC791E@keescook>
References: <20240415-alice-mm-v5-0-6f55e4d8ef51@google.com>
 <20240415-alice-mm-v5-2-6f55e4d8ef51@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-alice-mm-v5-2-6f55e4d8ef51@google.com>

On Mon, Apr 15, 2024 at 07:13:54AM +0000, Alice Ryhl wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Rust code needs to be able to access _copy_from_user and _copy_to_user
> so that it can skip the check_copy_size check in cases where the length
> is known at compile-time, mirroring the logic for when C code will skip
> check_copy_size. To do this, we ensure that exported versions of these
> methods are available when CONFIG_RUST is enabled.
> 
> Alice has verified that this patch passes the CONFIG_TEST_USER_COPY test
> on x86 using the Android cuttlefish emulator.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for the updates and the comment on testing. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
