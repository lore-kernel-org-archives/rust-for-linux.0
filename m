Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB7A30AAA6
	for <rust-for-linux@vger.kernel.org>; Wed,  2 Jul 2025 14:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751467846; cv=none; b=b3N5mUsrGMaKQyOhkfvvgEW/3LTPqbag7CAhzJshu6cdfPbraXZTwjjDk9hvueKfVt77wYkSxw9myuUzckUn1Z+p7ScHPQv/sY63SC6LzlG7y49Oai4SHQl/42ors4KMRd+OsYMZTyF2W6+36WkYKt8u4VrryACrO7alpda1QJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751467846; c=relaxed/simple;
	bh=bGDmRbJlC9g2n00fZnTFalUFPsZkCq3Xcia/+S1QojU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZuzGsmxLwvmmAwvI+Ccw+6PpRgb9mG1AL6lh//xLTM3rC8++drqNaVPcjGFn9tuxPiYyf8oFOZF0qEXCJxdhrwAjyrBbIEPHTNbUNHzIgHyQRB/8uR0Xb41ZLkXA+mq3DOmPgCOUj8gBT2PiUBv5275WcAjj1R1XCsS6URjuko0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fl8eO+hr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fl8eO+hr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-453398e90e9so37667785e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 02 Jul 2025 07:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751467843; x=1752072643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGDmRbJlC9g2n00fZnTFalUFPsZkCq3Xcia/+S1QojU=;
        b=fl8eO+hr+B5/m7SMDuoL0hDElM0F8Ng3rf5t2KhFFOAzzQEDtFyWslG88Z9QqC5Sf5
         7v5DYq6xk7WQb+8mfmHJCk0v0CFqoQLidHvLrWYFzTe+EJJEBxj8XcO5uYrabIB5GC4B
         m59caVfTNNCIVvk0PtCTarYaCEHQHQlZoWe+ITVR5KKcQPAyxMUSP5Pi1/LVJk/ByLPf
         9fMrIcTep2isSuXSuX2VdiOldY1TxIP9DU16j5LJBxL9MrpjwNsj0/gW04YQnifnL4NL
         OIC9H/TBnmN4GHQpTksKjWXKagqy80fwgQs2D90pvli0Wl7kI5gJrmKsGDIzFnpMG0Ld
         jKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751467843; x=1752072643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGDmRbJlC9g2n00fZnTFalUFPsZkCq3Xcia/+S1QojU=;
        b=iVLrX3zMvxjZ9PZAI8yi5wJVyk3A54oy4+MLZ/Np+KxemiF2P8Q3OvKCYzWybHdPGu
         MRcID/3RzKbVB3ebgBK1gbmldQh+StF/TvxPBnJ+AwShFrav9PsemkNYKn/wAa6V9ikH
         n7NQUSFAPq2IXfEe0Ko8X/huTb2BFGU/5FHaItqeBuUdgRo21XM1EiieJvaJ7fo71Jf8
         jCC/FWRpkl7TX9shOn9/FujHmWqoaVDkcr2E9lMCpewM+XQrb04uhPlSKRPE83k8tECZ
         9CyBFosYBIwnrXv4ZFF3qT76CDjrRqBatT3RyU1f5uUQ2oU5dj7Qsr5Ln+ENga3BAuuY
         anIg==
X-Forwarded-Encrypted: i=1; AJvYcCWSGkvdMBwJBq5VN4sp/aQdz+UYzglxU8GX2yHO5+lVlIxcqdHRIrt+RDgDAxwEu+DJU+xXLKD2O5XuUDE5Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Z+wSfcHMKBDo6CpilUMS8J8HylWJ5DJmWu0bTFdxAfQvN9Bm
	jN9EG2mXd+BX2LPDErvKQg3QVdur0GRb9YmJItkDHAL9vOBJW89W01pAG2Zct9qyD69ygVjcJH7
	QDR6/40eWdW/7E1kltzqZf+BD7/fKg7Qs7+hlJiuu
X-Gm-Gg: ASbGnctCkUNHBdonkhgx4oH7OJdatcU+HLUc3bsfiR5rjVXF8ITvNVvGEqc1yDnnaiY
	gL4DYj3p4rUg0oK9OBKKR2fEeA3zj6v4+LoR10ng7ZPLxOvK4VGCm61KteQHKT+KOHw9RTMfW7p
	YaTsudesOifT7j+Pf/c99QphoLRb7YRVIX1d8GUvAolHO/
X-Google-Smtp-Source: AGHT+IG+nGGlVC1LAKFybNU3aqbmD0eZd0ceRrzz5dRVvQ8OU1lPy3YrwXIf80CODXdFzmMy/vEJc2Ci9DIJm39I9S0=
X-Received: by 2002:a05:600c:1c94:b0:43d:b3:f95 with SMTP id
 5b1f17b1804b1-454a373259emr30006825e9.28.1751467843001; Wed, 02 Jul 2025
 07:50:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
 <20250702-module-params-v3-v14-1-5b1cc32311af@kernel.org> <QU7IDrQqnXyNZDFF_jgZ4qTsRLPmUeeWedU_T1i11uOyc1E83Zo4tETj_oPxSfJySNZZ4-XEVBlkZJ-MZech4g==@protonmail.internalid>
 <CAH5fLghw5TDrzmFZB=tORR5Lxx4WoG4wer6y5NuFdod2_tb6zg@mail.gmail.com> <87ms9mvgu4.fsf@kernel.org>
In-Reply-To: <87ms9mvgu4.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 2 Jul 2025 16:50:30 +0200
X-Gm-Features: Ac12FXwuZ185xGqP0rxNGwOW-SGS_WRsBbvNFuZzozirA5KDsx5bUbkVgIxui7g
Message-ID: <CAH5fLggY2Ei14nVJzLBEoR1Rut1GKU4SZX=+14tuRH1aSuQVTA@mail.gmail.com>
Subject: Re: [PATCH v14 1/7] rust: sync: add `OnceLock`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 3:54=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > On Wed, Jul 2, 2025 at 3:19=E2=80=AFPM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
> >>
> >> Introduce the `OnceLock` type, a container that can only be written on=
ce.
> >> The container uses an internal atomic to synchronize writes to the int=
ernal
> >> value.
> >>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >
> > This type provides no way to wait for initialization to finish if it's
> > ongoing. Do you not need that?
>
> I don't, and in my use case it would cause a deadlock to wait. Anyway,
> it might be useful to others. Would you add it now, or wait for a user?

Waiting would require additional fields so it should probably be a
different type. It's more that we probably want the OnceLock name for
that other type for consistency with stdlib, so perhaps this should be
renamed? The name could be SetOnce or similar.

Alice
