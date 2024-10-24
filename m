Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BABF12D1F1
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Oct 2024 23:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729810818; cv=none; b=Xf14rgYUajxwD39C8255M88Uke2gGGpfb47BJHmHQ1gWxpIZmCKnB9twZyJ2GSN6BIXG0k3n5E999KUVPgMFqD2WSNK75fd2bbLrJqcB1wGDhtcbQ4pNYPV+k/36WqUAu5LkaTNSlVmTgRv79OFnGSAyKYpPrL8MPZd6pOB5NOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729810818; c=relaxed/simple;
	bh=bjkd3I8PVvryUBj9cjaPUkOhrD6exRyenT2IT2meDaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pX2KummWj2R+2EQ4rNkQrhzCy+Cx5YWbzjTCJGr+F+IiQUair20ECVu2rFj+P1h/1s7LuOnMfb0XQdj3fK+7OnkVy2PpUkPTBmHnQZ1XbjTKaMEAa4a8YmNatA2P9axmGXk/N0+rVmn6yHUTV/rlxAwySNanm4mb/d4dZ3Bv1EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xMk/KbW5; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xMk/KbW5"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20ca4877690so34995ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Oct 2024 16:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729810815; x=1730415615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1N/YHxtexapkwEa/KzhGq9uJiSxlgwwlfK/Xn4dDvz8=;
        b=xMk/KbW5IhCvPKqnco1uNdEZayG6EvHJN0R8UMYxj4R5TnY1l1zvYNFS9Bgv7M1IDF
         IwIdxI+BWsOHpIbBRyAHR8zKQZOixgRb15IDDdVvso77YkoJT2aoBS5tcaoiNb3otLUv
         +J/5uhhHDOHzg7alPcCteqkNwv6ANqhMSL9hvAsm4IXRrgs891rUSqfFO/gfglpBIqTW
         8jLju8gQp3z03stQ7kHbEajMOi65BwHPv3llnJrYY5+5d0Vxc689Er6g8TB4f6WxjDGo
         Svq6JmtdXYi5JwJ6TAbeGfqBCraQUxN1DfReg1spY9tm9uIr2rOFS+yMS0feHVC0I7JJ
         mJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729810815; x=1730415615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1N/YHxtexapkwEa/KzhGq9uJiSxlgwwlfK/Xn4dDvz8=;
        b=aHdC3gMenuJcg+KcEyvJoZeMSlucV+lYlEjBi9xTq7dlCxx05uKEEMevijr6kQ6BVl
         +co1qsbLh+pVVRPQS0m4yxORyE6yCM3ca9oBP/hU8Sn47K/dJRXUUKgISp9KXoiA91Ah
         f/fl8h9UQE/cyjXuPwWht2Vyhvy5jFsUGkGKrd1G4Pgx2CJ6/lftMOXqQQEDlL9Ab+3A
         fU6PB0Tq/RhycWv0nB1n3n+Czd2/YzBQXLSuCySRBLiAiCziqaPcUUYvjsiauf6wiFi+
         FRBBBnAthO3sNPrr40gI+OhHg09z5VMetv+g53mIe9aCk3Bk3I+8mndvfti5mztRPuuD
         dIJA==
X-Forwarded-Encrypted: i=1; AJvYcCXchIzWtvp5uS8Rg0cnksa+uK/nftIvzXKWDLCQ9/u1jTElUQ8b9vOmBFRzHRJRAO1lHfCdU8zCOxLDfYr8sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5dC6hR5+o8+1EkVYo+5s56gLDtXkXvho0sCRvD1r9F80YSp5d
	aTCcPy097lr+Po79/J4VKdacnXUdN69lCGPbaMNfm4unDja4QXcoAY/W6j2odg==
X-Google-Smtp-Source: AGHT+IF/Dyf8ydqbgus1FTEPKZm1RYCxf83AYTE17X2EEDE3xOS0BfMauJXXQXefEKpmi0ZHk/dmfQ==
X-Received: by 2002:a17:902:d4cb:b0:20c:6c50:dc80 with SMTP id d9443c01a7336-2105b1ccb2amr461955ad.9.1729810815119;
        Thu, 24 Oct 2024 16:00:15 -0700 (PDT)
Received: from google.com (254.80.82.34.bc.googleusercontent.com. [34.82.80.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3555c1dsm29218a91.4.2024.10.24.16.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 16:00:12 -0700 (PDT)
Date: Thu, 24 Oct 2024 23:00:08 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7 1/3] modules: Support extended MODVERSIONS info
Message-ID: <20241024230008.GA1382412@google.com>
References: <20241023-extended-modversions-v7-0-339787b43373@google.com>
 <20241023-extended-modversions-v7-1-339787b43373@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-extended-modversions-v7-1-339787b43373@google.com>

On Wed, Oct 23, 2024 at 02:31:28AM +0000, Matthew Maurer wrote:
> Adds a new format for MODVERSIONS which stores each field in a separate
> ELF section. This initially adds support for variable length names, but
> could later be used to add additional fields to MODVERSIONS in a
> backwards compatible way if needed. Any new fields will be ignored by
> old user tooling, unlike the current format where user tooling cannot
> tolerate adjustments to the format (for example making the name field
> longer).
> 
> Since PPC munges its version records to strip leading dots, we reproduce
> the munging for the new format. Other architectures do not appear to
> have architecture-specific usage of this information.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
