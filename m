Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74779285CA9
	for <rust-for-linux@vger.kernel.org>; Sat, 18 Oct 2025 19:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760815587; cv=none; b=SHRa1iFKy7D2AKKCLijWQGYh2jOtBKhQ4MSvRCsryYcWFBNUuYFwUVW/eADCIwHBFtFf1zDTMJ9hkNBkJOVuntpQM4ElWTlLcXHYbzlEImQIHvGAixgkd1yBwoRAlCFYDWgk1hdJgTJDtG2ZRze5ckd+OFsaZMx0q83Or+M2cQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760815587; c=relaxed/simple;
	bh=maNTnrE3NTYDgn+1DZT+tzJ/tqBln8UodmRQM+56owU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aXB0Ud7PvAgsw71jaLA1dCAmC2mdkh++Ym5PK6u9uDSYygh43qgIyCM3noVNjVuXMXJivD8hSlt4s1u6Z/vOQe4R8Gt0zOUMSO5X6BBxjAw2U3eonego0OwdrC1+rGbNfaLNf5IHuVeqm/VpPEwZrFyhMcHvWY6xWmvR9WRYQcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AguFkXrg; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AguFkXrg"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2699ef1b4e3so4172405ad.0
        for <rust-for-linux@vger.kernel.org>; Sat, 18 Oct 2025 12:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760815586; x=1761420386; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjuivMCtlxL8Odir1CwO9q/tKAJWL5tIgtF8E3+8n3Q=;
        b=AguFkXrgmAfQVGth2z0pFbzY80lacRmV3l8DmzMIH0hKoqbJ/ujDw5sPkt5lQjhr03
         nloaLmpTWkK3CZyX/VQVf3B8V1icbB0pGE0SR+HSJRSgir23mv0Ba0w3f0g+X26tTn1U
         aXn4VNsCcUVIb2e2LvFM2nUP4NOnrpdz3o69N57FBw2c9j4qzGits97KWjzoQ8nztPNG
         rJ63fWdmdhf0/Gakxo2OLaqt8/QdwlHqIKbapZ7G3q0CICX5oieKPK19BCYqWxyu1CtG
         gjTsuJk6Cu0eDNAhw1YUDdOWSCwVJu35iOk61Emgcq4nSTgcZSC7crS/8y4gjA2xsunL
         ttVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760815586; x=1761420386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjuivMCtlxL8Odir1CwO9q/tKAJWL5tIgtF8E3+8n3Q=;
        b=wnZQPm+gLuCeYGh4pfWQVTMkH4yoJg1mqJHyZVyn9dLNZePkoC6Qp4/EeUimjupq8N
         200AQXtc9qwKPg+ks8iXV0s+6sfq+191wiNetdbx+HAblLQFhSW7r+wFSk0LZwoCEYAW
         1X6l/dYbBqSLgyp7cDNB/VzYPeGgoMJAFr3NYcwFTYNVI+mUyDdWxpA/8lp95OWIPDly
         KFqbjTajP7G+PBNhDkBqvkgGDNAHrENYr4w4WY/mtqcQFhDG5yCKNs0wwV+oPRzSYEOg
         5O6utBinN8ODEtSxy6fG1rCvpigicjXCYASxDG4vlz9MBy02AbTAC8KOIM8wjLREPGyq
         nqJg==
X-Forwarded-Encrypted: i=1; AJvYcCUq8EAurCbHmk+48TDACZ+JbfLDn6O+UJPecL927FVcb3rH023gUgdkX/j0huVImpb+7cttOnurEgdxeOpa7w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ssUOMysVHVKxAdW2uDmO6Ry0gVw2pEZk6+HxlcXUI0cmsP4G
	HpXP3LY7fvJU/EfJzLzqNY1Qg8Kr9kzpJlJ2cBGEpBAXD5mVW6OFcBfKRyQJSvVEvpi/ye7LEfy
	NBOZMCimPZItBrQStNb2h5pYC3CZ6iCU=
X-Gm-Gg: ASbGnctb8A0GFGxrkHQXsYljWD0MPxFqIxGeH6zTQe9lzyKLQeosXzj0rkX+vCqHMJv
	Gf9UO1LmeTfK0qhLUbq534Rvsd582h1M3gfNTXIUme2PfVy+pHI5MQrla3s2n4mkpNT72/sWodE
	GpTUb/EFpIdiLip2HzOdHp6lwC+adazvLAyLZAI1PPsdYlnIcqXROwmkWV2CL4ahLbR/fayobC8
	ywcoUfckVPTwSf3Y9VfDGmVvu4ix2dKUpVBbG0XtlQkp3Qxlbya7RhUMqxXjje1TyP3gR3Xn9d8
	bgHCaJsH6M+xHczR+hffZ1VY/rSebbpZiTovY85FXd3j9uKLXbci/B/wRIA6+3VXeu4u8mKE9PF
	69+Go8Truxssklw==
X-Google-Smtp-Source: AGHT+IGBenTbySBBctY/gU3QjDp3HFJHtBEOAUS6R2+K/P12LyE0SPg5Tcul8dIxRRcnUwnIEmZN66Tp9vXAnJJ+mww=
X-Received: by 2002:a17:903:1965:b0:292:64ec:8f4d with SMTP id
 d9443c01a7336-29264ec9324mr8035715ad.8.1760815585753; Sat, 18 Oct 2025
 12:26:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016211740.653599-1-lossin@kernel.org> <CANiq72k8KmpFyKAFZ293GDUWx5=HJtksR02hTU8-H9PX7xsT+g@mail.gmail.com>
 <DDK2SA1D77HM.38KOTOTF8FJXI@kernel.org> <CANiq72=Qh9sJLKwACr_McnbGdu8JfzqDuv1AgCjSdwKtt-9Gdw@mail.gmail.com>
In-Reply-To: <CANiq72=Qh9sJLKwACr_McnbGdu8JfzqDuv1AgCjSdwKtt-9Gdw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 18 Oct 2025 21:26:13 +0200
X-Gm-Features: AS18NWBrp4AFcrQ0jkZEQ0feystw5Iza3W0OYwyAWi1Y_FxdNAfDUM6zbf8CIl0
Message-ID: <CANiq72mj0L6GF-aebUcezeAD8iMV2mP-ZSn27ufKqQQiTPQajQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: pin-init: fix broken rust doc link
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Alban Kurti <kurti@invicto.ai>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Guillaume Gomez <guillaume1.gomez@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 2:58=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> In the end, it wasn't intentional, so Guillaume created this PR:
>
>     https://github.com/rust-lang/rust/pull/147809
>
> Thus 1.92 may end up without this change in behavior.

Indeed, it just got merged for 1.92.

Cheers,
Miguel
