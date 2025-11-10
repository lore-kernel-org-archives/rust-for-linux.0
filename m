Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AE130B505
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 11:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762775441; cv=none; b=Pri0sSelvCZ0rpG3BdHD6lxFN5HgRFjDBiJFfwt4SDGNYrNbMFbGO75L8F/um3FdULIoDU5D7umhJYG8pTzQMbR+znfjAjvjfVPkRSwA3vaNrxxpFsaB4c0G7m42tSQpr5jzGkIKAh0saGyZOEPeik4xGHwVQGXe7Yt2TfB2JBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762775441; c=relaxed/simple;
	bh=m8FS1LKsvEj23KYUxGNEuRyY+Er+5K2VdZOMGbBWuPA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YEidpilbT8jCevvZxECU5zggu/2yz0YKBFlCVr3PJGdC9foBAOZbnBwplRR1By1wnpuGazdha7TxQfHLbh1wcq0L4XUURZXQDozYXJD/8eweCBeqqeO2bq13cbzcA+Jl2vWPVUDTXrDCmIu7pkMOMEhANJx86tPNRxkY5YUKzoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tbfLQJ9i; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tbfLQJ9i"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b6d40007ea1so231765466b.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 03:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762775438; x=1763380238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8FS1LKsvEj23KYUxGNEuRyY+Er+5K2VdZOMGbBWuPA=;
        b=tbfLQJ9irZ4UgYbxHdBuCQGlz6pi+O152fJLPmwToJSNVSuIjg8Z/2/TzDmQB0wSKu
         YtAzMdezswPJLeOz5f/+NjJ1bGweh7X45VSenF/gKIehj+sPcNjx32fP8eIClW18/6dr
         vcLyY6usgSXfdNzuNUd/9ksixTNqvtb8dbI+hjqJ+8NzUWTtsdbj6kJFNo+eudz918n/
         X2GAjVGkDlxW56HHziaRBfsfDOm6DeZLR0I7Qn7jpgs+8lFvo1ACVjnMTEARw941Kvwl
         yROal+T9ZmrGcpPPZZlqbPI3ba/47nTE/Mij/9RK+CoG4nVNHfCS8HrCODrQfZTTF9jX
         arfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762775438; x=1763380238;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m8FS1LKsvEj23KYUxGNEuRyY+Er+5K2VdZOMGbBWuPA=;
        b=EPxPFaIolCtB4S+Y8rLQ3Ls8IGfFJ3Wb7dNsxXvOTN6msQB4PfpVxON8VLpU8+UN/O
         stUfxmF29icjeabux8dN9tQOKuzkVpI0Sc3+lTzOUSLGawwS7krX+ecNWNQvYDSozhYy
         OL4aQIeOW8va1ByPwaICp0TJSEFbCyUJe9YKofQHK4PCHBncfFCa5T2waSaUWosLVfK9
         DILUFhfb3z9Y9AdZIdr0cfqygwli1og/rwDYaNVVzNMYHrxuaNBIeXGU/v7Yrzu3kmOF
         ArY0o4r94CTty9rqlb0LoAGd82/Bpd6/WAFM+WaxOrfqG3CoMIaClxuoJKBcA7pJK6SM
         4V8w==
X-Forwarded-Encrypted: i=1; AJvYcCVFJR9xf3PtR6QcFTglybM3qHCg92WpIMwzUwznD8uezGOLt4olyecQGTp6Usu6MQo1Xsz8OvpkVyPwgBajow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcnWZiY9R99S9+P8PsDH39mQuIrnnJEVDQ+YggCuvS4qyk/XI7
	WYThbBJX/cJztUsq0J7b6LIBVSjbBLlldLPoM9Ws3J55/x6SVGBwlRGUd34srCPBP6XJ4PRMVnv
	AA6jxRp+VY7/7/L4VDQ==
X-Google-Smtp-Source: AGHT+IEdN/OzNgvJoDSQXjw0rImyZwQBZCotyROrmcQM6Hiiz8GNRc/HF5cFI/FbvnJNkDypZwcJNKuHze4K1U4=
X-Received: from ejcwb12.prod.google.com ([2002:a17:907:d50c:b0:b72:41e4:755a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3dac:b0:b72:d2df:641c with SMTP id a640c23a62f3a-b72e04c520bmr672023066b.49.1762775438697;
 Mon, 10 Nov 2025 03:50:38 -0800 (PST)
Date: Mon, 10 Nov 2025 11:50:37 +0000
In-Reply-To: <CANiq72n2TDN9oa7Yu2otk=HfpJQ7NA_X=up4uGO=JszGvaGspg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-3-ojeda@kernel.org>
 <CANiq72n2TDN9oa7Yu2otk=HfpJQ7NA_X=up4uGO=JszGvaGspg@mail.gmail.com>
Message-ID: <aRHRjaSHO0z9R_Se@google.com>
Subject: Re: [PATCH 02/18] rust: kbuild: introduce `core-flags` and `core-skip_flags`
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 11:19:19AM +0100, Miguel Ojeda wrote:
> On Mon, Nov 10, 2025 at 10:51=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> =
wrote:
> >
> > Thus do so here for `core`, which simplifies a bit the `Makefile`
> > (including the next commit) and makes it more consistent.
>=20
> We may want to eventually use `--cap-lints=3Dallow` here too, but the
> skip flags here were already feeling a bit more than needed for the
> series.

Using cap-lints allow for core sgtm.

Alice
