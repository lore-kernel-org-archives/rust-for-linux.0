Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777732D3A88
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Sep 2025 08:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757664459; cv=none; b=Axyk0YbB2PHJqa4PB4eD7Z89yDXov4PvOYfGoBSNTt/oGht2ZYsP0vJeIil5XduByawMLTpoTFgv+ArgsUFLUdGqZs+poyYlBapxieesHLWUWbWfutlu6AMB/Jyo3NcnWU5YVB0n8ZcvGID7ccV0CUgYSAmYemTsS1xaGpC7hg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757664459; c=relaxed/simple;
	bh=gXY6rpD6dmiNO8w8Ji0dVoTPlEqZB76ZsSgmdEXvDW0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DoQ3pkJ7OtrldhOn9hQaqL37hzSZCjVxxwllkntWIy3qk+BsLhEhJm0FfuA4IKW16Jr0Jy+X0AjHjfCxe4HuBP1qk9RgMNefMlEWnUx/urApJBrVSGOL8NQGRzjacKCbmHDZJT/j3qH1W3b1grLguj2tggx3vCwfFR29epv8/iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pKQOY/S1; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pKQOY/S1"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45cb5dbda9cso9631585e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Sep 2025 01:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757664456; x=1758269256; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+tgtoriTVA3wUl1fLwqvusUWB5z4BoYTpvvOhTysEkY=;
        b=pKQOY/S1UnIch1qPE5+pX9kMuYwdoB0aEtajEToaVSyxYyyUxqNxUSjRw+ppIHbv30
         bToRGCy3HjdrbrMrKp/2WRhFY7iyrjjp2hGbm+Ecl535hi+JC4ll3Y3H8yrAnDEWI/Bj
         Hu8+M0kys+Rn2+qoIoHzUHGJapgay47OL528QH2VPetzm5sQVF11tlLrtTJTtNPdij0e
         f/7ideA+pfFhciAYszYyN3CxeHFXDXqXFk3B0TF/9J5iUrmGol7JdtsEYjIrkdgUh0U8
         RoPZUwig/8d+SsdOjbp/oMbWvq2ouPBSm4E2NGyKSnbCsEkH5qpYCbHyz8xx6Uu+YsPW
         ottw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757664456; x=1758269256;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+tgtoriTVA3wUl1fLwqvusUWB5z4BoYTpvvOhTysEkY=;
        b=xTWAIFKwITJzpsdyvHMwJ4Cd4PAVz9nfrbXgRvFvaQsgsxlOMj21KjqMFvGaskNzHS
         nOsDaMrU30N8nWWQep1cBY+5GIfeempP0R4DMmDRea/ymGp7C7AcBb+WOKXqV/p4++Uj
         Hmavz2J1ZFOsRUqVG5QfzX1oSgcDZgIrcwW3o6hflREiF+AjHM/e/rFm2wA/ni/8Dsan
         mIR5boJ4o5AXmcl64/838g/p5q4napGHV2l7hzPLhSDTOXBLXNd0VW+9lb+CmdZtD+2Y
         q2IZ0Qw9rcRMgzh399hWcH49wCSfrM9KRU3WA7/fwTQ+GDvjECXdYEvocVvu4XUv4wrB
         rukg==
X-Forwarded-Encrypted: i=1; AJvYcCXh/qoU8bfoKU+5jxkWJDCDqNAfXAlV9pND48BjNz2PTdlpWMri1GAMSFWf3wTHAzEXh19t0zbojreO6VEvVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+PHHgAhPIB7FAPoyzzb80/J537OYcMm7dEjYL0IxJLX4O0fGa
	e+sj/GkCDmNkluXtDHGvm/MuSOq85D8A/iFDIhLX1WIQfvQhY14p/qek90kEo35+EEYdM8lED7Z
	TJ8/zkCnYC3wVhjz/JA==
X-Google-Smtp-Source: AGHT+IFkxsfqAcrnekL3Ice7pB/PeSHdeKiiZaFaWBiHr3Z/hX7oTQ21wuR0+bX+ocJ/wu6+RCMQdyFuzPpJpAo=
X-Received: from wmbdp7.prod.google.com ([2002:a05:600c:6487:b0:45b:9acb:6940])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2f87:b0:3e4:8163:b6f9 with SMTP id ffacd0b85a97d-3e765796c6bmr1878906f8f.14.1757664454769;
 Fri, 12 Sep 2025 01:07:34 -0700 (PDT)
Date: Fri, 12 Sep 2025 08:07:33 +0000
In-Reply-To: <20250910140212.997771-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250910140212.997771-1-ojeda@kernel.org>
Message-ID: <aMPUxZoV9BCqDg0y@google.com>
Subject: Re: [PATCH] rust: maple_tree: fix intra-doc link
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Andrew Ballance <andrewjballance@gmail.com>, maple-tree@lists.infradead.org, 
	linux-mm@kvack.org, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Wed, Sep 10, 2025 at 04:02:12PM +0200, Miguel Ojeda wrote:
> A couple `Occupied` intra-doc links are broken:
> 
>     error: unresolved link to `Occupied`
>       --> rust/kernel/maple_tree.rs:96:46
>        |
>     96 |     /// return an [`InsertError`] with the [`Occupied`] kind. It may also fail if memory
>        |                                              ^^^^^^^^ no item named `Occupied` in scope
>        |
>        = help: to escape `[` and `]` characters, add '\' before them like `\[` or `\]`
>        = note: `-D rustdoc::broken-intra-doc-links` implied by `-D warnings`
>        = help: to override `-D warnings` add `#[allow(rustdoc::broken_intra_doc_links)]`
> 
>     error: unresolved link to `Occupied`
>        --> rust/kernel/maple_tree.rs:135:36
>         |
>     135 |     /// [`InsertError`] with the [`Occupied`] kind. It may also fail if memory allocation fails
>         |                                    ^^^^^^^^ no item named `Occupied` in scope
>         |
>         = help: to escape `[` and `]` characters, add '\' before them like `\[` or `\]`
> 
> Thus fix them.
> 
> Fixes: 7f51d867d2ed ("rust: maple_tree: add MapleTree")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

