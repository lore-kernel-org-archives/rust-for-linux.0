Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7532494C2
	for <rust-for-linux@vger.kernel.org>; Tue,  5 Aug 2025 08:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754383374; cv=none; b=uGCvJv7u66UZmBWLbQ4PuoRT6PClWnwMfeiwrMSWnAFgBk4MzWcI4qwxBtOu9c0kEk6lBGwy9DXec4tYDDAYrL5dmUHgPFtxMwei3AXJrqd/6huDmeOhFa5RolXUxkYUN3FYvEROhYGhloKesHMKwW0YGIbTwTQsfGd3RiPt2jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754383374; c=relaxed/simple;
	bh=LVuuvIOXyaDckGRowOdAF0iCB3B9x3e7m6JtLCAG7og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKMjsl669ND2yE+m4jzx+U+FDJufJFxwJUKu4SNCWL2IVYYOCuxhV+jy0HacYewoI0s/QdeG92prBP5zOZgn9+vWKF56PKpXRpdVRpoOOVtjUuF2MUUrwCla+Kc20i8PReFmOqzySbpJ9SlEWhYKXHkirYnHTAQJoiMQXlvi9Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=peaxE33M; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="peaxE33M"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b8db5e9b35so1999324f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 05 Aug 2025 01:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754383371; x=1754988171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EC3P05sIQH2f4RvTxjQQwotKae6prFyn6jtQODb9ESI=;
        b=peaxE33MPTJN+Jls3NUjEorS+6iiGcvqpYpOaieZG34JycAEjy2Po6hg6w/rI2HN1D
         VoYMsKK/6uA3SAd8QR4dP0egxuzCETB4+WjPCx+bLQRa4a8bALtSZ896er/vbtcZuLZW
         GnYZ8sh4maJVXLsMfDrgGMWISLPS/pb2md4NrHF9UtVm7/+Hh1D23I+QOoHptojdgt/t
         wGjsZEg05AWgG76/urNl9Mdrkj+HUApCnlhUvGH6mHWglqTr2Bfv/ZMx3k4tJMe+b7Yf
         j4pvhBlOzwGZ4MQMcpUEOr4y5KhzxcGTYlT30gvmRcnC0rZC5QtlzA8Zx9Nh2XLrK69t
         uCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754383371; x=1754988171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EC3P05sIQH2f4RvTxjQQwotKae6prFyn6jtQODb9ESI=;
        b=nymLc8FN4xQZL70VxgnnkJB8+NICoiMDt5y6ZquiqoVTB9pys48tRnDSeOGepPPcl8
         6Z/P49z4CjoNClhXBM1bVXPgZb5qSTB4tsXIhMqiK/AK76tqqkITLDtZlldBQLZTYQGe
         UYWBKLHQRQY6QnSOKnGubJUR/j4UvjiuyU6sx6nes2RgGfnhj9mIWyMvy/7RDSsweoN1
         XlD/bQyDuaw1SDfdNgmleWKpkIVBiIG3qUAG6hd1A/NKNUywE1XLPzCk/49ui1TUZK/o
         3oSxi9htrjQjHZNWqM6v8DHTyiTd4Y35m8B8fdFZ+rVzWD+pcur4rFpWKF17d03B5o4a
         XwMA==
X-Forwarded-Encrypted: i=1; AJvYcCWqBmwz4A4c08dJHripaP/qK68rk0s7VbXyqIQ3p+4U7h+YnZU5DckgYZSXM+XhLAEghe07m1t7eaCA0VsMJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1jZmSREHs3WllbsaOGSLqirpkmqSSReIh3qd2QJkdJgW8gz08
	RSsafO2fpqLFRkOmuvcfR2Sdvv7nwTs32NA2Zv4b03bPUgbhd7rknfjcXC4dj96Z3Jxp3excmzS
	lP+wn/QX6IDSZzLJu9a0ONgGDCRghBctqDNH6vFcb
X-Gm-Gg: ASbGncuwbtAXekmRWU46TJuJy7EeIGE47zduApvF4LkHqynVTdU6rBcbto6yhh4YULY
	Scbz3UQtj+1T+Vq0OLGgwjFUFfXm8dAgmguN67fn5YOuv387W5cFj4b0RMa1nifnGkHGmZKcn+I
	HBQ1Y59yB7BIdC/QdgWtplwcdpPwo+WToZQBx5dBPZEXn4X/0SnYMXM/irQVi60DES9c9XnhH8W
	/PqdA7H5oIHCywoOkQBEEluEPSy32Vlvsa3flbyjITH5Mv/
X-Google-Smtp-Source: AGHT+IGtAV56xPSuv3qJG0TJb6qDD4qvA7fD8oX2CreP4OCwWwwKK5eD+igWG1oRFqoLugM9orOt5fMF8aMdW05tgpQ=
X-Received: by 2002:a05:6000:2289:b0:3a5:52b2:fa65 with SMTP id
 ffacd0b85a97d-3b8d946a541mr9866566f8f.5.1754383371062; Tue, 05 Aug 2025
 01:42:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804171311.1186538-1-ojeda@kernel.org>
In-Reply-To: <20250804171311.1186538-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 5 Aug 2025 10:42:38 +0200
X-Gm-Features: Ac12FXx19FT9ynQWIxH_U--Fjwzz6tXLnl6QKMiOty5H-9vNPyzv9MLJrTEPKps
Message-ID: <CAH5fLgiERU2Q0+BAR2P5vb-mTeNe=wbS-b_38bjhc+WOD+bXyw@mail.gmail.com>
Subject: Re: [PATCH] rust: faux: fix C header link
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 4, 2025 at 7:13=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> Starting with Rust 1.91.0 (expected 2025-10-30), `rustdoc` has improved
> some false negatives around intra-doc links [1], and it found a broken
> intra-doc link we currently have:
>
>     error: unresolved link to `include/linux/device/faux.h`
>      --> rust/kernel/faux.rs:7:17
>       |
>     7 | //! C header: [`include/linux/device/faux.h`]
>       |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^ no item named `includ=
e/linux/device/faux.h` in scope
>       |
>       =3D help: to escape `[` and `]` characters, add '\' before them lik=
e `\[` or `\]`
>       =3D note: `-D rustdoc::broken-intra-doc-links` implied by `-D warni=
ngs`
>       =3D help: to override `-D warnings` add `#[allow(rustdoc::broken_in=
tra_doc_links)]`
>
> Our `srctree/` C header links are not intra-doc links, thus they need
> the link destination.
>
> Thus fix it.
>
> Cc: stable@vger.kernel.org
> Link: https://github.com/rust-lang/rust/pull/132748 [1]
> Fixes: 78418f300d39 ("rust/kernel: Add faux device bindings")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
