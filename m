Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288212;
	b=1wdduNu16wdBxLt/FRnDgReX+4ZL03L6CCGsDl2Ppkp0uGOR662a0nuK2PcKT9+HJ063
	 12HRCse3dLDJvATQiDS0gtYSJhcOjumRISy433qeLgODDMT5e0Roe5dk6Pi9zAolvzDp8
	 RheGIe/nJ6U4YpKk/VpNoWEDbecxRdugvqlR0odeqHvAyq1TxF1HJWqQkiBrlWR+6kvft
	 AWQ2YkSpAcogf3yglRXrR/bBmfHWcB53sc/C61c1MJCwNBuJWw4KQQ76NxJYObVZal4PC
	 3PDLz0zExRJpMtbBeyFm3u2LdTX7rIDsFzhW73NX4LWTs8iFBBxYSU/4KJI9fUPq9wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=D6UUa2xNPRVirPhujwvkv6IdDdVKe4P8N23+MP1pK9Y=;
	b=Fjd7lw50aLk3Gajih+GmrWd/k4NvDIxREdmteSbCSllj4LS+9MrLIV+YNVEG1zi9iKwo
	 HSXJa9PpxdUEyDsTjT+F6cAFOAoiiLT53m6vCeUOzev1NPjEDwK9e4CpNH+Yc2Iep8HT8
	 XiEbVTriMA+Hy0SUhcgntVYaN1wtfkJB609r7XTLdlgAX3G4IYK4uI8XL0r7UsBBD1Dre
	 sB3A4qYWhZjpBg0douYKwT/VcbRch3ln6CnDNk6EMYQYWaFdFvBrmFdcVxqZZ4cILo0jv
	 30Y7T6K5UX53ZJrTEjHQO2L1N2BLcptu8xkMV8vi8AeKFFYdHGytJPXawUVETDWk41w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WL0ETLTn;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F83606A31C
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 15:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18F83606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WL0ETLTn
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a204ac318aso12885675e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Oct 2026 08:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793288210; x=1793893010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D6UUa2xNPRVirPhujwvkv6IdDdVKe4P8N23+MP1pK9Y=;
        b=WL0ETLTnu+RzZ+rWl3gTcAoUIOf0QlWu+j8j8nR25Or4M20qZI8CSdNaSCMsp1Ys63
         Gsvfb0Ni1QbqZoSa9Zr9aHEXCtSRuwI+/IPSLi+CVBRongaCz9fH41a2rDGtFRkn+NiN
         JNP64rLiHGkJXNN2IaJ+6FFbnoQEwGz16NMaZDJxRcmIMIOmA6n0JDzTIJISwHbCe/Cz
         wgBnnW3c2lihE6wBFIDZMfRcu2tfZVk/85JjS1bn7MMLhwHqU5Uuq7+eivbJn3DijFRa
         IVga8pYchEeSis42dqRNBZDmCe7zCDVDTDXTALoIFpCmnvzzsoLJ/NaCKGBbcBDnnvUj
         wbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288210; x=1793893010;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D6UUa2xNPRVirPhujwvkv6IdDdVKe4P8N23+MP1pK9Y=;
        b=jF0Hp0mw4bmikZjQI9XYxYyvIf43wmM8IjYH2NrblQ0U5VBjz3OBVRmG+vc4yP21cd
         km/a/+ui6QC5dh9SreljllKFmqPh3Mon4jmmWaSjcft6XNZwjDF3fWgtbRzglG736tBW
         +hFYxAW+xhqH3j2xNBDyoXebAmeYnc92f1qIDEnPYEvgg95znJ2NC80dC3+Z5PwqAbdT
         eTni/KO/gNm3ef4rVDr80YWB85eprYyU7m5dUmbSxEX9/kZvuaTekwrybRUgOrPRgDBR
         VY+BxBqfwDRXppvyCZ9qQ8rdwUojHybawhWQOr+Az3JG1fdcqx4JY+1m8prnVAz61VGH
         sIvw==
X-Forwarded-Encrypted: i=1; AKwUvBzjX3LlgzXTm62rNJs+S2DpUyrbQtCpAz+BwNMl9w8Xs3W721Mx/bH/VFy7wo74mCp5LNCtnUgsqBlHXwpqHg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLKlHpLmGGXL8p5HSGUD6kLvB6AVretJpnCSrjKh4YicM+O/KL4
	EyqFLWmET473h2YvT3G3LvOMOiHwFTPCayDtq8B6DycTl5d2rQ3+ZyMtslQTVKn1tLrmCopoY+C
	yveH+6ud4+2gpp45bTQ==
X-Received: from wmap17.prod.google.com ([2002:a7b:cc91:0:b0:4a5:9877:cd58])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:474f:b0:4a1:cd83:b23e with SMTP id 5b1f17b1804b1-4a97452869cmr133905495e9.0.1793288203757;
 Thu, 29 Oct 2026 08:36:43 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:36:42 +0000
In-Reply-To: <CAH5fLggAuPdmwOFiOMMRUCP+yLPjmdjYGGfBxZJ=7+bkGODJmQ@mail.gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020-b4-gpu_info_intobytes-v5-0-3e0c7c93223c@collabora.com>
 <20261020-b4-gpu_info_intobytes-v5-1-3e0c7c93223c@collabora.com>
 <athToIRyTjSB_jVg@google.com> <CANiq72nP1cXVOQp0xciGfBhZZfEfNP5hx8c+1ZPhXwrr=EOUGA@mail.gmail.com>
 <CAH5fLggAuPdmwOFiOMMRUCP+yLPjmdjYGGfBxZJ=7+bkGODJmQ@mail.gmail.com>
Message-ID: <auNoCpPLYfr6hBu8@google.com>
Subject: Re: [PATCH v5 1/2] rust: add zerocopy to bindings and uapi
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Jesung Yang <y.j3ms.n@gmail.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 01:44:12PM +0200, Alice Ryhl wrote:
> On Wed, Oct 21, 2026 at 1:37=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Wed, Oct 21, 2026 at 7:54=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > Miguel, is this something we can take through drm-rust-next? Or perha=
ps
> > > you want to take both through rust-next? Let me know what you prefer.
> >
> > Both sounds reasonable, so whatever it is easier -- do you think there
> > will be lots of movement in the Tyr side?
>=20
> If we're able to land JobQueue soon, then yes, otherwise no. But I
> think we've aligned on how to get it merged at LPC, so probably yes.

It sounds like Deborah does have other changes that depend on this that
she'd like to land as well, so it'd be great if we could find a way to
land both once the merge window is over.

Alice
