Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E624030B50A
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Nov 2025 07:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763365614; cv=none; b=TpFiwOBsxEfAb/Z0RXXbh1RXNZrKwcxRk3ccSSAuAhTY+h7DwWEo/jZFWDl23Z3t3UsExRGFj6pG0SkD9FK2Qxh/4QYbY+LsrdEMYJquSKWE9wSV1BNp8wTxqYiAAS4I++c1RMRqI2JcpsHwh4pmQDWr2WXyGMRA9WnXoYgUm7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763365614; c=relaxed/simple;
	bh=ObmpRVCC1Puh2FN4TUTSDuNBSGR1J6ACRGZuF8hCM1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NmV3UwrRHKgCTHcMsz9zn4lfT+/57W8s2dftxYuOzdtzUQc+ID1GmIh47fekXWWEARlUKBebhyp7hDP+RwZ1hqJa9FqrtAEWzQZ09QWF9ByE72ByOqNzn/G4P1b5molCCZ5YbikFHvMiBJDKgP3q6bwilTRPJ8At4T7Qi20iIU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDna/a6/; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDna/a6/"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-bc144564e07so110377a12.3
        for <rust-for-linux@vger.kernel.org>; Sun, 16 Nov 2025 23:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763365612; x=1763970412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObmpRVCC1Puh2FN4TUTSDuNBSGR1J6ACRGZuF8hCM1w=;
        b=EDna/a6/MkdVrusdvi7xH4k+ul7UBdmEJlw00npEg52GaDzaOzhzZ7JiWN6Zl2Rzbk
         l6nyw3oCewdlJuvwJIemdwHmhWWMzJb4+ZD1+5kssVt3sbzrbCho2+Cw24iktPDpcAft
         lpl5a69ixugH9UMb4PZrhd0MZUZRz/LFrNcUWYzdh3QCAIhxx+31at2f21rm+SvK/QRJ
         RxfzgJVMXoQqP8ztE8hVAN+vMowtUBuMt+oRRWwKg43qLoID49YUbs4mC7vYeL1FEsWa
         GxnqsXjFOKmpfwlXea0ZMAIiZQxFHd8HjHZyalJQh2+4oVahATNgz1tBefL0u1qvCXl+
         HayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763365612; x=1763970412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ObmpRVCC1Puh2FN4TUTSDuNBSGR1J6ACRGZuF8hCM1w=;
        b=vdGh52tMzCdx3pnG3yRj3bGGswtosd1VBe/RV8iPbi/gzrBGPnoLJsqQx2fItYWtad
         NcymIMtbUmZ25sY2p8MUITsBIUsGWasOEA0VX6On+zNu2pcPYYxrBUUaMcHY0Mvggffp
         scjLtvJzZFPkYOsMR278nJUcnMGEMXKCPN3YV924E0gkSg1YCxbrUt8BZxjPOYLx6E3U
         aYntxZYGqEYAmoYe1U2Wdfb2H/mkAMmvjudRDoUwpzzpcZ7Ohq/LYJqL+7Tdvr3x6FQt
         ionJ8BIwdgiRtQjNm7m9RoZ/FSn/udiOPDBvw/dsXS66TxpIFAljiZDbLm6N+m2GorRd
         BAcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLmqLUaHbbkzBGcLujtNZrjG1N63MZ+CaG+bQfYtfBA6sUhYbeSp7ne2hE95t7yMTwqR/UeZCRz0/Hw8CvOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUzn1i7sghg+Bi332MXs4oj4DDgTuHDK8zaxON5AQVQv2LBTzQ
	MkbP0PuupT21GkOKbTyOHTigEFw16bmeQBgGgWjkUD23h8ChhYLR5tczmLLFYtaugETFviynEBq
	8Bhx6s0ko4I+1h/TZiUpNT3IFEGJct3Q=
X-Gm-Gg: ASbGncsRXURKbH2TbS12uMNJ8cGFf9aN/evqw1c5ORhRXI8KRijq974MuXGA7YJh4O9
	Kn3T9cC+nKUzLpgE0jdDJWUVUsByR0lEHGlt+1MGPLqnQRB4a8kbj4MH+a369cXQwgJdsptss5j
	0wjTv5zaFVgg02Tc72ZdjD5sDaaofug2IIYXxcTMBwmrN8r3LRLny6IimF0ahtWqmRkZ9Kz/+2q
	MDdWH849RBILtDubYu0O/oOFUh5mGn1kI2izgECIRjz0jKYLBNK4g5v9+JO1/9oU+eKBsvjxtl/
	OSbjRaG5vmCYdaa5kivnVk0bdj0HH6SRLOuSLxETlns1OMeVWb48aQ0H6g68VZl+0uZ3jT4KzBO
	XgK1wl2w2Tr2HecLD9zEQlgSC
X-Google-Smtp-Source: AGHT+IHcyHCJS+XHOfR1eZy7OnTrmnx2eonBofGVOY9uvH4vy2lj6EpJkn3+qRUAndgLxU1J4hPJkhNm7LJiEaSgXd4=
X-Received: by 2002:a05:693c:6319:b0:2a4:5129:fe99 with SMTP id
 5a478bee46e88-2a4add16638mr4149911eec.2.1763365612090; Sun, 16 Nov 2025
 23:46:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110113528.1658238-1-ojeda@kernel.org> <20251110113528.1658238-2-ojeda@kernel.org>
In-Reply-To: <20251110113528.1658238-2-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Nov 2025 08:46:39 +0100
X-Gm-Features: AWmQ_bknbkpZ3ljEJgnqzyAN5abYU0FTf1nfb1wVbwRK92rcRHx3LRnBCnh3VYA
Message-ID: <CANiq72nFxpNP3JH-ENKRM72phHXYSMfp_7X89-q4UuGH-OyT-A@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: device: make example buildable
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 12:35=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> This example can easily be made buildable, thus do so.
>
> It would have triggered an `unreachable_pub` warning without the previous
> commit.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Greg et al.: a quick Acked-by would be appreciated.

I can also pick the first patch without this one if preferred.

Thanks!

Cheers,
Miguel
