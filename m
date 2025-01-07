Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7222A1547E2
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jan 2025 10:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736245292; cv=none; b=j4dGaBvmz4h2aZO+/X6XbSmLvVFu7Yt0N+xzDdcy6Wwe5GUiPKkw9b0PpjNU6xwDS/VT35BK5Y9hpXRtfmGuNxlC+SEF1Z8q8uvGdDJPGt7yq04u2YB6Y9w7P4prLrZHq7NooqS4P0LTjpaRgjY8Na5UPap6iF7yeh8KpmOEqmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736245292; c=relaxed/simple;
	bh=FRIGQ/JB661jNzhXc6tK0hhdfh1dIA4HG9B/GvPjBIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=krgPfuwzwKe9SH2a4/4p8umEX/+tpN3CX10YfRZLtmaiiDst65kDUbo77UGxkcsCvn3kOC/ZR5WV5JakXYvc+zPPWQxBotSU6hwntNkoI6d5H5mzCwwyYGUN5AFkVlZwklaOzudE8hssSXVNqgGDQy9ngglXqlsCHj8134Zy70I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LHD5Ydha; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LHD5Ydha"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so7386009f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jan 2025 02:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736245287; x=1736850087; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRIGQ/JB661jNzhXc6tK0hhdfh1dIA4HG9B/GvPjBIc=;
        b=LHD5YdhaNkRB4JS4Ksu1pAn8A0DBUAjNpElm/3LCJKJR5UQ0BDiy7KCkRTwrDl972C
         bFJtlC4+GYftt39Lc5+WGmBa+61RMVGNi9w8f6LjRA9vNQhMT+NvefunvZHbMXJuhkiJ
         aDfZtiSzsCHMTQF6m/KDWHcj+AF/5gCQ515Ob3jjxTk6sgDhwWN0RUwprgUfKuUmyTSh
         Oc+xaJJtr5VupD9qflGYzi9zJISo3PsLbPCvinap/bmF6u523s8t86UAQRln5fl2XA8f
         /7rMBJZf/yh8pUJpF5IAUICuHi0eq44KEYkHTHnIJqvd4ku7+Cp3L4wkvuzyupcjp/Jn
         TtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736245287; x=1736850087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRIGQ/JB661jNzhXc6tK0hhdfh1dIA4HG9B/GvPjBIc=;
        b=stKbvGdM/RxMLKoaji9cVequeIp0VQKJ5NJA4xIyhuciYW6WYS6E5LmlXWvfyktUDK
         LaMKNtvUgoYHXSyK/IHpI8AC4E+FDmwai58wLA7/poiqHI4Vj/h7u3agKuufAWs7qQXE
         AYqsaweM1/QXimKLjYY+Zqz0Sh54Y5X2K2LqyyAQTqLZt/0ptWCtpnqBWd/2fMlZXcr2
         tKHn4niVjzrCCbnfq7UqFoAsoBVJc1oDQLK5DMxJmTx+t23HBAOOjr/Oqa0J5EnVQ0S/
         ECkpTkEnU2lKusSRrCcJzIFHX0Kq6fBwjsBbl/HVu+ydRHGV320pGXfjAvvzbfi3anol
         wf9A==
X-Forwarded-Encrypted: i=1; AJvYcCVG2KnYwoCoFIFJI4fCFJGWVKrq/4PswK9EjG1pLqcRQyaQ4gfrNF+nVZ10GvuXyZ3GMpcl7dsL+xcS7ovHMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVKfuQ0FSynhzSARnqV6xPohiOLjmeHb1yJ++UjK3Leum3s0wC
	WdxlBMlEFFTBrT87TKE13Aj/9aZPtfTcrxhm3OHfIy/Xk2rkz0uNaPwkNUTMbXnrNF35phog4dh
	UdEhkIrSHJMtvDCgAwN6WgYvacJsNedPyuyHV
X-Gm-Gg: ASbGncuh4wOJSXoRVYufWaO23MgIT8jH+PHKzuXYJl4awYRtOmxF+ZG31QbWscyHKDv
	kAgiblMTAhLQNicEHhdezLs2grzBJMjYklNQcXH6BpvGGQ8VgQETuKDpCnAA1EzD3oK2/
X-Google-Smtp-Source: AGHT+IHcS3m3JDYGwTz9T/lHb+HT4UdeoHfbIPpg3qp3MMGbxT3aBg2nIFZIvpvAU1f15dKkyLCChwrMCrXyaN0wWkU=
X-Received: by 2002:a05:6000:4a05:b0:386:380d:2cac with SMTP id
 ffacd0b85a97d-38a221f91a1mr54506465f8f.26.1736245286668; Tue, 07 Jan 2025
 02:21:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250105194054.545201-1-gary@garyguo.net> <20250105194054.545201-4-gary@garyguo.net>
In-Reply-To: <20250105194054.545201-4-gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 7 Jan 2025 11:21:14 +0100
Message-ID: <CAH5fLggUVBQytWk5d8GHBMAnBTR6MkQEwki+F62PDaeunt4qVA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] rust: alloc: make `ReallocFunc::call` inline
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 5, 2025 at 9:03=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This function can be called with different function pointers when
> different allocator (e.g. Kmalloc, Vmalloc, KVmalloc), however since
> this function is not polymorphic, only one instance is generated,
> and function pointers are used. Given that this function is called
> for any Rust-side allocation/deallocation, performance matters a lot,
> so making this function inlineable.
>
> This is discovered when doing helper inlining work, since it's discovered
> that even with helpers inlined, rust_helper_ symbols are still present
> in final vmlinux binary, and it turns out this function is inhibiting
> the inlining, and introducing indirect function calls.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
