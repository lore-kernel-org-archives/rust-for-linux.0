Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BC034F470
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 19:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773172695; cv=none; b=ssCZOzBxkKDAyWJkBV9OUB3E7S4+WqEbJ8hb6KpYd0ZkrNKfuXZfFla8/02/7zNZOijrlloZSz2Ixq3YmiXzXbtdfINzfUYfr1rx6GvOaO9tPTvQQ9xUUE81z8s/8wTiVNieAvDbRn+nXbs6BfT/NSrhFmlSWDywJ21OLkgVrt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773172695; c=relaxed/simple;
	bh=OR+qgP39kATrp/QfTOJZ3bPaOj3WuwOeZ5qDFD59pXA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EmK7ynWp1UbTpR5jKEt52+HuXpxvagJChkxvNV//46mwR/Xzcf/MwH3UYCLHwKI9XEcO1bdUYAgu0gl04Wz9VFnPqchWNpkvp+ZBRvO5gmS3EZOfGysdlWbQXRIJ60E1xcSTMdy6otoz/s90x7wjF3xXmboGYTRSnsbIHZHT1bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N056z1hl; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N056z1hl"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6612922bf82so5801552a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 12:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773172692; x=1773777492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OR+qgP39kATrp/QfTOJZ3bPaOj3WuwOeZ5qDFD59pXA=;
        b=N056z1hlQzhx/tp2YEh+ANc9XY8yDuOBtQX/gd+3VRqdGsTSnVwG+CGb+/9XutNKLX
         BdSw9T5KvwwBHoFy+OsnYptQb0wrbwkg3o6anT1WPhqlrtEU0JrN057MmEQf1gYeEKGe
         6+bfgWb5ZX4YylKDCQj3W1ztRT70hBqGkGaYq+GRoUcSxYZr2wZyaD3Goi1fOIS54vDP
         qhwJLpfhNDhIH+c2zM2WvK1CjV8cSnDjW218DRrTt1dvs4v2gW+6sDDaEdXbTjYjkqaC
         2++JTaxEC+w512rwe75unnazLoFvE5evrhMQ4bJh7yXhxskxzSDFOvrG0Qjfq9kaS6ZG
         C3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773172692; x=1773777492;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OR+qgP39kATrp/QfTOJZ3bPaOj3WuwOeZ5qDFD59pXA=;
        b=k3wtGc1EDZ1df9UgKyMyag1ZpVsQOOVN9pPHbeDl8x7rWBc33CyfUuQQCOg3lic764
         5SPOzVJhDtzl4cPvue+/sy+rvhDXDySILXCcedMwjcmG5eAfqsgTHdgU70v1o3WpY3zJ
         i1P1W5rR5oaihFtd2vw/oN9EPGXRRKR7s+oUZNwBHYs9xl6D3ogcz/7sQszoocgd6Tec
         o83mlFHM+kA7oje0yGSisk+wjQqojwXcg56rat5c72/UxdzyS6KZcHSFnR2oDDDlZfWg
         hlTzDktDPEXiVMTllAAzX91JozLOX89QLEoOrrSG/ILcD7oGK+Z8iX4b1GyLYUGELEtw
         ocIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxTzpI+MQ9YX6PhhU6zFxtRsrIbtacf0UsHurZ/XS0SEGVv9WBouxe4uxrGvPUP2ojx8w/D4gqP9rwTEll8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3IttI+/Et3gOCmPl9Xm+EeOwbVEAcTuQP1z4mq9rVSlsdYLYO
	SCvyWOVMwiU8YQjaDtofOGOfSfX6sZBxgyUXNjyZ4SH5ft7R+s/MDNL1mDfmslhRhJWw2aDNhR+
	vhiaMZxxpttoWM3Hf9A==
X-Received: from edl4-n2.prod.google.com ([2002:a05:6402:4244:20b0:660:af3b:aad3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5191:b0:660:a4ad:1685 with SMTP id 4fb4d7f45d1cf-6619d4e3905mr9544182a12.18.1773172692025;
 Tue, 10 Mar 2026 12:58:12 -0700 (PDT)
Date: Tue, 10 Mar 2026 19:58:10 +0000
In-Reply-To: <CAJ-ks9=ijHBzOGxViDzJzGhEBhLg99ryNpN-FRsFN+NLJwVUYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260310-binder-crate-name-v2-0-0f7c97900d36@google.com>
 <20260310-binder-crate-name-v2-1-0f7c97900d36@google.com> <abAzTFLYsUxK7VJ6@google.com>
 <177315751568.96522.7020199079773666163@1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa>
 <CANiq72nM6ECBE+iiKrBRzCwOyd7BtQ4w6o9AH4+o5rcrcY30kQ@mail.gmail.com> <CAJ-ks9=ijHBzOGxViDzJzGhEBhLg99ryNpN-FRsFN+NLJwVUYg@mail.gmail.com>
Message-ID: <abB30ipu_Jwc6aBc@google.com>
Subject: Re: [PATCH v2 1/2] rust: support overriding crate_name
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 03:38:58PM -0400, Tamir Duberstein wrote:
> On Tue, Mar 10, 2026 at 3:13=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Tue, Mar 10, 2026 at 4:45=E2=80=AFPM Tamir Duberstein <tamird@kernel=
.org> wrote:
> > >
> > > Did you want me to take this part through rust-analyzer-next? There's=
 a
> > > significant rewrite there that adds type annotations to this file, so=
 it
> > > would be better if this patch could apply on top (with annotations).

I will rebase on rust-analyzer-next and resend once discussion has died
down.

> > We should ideally avoid breaking it between commits, so we could apply
> > it after I merge your future PR, with your Acked-by. Another way is
> > next cycle, through rust-analyzer-next.
>=20
> The change to `generate_rust_analyzer.py` is safe to land even without
> the other changes in this series, so it should be possible to take
> that through rust-analyzer-next this cycle and then take the other
> changes in this series after my PR. Do I understand correctly?

I have no strong opinion on this. I can split it if you want me to, but
I'm also fine with Miguel landing the entire thing in rust-next, or with
Tamir landing the entire thing in rust-analyzer-next. Just let me know
what you want me to do.

Alice
