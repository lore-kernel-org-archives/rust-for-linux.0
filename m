Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7445642DFFA
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 17:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772471920; cv=none; b=Z0IG0sQBTa5soVu8nLMPld+IWzNDI1eliLBqdyB7YUkxrhwageR+bgR2A2J348KFuYEFrcT8u2QnxY06Snpzi+DQTUGTGG00Ul2+ZyqgZfJU2z/Wk+0nOkPQbuOccIg9m1onwq3UeMMH/n0ALVRq/JgsX5FMfWCp60y/l8QmzKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772471920; c=relaxed/simple;
	bh=Pv2qpIk3MvXi6bkzaURmK+swy1UybcwU1prgxX07c/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s46i3YFvWAGIJ2FeH8bUGMjrJmfdLa5siO2VOMHxjaw0zJHyRJjHUqS0HC7yG+HdZDS3Rv1NuUFuc5R8jhCx5/1U2U9dR/Yr6d3QUKnfmk5FpPiWhpq2cBFwpsQxHTltzi99MpSj1Vr7AqJTvQHayymL1fanpH29cSNZ1dSp/6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ee+SlY59; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ee+SlY59"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ae49120e97so105975ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Mar 2026 09:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772471916; x=1773076716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gmjyFqn2IXkUrXbwMN6/szcLPp+gfk/WNKWPoNt3xHc=;
        b=ee+SlY59p0blvuRcE3KRq1cPytLWsk3tj8cu0KzLJ4GCGIXfnBihzE63BosPQ/MC1Z
         00mtDEyiflDkjCl7w/HJvLjm4FwU4q6Xz5GOpbphoW4JyWqa8DpejTQGfiM+uKiIhxFW
         rKbQQipuiIcMY+LiI4CT6W9ybbnRdt2qVufnlMV6np8iRAmNipXpEDDX3tLUXtQnNC7I
         kL05mNm8TxKJEry63U3Cxvt+Q0sz8PsqJS4UNkmctIY4NEZRY5WCfdloMpS+3thD0D7n
         u8KrNT9tYjIWaWA7SbsjbX5peyLpolazsrjHmmOucT0vzL56UVet6gSm9HimgQ01/TN8
         gzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772471916; x=1773076716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmjyFqn2IXkUrXbwMN6/szcLPp+gfk/WNKWPoNt3xHc=;
        b=l1cSllOIS7yv5bPIbA7Bq9uFuB3KcDC1EN2zKNUN+s6+A7dGtUVGPQefy7gJrMbDyE
         7WgMAKVavbDQZHDqZaXhxiV+Z2LaO81DP/rhD13x6FN1qhfBjMoHJCc5fnSpTbgoTmcB
         Cd2vt24VlzEcLu7hQLp2eXtsq5xqSeK16mRW4t9DhKvMLungfgWxgmV+KNKIgQ4WIols
         Eq82HCv3a3kIIhP/lzJzEtrKhZpPS/DBuJeY14n25lFusVUfHqY9kikrcya/IVKUhv15
         4EnNPBkfrscvwAaKnleJDc8z3585qjP022zzJPpgGg6Jh+6bSB8gVwmvrvEPqjRAVUJv
         t6VQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8bUQyemYXSNF8lllP6yxb+o+qz9z7lnztYZea94ddHOSbiOU9tjPBfI0HQd9+xLAy+byBKjyyngRMqkBmeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVHjDLsrcDyxHx7epFdGo4tIXdTMz2WfP4glOPk1ABosaGuifQ
	UJf9lBUT5+O8hpdcLPaofROiyMX4bIppeUM87zOkyG7MApJVe+YpiRQ0qXWODQDsOQ==
X-Gm-Gg: ATEYQzxYEOtkk5DgIdeXdyHfCTze00z8F1S5OdRRkstsP4aJ6DyRmjOm4qaNWhm5HDl
	E3wgGMWLjCxbcMPvJ3/wOux3UIpRCSXSFdMS1ZVcZiMKTyyGePt9e85C6a1eQLldUbhGBor0oZS
	QXgyrtQnULWIEB6FyQj5UYdr6RGb+szt/oapMtxbT45Ppz17htFmymQIJnXpHIpswJ2Zs286OBr
	kePK34n32qbWiga4gB0OQ9de5e6hDOOBdqz027dP3/Uio7/TKciCfvro+yzgU/6bqQlkrpF7Kxb
	CZ25yH6ZpuhegdebW1cItdcov7fzUPEjeltDsG1s2BWteE615bvqzwMQEbVENvXTYnv10+OnFJx
	yLCDt8jpmeWQXiylEcBXiK5ne9nTZG46KKN98EucPnTFK1s9fFRFNJTy2oy0z0FRJJAvn6qEt8W
	VnwNtsVFc875UwlEarLoKGrUy5R1QIAX0nZOKqOIuxs6VpKnqwfj7TnhjXxgcwI5N7HabB7Uvf
X-Received: by 2002:a17:903:2d1:b0:2aa:d5fd:5d76 with SMTP id d9443c01a7336-2ae3b3868d1mr2934195ad.1.1772471915887;
        Mon, 02 Mar 2026 09:18:35 -0800 (PST)
Received: from google.com (154.52.125.34.bc.googleusercontent.com. [34.125.52.154])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4802645bsm55239085ad.12.2026.03.02.09.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 09:18:35 -0800 (PST)
Date: Mon, 2 Mar 2026 17:18:30 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jann Horn <jannh@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-mm@kvack.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust_binder: check ownership before using vma
Message-ID: <aaXGZlfAmk-DCuBW@google.com>
References: <20260218-binder-vma-check-v2-0-60f9d695a990@google.com>
 <20260218-binder-vma-check-v2-1-60f9d695a990@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218-binder-vma-check-v2-1-60f9d695a990@google.com>

On Wed, Feb 18, 2026 at 11:53:26AM +0000, Alice Ryhl wrote:
> When installing missing pages (or zapping them), Rust Binder will look
> up the vma in the mm by address, and then call vm_insert_page (or
> zap_page_range_single). However, if the vma is closed and replaced with
> a different vma at the same address, this can lead to Rust Binder
> installing pages into the wrong vma.
> 
> By installing the page into a writable vma, it becomes possible to write
> to your own binder pages, which are normally read-only. Although you're
> not supposed to be able to write to those pages, the intent behind the
> design of Rust Binder is that even if you get that ability, it should not
> lead to anything bad. Unfortunately, due to another bug, that is not the
> case.

This all makes sense to me. What I'm missing though is why not reject
VM_WRITE mappings all together? Is there a downside or something that
prevents us from setting this check?

--
Carlos Llamas
