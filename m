Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1998285412
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747675816; cv=none; b=GWOtOthQm7KSrT+athtVeA1UomBUM3vXtQO2RRBxyyab9a4AQQ2Gu8Sq7SPwPJ3uO3tpQNtSm5+6jCXl7E3GZnWJLN4W29IEe9SeZRr7+lrCdVURSv3sAoK3w2glJohMg9fw/rFfYcixVLkShBW4yrSh09i2kWTRy5ANOIWWFNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747675816; c=relaxed/simple;
	bh=DlVjaAuGzCckGp8cGIwmSCnyzwOM6gZWGWJBeW5dPt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pxa57IdS1NSrYWkjoy92FCh3JJ0LdJ7XwKHCVF53Q6sX27uABE1lbsu+381HAVwc/MELyhUe8X1uz1MBlV6rRRbXcq0zbdvLkCO6mcM3l2GDEMsRd7iSyR7BnompR6xerswhSTqYW3STSqwimSLf+IG02EHghDp7mACekKWk+3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h8zomfpD; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h8zomfpD"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso44017525e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 10:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747675813; x=1748280613; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlVjaAuGzCckGp8cGIwmSCnyzwOM6gZWGWJBeW5dPt4=;
        b=h8zomfpD2mC6n01HVxombTvRmWi8L+n/SRu5WhAPx/fOJi7xeYy+iKd9i31rnIn/Sp
         y/cdRMwdNSXq9fxIw1//1EIAXCbDAYl4JIL3pD2hT5u2x3q4J1YRctgK9gRJdlIQGQBa
         exFrbW0HUUOOhLJQSk7WaU5O/Ea4LKYTNJHioIZzx+BDaq5uY1w8lgwjdGeJ9x+I2Q2I
         wfypSkSWSduG8qSm4OQpGYBcOg+botAVNRvLKBKocnhtmjI/D/l117/NEmgiNEeH3WMt
         s2UX/4enYYDxpZtp+mZhcQOkA1jj/3/crKIkEJxjMs1zgaMWzJ4skzqCv95qdc24DHGF
         xGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747675813; x=1748280613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DlVjaAuGzCckGp8cGIwmSCnyzwOM6gZWGWJBeW5dPt4=;
        b=T3Ld6qQX+cemuXOpQXBGtSGMeYWVw+sbtKMH7SN8Kv2M7lvOJfv3lDZpAhNjgcLbQ0
         dVmuwQXfQ0Yqf8DZfscu0Jh5BbthpjipD+WybwAohPqM6zzUZ6fGuFw6YbJfzCuqUxYd
         tIc/biLQpbE0+E+SK+/N3mfsH/EAOKrFAmDMML+0/pWihE5QIuyPSe6JvnjHmOFewMSs
         pSovWw1BRFd4oU86lhw3w2x68R6zv6NEgwcm20AzuwMBtudfHSqIb5rcNFDUeXeTrPxD
         tbR12J6U+ywPmf1qJSQAmAK7tnr51k628VPOF3F5DyNptAqcp43QkaXDqmGDX/1Ksj4S
         oBxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBUoSjyA0IoteNdrgPysceqTbkE0fmVZCuqD/IKMrRZc56O0rUfQp0ZzAoay7J+Vj1wqjNnU4dm78VT+FbKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWyL9tyI+dAAN/hyTnuEx6O7fuclE0+f3pTpnF9GVYJkl4X4nz
	7liiJ1bY6Ywho+YosbP56bL1bx8Nrd8+kgw7hG+aPEwEDba+4WkMhbFDgLPTcp21zdajD6g32SB
	uImpYhDLeO7/1YbQIW8KapjPZ1t0We4xXwHK215xL
X-Gm-Gg: ASbGncv/Ldbrpd5N5RrjfhDgz+hUHbMV9MIZ9mltthPDcnCu8gY9vpCcC8RfV/sfpYY
	E72gQjIdlWdRkadkzBoEyxdIaBUqmpWXoiGVmTHu7cb+MbxrHdsbZZ03sa/4hg/G++EEpi+Gtwp
	43Zt+z/V9TlB5TxdV0+PfoSZaRUgMvsJ05oUlXiOn0SNNTCwmfPFnp81vadH0bmBE=
X-Google-Smtp-Source: AGHT+IFQD2LI5rd26B6n8pHjdC0LhDPOeG6Ss3mD/taDqgLRFMr+XfxaMA5Wk4K/AbxHJ0rJ0CBHMuFKf1LPF0bqKPg=
X-Received: by 2002:a05:6000:178c:b0:39c:30cd:352c with SMTP id
 ffacd0b85a97d-3a35fe5c5c4mr10951227f8f.8.1747675813149; Mon, 19 May 2025
 10:30:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519124304.79237-1-lossin@kernel.org>
In-Reply-To: <20250519124304.79237-1-lossin@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 19 May 2025 10:30:01 -0700
X-Gm-Features: AX0GCFv3th3HNsBNGLkEKsgSDx5oHFNYc5dr6sRRu5xtx1L8o4sSk4_tUpgUv90
Message-ID: <CAH5fLgj1k6juFMoBWeeWgdkF0UDewF1=VThj-dnusXwjKGFnSg@mail.gmail.com>
Subject: Re: [PATCH] rust: types: remove `Either<L, R>`
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Kartik Prajapati <kartikprajapati987@gmail.com>, 
	Aliet Exposito Garcia <aliet.exposito@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 5:43=E2=80=AFAM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> This enum is not used. Additionally, using it would result in poor
> ergonomics, because in order to do any operation on a value it has to be
> matched first. Our version of `Either` also doesn't provide any helper
> methods making it even more difficult to use.
>
> The alternative of creating a custom enum for the concrete use-case also
> is much better for ergonomics. As one can provide functions on the type
> directly and users don't need to match the value manually.
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>

I don't mind making a custom enum, but I do use this in Rust Binder.

Alice
