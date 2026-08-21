Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4742B40BCAD
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Aug 2026 19:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787341733; cv=pass; b=cFE4TASKEuoMstBiOeNxLMtIn+GHOF8kllQBFYl2qtj9mIL9UzcyPddsgIkTYifrJLU7i76tLrohAmaf5A8qWoKY8YtIh7pMEjWEOrQ0wVMi8uJaQXZNwWP9lvgf2quXGDUFsRTBUqSwXU5t1TowQWNul40iY2k0o5vHZPmLQbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787341733; c=relaxed/simple;
	bh=CIOe0gksc2TBFCzVC0UABUDWCb5y+xK8eszlV06eZyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fs3RGMjh9r1yVSvmr2DLG5cdLzbrwmTiuQv5mwcCAkHQjgaM2/RbZiqX9qlpAqx8gz0p4R8mnRZCsckiA8j08kYl4zxtiPKJEjxFzXPDSfioUeDDhuWmfDWAgPKNWvUp6jGyVrq/+VXyp7GsKvnkIchR79a9uoBVuhRd9JFfim8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CcpGF+qM; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CcpGF+qM"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cf4c37dbe6so1280475ad.2
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Aug 2026 12:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787341729; cv=none;
        d=google.com; s=arc-20260327;
        b=rgR/7W8U/ewJ2GN34dvR+UKbWHspFcI1ZxE29Lm8viXzHQspA0FsUfUpgBnS1JKEcP
         2WQxZ1KC+xZTbEdQCEZRSxmop6/uosV1PZObMA7VThQSFyz7rvQGwr/mkBou20uH2tSx
         pLxa1+d1K/lqe+2Gisug8e+HEE98T7RW1+KzaMVAq0O0N3L4yEZ2Zos891/du7+lyjGq
         Vs2Xl2s5hUJQ5eD5af70J5Nj84xXT9/Qo/wpCPAA78vMJvsdOz8Dn4CeuL+F7KOv1d6W
         wcodFLTMt9vz86eGkXzqXYibvK3ySVixxowRjq2F9JuCsunq/bUMUFQK6mzJRVTVaZiM
         RGmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CIOe0gksc2TBFCzVC0UABUDWCb5y+xK8eszlV06eZyA=;
        fh=/n+sP4lkWYHr4YJMUBDVQIB6pWFK47mJiAuxFnBu6sQ=;
        b=S4YRHRGU1F5vlEFF/pjlyBf6oU9m1MWcltTi1goG/uMzENWzLZD7hsQ7jMGhhqyzIO
         qJfVvxMIKcpqIJKfLz6+PAAchj6ymLP9k2ZvTNpxlcvfEr1ppz/Dwihfssj6m7TX3s1i
         b3h3KG3eXq4Z0yP47jHA1L4vuM9k6CZ/9vvx97d950L94Mvnmpl3biXro7/un0R3SMJW
         25HG2QLt86a6ZRwwgscfd1HgEQ+i0Iz+2/IbrdxT87tmzW/FJI7Uh7SLc1VU5fVgrQD8
         2CbSXbtJ17rKClkVk4K8/FqPTlsdYc+EBEhh+i/kxc0VuCVEh/Mir76/2NsqQjsLNnxj
         5bGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787341729; x=1787946529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CIOe0gksc2TBFCzVC0UABUDWCb5y+xK8eszlV06eZyA=;
        b=CcpGF+qM8yYIih1cSAqy3lWYBxp96sh1Gj/OttiHxqrpYuMRGm6FlAx0tqoh4cggSM
         Pb+i2/SSzrnOozG/OY1Mw4F34yN2J9buwvFALEeUp2O8avFAgv3oDJozaIWVMuWgGTwX
         akBoWrOuYNOmL8B94SPxjS1FXfV3gJzm9aqj+Y0/f35EsfiDaPT/gQ9aexZHui9q3mFv
         pnZ48ywdxsD9JVj2BqSl5Blw7faLWP6QbXdXdvpyXdnag4GCND9d51YbRxFEpWtZ057I
         63rvLD96Dqcu+HJdNKZarWcS7c1CJqleOFSOkFZwJfQwpeum1UVbxyA9Jej3maFhMIhg
         uwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787341729; x=1787946529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CIOe0gksc2TBFCzVC0UABUDWCb5y+xK8eszlV06eZyA=;
        b=qpLFlMDSGmtuokkAqI0h/uYrMbBY+bk2v90OINE9+TcLCaaojx89ZP9DlVaxSOJ0xw
         Wxx0jR+GCrl/q+eDFgT3P6K64XzmcYr3Cqon839s8UNvT0mO4n++3USzD2IuF2SpyuLf
         uqhpS/3frugUNU5NUZWcb+BalKHLLeiePcAXW3dFs62Dwtl4isqwdDOHxcsoqWTBqXEB
         nu6ljUxIC6GICBapinT2mVCd2/eiOTdcZ8a9x6+sv+DgOWBpEumprR5t1a8WS9HTnJlF
         PZwaG0YFcStb5LVi4RzaSRwWDjUcobXdX9YRWl0LSIcOCSSj3WwxFIdMm7xF7ShMsYY3
         OGYA==
X-Forwarded-Encrypted: i=1; AHgh+RrMD+5vqUTSiAutKYiCxGVoQh8tCPapbnMhk9ukAqKYvo/BU3P/+xxU0ENbiblG/V8fqajMJCp2RFI56odCeg==@vger.kernel.org
X-Gm-Message-State: AFuF++n6IpqIYSvhU8tnc8kS1T8XVEQO0ba3hI8cfiud4Hv8jU5bpg21
	u4Yja8cmFzmTw7zBWXTjRRJHIeu6IGd9QwJ2is+egMwaPORp7TwqtkksSD2Tp7ykSrEKTb6wMUP
	gbkM5MXHaJq7Cmgxs539wCYhdmvcqVA4=
X-Gm-Gg: AR+sD13o+RvSG6NkQ8xchism6EyenjdOOE0VeSCqaus2FySTdtlOZkSMK/MXP2g57BZ
	QZRGISXw6NtL3qqyvysXPCSH7GlxdwN5AX+2BY3IrMkSQQYg61HaYkKQ2U+K6cDZuIcyj+2pxja
	CK8mr2qk2Ebmn9WUy66i1NSHe2P5OTK5lZGOXAwBrlUf4ihGFPlzTMesmPsfECKr71CG4NZE4Ew
	Whv264miYG/QFupyhwx76Lrnsde/j2OLYvKfRbFhIiJTbC3AfWkw+eVPihRKP4IEF/oMCuDM6Ez
	QUMqf2EHLs2qO3thYKbVKnATIDSPc61VxxQVhkT4sw42GX/gKM/4tJ0v8f5+Ludl3IFHzTqjTGB
	/vzsK8rltaV5IAXfhzCyIUCTQHzYXnFq5vuCY5p2plltNr1LpK9XJABDp7THb
X-Received: by 2002:a17:903:1b65:b0:2d5:3f09:4126 with SMTP id
 d9443c01a7336-2d64b13195dmr82640675ad.4.1787341729446; Fri, 21 Aug 2026
 12:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-rust-reverse-randstruct-dep-v3-1-7b8b2c761d6e@kernel.org>
 <178733378275.2181196.3186172911325132761.b4-ty@kernel.org>
In-Reply-To: <178733378275.2181196.3186172911325132761.b4-ty@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Aug 2026 21:48:35 +0200
X-Gm-Features: AcwNN1VcEKRBJi5joKYnArWy65OxDBbAjzWAsN3BQpiDLg4VMvQL2Y1JGnUF-bA
Message-ID: <CANiq72kE4tf9b5BJnK4mcY39e2KELqErxHTZM8b3_GLiEvPt6g@mail.gmail.com>
Subject: Re: [PATCH RESEND v3] hardening: Default randstruct off with rust for
 better allmodconfig support
To: Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Mark Brown <broonie@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 7:36=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> Applied to for-next/hardening, thanks!

In case you want it (I mentioned this in previous versions but I think
I didn't give the tag explicitly, sorry):

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Typo: "likely go give" -> to

I assume people does test (and enable) randstruct elsewhere, so this
likely will catch more issues at build time in linux-next, even if it
feels bad to lose the other coverage.

Thanks!

Cheers,
Miguel
