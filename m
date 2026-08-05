Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9844838DC6F
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 14:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785941308; cv=pass; b=FuFg34MH6cgCCw3P5ZYZoiCWIJTvdmbl5xEMMOVZ1LgUQpZBO5CvdXrAgknUca4MuRCaxCLPp0w9mcQyq9so3TVxqb4F/DBhD/KHJhkGrb6/QFlKq7dr/5KLUIfZPxkeDJBv2oxNXdFlJLbG4hpx/I3rIAcmr1eWWs1ryE/daRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785941308; c=relaxed/simple;
	bh=t+aFXV6ambbZV6tug50+iq6TY9Di3koZpKru8wvXOkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QKExwVei/JCXNltfGGpCBFUe2OK4WUVZFUYqJtghYF0+NJ3RwDfYAqZikFZ1Tc/fNJ1+N+su+nFRprHHTdWSGElM2YF68T6KOJ+Za8qfXgSFprsUbKE9YsY+7O93FSpUb3jUe1WtoPF7ujDEJNigejD3aTNe8e6Bfy3VWlZojEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVdud3Qz; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVdud3Qz"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38ecc48b3deso134919a91.0
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Aug 2026 07:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785941307; cv=none;
        d=google.com; s=arc-20260327;
        b=XBzqRz8BPlvZi/QGAGLfeemWFohp2GyBKDKRFHFzeExxf02sRWyQ22piXRo09ZutQI
         ksNzYsSi1vIRh0Eyzt0E/dBK2PvdCI6aYkG+GcrwytBAKdco2IkUREjLZ+eAzBBXLSNt
         IDw2Sm+pZ63xVPWDJrkz7S/V57G50j69W/sWwTfA8unLp2WQ/l4VUf/RHkRHaKx8xaEU
         m2qqzQhxhh37eLF0ciwLOOBWxxKpNZhTUIxq+Gvz8oCD+XvrmoOnWlo0aQnAT57PVggB
         Fqar22Uws6MEx+rwxDFk/arX+sJ5kXs6Ld973J/ncg/pgFWJ0+HHe53mUDWXiM8FK/OL
         b4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t+aFXV6ambbZV6tug50+iq6TY9Di3koZpKru8wvXOkc=;
        fh=a4fFZE8vK5P7pQw728FbfWRxOpdKxDx9LRO3kahFMas=;
        b=X9BG3IEBEFQO+t9zhn+UZA73D0st3SkFuQBrr/z5wqgCl/6S9/xo02eI6muuVR4i0X
         W6df53XBN9e/TRMW718yx7o5F/G9xvNpLELomOyQr5R+1NwFYGMPagpsx9JH76taGHMl
         fNpKhSL5yWJjtLh8u/bRRJvCWMrrPgYPbFxR8sr3OHkMBvdZDgCU9pq2QldHKdBtwi2n
         rhvrPmE16oPFnB7ScvCKW+nOB50SqPg3Y6zr+o4muBknkMtnMaHO0a2KCiVnP4Cwi6St
         EfyhiGHcJ6tCiH0bPeFSXq9YhQuwxbPkVuQ592Og6lMxGXzgGnycZQsPJYfnkgufJK8W
         LnvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785941307; x=1786546107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t+aFXV6ambbZV6tug50+iq6TY9Di3koZpKru8wvXOkc=;
        b=YVdud3Qzq9B6XNgzAdBiV/tZyDOASN9hSr48zJW+NGy1HVR8tif0lL9B9gq6yYMJgs
         6ABJb+Vkj/jy1F0PG8M2BlsMybd0Q1883Bq4GbFP93NDy1iK/bNiJlnxK+Eyc8KaCDrM
         zdBc0IzwcYGcfjiiD8TX8as9yHUx8IvTzsWjbN4sEOYtDkK5tp7+zjPKrbyNsu/UwXQG
         srBwPC/8Z/cS1Du4LdyuyR0+Nd7+v8QrbC2q8pP63c7c3869VaQ3hG9NToq6Ou/5KoEd
         0bazibAkvmsNllcVVDXp2/y1QJC6UCDamwaj8nBKnDkJITkvW/BWIZTcHPKlJEop3GoL
         RInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785941307; x=1786546107;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t+aFXV6ambbZV6tug50+iq6TY9Di3koZpKru8wvXOkc=;
        b=NcsgHbg1L7/2pKPwxT6sAkmWTQrmLx2ng3MO6yp6LU+WL8NLRwp+vGWZ7lbjVSc/oJ
         rwgDnwdpBjmOXUDrSMqgO2dLRZqmMhomv9Ob5/rSnKp1VM/UkaSBvC7c+VGR4Oky0m6K
         Qn/tbmixiX2zga0YS9u9rj+D0Z9LQTJyGZ+px2iq5wu7Mj/qX/zCx9EM4EvtFYK32FkC
         nSWNh5577ZI7wFY9ctxwANkxb1AKuAyVwWkiFxDo56PgR3qzwZN1ZISRtwNzuDcFmPA+
         RJ1nAqbziXPu+QwrPICtBK4NIAAnktppuhpgjlc1uE6S40qoJ3opyEN/fzRIQYicWGSD
         y15A==
X-Forwarded-Encrypted: i=1; AHgh+Rr3VZeWP1uhLRYW92uuwxY683Oq+c38A9Xujtu6ovNfNB4JFLnnL2FpV8VBsk/+Ou7dEEB/AmarSloMuF4G1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyevStjPapwsLH2hZ6lj6SYU81YZCK9s3cvN23+YjbgI/az11i/
	iPTImRlo6as14YXiGL3C6t9HxPWh9a+sVKiVHG1adhBSKpLdtmrV1Yqg1MzVCD8abtgWcKqm8a1
	G/JMZSN7O9QUSbVzyzG5jUnOFoIdTdoY=
X-Gm-Gg: AR+sD12lSPW0zXPIQ1wcc8Idyd+0bRHqB2uE7HK9EL/waEKp24tV2eBCIBuTqx3qLMW
	78S0AFM8gNb+6Dju0T2hkstFqce/nPJmI4UgmZj4eXmQaATm61cGCsrJklejOPOhSBC1VjGtNkq
	bGf/TVFGfZd25Ct2+QlkuGjDJOccEqcM6JyZFyUb7IGDaMfXVZdOmXZkKcO036YYlJR2jJ8AXkd
	cLdM9w26KU34/VJ794i8nR58MywHVcMJY9DtLKCASy2p9Az3GL8ES7FQHwgETwy62Sz9XnM5iYQ
	cr3BcqXvv6N5KjdsxpeYG1L+43AI1m3L8o3a8+w/H6TcjMsGUe5mYc2ZJnUs+ZWExG/3aIBNnFn
	7Kl5/WKd7c5WkIuWh69aCdjedB6rQeGiDVreGthd0Zh5L/V1Lor+CU+eTZr0d
X-Received: by 2002:a17:90b:1848:b0:381:77cd:38ca with SMTP id
 98e67ed59e1d1-3903c7395b1mr5846194a91.4.1785941306831; Wed, 05 Aug 2026
 07:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-hashedptr-v13-0-377a07f2f78d@kylinos.cn>
 <anLxXvCKBcAVf91_@google.com> <CANiq72=gz6RFVm057RwqARGexTcsphC+X7EP61WP5v_+GAhD+Q@mail.gmail.com>
In-Reply-To: <CANiq72=gz6RFVm057RwqARGexTcsphC+X7EP61WP5v_+GAhD+Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Aug 2026 16:48:13 +0200
X-Gm-Features: AUfX_mxp5dsrFI6XirL-ZFjotS7LsYLjF32AS7C6lEkYBPsGLJ7cnnAf-tRKTC8
Message-ID: <CANiq72=TZTCfHdushKsFH2fxO7i8GS+LfLcYPANDGH0mRGZe=A@mail.gmail.com>
Subject: Re: [PATCH RESEND v13 0/2] rust: Add safe pointer formatting support
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Ke Sun <sunke@kylinos.cn>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 2:30=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I will send a patch to be applied with this series since we only add
> the ones we need.

https://lore.kernel.org/rust-for-linux/20260805144524.233362-1-ojeda@kernel=
.org/

Cheers,
Miguel
