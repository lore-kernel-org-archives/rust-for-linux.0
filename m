Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A33936CDE6
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 12:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772454758; cv=pass; b=WvyDjsl6CxU8APfoKlpz2TW+rT9/T1NUZpbqhqlKoGia6YK2wHu+DpJasUYIuvdxBLGS+d/uhZtSsugU0SXJilBSok0OgF7P2H5hkAFbI0+xNNZ3COFSnMMiQzcPGDhOjQDpKwDfYDN/dE00MDdG0Q3WWqshYqjJ6Rc/jFlOigQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772454758; c=relaxed/simple;
	bh=zQz0rPb0FHUXbzgHRy665O9Jasbnueaxd3e7FIEzeyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWd+XDCSd2MP+WTvR0hWVcFQtNmsmWpG6Hf43wxoRBgx2cbPBbibltxEd5XYMZJPHlJe2rqHCb22ty6PxZotq6OjNUH8lQjfcGdQfWPUqqcAldaMWkZQvob6AYDcxLgc7s3zXxGIHnv13wRMyectLRDd5QJ2Z/oFXwMuz+glx/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtoUIMmv; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtoUIMmv"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2be084d8166so71402eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Mar 2026 04:32:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772454757; cv=none;
        d=google.com; s=arc-20240605;
        b=G4kf3rLeMYY9cHsTdWrmj7l634918NVwCyfIsnINsguWh3V4ZMHuWtffj1+iTYwegb
         XBfO210xPhw+M9MECf8f9zyOXcIJ97yev0gIornChusc6iL5tUjRiIsQJ6aCA2u6KQ38
         e1MBBwTXck6npNyTcp5S39BmUeBPbqyjhsWji9zO7lAMAcs27L20nUzGSQqeZ9Fck95O
         lUYXwn7FSbNBPU/RWO2uGQd+MY8e/YdlJMj/BnY2y/wLELZy5NgMWPw/gTLnyQV3LVoC
         adjOTLqLz8QnE8ZRb1rVudXMeKuyHl8ErIrFa7DS0oJkRYiZCQB9KLbx978UzUu26YzE
         RSQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zQz0rPb0FHUXbzgHRy665O9Jasbnueaxd3e7FIEzeyU=;
        fh=GvV4DxIVKNuURwx/W4Gl1GHjzUlIE8KL/slPj9dXhWs=;
        b=QmmaBvXVrGAglnR8z2YNXe87YEvzK+m6DWoSOJHP7LG3prX7GxIbwwh5bzsmXlVsj8
         402Eu196W9PWXmeYrS1YWaBNWuLCc1Y0Uy/ym8BQ1GEzPjEtR1Pyb1Hs23rH/QnBhRsS
         XTbRHjU3/OeGUcbHZYQ+2XfiSoVn4H+JsIE++JGESaoxton55T0CRfBqxSCaB60nXdkV
         HJ/rF5VfipidgcXjSJKIP3dRXIFYuokqR7iagMlB7iXqACmJXL5UlLGtjj9SHaBwyVV6
         NxBn36JuelTyS5GvGTAr3iXq/fIcO0/eH2q9fk1j41Pmai8suT8/lpGKDnbhOmug9iEg
         Z0dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772454757; x=1773059557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQz0rPb0FHUXbzgHRy665O9Jasbnueaxd3e7FIEzeyU=;
        b=KtoUIMmvcT9a1/mJwfhsK4ojPgzcyjaxTFsEcYoZHNxa9cIO7JLI8+2vzY7sr6IXWs
         INDCyzwkjX7MYDdtmfTXbb5lNbJJyUd8EAH+GUZn1TLJlwfVj3XfqpdzLvewFUhWegbJ
         houyxh19vsOHE3ucUTuT46UASQcLmznDmqjYrOFDtNM4GdWzVpPFJaAnG+iJTZcL5I6+
         43i7B8ennRgMwdU1GhdIbMex7AT/IqbwGF5F6KAHYkjL+3inuUfXyYPZ2WU77m7wvmrV
         tX0DqNdR/hSNUqoZYQjeE3p3Usu63AK42R4NCObpWHhSI0UjKEhpWhjgROxcziVYmWdo
         5M1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772454757; x=1773059557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zQz0rPb0FHUXbzgHRy665O9Jasbnueaxd3e7FIEzeyU=;
        b=MujNF7VC6Bab0oERpCqEe8iIhw9y/5caSixbLKEYKW6Od4lkZbS8TEu4ThP7L82Xmz
         JsbYmlmVLa9z0DNaCtgnub/ALuQmWsKeBe1+eyqJ3SLO4cK+VHNnGxbAmZI7E4FEAyvp
         hSp1z7boBY9+VavRdDAYon0vqSZuTVbki7sUiVFdco3XYB+sCgvknnuyJJUCZRPj5vGM
         Zxi1F6BoG7vYycUDS62MMVxK+8HpQlKllpnws7vdcTDey99hhSX7gq2ISUVxZuGl6wwC
         W3ZVILEcspGWUIvWjPQqtoSlsFI/eoDpsYA+uTaw6VlHs5+SD8vY/w2Upvtd6ei32V4U
         STvg==
X-Forwarded-Encrypted: i=1; AJvYcCXL7ZxpQxiRF6tCa4dkl8ut8NMi02HgT+olF0LqKL2ajtUHtpKLg9eBMmIbbUeSOf9J+Jpag60tFSGG5sZ88w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhQhVeYjPPYVH/jo0aZoJWfst/GoQKqeIjKsJoiSIoTpCAOobP
	xA7UnPMsSO9dRWbSSYVZprL+RHrFKZl0Rye3A6qjRfczK7Od8FUnJYqfJYBen/A73m7U+nYwtIf
	3cztSK7R2md8ZIHzYYjhy7IS/wipA3oMigL21
X-Gm-Gg: ATEYQzwVbtdWINFH0vJ+XOrVkbulif9LnVsVBD/MnjbAi1pnq3cogW31cAsqL8x6s8z
	G3lwiGaDtn/DJK+3W4gvCN7ZBLSJ7sSlxetqR8SV8JytrCUT51MpcrdwezRjDEaLyz7zTHpmoDy
	N8nkTvJ6At4ORsLCvfT5WGaVttTjIO+ob5+GRSR849gbZHqLM6R8as+vyHQpmOYriCs0I+IoE2p
	/MhADxDF+6aQpNGrHjcfiyxWIPuH3xVDKz9XOxRS/oyGmsIvxEoIMjxZ94vWLZfxM1Ai0jrXY9V
	WJ8m1n3XL0CUN8VaiRtTIZTG/PwZZmDdYwrfMtAxMl2ecUnxVQj7hBgNET/KUx4wuQQb7H3iOiW
	OoDEfcWtkgb0Qv59Dc6YMuhtSTo2Q
X-Received: by 2002:a05:7301:128f:b0:2be:1946:8576 with SMTP id
 5a478bee46e88-2be19468a7cmr221836eec.4.1772454756603; Mon, 02 Mar 2026
 04:32:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224-unique-ref-v16-0-c21afcb118d3@kernel.org>
 <20260224-unique-ref-v16-1-c21afcb118d3@kernel.org> <eeDADnWQGSX9PG7jNOEyh9Z-iXlTEy6eK8CZ-KE7UWlWo-TJy15t_R1SkLj-Zway00qMRKkb0xBdxADLH766dA==@protonmail.internalid>
 <DGRHAEM7OFBD.27RUUCHCRHI6K@garyguo.net> <87ldgbbjal.fsf@t14s.mail-host-address-is-not-set>
 <DGROXQD756OU.T2CRAPKA2HCB@garyguo.net> <DGRPNLWTEQJG.27A17T7HREAF4@kernel.org>
 <p7rsBPaYxHKSMFCYVUFY5hdI1H6jxHK0s7lxLQkqH4rylM6yS03Yt52SCjiTO5qBVUmc41ZHZ7XZ0_3w_U-O0g==@protonmail.internalid>
 <DGRQNTVD3N23.33347CYLKMKEH@garyguo.net> <87ikbebsx4.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87ikbebsx4.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Mar 2026 13:32:24 +0100
X-Gm-Features: AaiRm52T7cw5MIQan-WghpnUecgDLtb8HLJUgWIjNNPX7ugGbu9wZy-93BfirNw
Message-ID: <CANiq72k_c06P4_JVDCNmwu8SwCUP3UjofLCAsovBVzQi=fb6CA@mail.gmail.com>
Subject: Re: [PATCH v16 01/10] rust: alloc: add `KBox::into_nonnull`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin.linux@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Uladzislau Rezki <urezki@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 8:19=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> I was thinking something similar, in clippy or checkpatch.pl. If we
> should always have this attribute for small functions, we need to have a
> check.

No, as Gary said, we do not always want to have it.

So something trivial in `checkpatch.pl` or something like the existing
Clippy lint would have quite bad false positives (and even false
negatives, in the case of `checkpatch.pl`, depending on what logic you
are thinking about).

We would need cross-TU heuristics for this, because at the end of the
day what you are trying to say is "this function will end up being
trivial even if it may look like it doesn't before inlining
everything".

Cheers,
Miguel
