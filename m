Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9422733B96A
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 14:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761055995; cv=none; b=p/nTrQxmYdjRbXA8PSmOcELvXhpA7Ce+WU03zIs9yNXOejGccEDxk9iO0JtSjeVuneAV8sj4QE6IovsT4aE8w6rZOuzixQmTBAbEsC+QzymqX5PxbWmf87nTuhVs+bARyS2xolkZLDI2ypZvUOyLtswvqrsRimdJ1XjG4RdCcek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761055995; c=relaxed/simple;
	bh=5tgj2qMi7SlzBgiUdrariI7mGTmx/Ggr0BUu5gAdEws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9Al65MfCc3QFNJeUgbgXT7/7e9QVog5AgBQKbUlSghEIEyjv1GMoQET+jja5rR4AJ8RgcYCIwmDSVmMtBuUln/6lQBLmKP3bRDxBoh1/hCHF/onbFaIWWQqGo7qvKtlDOY3oe/aDDV2UOa/SwOa+is4HfGYYamoxMekHVFDEn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v155j+Mi; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v155j+Mi"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-3c8f257b7e1so5410212fac.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 07:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761055992; x=1761660792; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tgj2qMi7SlzBgiUdrariI7mGTmx/Ggr0BUu5gAdEws=;
        b=v155j+Mi8cCN4EfrIDjh03B+8n4iksYJhcpjiqZp2NUs22VM8tD2Aye7AmeUSgojtY
         pqez5GjeZyZ8hGDQXCZWCuXiNKRGrICFN5fZeX7ctUtG87RCb2zJ2xl31zVZzY4rX7rp
         eSeMwookZRwa+WDVaTsXtyVr3lAkhVhw4rYNpGLGkMEIMVn8Mh/NoN6IkkrX0SoS4skY
         7ANAv5enMHlTRuP4j8Y7lW/1p6mAToQtjycKsXSuaoBFcB9Kprwinlt9Oz1IbrO5gjyg
         yxbs1f3SG8AYGOe1yw/5n8KQDVAuZAvYCBfYe8HdLFnFqnmn5LOm6qmrVDpDsDob3/Yt
         8Zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761055992; x=1761660792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5tgj2qMi7SlzBgiUdrariI7mGTmx/Ggr0BUu5gAdEws=;
        b=N8aBBx9R4EgbWYYu7qZcfLSvO+PczVUoNwgFz+hWw/a8Nna2fgkou4ZWLEnKbtvNNr
         7eSXU2x4EOGUCel+S/wMBTjf68s9vNJOfFzZCRd7t2N1u1XgIRCYKGpT/hIOXBkbjBvQ
         kwLW8L5jpCLm/6K4gfpjFIhcFap0Owh7w2bogXAXFQvW7ehyZExcfzn+zQNQK2rcgwJI
         Zf6/Ch/qWzCVV1nsVJsHFpQRaJHK0pCa7+CC1bE8Gjqq0BdwJx7Hkiu2Eyu4+/+x7jS7
         wp+iZuEPIgkiruNQfIyhxLxkYRUcp952TgIZ00Ll6C7MlHoSm7qp3QouK+6MkgpiLUyN
         HxwA==
X-Forwarded-Encrypted: i=1; AJvYcCUI/FOo7B91JQgGj4SqLXvVE9iUo52RnsR7XKmDlUc7eL7RvcNpRdgf3mtatDJlQpU+25c6TXCy4UzN+w8R2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YweAXLRfNoD36drgoYCNpCDGL/s8Dh8FVikvzKrbDioijQXEaAs
	HU/IcVRUK0yeGWFa8+NO9vV97/7IvT7bdgXW4TFq0KEfke35LYfHNmwNmEoJlKx1CbvoVd/ELbq
	SL0N7aheZ4NWxlv7YAclOGQL+yALaqXi4dVXx9iFg
X-Gm-Gg: ASbGncuCWtLPbb6EXDxkYt+0GkekcT9j9aibWk7B4svvFMmNCzeB2wNBZVxBYNxofJK
	bw7q1tDhNrIMXtal29geIlumuPAMl22UXB2xqs+ye4tjNplQrQopbtFleJg5it2Za/voOdkLY8N
	q7cM3VKbhLUevaMnja+j3cmm/fYU24EqJaXS7IoXvlZ2zwTuT3xkQ4pIhEp5THax9Cx0DJ9QIsr
	LEUcb+0ZubO0Y4sG9i1BadKCRDPCpKaWoKOD3SnT13BVLzGuZyDu+vMla7vmE5ltLDypzX4ALvC
	PMs6pBxnrGPkNPs=
X-Google-Smtp-Source: AGHT+IEgBLAwiY92VxAzxQr0LtJzSFCjgKZQr5ZEXjzVs1+p1QEiUDeiahwZ3bIAvuYODoXUkrJphRpGr/s3f4MFbIY=
X-Received: by 2002:a05:6870:3120:b0:314:9689:a467 with SMTP id
 586e51a60fabf-3cd9f87066bmr5212fac.23.1761055992354; Tue, 21 Oct 2025
 07:13:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021-binder-bitmap-v2-0-e652d172c62b@google.com> <20251021-binder-bitmap-v2-4-e652d172c62b@google.com>
In-Reply-To: <20251021-binder-bitmap-v2-4-e652d172c62b@google.com>
From: Burak Emir <bqe@google.com>
Date: Tue, 21 Oct 2025 16:13:00 +0200
X-Gm-Features: AS18NWAZsNsOB4qRkAyLDHKfRZ-TFnjCAE5QmLhsY3piap9hO6936JhLNd9oelQ
Message-ID: <CACQBu=WC2C3j-okHtr=L1XFvAp247ChwHLKBnS795wG4RkJeUA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] rust: id_pool: do not immediately acquire new ids
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 3:33=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> When Rust Binder assigns a new ID, it performs various fallible
> operations before it "commits" to actually using the new ID. To support
> this pattern, change acquire_next_id() so that it does not immediately
> call set_bit(), but instead returns an object that may be used to call
> set_bit() later.
>
> The UnusedId type holds a exclusive reference to the IdPool, so it's
> guaranteed that nobody else can call find_unused_id() while the UnusedId
> object is live.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Burak Emir <bqe@google.com>
