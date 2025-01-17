Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411D21FE47F
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Jan 2025 12:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737118041; cv=none; b=k6U0cPe0o/nEaVcbznPp3GToepum6F+y930SpSOhk2weOThSyAw8wdW5bPlJvmVycRYR/G7dkdthM6bP84ICQnAP8c/OAqGzBt4uj2gCAXRmHu54EvlAA+1LtzdLG2otLKAHYO92D4TWtGbP6aNnFYKmHEG4fppiCUl4PBjiYpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737118041; c=relaxed/simple;
	bh=qBn8HirZN8Cyg2IQ4Z6nrN9vWkKOuYsOkKbvTSXKOgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGwpfRtPjJHAFNaldzLPkWFSHdsGVV57NZlrBl4lX6a3DixVieGBfi1FZ22j3PjrRFSlEu3ZNOZu1X6U5UeHjFBqxbDjKgC/DJHn/Ns4ai2pyM50ES/fIiiffsLS3icaW0HWdHJ516FwcUU1h1HTk/mqgD1o7oaqf2XcObln1a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lf7MkggQ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lf7MkggQ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436281c8a38so13599745e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Jan 2025 04:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737118037; x=1737722837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTsFM3xsW1rkvVQ1D071Ox1vp1fq+BLVH0DDYFb7YP4=;
        b=lf7MkggQHA7SoX5DeVVcOakaRqZUyYFteCa5zhcGWPDKUE5OdQkKWT+m//HTW3XKTs
         tMUNMPaVoRNPVIa6x4tP+aCS25mtlj8+uKXLBcYpNbxnUFgYK5eitRLmYo2zwHpDuqZG
         3PyMblehGARLV+adThrMKQQKqQN0b3CCZ63de+8lwN/swfM3hmZ0lPtWmjOiR8Y++14h
         o5z+7ZiDSKvU5sb8+7IVelFl5au7Xk93kPsad2Ozui7GK8yMNYfJC5BmToB7AEz48Nzg
         0lS81Qa55xiPX+R3UYstct2eGZr0bKF37IbHjznup8M7KOx1OOUXEDq38G2pP3ZFXj+/
         DH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737118037; x=1737722837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTsFM3xsW1rkvVQ1D071Ox1vp1fq+BLVH0DDYFb7YP4=;
        b=w2DKiUqeHOF657xX+D/bgjCGTGCQT3HLyI9Zf0pl+YsVuHDp2oqXCKlET2Us8nwLv1
         giWI5Tw6wYX57Tf1Tc7BBNEgOeLe2IaAxNJRudoMUZEnWevmF3rfYpYwC7D3WMDNlneM
         4FCRbMRUs5TWivPly/8EAQBuPJixL5Mpp+YrPWHVx8crK5IYk5kbVJCu1ifc8lI4yP1H
         Fe1aimKD0saDStSSBZmbdPpttNaPrtwKmKVS4rD641idqZsaa6R8lM+255eYrlIstkBJ
         a2XZfHFQGAq/c2IBY+8eRY96k7poLy84aFX9cMcb4px1hwLnGvE0WtQNw+tkhUPXXWNR
         G8bw==
X-Forwarded-Encrypted: i=1; AJvYcCVoKN9li5GtxucMdL7N9FvxLOwbcuEbHUFd987PwLVMMOyyEPeS8KafXAKMMvcEv7g+YEk7ndbessvuxLReXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb7VFzF47Z/KoeoIZBpLOI9bY0pXA/kN1su7ZIprAT2Ztn+90k
	L+DXJwlL4yBLLrvKbWUVHIdAQdDHzAF1pbrGA4OgnwE9DhjudDZSz4lTzFfNbfoh4WCvI+VMP28
	Vi9RTTLuVakoPrv6YPl8GRexCHz7vqSEUBwc2
X-Gm-Gg: ASbGnctkbIPUpr1y4oJSNHiplfr7OF5R7i7sYIR50CQLPP+6nS5BjQpnNXX/sbvfsml
	IsLEYvwjICM3Qfnc5mkk9diw4KU0O9qmYXARd+WY=
X-Google-Smtp-Source: AGHT+IHrIhAKGXIqeHt/cUeyGtUugRtfxylw0ZlQpSabDdEBD/SAKou24gHW5sEFv1nvjVcY6H8O3Y85JY3ERj+mSv4=
X-Received: by 2002:a05:6000:178e:b0:38a:a043:eacc with SMTP id
 ffacd0b85a97d-38bf5655a55mr1892926f8f.1.1737118037519; Fri, 17 Jan 2025
 04:47:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-vma-v11-0-466640428fc3@google.com> <20241211-vma-v11-1-466640428fc3@google.com>
 <a5f26615-b27d-4e7a-a371-0bf8cba03d2c@nvidia.com>
In-Reply-To: <a5f26615-b27d-4e7a-a371-0bf8cba03d2c@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 17 Jan 2025 13:47:05 +0100
X-Gm-Features: AbW1kvYWqYRF6L9bNPtcxy-n6pkNZgee56h_AAgcgyZH1ftUtuKcO9sA-D3BhZw
Message-ID: <CAH5fLggTisDuOndJKYNHYQoXeind+MGD8veyGfj4A-39H1KQAg@mail.gmail.com>
Subject: Re: [PATCH v11 1/8] mm: rust: add abstraction for struct mm_struct
To: Balbir Singh <balbirs@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2025 at 1:45=E2=80=AFAM Balbir Singh <balbirs@nvidia.com> w=
rote:
>
> On 12/11/24 21:37, Alice Ryhl wrote:
> > These abstractions allow you to reference a `struct mm_struct` using
> > both mmgrab and mmget refcounts. This is done using two Rust types:
> >
> > * Mm - represents an mm_struct where you don't know anything about the
> >   value of mm_users.
> > * MmWithUser - represents an mm_struct where you know at compile time
> >   that mm_users is non-zero.
> >
> > This allows us to encode in the type system whether a method requires
> > that mm_users is non-zero or not. For instance, you can always call
> > `mmget_not_zero` but you can only call `mmap_read_lock` when mm_users i=
s
> > non-zero.
> >
> > It's possible to access current->mm without a refcount increment, but
> > that is added in a later patch of this series.
> >
> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
>
> It might be good to add some #Examples similar to kernel/task.rs

You're probably right.

> Acked-by: Balbir Singh <balbirs@nvidia.com>

I'll pick this up for v13 since I already sent v12. Thanks!


Alice
