Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2554F475D
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 12:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413330; cv=pass; b=KeWSviTs/gkNO7XdZoJr5/QlhosrFj9R+xvug3xLJy+mArau0GROfdBJfEoi+r4BfpYE66GPoF/1/42K/Tx/qmRrIRBPu+9pWfOl+3u7enybRBlgFeu3nyvM8GLj9ttsZPxTuSXNlkAi+4qTYznJr2DicM5jnTWoIl8QiegMsG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413330; c=relaxed/simple;
	bh=kHYzzrv0/FqkmbWY/rN/GxGNCP9TcRC3pY9kk8aXaeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gVnFTpotIINoGOyoa9aFiTPau2IC4hD8pIerq84iAhdOxf9Yowp/LMdMiBZ/CeGI32NBmyv4BsRNfdHzytgfFYcnldndfdGWTRlY+zthYjTYaiIDzdAckI/d2NOnWdGnpCteG9QSREwjKLpyAZ6KEPGQkpdATP5Pycl5SXbzlhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PqWQ+m4S; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqWQ+m4S"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-355724d032fso231458eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 05:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792413316; cv=none;
        d=google.com; s=arc-20260327;
        b=kiyPhbEifVlyxyt4oEmzjGSCkEcihVR0kWnPQX4a9qV3+zioQqR8VBQ7qfCt6v3hGV
         cSTOi9jvc1gS5o0Wpbxo8ZeDmsqykU+j/laEwcOpFrxtE4lvKI+aMSNDBUG2vFN1dx1P
         INR/fW0t3bIkxOaKrlAcEIAqVQMWuiw/PLq5ZqlAbkHkVOa+JrxyKK0I8I6qYhqVK5U4
         4QL4bB2L04Zn0glYFNNJuxHo3dcTDvIHKb1GPMarjIbcfyFCRCfedbdGhFnWX6Wp+dB6
         0yPeJcB97Xg1lXM7qaaPzw1Z8aUwq3AQG4YkDLZPCyhqXFkSh4iI5eWzuQTOPAtQWlW8
         rImA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z4G6BdTXSrvUBkKrtgqJe7ik23iqNQYFU8yzcfGukx8=;
        fh=vzLdMSifRySnbDijZULOpqsKSJ0xO/ZEoBlMxZpk5WY=;
        b=Kefg0qMsoqt+L9FCSNRBT1mkZkndr1u7Rivq+0hS5YGZAJCgLQuGIfIvGgGtMh5aLE
         JVbDn2niu/+hKAj+hEf4uYeIzpsZ7/V92PzppXNQbk+xw5GsPLrJlRKbkm9fykIMPJwH
         oIf9sTqgFvmYh1Ks6vs6pZnXWLfJ+b9e88SqYXv0UV98zT4gEWshTHRkVzY1lUTVaVmI
         uXZMlECd3OiFP22dW9ANbjHD2wpi9tH+KNvJ+kR8aUh15cTxhcNXyO+qmPU/0r3ZLvXh
         FNIKsou1a2otwqXsFwY0VY+MrdYJL2XQIMjpA4g2W+7nHIV/UeGAMbXBOxFciWzEPTpy
         6fbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792413316; x=1793018116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z4G6BdTXSrvUBkKrtgqJe7ik23iqNQYFU8yzcfGukx8=;
        b=PqWQ+m4SQXb5p1luT6Xo/1a5Zh9owOvO4Ow3l75XTih1nogRAv0NA7PQz4JCuFdADY
         NWHNut0xxXnMDFAIZhK6pytQPe/k72REb+3X3t6BBnQo14NKshg8sLFf9suqxA/GQVhr
         A+qLkiAhs92R/VUgPkNcyPY1iORN9KuNjg3agAcYF3HCHww6SFhgbm1G5Mn6zlefUQ8R
         7yubMiOdam74pa1AYQQVopKsxyM3okQ9qVKRfbrkYx9WteKzb9C9XKEjHTVqq3xttz32
         gE9rmn+pEgIMFUY+P6WVdfYOHzpOvCceBoRUNYSExVB0B2HiEzD7uqmGGpPQwBrFFAIO
         iHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413316; x=1793018116;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z4G6BdTXSrvUBkKrtgqJe7ik23iqNQYFU8yzcfGukx8=;
        b=VjRtogCHzmMdejK5GqnU3vynNIIjXyBnWyHoEQLOUhVD14CR9wOGQUAohwnLACN/Xe
         EMKuZUajtfLY87IUDU/6VVOITfVA8RHUKb3tXJ+/uGaNXQmPDBQ4pXM7+M2D3bCrzLuB
         z+oyUQXHG0MZTdgd5rjLeY2029rmX1Ypn9ezksi5fv4xZ5WdvoFyIvIdTkGHIc4Vn3RX
         eEuiZBI/Sd2Gx3wm8DZar8WIBExHUcwcnQr6T1GEFfMDuEjsAg5TfJn0AVVBBuM8xH5H
         P5ahQTh1YBr8m5NvwEVtR2zDPfAAr6UVY3ecbVl2rIdAiGNLLcrcuAVY8YQ5/UM8c6fG
         rueQ==
X-Forwarded-Encrypted: i=1; AKwUvByvy/GkYpucEddRLlzA7w73/Yj9P6xXnaTMNcvV14YoLG62MAl90Ll2D9IJoYydn/I8fWhz59Q+3dY38V4ojw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI/6ZPzqWMp8ywcUL0X8GikgnLqT2k9zfih9c6waI8aPuuPnG+t
	J8ATWQwWB6DgT/E6e+NosLfH+0i09UgBAYgMxwC28vIkA5S0JRCrKvP1iLXeIx4bnkqU3wRU5by
	VegZDF67FIZVpLhmId3UZeq+yiJHgvMA=
X-Gm-Gg: AYBFou3fQIcP4XEKBLzkKbskFITPHHMItzxwBKBOwvQ2HXO2ZSRXYSjgg5fMlTAHYg4
	IzvIRmOzfA56FhGOSwS9RtpPcAuDaLGy2b2bQgQx2gSVui2Q1DS3yO6jKQkSZluEd97oo4dTldn
	QrcDSqaihdtFz6F9mn/gCW1cNPu8W+/87so8htBWQXb22AfwHGWZdxjlMcZ17MfJt7AwuttkNqv
	3aSj616paLyWx4makx6hIzVSMRIa5hmO9Jy9ZP4vfIIGaXHrOC0o1Md+48nx0UweUgqhU0e1fW0
	4Hb0enjTrC0uhtt0DMjqbi6sM/oj+u2U1KrvWU6wc2pAWxPDYphQS7SFPt0XUOxfGLRMBiw+bKG
	1R4GMEzdZNcUS8stB7ZZtC5YCx5ngcnR+1cXJamitwK8+IHOoXQDrdphkJF/Qlziboc/pPtG/ci
	1OUrZCuIxfRzLyiQE5IOUwywXGjKyG1gMasiVvpjuVgUtQWLGTNoiK
X-Received: by 2002:a05:693c:20d2:10b0:35f:8c5d:5938 with SMTP id
 5a478bee46e88-3619ffc5b52mr18422794eec.1.1792413316441; Mon, 19 Oct 2026
 05:35:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261019114811.1105192-1-gary@kernel.org> <CANiq72kzVouV2GmeFpmZS1PNPDo6gZsmG8MMrrovvETUxVSVsA@mail.gmail.com>
In-Reply-To: <CANiq72kzVouV2GmeFpmZS1PNPDo6gZsmG8MMrrovvETUxVSVsA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Oct 2026 14:35:02 +0200
X-Gm-Features: AclHuK8NqyayzMi_L0qJx39DKhIVVz2vRnMPPzA4fngWVWW2n2x20pZjM2meo0E
Message-ID: <CANiq72kxe2f1cO+yypVW9LY4pAHO29wn+O3sUECvHXPnLu2hdA@mail.gmail.com>
Subject: Re: [PATCH] rust: doc: mark `Io` as notable trait
To: Gary Guo <gary@garyguo.net>, Guillaume Gomez <contact@guillaume-gomez.fr>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 2:28=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> The attribute has been there under that name since 1.53, so it should
> be fine, and we can always rename it or remove it.
>
> Having said that, let's mention it in this week's call with upstream
> Rust. Cc'ing Guillaume so that he is aware too.
>
> Unless they say they really want us to not use it at all:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>

I added it to our usual live list in the "Nice to have" section:

  https://github.com/Rust-for-Linux/linux/issues/2

By the way, for the commit:

Link: https://github.com/rust-lang/rust/issues/45040

Cheers,
Miguel

On Mon, Oct 19, 2026 at 2:28=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Oct 19, 2026 at 1:48=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
> >
> > From: Gary Guo <gary@garyguo.net>
> >
> > `Io` trait is the primary way of interacting with a bunch of types, e.g=
.
> > `Mmio` and `Coherent`. It is hidden in "blanket impl" section which is =
not
> > very discoverable.
> >
> > Use nightly feature to mark `Io` as a notable trait, so it is highlight=
ed
> > at the top of the rustdoc page.
> >
> > Signed-off-by: Gary Guo <gary@garyguo.net>
>
> The attribute has been there under that name since 1.53, so it should
> be fine, and we can always rename it or remove it.
>
> Having said that, let's mention it in this week's call with upstream
> Rust. Cc'ing Guillaume so that he is aware too.
>
> Unless they say they really want us to not use it at all:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> Cheers,
> Miguel



--=20
Cheers,
Miguel
