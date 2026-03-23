Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0168339182F
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 13:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272378; cv=pass; b=Xc9WzZNvbgMIkjMG0/QH/Pml4mW0hZkUnZE14I7w4UG009t9bo2XmBXCKY/qUsohnahylRjmSgpSekepfQ/SKGBnzwaVMy8qHQcOfPqy1VMJFv4kFjl6/sj9ZW8zcbao58AClAco+XSYlKtb3CZVdKsYzdTftgIX3XeubQF5x+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272378; c=relaxed/simple;
	bh=b8yk/BaeTksLn5Ogx8FpbgVk4TSQec7gWJcIZVnJOpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i9ePNe27jI630fQRfuJdwhpfczCshw+fzKKAhbcVg+CaEaZkEUqL2l5m7R3QFsDAbJPo2UOE9FSJs5CI2wZLIFLVLRz1GDJ1HM/hAbkF7cwraIgnxSniM0sS3hg9QyEFmbX9a2kyetetiovqc4JdlVfyawPgRSNjOd6pF27yPEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wm2uDFrT; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wm2uDFrT"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1273c690e5bso384417c88.2
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 06:26:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774272376; cv=none;
        d=google.com; s=arc-20240605;
        b=Q0SjAfOrwZRI55z4lPkzvDJd/G8v9oebh/n4b3umKq8TOvXsAtbXlORNpwm+B7CMFn
         oC8rvlvaCD34VNdZilrHjB+fJpWjwDDysup1xurMIo21rx1xeigOiQW88hiibXONofRc
         Jwx6Iq2510Kn+oIC5GlvsYcztAfSKHzMjTd0HFahO/kzd/CbIitevCcyBF4r2AGNu6y7
         MxQNDdns/+YkQfyMZ/ibd+5m8dfsgXlP6wqWkN3yz8K6bkGEkQVbf5fk8O+UTuaHe32+
         +tmU1QQKPBr/Y4wuAW/WGuxCbQadlDrKHXL9p6+AK1Xm6d5Islx4Plvtyjg+CIa3snYn
         I2ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b8yk/BaeTksLn5Ogx8FpbgVk4TSQec7gWJcIZVnJOpI=;
        fh=xFKrzg9hayULSlezFWJihHjkCDoQXNfRDoshxTyH8uk=;
        b=CKfntlXdnHiWVmwXnlQSvI0sUvUc4GbzAFFbHJiD6rLqF0vg2JlgMaPvJhrXxdB3KQ
         sbbT5joyL3gGJONRh0OncaGwV8DdRJVsld7tEGowt5XhkVOm7ZiGFDikTU13Xl9tmll5
         Y073u02RHPxmmdZKFWP3LQ0s8Hn2iMJsgS87ZRQQigwHJn/Kt1i7sJj4W4D0Qir41zAl
         oVdJ6HWq1ardD+MqkOlznhLyouVMDs+D/+h5zBYfnZn/N8sXlwPX95K0v0+OjIM0UqZ3
         Tck4++BQAXtt9hffiOtneBQ70K9a6SxaKILN6rAWH8N5HIYTfW/kVlAO1wnZpkRHYi6H
         TXbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774272376; x=1774877176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8yk/BaeTksLn5Ogx8FpbgVk4TSQec7gWJcIZVnJOpI=;
        b=Wm2uDFrT+eRpmlFnS/Hvf5z5vwv60QhSHnQXFhZ7CgtCXAspWKceeMpqTtlA3K5igQ
         o1UfOOWc2pmTwXpZRzmw5xx95bQ5adkP89+3Ta0B+lt/xxr0rxkucUJmbJ9r1kx3A3hd
         HM/8yaXNCrAjLKofYaIwafFSdlPY3vHuFYb4EPjmusRRmBI1AuCK1C87x3qzhuNJmv3y
         VMQeOWY1l0DtnfvhiGO+Ei/XWTGZJjBfuN4n+/EVn/ZBBMYTX9jKqsiPZ9UiCL2CvLX4
         MZ9SnY8RhLOzeLIvMFn4NAk6AUsk7ui3l9ycWl3EPBxr38r9bXEQ4mYcJATjmzcOHTDT
         AgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272376; x=1774877176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b8yk/BaeTksLn5Ogx8FpbgVk4TSQec7gWJcIZVnJOpI=;
        b=sUYXo0VmXvf0PTbxZg/wQ20GPIn5wkHKjjwi9k0qQ48qEjH0+RpWGz3zZp3rlDp4QH
         hrY4BOO0L4PyI5q+mdpjDp0+9ZWex456biB6ee3/bHjgKRS+YMY+1LAgUNL574Up7IiJ
         DNvxf88Cr6tG6pq+sANJXPV94a1FysQYyMysaDxUS+rJ6EiSB2DPVTIXQqfA/24Kqui6
         30A6T523YhfZ0irj/+ZxipBDl5MYTVPOpIuXRFSxi52D9nvDCs8hGDqkfkX4otnJghMc
         AN+ICt057u1UcAiaIbH5cPQ9W9YE31NAluzGoGFPJyz3H4Ue99R9ZL16ej+mLRz+9tjk
         wcKw==
X-Forwarded-Encrypted: i=1; AJvYcCWYR78asiTKM4nnWoS5bzCyz7Zw4OPQmYotTN1ZZqvAIr24Y3ObXQaX1NQwxaFjDaYdG0FGGayeAOo/87NquQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEyHse0/9+iAND/cWtmVDevinixaedhsVYyCnHI5lSAVppYuXV
	Dd6eAO+Rd2p3UFR1rEJEB2bL3Mrpg226QRpQNjVeg4DeeMKyNRPPr5ueASRGoz8cN0Gntk3h60b
	wQJfcrnr1IIu7fWsdiOUjXQ6bRBmKHqE=
X-Gm-Gg: ATEYQzxNE9YVtMfeZZGzU3s7UCfQqkHGsp0njv4hknq2Tyn6hTjEtgx7J+1//1/NX56
	t2hakFQQRhg2seat1btx6eD2343Qc9QdGtLSUsfD3MffkcsaZu6woKmcX55r67NWxW3QhXzpm9S
	EN4M+pf+9Y00aHnX/ZE/e1pwWDEIj5tiLhJA4i6SZ0e1ayTXQ34cuvr4Wrz9+JZkYbhE7X7a4+7
	ari8MTnOk/MtfTTQayVXkHsMgSZCNApBNsoi1mKrQJe826kAOkDiKEr39AQrAIUWM8uOzsq5MFo
	aYdTpJ1DwgqD7CMwkfVHEKA5tV4NF79eusVdxT94h2SB8+ZDgY6dA0/RUUhiE//YyE+2CSm4LlG
	y6YziFIQIMg/VTEVx31C+GlDKCt5LKBoAjQ==
X-Received: by 2002:a05:7300:3215:b0:2c1:27c:758c with SMTP id
 5a478bee46e88-2c109938d44mr2298180eec.8.1774272376046; Mon, 23 Mar 2026
 06:26:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk>
In-Reply-To: <acEP7tl8pqFA3tK8@shell.armlinux.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 14:26:02 +0100
X-Gm-Features: AQROBzD3BkPQaIE4qxn0GaZ9qpo8tZ7H6ULFyxikznbiRv24VDJjkNXoA95umyo
Message-ID: <CANiq72=dh=jTORtmHfv3Z56qJoK4K-0Bpzew7CTYn1qO+sR9_w@mail.gmail.com>
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, lossin@kernel.org, 
	mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, nsc@kernel.org, 
	peterz@infradead.org, richard@nod.at, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, urezki@gmail.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 11:03=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> Why is Rust generating code for userspace thread accessors for kernel
> space, where userspace threads are meaningless. This is totally wrong.
> The kernel must not reference __aeabi_read_tp().
>
> Note: I know nothing about Rust, but I know enough to say the above is
> pointing to a fundamental issue in Rust for 32-bit ARM.

If it happens outside this patch series (i.e. the new opt-in mode),
then yeah, something is broken.

That is why I proposed to gate this new mode to the
architectures/configs where it is known to be OK (and where
maintainers may be OK with it etc.).

Cheers,
Miguel
