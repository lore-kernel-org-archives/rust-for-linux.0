Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF88C1A0BC9
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Sep 2024 09:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725355833; cv=none; b=flpnakVSsjFf1eeIPduDnhIPDOUC7d7aszUpu1aEo3YNPszhJqvB1YLPwBdnAGN+ZKWZieGv8O7w7UpjqppL3QoJGRV6FZt5sG9EsWWHTR21TxrdSAMCxPH6Ny6rvMtdMrCOzRzhFcky9iYO5aS6niTJPUDeyW3cEj3bWE2lBjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725355833; c=relaxed/simple;
	bh=GX5ZZXyvWa0yGb7R8h/1b2TOpRvcfTrEtH0LDTqF0Lc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acQcd/u48lIqpgFX0b+erVSXUUnxsk5JjQSmCfk5ocx0R+p8wh52KMT0iWeo2pWyrw7vT8GiPL7RdWBXnxPLBCorROSLzPnjFo5w0zJY5cMUpgSYJ7F2JtMEtvZiF9vicmw6stMIhlroXzSzql//q/IdKgNXbADbAHipM/cCoPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R/oW7hIi; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R/oW7hIi"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-374c3eef39eso1635331f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Sep 2024 02:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725355830; x=1725960630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GX5ZZXyvWa0yGb7R8h/1b2TOpRvcfTrEtH0LDTqF0Lc=;
        b=R/oW7hIic26SAKg+zT2DqDvgllZJdBidGT9pr6PpY+IjYxBo0imhd0DMJRivmYrfzx
         nKuHPJQpml6/ILzHyX1wkRsGPSfBf5jFCbEv7fur8yJKOPRk3Ajl3hXUn1iSHl4IqBfv
         bGAefJivqSf1zcAn6RYa//fXK2rxhOZJNLrT1fMzVrRgyJ/b8GbFVpgP6H0drzKQLqxa
         WsJYDM7+JBgZZGMryCP3WwxlG8qKYMKE1aetrIop1eTPYTNxtVvz0qX1Avqt+rTVY46j
         UMoZ3Gz6vmQG91QavkwsAzZy/Ho3LxM136GUXb52uNruWxGL3v3gThTgTegm3cojQE+e
         6ugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725355830; x=1725960630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GX5ZZXyvWa0yGb7R8h/1b2TOpRvcfTrEtH0LDTqF0Lc=;
        b=NaRNhnIyOPe1XqMPQLbK6nfd7wUq0hpp6VgC1dPLZu2DaR5ElEHo7IvDZb2KjlOxwR
         XSM8EcjfAKFLkPnJWsxKpXtM0XBre152NY0R3S34dDRRmb/JJqyETpCsfLFQ3aEGCNTQ
         NWnD6wERuCE5NL4gstgWkbLaVY5FA14hQNbVSt6inZKWH7mlPL7LFGYqiK1EMMljiqWh
         bkoJ6cwXAzmcbB0BFebCup/G1NwrDcHdsbdvnROQFBqea7alWtX2VXP4aoAqC4MOyK+D
         wacFFqADu1glOgAwNhTBLAILv1WVZDMdECdCMiuExIh4XC/0QOCrJaliLSwUKkUIVmLs
         rnjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVhdAByRGFG7Gj8/7BznM7tXrPk8oK8GF1fmxvdFqkNhxNXBEXWaAlzMA+m5shg+SB+f1TS5OsbiFKCp1rMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrCxcdBlT1kMfo5HfMHpRcFdqO3aREBCe0LYm7lMg/IIYRw8ob
	+8u/9cp6YBIKSBNM5ycuaNw7uztwZMKkfVftPdkkksYrKh30pgVaBpTfvFzJoa3YxMMbPYmZJ9U
	KwgXrcxIpecZui3S3mMxVfq2AuUQ3O1EillZEaal4x429/RUMu8LD
X-Google-Smtp-Source: AGHT+IEStut0eCsHI0DJyv+WcU4/DFOb5+cqPAFzWOXkNnUFxED0ZPmrR60Fk63iost8Uhe3FPANLlMBj6BuAnyCFyM=
X-Received: by 2002:adf:f08d:0:b0:368:785f:b78e with SMTP id
 ffacd0b85a97d-374c94554camr4058991f8f.13.1725355829775; Tue, 03 Sep 2024
 02:30:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903091700.172734-1-benno.lossin@proton.me>
In-Reply-To: <20240903091700.172734-1-benno.lossin@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 3 Sep 2024 11:30:14 +0200
Message-ID: <CAH5fLgihM6OeuVrAhSXAqb9RDKBa8p7+EOsFuuqkGu-OzoapZw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: sync: require `Send` and `Sync` for `Backend::State`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 11:17=E2=80=AFAM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> `Lock<T, B>` implements `Send` and `Sync` when `T` is `Send` or `Sync`
> respectively. Since this does not depend on `B`, creating a `Lock` that
> is `Send` and `Sync`, but with a `!Sync` or `!Send` state is possible.
> This is a soundness issue, thus add the bounds to the respective impls.
>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>

Currently, B::State is set directly to `bindings::spinlock_t` or
`bindings::mutex` and these types are pretty unlikely to be Send/Sync
on all kernel configurations. If you're going to make this change, you
will need to change these types.

Considering that B::State is already stored in Opaque meaning that we
don't run its destructor either, it's not really treated as a normal
field right now. Perhaps it would be better to change the safety
requirements of the `Backend` trait to impose restrictions on the
thread safety of B::State?

Alice
