Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2304303A0D
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 23:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774134846; cv=pass; b=CK9Os0XXLw8Win29SZvlMYsZbAxo3hwR/qhntZJWKekwrQ8wRLNIxFRCIKg+MBAQe/Eg0GXFPiWChAN8Uy17qANqiwas5g428D3xWB34j7zTmq7AnSidc4cR0s3zeeT2KD8GJGUXVTQHjLeacfYp7krLgaq9ejv9dS9q4ozpDq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774134846; c=relaxed/simple;
	bh=OkuMmGlR+2dX2EPNGXZvKOfNywOwMrYmN2SQ8xnr1oY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PaQxGpTrxs1e4iSnd5aRNXgM2iIsj3llWHyZ2hnYyAQaq0ZjMSh0DJ6o+wQ1Vqi/RWYJ0phSrRrA90ez0tAUq7fQDc/qj00FDOVa6P6CWenmfr/u/pHGbxFSlonOum04m+ptWSqHEo/Pm8S1eQMe6T8htKpeDeJ47xrjmmod1hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBYisUwy; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBYisUwy"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b8095668ebso197510eec.2
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Mar 2026 16:14:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774134845; cv=none;
        d=google.com; s=arc-20240605;
        b=dtMI0sBxV+8mxqEXAvO87wj6vQGnKEVaehCZAhsBUMPtElOsjmm0PLBkr+ofGenlHB
         9EKXX39jPI4apVeN+6xyE3wCJJ/IAt4kahB/M6pT4JUIqsGn3mpMztWjBVMgFPWByH7E
         4CVbUEeqI+ohellQDBNWXsVL/DEzqy62h9IO4xLSRAC/gJoG0ynYwC0yEQj2kkYRbNyw
         DFUbSr06jcz6Vt0+xI3EbwS7yIH3BkrPQPCYBtO9ObxBOQeANsbuzqMewMGskRXmGVZR
         buNdTNRa/mCgjAtB5OHGFjtSnb0TtlpD8IrDR8oeE5dAqpl8PTdiWK8fL5R+hNTYAifZ
         gLWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=goHll+grzPEzrXXV1zJDIuGOo+W02rOcKgKf+8zUcnw=;
        fh=28CJpc+PK5ubd0oO6r9kPRDg/3Z6Xq79NOSHa7eg+5o=;
        b=LynCIjyGVgVz4axz9oeXLptzCqjFPaZpr1oW+FUQJWAfB0qmF8Zh+Vt8lShhLxXjn0
         vXiWUp/xWpj45XJwF4/u7gHeqeaQsyWBl4ttS7MPdB1+vr3epSrjbCQGWg57i5nPhvtI
         /HNXRP5tMcAMUswDWrG2ezujAFxtUSVr76GWGvfvt8YaVt2G32zZhMa+DpwOIE+koI10
         LiZ8Az9d9fpyseK+UBxo67/F0CXisaAOkorWbAdZKuxfXoqhWzqSSt8ho+n8g3/VCEAe
         58pjM66SIDs4Ux44lEjVV6e/DdMJUCbTpCX8RR1fbTSJVz9cahW+BZ3ShgMWCMGzvdMv
         AfQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774134845; x=1774739645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goHll+grzPEzrXXV1zJDIuGOo+W02rOcKgKf+8zUcnw=;
        b=PBYisUwy1Vn/d7sAbRt6aNAZzCCaDOmLbsCe3oTYUmJvLxv84rzqLa457jH1w/ewt7
         BZ9OBLJo51rTxGq46BPFH2gf8mYpmGn24OH1sfHMaDPT0Bck2EOzYIDqanW089xgp2Ep
         hyCRqTKfF93bQ4tk1taCL5xlF6XVJq8LPnYO3lrgjX3pDoOHGwj4eCqQU92Y0n1Guzi0
         8NYO4bXOqGRJMxyub7IvnkzgX4+kTeK7MyzT3YFtsFNnzgbpKYmbMhBvv5lyLUYvCObh
         HC3EiGBiQ2r/JuwIsLGZEPuULLHRaXUGNujsuuqylahL0Xg5y1hFAidtf3qctCYE0QV/
         QI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774134845; x=1774739645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=goHll+grzPEzrXXV1zJDIuGOo+W02rOcKgKf+8zUcnw=;
        b=O1oAnLEIzD0GcLzSiGoJaj/v5snMdPDxEzaP+nTMEpmmwPi7tycnMZxlpiu8/Pgkez
         4b8GqUXYbkeIWwPQJ71+EmeT0EghXoPyIwV7t7yuB1zW42NDTO2Nc1x2ybAOngHy6xbP
         POWCwLbMu8ksNecKtrEBvv1rAlQwB0uAiGKBd4vEB5gfXTenbj0Xx367nDsnt0L3d1+C
         prshO0Utrr1oOIvxclvNolqGBsQolsDIIzU7XlK6Jj1uaW6nuYzOlTPsovzrEDsvIRnj
         0rkT1FQy3PTYkgTRMxvOFjrx2NMqBkeUikwCVESoC3pUzZdxKCQMBGi3aJgquclxpULt
         og0g==
X-Forwarded-Encrypted: i=1; AJvYcCWhGA8Fh0d6puODRJTq8P8RVkTYw8wwrRv90ddi3PuduYEnoCGxW5Hrd07fHsg9ua8m2xiMJ9zXvuAGRPKd6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYUiy20DEvVvgyQbGDMdT4Kj8UF26dSfxZp3px02QB/IPtDZzP
	UZdjvHr8Ki5srnRkcPd6PEDTsheijYFz3qYdtN1PmES+Fx8MwZu8mbTaQIPmTGyOYQLUdAqeNoJ
	v3ij09Ww6l5UyHf4dhOKRP03VnyOS/Ho=
X-Gm-Gg: ATEYQzz9VSyfUKAxcomcmDDrRf5S2Ov5vTBpnTGeP0ZvFdP642PRfgtzqdJX+83FptG
	MjWsD3Gt/1UmDmxXKuUGD9SIJLcyp1aRD5KTeDMavanb9Xw1mrSlec9rr9WPbWD9nEvaaug4Fe4
	Shoi1c4i3UT1igT75qmfyhKpll1leodkUrRuUH9bd00qWXScmFXKy0ky946CNv9ARTZXL0bDU9W
	4t1aieILexVqiHHgciQKwwQFDjuC/WxUFBKOPk5rbIIsZoATro5zP+v6DpkOMJ2N4hxZ0Qu/v5C
	QLuV6qf9mUCM8MCvAXwHgV9f16B6tlfOWD9LmKu2nUan/7ToJK5FGvlRAfXHWQtlAeAhFZlg11k
	0+1skm4KWkBVTEzPtKhaJZzc=
X-Received: by 2002:a05:7301:fa0f:b0:2c0:d9be:eb09 with SMTP id
 5a478bee46e88-2c1093d1a00mr1721387eec.0.1774134844814; Sat, 21 Mar 2026
 16:14:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260321143406.67066-1-albabhasan276@gmail.com>
In-Reply-To: <20260321143406.67066-1-albabhasan276@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Mar 2026 00:13:52 +0100
X-Gm-Features: AaiRm53KhWNpl_F79vzq7L1rLtUXM4Mo31I69Dyxoil5SzkffhgIzepZt4oBslY
Message-ID: <CANiq72=w0HcWi7z1wL+R1wa6jS_+P=L8Zp7pvZtUG+C51ETzng@mail.gmail.com>
Subject: Re: [PATCH] rust: print: add SAFETY comments to unsafe blocks
To: Albab Hasan <albabhasan276@gmail.com>, Ali Zain <alizainuimx@gmail.com>, 
	Shivendra Sharma <shivendra02467@gmail.com>, 
	Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 3:34=E2=80=AFPM Albab Hasan <albabhasan276@gmail.co=
m> wrote:
>
> Replace the placeholder // SAFETY: TODO. comments with proper safety
> descriptions for the two unsafe blocks in rust_fmt_argument and
> call_printk.
>
> For rust_fmt_argument the ptr parameter is provided by the %pA
> format specifier handler in vsprintf that guarantees it points to a
> valid properly aligned fmt::Arguments<'_> value. since
> fmt::Arguments implements Copy the dereference is a bitwise
> copy with no side effects.
>
> For call_printk the safety depends on the functions documented
> preconditions the format string is one of the fixed compile time
> constants from format_strings and the module name is null terminated.
> the arguments match the format specifiers (%s for module name %pA
> for the fmt::Arguments pointer).
>
> Signed-off-by: Albab Hasan <albabhasan276@gmail.com>

Did you see the following ones?

  https://lore.kernel.org/rust-for-linux/20260212125427.122362-1-alizainuim=
x@gmail.com/
  https://lore.kernel.org/rust-for-linux/20260211182755.82220-1-shivendra02=
467@gmail.com/

What is the relation with them? (Cc'ing their authors)

Thanks!

Link: https://github.com/Rust-for-Linux/linux/issues/351

Cheers,
Miguel
