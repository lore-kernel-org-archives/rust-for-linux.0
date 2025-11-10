Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6993101C5
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 13:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762782152; cv=none; b=Vof2ldFvFcpg4l98LfEez6c0eZ8N5gEpavktQYXTmMV5go6v0HfQETi8JP6lQ0A2qN5qe7BldECk6AEHBwsQ68dPXwQb0MPes7V6tDELtiK8gpiPr4XTfbJ0gZo07iH5tqHRcXm73MO6RI1rotgNMx+CoyE967eF5ExuU748Mxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762782152; c=relaxed/simple;
	bh=PAdjbqg0ugnMG+0+hkw0gIL4xG3r5RPuYT8bL7baWBs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ggM/zg4Ph7CST0daElLzFw2pF2GXr38jweVr7IjiJ+4wFcmZaIBE2nafap4knJlChyNq1lCJExY0CUaUfMPnpLgLVHUyaUY21i2xFWBb9Xewtlfs+/QLZcWPaWS8HQnUmcNDpOOiEWlKZyVLj75t37dU8BLFhM6ELwHvzfzDcMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WYsteZKI; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WYsteZKI"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-42b3c965ce5so573069f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 05:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762782148; x=1763386948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PAdjbqg0ugnMG+0+hkw0gIL4xG3r5RPuYT8bL7baWBs=;
        b=WYsteZKI9i4v4if8baaqBjwkLKPAp7E4xHC906b6CGLP7Gj2G6qsLuYy5YYpHF2t65
         fZPBF0qQWttyAav1lvcoR6ZaVKtcYMdjtJ7kDzVKOGsczC9sYBTIYxBGz4umM0OcK5GP
         yl5Zacr4jenfO30SSii2Z7VDinrObqQYY+imR81ogbE+YpokuHD9aoJiAq1xaM8L9HAs
         bY7AFE7hC8So2fgsPzHT0fE4joeMMvyYQOATj26gI9eUR65tim1TWcFlcxmB3T1wJmoe
         oACoXphst43rMMAN6ttgelZYZ+fW+BJ2dxknu785mJ+fHRSrrRk+7amcq/7XbwruV4pF
         8wug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762782148; x=1763386948;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PAdjbqg0ugnMG+0+hkw0gIL4xG3r5RPuYT8bL7baWBs=;
        b=bRDlLSxY+0J/tt8KrE/JQC1WnLmA8/wg4yrv+bLi11AsbT+iE8pHq8ptQ1PJ7pWRUc
         3KBnPpbFCSI20EMGxbuiwrAUy7m2rqzhubcT+XXvWjH9EgRaqehN2mqyKINBkBBvXga4
         TA3XD9HKGNvB9QAE+rJWf1khYgAVqzAWUwMWmnhLoVGN62z8K8SCe6Q5+NSXatYwvygp
         VVTDT7by9EOABVYwheSS0pVqMCq539mvc2ZRCoWPuv9pBQb3wXWPpvCtkSyMIYBVZAcV
         ONCt835CviXCvyGWMaHo02AfDGZx51NZ1+BOfWQWiUSWROc8Sfusy7J9lSoovJ+Bvdfa
         kSrw==
X-Forwarded-Encrypted: i=1; AJvYcCUQoAqC/E2Nxjf4upYzPYx2IkAzVWH1QWxsMCg8EwTByKYnMzRHBi0cfacPBLWDAQJg7CWhFfpUXhSIDtqTtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFmiyx5QQFzigpy4+BuBitNk3wqIfDw7trGhKlGv2L9xMMTq9J
	EBI1pS90DlaHSyaVks17rVlcTlO/cEKnCyiNzlfaRikA2KXpmv7QKNDJWZDdCcgCm6uY8XdVFD0
	QkkZYs15mwUgpUsoxuw==
X-Google-Smtp-Source: AGHT+IGdYLsMwQu7IW6P9IMv+n1Ga2zIS4ZW4YRMrMw3h6aVj+LGhXmv8UdaVn1QueN1sB3azN/HLRdoRa7dYS4=
X-Received: from wrxf7.prod.google.com ([2002:a05:6000:1287:b0:429:de3f:827d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f87:0:b0:425:8bc2:9c43 with SMTP id ffacd0b85a97d-42b2dc12867mr7026361f8f.1.1762782147990;
 Mon, 10 Nov 2025 05:42:27 -0800 (PST)
Date: Mon, 10 Nov 2025 13:42:27 +0000
In-Reply-To: <CANiq72msN1B8c8QFuH2VK40xXY3=uGiGL=YgAo68o92LTO=kLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-19-ojeda@kernel.org>
 <aRHRYbHIfxMQ77eh@google.com> <CANiq72msN1B8c8QFuH2VK40xXY3=uGiGL=YgAo68o92LTO=kLw@mail.gmail.com>
Message-ID: <aRHrw2p2YX5TyDYq@google.com>
Subject: Re: [PATCH 18/18] rust: syn: enable support in kbuild
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

On Mon, Nov 10, 2025 at 02:38:58PM +0100, Miguel Ojeda wrote:
> On Mon, Nov 10, 2025 at 12:49=E2=80=AFPM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > This change seems unrelated?
>=20
> It is needed to actually use them in proc macros, e.g. to build the
> new `pin-init`. We could move it to that patch series, but then it
> means it is harder to use this series (e.g. someone was waiting to
> port other macros).
>=20
> I can put it in a final patch or perhaps just mention it in the log,
> similar to the `quote` one.

With that mentioned in the commit message:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
