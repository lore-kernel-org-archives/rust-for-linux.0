Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC203D561
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Mar 2025 22:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769177; cv=none; b=sHfdJbO2cABt36I28aU2MEMLr/94Zs423Cft3zMQsmxYytOojNZv1DmC+q+MgY4yq/E1EAP5swKZTB3phJ3/fB/Olm2NWf9dDVltequbW+IsTWF3KlpoCDrVK/J1328/CvqEHJsMp80vtFejb5kh9QnS/Y3Lm7ZYCjrklPzlZBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769177; c=relaxed/simple;
	bh=nB0BZRnNQeJJXF/31Bk6D349ph0nen94EMqUVHZE3tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gnqemhg4J7LNHs6pu3WfYRiz1U00fZIkXkzE46EIePJVaQg2VYVUcRc8oTVYAKdEJoszSg2xx/KxtmleeDwL1pICvvPuYwcA0Y48w+j2UptfQKcKgdfyvwgO4oPDPsXVQFBcIUubfSQ2zcShX7htKStxwZiZNU2crLlupAHcObc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=URvbmivp; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URvbmivp"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff5f2c5924so940224a91.2
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Mar 2025 15:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742769176; x=1743373976; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhCXaJJDz/hQlfov8xlBYRZoMBvVXb1LgHoZ3cRnbbk=;
        b=URvbmivpZkxVSPkWbxKQBtv6Zbgj+KZNuUC5jl7SKTjhOaiN4GY5kAXOh2FpxWJxCD
         veDg3kM1vzuDGTf2gVCn1Ux9m5mLe2S81idQPdua4P+w6LMvw/F6zvEfol1UzI8L4eoN
         rc0/OIUIRt6jJTp6e9pWbe/eqlLxlOy2vEsbyTdylQefhU8YW1jaoFHQhpTMmUIs9nFD
         fRB3hyH0TJfrOcAgJ7eajCk1d47MuuMd9BY5jmc2RpO9Go7XBeKVTGefEiA+2eV/NzSl
         eb/h7ROc3dK5KFG6AYbxlUsA3Qb8TAy8VykZVpwVkZJecaImpKis2oj0g3ANtwcxRQQt
         mcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769176; x=1743373976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhCXaJJDz/hQlfov8xlBYRZoMBvVXb1LgHoZ3cRnbbk=;
        b=NcJ+RSuqz5486nb7jmZyd8jRuDGCzOmURnKHoaK9FP5Lqf9n2D3NQSf9LKtdAipnmD
         kSudb0x+mCULKTXkdNMRVBPmMzJXTJOZkOeS6z4vxrxJH9h4I1GzeqLowBCJsBf92FdR
         mz4ECGL/uiA7zSg0k0J1cOOz7s7Peyknh2vbqHlb31AjbIxqJYKcLLa4/qur/6eHfyOp
         og4Qb3lwTEk7Cmcw921keG32jMCHrYbhqhMYJ/TYWertO34pmmYuqzo9IBn7ZuiIvmnT
         FblL9xVUAm7l838YFir6ZGX7pYsT0eiuidMBfw+Yt4/33ZLCjz5GEqUIjrJ2FTb15Cda
         lWpA==
X-Forwarded-Encrypted: i=1; AJvYcCVUP+mMck+XiTEFLDFGSY708O2+oOXn94Ki8N8HnzDxgvtpJb5cAfabQxRB022xMKW4VStVh17LnSHeTKpNEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzsLDxgnThqs/YCZOJuex0osd9Qbt9SyxvN55Z26lvvOuFbsFE
	2EYyluS8GViZUXha/kYzjzDxuo5kgcgfcMxkoniq250HpRKhsXV2IJZgMw0+n7uwwHPDhAAC5eL
	knQvfhPOBvDoNWAz5sreZ04198r4=
X-Gm-Gg: ASbGncsckm/VuIWwEzUhIRqSacZAJa6FQ2wB3cidcEkYaPXovZJsnQ+JH2+gwjODhE8
	bUpenFRSXUzPdDOqwdc/a7fE1LEYKnLsUTk7tzo4zqd3eHxZvseFeLpNQ/x49xq2TfDSfp/rCBa
	4UJGG+tHKpruhxmmBqpytE1M6cSsv0Cp1kwLu3
X-Google-Smtp-Source: AGHT+IGHMgZuiT6UMwkn9pW+hTsuFp8czYKYcxZfgaQ6hnKc7ps8KPCR8emmrLriT5QKw6HytBRwsNdQd8Q8+8kHI9Q=
X-Received: by 2002:a17:90b:1647:b0:2ee:6563:20b5 with SMTP id
 98e67ed59e1d1-3030fb1fbc7mr6101645a91.0.1742769175710; Sun, 23 Mar 2025
 15:32:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320020740.1631171-1-contact@antoniohickey.com>
In-Reply-To: <20250320020740.1631171-1-contact@antoniohickey.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 23 Mar 2025 23:32:42 +0100
X-Gm-Features: AQ5f1JqZL9maiGbW1UwpG6cUj3i5_DoP74aYybDvcMWHhokT9boobq7ewn08oDA
Message-ID: <CANiq72mArJPP3H48D_EUsRBfUXqyH7cj0T+-573bpVn8_5j0xA@mail.gmail.com>
Subject: Re: [PATCH v5 00/17] refactor to utilize `&raw [const|mut]`
To: Antonio Hickey <contact@antoniohickey.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 3:08=E2=80=AFAM Antonio Hickey
<contact@antoniohickey.com> wrote:
>
> This patch set enables the `raw_ref_op` feature, which became stable
> in Rust 1.82.
>
> It then replaces all occurences of `addr_of!(place)` and
> `addr_of_mut!(place)` with `&raw const place` and `&raw mut place`.
>
> Finally it adds the previous macros `addr_of!` and `addr_of_mut!` to
> the disallowed macros in `.clippy.toml`.

Applied (#1 and #16) to `rust-next` -- thanks everyone!

    [ Removed dashed line change as discussed. Added Link to the explanatio=
n
      of the feature in the Rust 1.82.0 release blog post. - Miguel ]

    [ Reworded slightly. - Miguel ]

I applied #1 as Boqun suggested, and #16 so that we have a user -- I
picked that one since Andreas Acked it, there were a couple reviews
and there were no other changes (the KUnit one will need to be updated
anyway).

Cheers,
Miguel
