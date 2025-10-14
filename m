Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B088630103E
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Oct 2025 16:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760458155; cv=none; b=fCjOMbBuwqF7FGVGbzKf2M0rSU8A/5S9BX0ogwoH/e2NpFwQhnxXePgmgAwd6RUJb7HS6NePop2MGYbClIaf8hMFIha7Ox2wBDWqNaelORdLK8GhRu5sX9gHThmVE+JB0FAtDhPnCy6qzhs/Aal/rtmWWloT63FLLcAZ7MCwvYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760458155; c=relaxed/simple;
	bh=MyDZ+5xbfpDbRdcjNPPtRkhMLKRMmMRRRYNXyrRIfp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NRMS5XWlqW7RleZAoCM97+qZx7V50FNyDH6/cI9OgRKOaHMgpjX9P8OJOXkfZ3S+ORHdekpe4rCeIwYgQ5RxEEllbNwi1X4tSbcE3B8OZdgBYzeKR8kZWZsW35spC7eCxBLolT/7+0zzLQdudNliiR47XuaXTBdlVvsq/HArMwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAFGSV5A; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAFGSV5A"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-855d525cd00so962944285a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Oct 2025 09:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760458151; x=1761062951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N4lRqPExRAyMWRp9Rfjmg4SkkmqlcZGNh8vWt5+XF28=;
        b=AAFGSV5A7gtxhBTm2GLz6kIfyMee2NNo+qC3TWlq/erdxS7U3zcNl+nZJDyzf/Wp9h
         vKzQul6e/lfjtDgqtngaFtoDZSDZtzKKSN/0DUdjFMJ3DGaJFmDIu72EswHd/cMD9c8y
         oLg7YBR0tWdVCHowsUe71bSy/Dn13vqyofgyiE0wffQcODRrT5W40tL3w22gwpq+Ylol
         XjgoxEq4moS3FyBK6YoW7Y+cRigs0126KMW6qpISoKqG2UOURzpEWiLeM+fbUYldhBF3
         6sS1gCwLTfTK96tfj6zGEi9uMJ4L/408x2yJv/mmXRiToXPNL8JGHz1mmtTcwB6KjHXe
         yz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760458151; x=1761062951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4lRqPExRAyMWRp9Rfjmg4SkkmqlcZGNh8vWt5+XF28=;
        b=C0DfKHyCytrWtRXnFNbze7pFenVCMaMPy0+1a7I/b9+5kkDPF4PLMJis4FjRBQQhMC
         jZ1P3SROwSpyLY8xehG9PJtsShAZayg8uR+78pMgxykQKhRqkvYqBaqEhTs6Wnp43fxT
         PryEtLnpTzJG3pxyX7baLFYOlC4XE4b45wTxsw8TlFMoVYKeJNetJhlrQL/6SIDDofnI
         8R/+J5l9Wo6GLTENcxNtxtlnKUWtQhrdwEaTtXZIlro5aRNTtq6GuS8zDEnuCHH/odxz
         yKr56W6aA82q8+IOcaIqwEdZgeqsGK8QHO/KVvzDCfs5f/e8N7+YFFnNNbTBhdrxKseN
         eoKw==
X-Forwarded-Encrypted: i=1; AJvYcCXmutTFdup00/LdQDQM+mKadMaBwqVkvkRSrnzg6lui+UWBY3r77bRlADXyHY+gtQRKkzC0Db8qP3TsIcjDsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdsJyhfp73EAVtrcqECnce10AY0UM7mPBLMnSsw0Bh7jma5whg
	3kOUIB2Htuj1rmQBjWU0+lbbbLKGl5ycQJFeD58Btx4YBqPx4rcoHYTT
X-Gm-Gg: ASbGncvWIOUl9RW7IJ1GTgKmSv8sktink39hwD+ZYEDXLkKT/PBaXBom09+qitOzt/D
	m3GbQ8dw4QLvuByWzkrr7yBkIV8fnCn2Wqw2dRtfgZ+uamvly538ue6NqrBvntKBS54gPwNOwOY
	20miPcmZEIdUA3HyNoEQ2Xd1mDLrkrpSGLkRMZWuT5ggO/uk9e9Cp5+YR41qLBA3kq3W93Gir2F
	VdMWeUMENoyBPWV1FuBG6h+2HkvEoKtVB8aLt+Nmjm+mN9gakpiOgv1d/c0AbI0N7qBUn6Rtlkl
	dIaOZCy6+8sSmhU8RXZNwwP8mImtBE8FGlYviZcJdZw5g7Q4nFLblTEgF7By7e/NiNc1g3NTwjl
	4fNB7ffUYfAzLcY3ui9RUV9XANiSX4jrzhdrMFX8dNr15cd71
X-Google-Smtp-Source: AGHT+IEoehLXwqxEN/cc9TnKoWCH0/efz6jmoKuyzf/OPOzqS4tT8DPcYGiD2jioZTZbNhTh/I2HrA==
X-Received: by 2002:a05:620a:a515:b0:886:ea5d:9270 with SMTP id af79cd13be357-886ea5d939fmr1674523285a.72.1760458151266;
        Tue, 14 Oct 2025 09:09:11 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f3d70easm1249358885a.12.2025.10.14.09.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 09:09:10 -0700 (PDT)
Date: Tue, 14 Oct 2025 12:09:09 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Burak Emir <bqe@google.com>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH] rust: bitmap: clean Rust 1.92.0 `unused_unsafe` warning
Message-ID: <aO51pV5WSmqnT4rL@yury>
References: <20251013001422.1168581-1-ojeda@kernel.org>
 <aOzET46lagm-p8go@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOzET46lagm-p8go@google.com>

On Mon, Oct 13, 2025 at 09:20:15AM +0000, Alice Ryhl wrote:
> On Mon, Oct 13, 2025 at 02:14:22AM +0200, Miguel Ojeda wrote:
> > Starting with Rust 1.92.0 (expected 2025-12-11), Rust allows to safely
> > take the address of a union field [1][2]:
> > 
> >       CLIPPY L rust/kernel.o
> >     error: unnecessary `unsafe` block
> >        --> rust/kernel/bitmap.rs:169:13
> >         |
> >     169 |             unsafe { core::ptr::addr_of!(self.repr.bitmap) }
> >         |             ^^^^^^ unnecessary `unsafe` block
> >         |
> >         = note: `-D unused-unsafe` implied by `-D warnings`
> >         = help: to override `-D warnings` add `#[allow(unused_unsafe)]`
> > 
> >     error: unnecessary `unsafe` block
> >        --> rust/kernel/bitmap.rs:185:13
> >         |
> >     185 |             unsafe { core::ptr::addr_of_mut!(self.repr.bitmap) }
> >         |             ^^^^^^ unnecessary `unsafe` block
> > 
> > Thus allow both instances to clean the warning in newer compilers.
> > 
> > Link: https://github.com/rust-lang/rust/issues/141264 [1]
> > Link: https://github.com/rust-lang/rust/pull/141469 [2]
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Added in bitmap-for-next.

Thanks,
Yury
