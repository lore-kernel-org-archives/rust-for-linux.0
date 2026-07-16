Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A9240855
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 06:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784184365; cv=pass; b=aW1qdN0TbKU6EdqmcR6at1JM3ITi824D5o2KUbWxOn6CDmfCFyHL2rVVmX04UnOADF4LUwc16HMmg4tQS44cO3iei2pHrbhxmHhZAHqx7INuevoHuBMPCcwLZpa948NtydW0a4E7kQZv4CclK0mPaRsc1Dms4DEgu2agblQCqJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784184365; c=relaxed/simple;
	bh=rEmZGG88QTcZWd2LnUd2etfQFj2MEVBV723Ru+G1zc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGBHACq8DsMUBc0c9xXlj6Mizoii6LOZkjnEE8aP2N0E/ovWqgRkxh1/Ct1uaOerXPIH2Hp2vI/JJ3628JuYj2RPRTMvmA/T8F0L/0zLCWSmKhMS8rt8osfkU04cBMUuVmdIgC4amVSAsYHIdeY8zfssfu11ejWEMsRTgK+l11o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U6Nt6CYP; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U6Nt6CYP"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso3391626f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 23:46:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784184362; cv=none;
        d=google.com; s=arc-20260327;
        b=BbKDCvmVu/AI8HqzkhkkzrVYAGHLQRPBLAgbizQZwwQXL4kefmfnGS8MSgeBnv3Zd3
         CVF081CX3MZAONURCnF5QfnXpYC8xj3SaFDJ9dGefR36cbFMokLJcmi6aeE/Jv5e3pUQ
         8DXEdi/9dzv91QXbsHr0Hr+c2P0NmoOX17k6WVX2iJod0PtBr2ob54kB0L9JHqlSVyEy
         jbgdUPt2NIQT7mGnm4GfDOrKgqxSXeLR/A9X1v0NFYIgj4SwehmSxCvwjNc9Gp8ncCo6
         qG5bryoTs7kcz/KApbvU3xgqFBgbeIo3Ug6RdWhpog106KZQd7jYC2cfEyDruQ3BBgcQ
         +v5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aHWmAPGkakXoC21WAHnZ0dTmzDA0PsLw3hbHUtI1bYE=;
        fh=VIIskdsJxMQRTQSHzokH0MyCAQu/wp1UFOPsX00HR/M=;
        b=DLtKt8v02DZ3TNadBryo/5dawE2eK2hXROcKVoC54p3vyAQ26fUjAWsWz/OrPDbTW0
         5Ld4u/h+EEeAE7o/LbuvzxWKF6vNGaGkjmWPLCk2Bdi+OMyue9KWXembYYggXfMsMW9Y
         wtB2PopSWM2gsoVQjRi3jRnEjtU1CveTnN1nNYgzkc1ZTa2VoD4wUXnEqg62SP2LBW2S
         QOPJyJopHB1FNzx0EXK5Kx4lszoC4nW2OntqCWAxA44d4psiiClFAEsSK/kkb6+cRNPJ
         k1BNNuTHRJ2vlu+2tjvbKBFUy+kuCiNYf1RoKJWvw6JVWw7+qEXW0AZ0U5naN1VvbWlN
         RhMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784184362; x=1784789162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aHWmAPGkakXoC21WAHnZ0dTmzDA0PsLw3hbHUtI1bYE=;
        b=U6Nt6CYPlvTmMqETu2OYnfPIihh/OGCP2VZdOn4IIkUKaMA+ek5wdMO+559aq2ZLHX
         KgNexSggQ1celNC5pLPPvHCeMknoAqVvc48EmYW5lE37kPBoT6O3fhJ3GAEQtbewzLhD
         cpo2Dzy3Pgqj5QrkCfcck/Fn75xvxkZajd7yWfmF/ieSVqfq+UV6Ku/T86Bq27QHiwTp
         FDlJW1yFfhgLQybtM5q0cuHvwbu03dbjulCIMhUIc5GUIccXpEzYkK1gQugcgCy8Q0nU
         DVe/qgSBU+yPDCLjfQhhw9J5pNdPqLZ0dWSKiu/+vVrsg0KlCYIdNulWsLuBdc7kWXRq
         2dMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784184362; x=1784789162;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHWmAPGkakXoC21WAHnZ0dTmzDA0PsLw3hbHUtI1bYE=;
        b=iynQxEJ8+EsXGuyzE5mHMKaBJxKWzhwc8l5+8aKzmg6tpjtl3f7qP+o4yHCgdzwTKa
         3wLbRXdXYgszlsseHr2Af6ZtsyNOkEBPh9c+/1AF6Q+28BIu+ygTI78/Iyj3tm4Pu9AA
         q4T9rwxdJpYVRWJDEKkpLPKD07/DoyTngxAsyJw2gJsV7zsjF+HQrK3GJiX9WY12+GPU
         qJ6x85gfd+5o/yV1PXQVWtrqWooyJxUOHGW90ofA/7UNmFD806nKt3TyBhzE0+DaWF8j
         IACx5hiVuxbdCxxQcNc0GF1d1BeZ4UFCYsQa6WT2+LhloxjsH0JdUxso/zxT7PEZvNq+
         WxCA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9Fjd+4Cz67G3zTqDUZ0YweZOXe++z9X6LjpTdhZm/gPAYlZlF4TktXZpmZTsVxBY0XUzxee2XHy9uxP5eiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSo+isjWUQNXGe5rGMRO/hb7hoarXVIk2Ckp7f/YDIqb7AGFbf
	ElNPq878SmpVueW2dGOHFBmRTX29Yc+HPN0d0W+GkBsk08ZF71BplPf6UGRB3SCHEhjXe3k1Fp3
	Ukf4CPPxNHthFYZphWRY0gdn512Ne3/bMNeQ50ejN
X-Gm-Gg: AfdE7cmeDNWCECwvfkhVWvxdKGfTSSdO3AFhLfpE9RsPKnmTxptDayeMv0QI+0UidC8
	SUJKo6aUvLrz1m65PT9iFdLyHohjDJb8w/EySxtDxHETAZZQmwrILu5thRcO1/wG48jfQuotS5P
	xfwDffbGUPVXIxrw/H9A+cACQTFzBUinCIfXhdr5drrHnF91cgHLhoPHjdXLk7Zqt9M+aiIyfu+
	grXecUzsXra1EX7tlENNim1YjfH22ffvzCeccOdeLpscLVMobxsqOTPbR9rewvBkjZJ1T15P1AS
	FHXnoLwQyyAL7tpsP4Q=
X-Received: by 2002:a05:6000:1841:b0:47f:4e42:6f1 with SMTP id
 ffacd0b85a97d-47f4fceef3amr6899562f8f.41.1784184361256; Wed, 15 Jul 2026
 23:46:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-rust_binder_debug_mask-v3-0-0de91bbbbf69@google.com>
 <ald6JiykrvSDxzWj@google.com> <2026071634-democracy-elves-5686@gregkh>
In-Reply-To: <2026071634-democracy-elves-5686@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 16 Jul 2026 08:45:47 +0200
X-Gm-Features: AUfX_myY2zJMuPQWNfCV5Yelrw12LqKDfQYIzL7NIl03jBEo0w3Q3YhWmv3tu4g
Message-ID: <CAH5fLgg1nAzjjX_P_PimxbybCVQULAvv+T7uphWq9FSvFhmU7Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] rust_binder : Implement dynamic debug logging mask
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: jahnavimn@google.com, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 8:05=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jul 15, 2026 at 12:16:38PM +0000, Alice Ryhl wrote:
> > On Mon, Jul 13, 2026 at 12:35:22PM +0000, Jahnavi MN via B4 Relay wrote=
:
> > As for my other series, the netlink series [1] applies cleanly on
> > char-misc-next both before and after applying the debug mask changes (o=
r
> > at least, they cherry-pick cleanly after 'git am'ing on the original
> > base commit).
>
> Are they ready to be applied?  If so, I'll pick them up.

Yes netlink is ready.

Alice
