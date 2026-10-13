Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8690F4E4300
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 12:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895994; cv=pass; b=pMgcomEilkdMUX5mxTbLiw9P3otzRR1y9wAiqf1hCe44ftniDqG1tszs+rVoSsO2EiAi2dMNXoDxxsLcaJj79CItMHxWetL3UfOYZV7Fb88ZlOTU3hnxtyWq55F6V6MpB3YLzdJRFbv6VFF1XDcgOOY7SPOFKczKoKPsS57B9cY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895994; c=relaxed/simple;
	bh=UuiRmBadCxfqcfSzZSqby4/2UPwr5QA6sDq3PGs+kpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aI0skkb1dCcOFtd/+Z+TdAOMJj0jjzjXmRiLY43PxE5ucRaBr6L6nYiddagVDpXYG1/zfP1U+GxDOuvPCv0IpJ6WZuYlxmVE2pXXzEKvzM/PaOUh4gZydbFBUUj2do2LFekQ+1A+cdv017No13sghsw52VYw4v6sxcR0I8Y+jKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s2Y7Inva; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2Y7Inva"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-355724d032fso309726eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 05:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791895993; cv=none;
        d=google.com; s=arc-20260327;
        b=UBum9TouL8W4Vjg6lK99N3i61xjLAjC9JKZrqqin0SBJPr5VeNjHaRv1ysJooCmCb/
         N4neA9QabZ1tPR1scS8V0dXPZOj0v2D9Yxl8nPGtBXVK3XvWrwCyM0bKTK/88EVkFA/c
         BwceQpawpaBadrqzHo4iNt0VryEZY29SHCcBWhLGTMthqOF0konacL1bhPGxqnhww1Km
         Uxod/cZBFKHQNdaEeDhEjgk3fIKn6J81rFoc8/EwpF4anNZGNO1tCxYbKx5IZgOerN5I
         YyYr/9hNW0SDqOmxtMBSi7qAePvewDo0C191Gp3/EP8bCu5SrMRfEczFsWDCBfhTRRkG
         zUPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hFhU2bYt0krteVUmUhOtq11sG/zJcX159F1mHbOkYZE=;
        fh=ZTJ2oqVPmA48bqow9P31YWitMmz2breDDYRQFK39lOk=;
        b=GimPwD+Z678bZ98aPwsmrUJdbsp+EiTMXGD6fjHNSS7L1wG/h5zAwYHoAcUlXTyskp
         BaxFEQ7XtAPP/tpxXR2sIwj7ymMrMcbODQi+YNOTJLJo5gxvKQ6r75KCH/Xc2X0TLozQ
         jKhSo52Y74vUfAYUTo8QLIdWSxgOYzalmuvGkYbxJCgqsyhtuGZor+gCwf5wBuffnvcT
         AIrZu2Yhr0wLlaUSg1R0bGn+d5HHe479Ejcw7SRCjHrlOwcK+gAG6o8OWjIo38S5u8vA
         AQ3uUoO/4sSB4tGWlJn5HfUyaFgT1Fb4LrYeDc3QyA1QhStOL27St3c+n8G1wxoIWaHq
         2oAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791895993; x=1792500793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hFhU2bYt0krteVUmUhOtq11sG/zJcX159F1mHbOkYZE=;
        b=s2Y7Inva6fQGfLVIQZMLYFwDJSoX+mPdVI4FfdG0eb2ia54fUNsny+X2nyB6Qxzei8
         3iHPlJWq40/CURiwkEuyC7GRC+zhUqnhryntMeaJc19s7L/EFfRQNMFuOH/DfTPMYt1o
         QUwUd5VwKJQn6iekspQOHJ+kOeee8XwJ2DzDx4SlKNxz7kcxOlYO8Uim16bvHbBrjCNH
         gGqNhGGHUWUqE6SywQvCkjeL8IEjLvuKBsJ7BBF4Zo/wf4Ytuest/3vqaOMSlpheupTA
         Fu6QTdXlYl2TV+Lh5bwrZ7MhAYP6Sv/KPPdiljo8RHm4YWoE2D2WDPmPeKIVaXjPU/xV
         r+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895993; x=1792500793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFhU2bYt0krteVUmUhOtq11sG/zJcX159F1mHbOkYZE=;
        b=cqXb2NMEFr1tJHd3aUWVQ7yGsWKpPUxCjpr2HmXH1Sliim2XK486UQC1fjgqHRN3o1
         8N7fl8RwGIMybbQbqVkaLpPK3e5gt5RLE8jU2E0LNKXSGvSj4xl2JyErJYBUqPW+f2pc
         kQ/caOxhDwz8ikqsxaeo40BxqrokyHNpD0A5SpSKSfwCLzqrjFvDx5QZ23Y8//K4HkA9
         yt9S9f2c5E6whnkEsVsbLyhleH6wpfXP1qF70iEiei5MwGUmGesEXrp91cO1LsOjRMxo
         McvMeDvjWb4xOSeozNP3qG9Nw8xog7uPFTrGiqCkO193xRx6OyWaWQYiDYeDYQD2GNKE
         wvyg==
X-Forwarded-Encrypted: i=1; AKwUvBwut1hs6l//j/es4um032fSY8sGYEvCmhLo9HmRQaV6ISx6R0jInFXOO9cxyIBXewYI3gdjYLUSNwQBS4flMw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKpfyaV1sdMCo0SGPOxFdZkuEiFk8Sv3OhBxRQN7tjOa2aPaXdq
	ych8XcFCUFn8M9QVIEOidryfkdgE8WsoINsUMniLWgMbbJSmmGK3S4+PHqT8885ADc1JlOWzrrT
	R2R+CZ/tWa5sZceK11VfYL9OmX8rrWec=
X-Gm-Gg: AYBFou2Ixua6r6W0N8vAadWlO9PtDd/n6yqhUcGgFYYctZWYDxAwhOE8DEAJw21+DQ1
	bA33raiVxbO/58Ja/3RzQc652zLkM5Z0Fei8HQsCGTdKxpBc4Lax3EFKnGS7lSIOD2KD77gV21o
	FvgoQg4DYm/iaWDEPJ8Pt3ypcP6R2AwpbnRUNJMvFRD03UkwABU7tRIlFNo/U7qAqpPkzJCQw6v
	2nIH2CyEMLxQEaroeD9jvFgaVPRSMgnET+bbXv2Q5KuxQkzUw7Cg9gHim4nnX8B1DKynSwdTn2x
	KDjHVNd77YXKMOoRlHBeZrvq1O3Do0++/XvriX5aIg/W2va20qHgJ6BKZbBh6o9cx52rDseRdRL
	yOIDxtqqKq4mQDnAmCigFOs4OA+sMNuunO7/ZftaETRkJSdvyldxVcCHDPccuvkK1ZN4g1OeYAP
	EuzwCjBzUQRBMy7ApiSYJMvPql5jl6QOiuvruUGWUseT1SYJBx3zA=
X-Received: by 2002:a05:7301:4d0b:b0:33e:6714:3945 with SMTP id
 5a478bee46e88-3537e0129e3mr26810675eec.2.1791895992551; Tue, 13 Oct 2026
 05:53:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org>
In-Reply-To: <20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Oct 2026 14:53:00 +0200
X-Gm-Features: AclHuK-P5U2ev9hpzeyozzfAgREhL2ZTBvoLRgkZb9RpskE9yERenkCCWIyQj54
Message-ID: <CANiq72mA6pTmPJUk8g7y3Z=wetFMXdzHLiPEPChpY4OTg3OHiw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Add Greybus Sotfsvc and UART Node drivers
To: Ayush Singh <ayush@beagleboard.org>
Cc: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, 
	Markus Probst <markus.probst@posteo.de>, greybus-dev@lists.linaro.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 2:01=E2=80=AFPM Ayush Singh <ayush@beagleboard.org>=
 wrote:
>
> - I am not sure if Rust abstractions should have a seperate entry in
>   MAINTAINERS with me as the maintainer, or if they should just be added
>   to the respective subsystem entries.

This is up to the subsystem maintainers where the respective
abstractions may belong to. Some subsystems prefer to get a
co-maintainers for the entire subsystem (e.g. because they want help
with maintenance; see "M:" entries with "(RUST)"), others prefer to
have a sub-entry (sub-subsystem) where you would maintain the Rust
side (see e.g. entries' titles with "[RUST]"), others prefer to own
the Rust code, etc.

Then another question is how the patches should flow: some maintainers
may prefer to get a PR from you, others may prefer to take the patches
directly after you review them, etc.

I have some notes at:

  https://rust-for-linux.com/rust-kernel-policy#how-is-rust-introduced-in-a=
-subsystem

I hope that helps!

Cheers,
Miguel
