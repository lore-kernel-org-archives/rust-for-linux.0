Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EFD1F461A
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Nov 2025 20:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762548278; cv=none; b=ruNvhQacSMXgNDOWBqjYvc8vGkPmBl3OwDSfrsT5ihhUrCgwNImChnYgNSAp5cUMVAWu4LBPIFZnWmpHfvUIIjkbOyDnvx9CufoEDJniFub4ybW0Cn3Z43mnKaKH2TCGAE01hQKKhyI5Y9DrQoOq1sG5NF7+D70XFoIIAIPgj+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762548278; c=relaxed/simple;
	bh=FJwadjvE+x6S4hONQHvG75rq4vKRo6ZUAojElg8WjXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k+td5dj/jZV3au5XT1fXA+VY2aedX/CEYv1eFHQR/+QVU60TH8aE4F7yy1EFYRtNKRYKAVqqrXoqgx5ciIvvQvXxEl2bXuFLwlfx7yveaZgyZGhctYyxifUbvqONtMTAiZAh9ttbuJz/rkOlbi0t1d0tu1OUG9XGvdSH9eQzl98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JO9ufdb1; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JO9ufdb1"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7ae8a6b637cso125024b3a.2
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Nov 2025 12:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762548276; x=1763153076; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJwadjvE+x6S4hONQHvG75rq4vKRo6ZUAojElg8WjXQ=;
        b=JO9ufdb1GvRJA3GSLxSPlMU6ZBq7/y3qtMm4GwQ8TmFJnv6d68sEdPqi/qzJ+P8v2x
         QYt7xRa5iXPGnwfXAn9/jtPr8BHvECl0g04S0zuHGZzvao/z3iDK2JlYILLrOMmA3IWt
         EN/JiTWerEwxSn+APwtzzGiNSXQkKF++wZ4DQ62UmfgRguNN+lBMPWy9c2vStBDlPRUA
         3ObG1QXg7VYgggV7RiX2WnjxTMCyt8KTCzQ8fbERbyzbaLmTnhc88q3NgAnVdNP5sJh1
         qLTfFDSDxWt2Te+bgunBwQuZ5Qa6fF7Wwtu4s+LDDNB1oeJ3QXihfbrx/Spad/Lls9E8
         0nsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762548276; x=1763153076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FJwadjvE+x6S4hONQHvG75rq4vKRo6ZUAojElg8WjXQ=;
        b=HYVkmGsYNkf0oMRbhV8ODNFASVrEUcVpg8A+1US3iLd555BYH4QCNkXWhQwfwIJcwI
         sr+I8QQB4VJvpc+KbobmOAlAvBUINwstzX00zI/GGjzOtM0PvFJs4MQGVvFkFHdwehga
         m1jIxSwFBSMDiid385xXwKCrhzcwbqf6VuGqrXv3FzKs24927t1D9pPcITuR4QEnNJIq
         oW9+hyfMhCaH0O9D+W++dkTl83jGnSBKIztnKHFa1JEtDVWX4jPVku9rgVhrXVjl5YQQ
         MHRpc6OG31iHkUfQqjbb5SsAx3fQvR20XZegvMiBb0vDWxikGnHQOejzrbG134D0t51Z
         VzRg==
X-Forwarded-Encrypted: i=1; AJvYcCWCqWOGcjE6/CBAZi9uJVjuOc3ZGTF+05RmXLAVZou19n+kv0VspEyypU6b98FN8C0eruVGaIKufIHXwqiG+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvl1pkbN1haz9Tnsk8IzlG45pxK9n1Woc5S406GDCLmeZqCdBh
	t+4T4p/sZ+xEgrh4ACEeg3SpWMm/D9U1H7SlP+ymwLV5m5ScP5x2bqzckh7U30MAT9K7+3L/HKa
	L8wSUfCVWUgGXuGOQesTK+YrJF1JlWdU=
X-Gm-Gg: ASbGncssVGtXquB3bHhzwJRRQRVtNFjYm3ptWxDE4KI1KMyDJ94kotqe+nEBRAJ459s
	stwayWuu+blOedCGAO307pq0WpqvB/3B24WuaymqfDvBET7NBei5aU2K71sEzYsihM7Bo/idNE9
	oUw11+3Olyy+ODsWjLDZMCfEFccxr9wnpNlC2Q3GCdDnbo1XGAymhaD09Wo35M1I1COAqLTGQcK
	MjuQIhhItlNA/XprfkCBKrHByT2l8+fgyv87QGvDH54N2YCK6nKzifJ2ZgeABkxjEWHL3NiMOpr
	tguUPoRziAWg27z3mxZet5YTQSmDwnzWvBEmuH3rQrjReGp/RjLBpv2Ru9AjmbrQaK1wjkeX5LG
	ylrM=
X-Google-Smtp-Source: AGHT+IG4kfdE9ns+hw2rpt0h0Ke6GeX0YiddNE3DhFtSBXMZ3HIxQ2OtW0G9wd0osT7WC1CnPcwhL4cL4czBFQyIQaM=
X-Received: by 2002:a17:902:eccc:b0:272:2bf1:6a1f with SMTP id
 d9443c01a7336-297e5657e71mr2838795ad.4.1762548276152; Fri, 07 Nov 2025
 12:44:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251107202603.465932-1-lyude@redhat.com>
In-Reply-To: <20251107202603.465932-1-lyude@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 7 Nov 2025 21:44:22 +0100
X-Gm-Features: AWmQ_bkvvWpH3oiH0ZMom1_CPsAEk9l2Cr9yEraf7Pp4-uYDzYPAwG5chWQGO1w
Message-ID: <CANiq72=c_0+H+ZysBL6a=zVd18sGPex1=e9N3_nDMxFFt9yqjg@mail.gmail.com>
Subject: Re: [PATCH] rust/drm/gem: Fix missing header in `Object` rustdoc
To: Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Shankari Anand <shankari.ak0208@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 9:26=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote:
>
> Invariants should be prefixed with a # to turn it into a header.
>
> There are no functional changes in this patch.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Thanks for taking care of the docs, very much appreciated :)

Cc: stable@vger.kernel.org
Fixes: c284d3e42338 ("rust: drm: gem: Add GEM object abstraction")

Cheers,
Miguel
