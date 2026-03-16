Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831FA3932E4
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 11:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773662322; cv=pass; b=OcMaLkaF9g8HiKkHS31heI6ehL4I8rwsRLKokitB248szM13pt2q9lKAuL91ZBgYlvNz0iR1Q8NpYH431l1mLmOmyOI7FoKs7DiXkQ6nyQNL/iCNtH01PJwhjNa73u9PjL8Jyf6bpD51W9pnC4LhiYQogNDeFqzMhBSrHmbBEUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773662322; c=relaxed/simple;
	bh=WqzStTDme1iRCeMFGoEp8Qdz7FeziR1yr/cuI448uRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XAD17wGGPX5PVgFNrTPO1c7FHAsVP/cy5PiaYkmtcYelJ3ISJEpRbxF+ii5ZdVKiCvnwqvba9Q+UHWAxNjKeVZ2xrOfKTT6rgBLPnMIPSCLFWL6L3b4HGgus1GkE2P/rOUXcraVXSLJBGHLfcGOHNXAsYZUzrYOnQCghmQKANXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rGj8sgx6; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rGj8sgx6"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43b48ac2727so182186f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 04:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773662320; cv=none;
        d=google.com; s=arc-20240605;
        b=ZGVncHCvTI5yZxhhLTfiMgP+cE+UQrbT1o3H2+li8+UVKxk0ENzcOTmYTFz6bydUpj
         El8947FO/TQ46WDR5/EpbSUgHw8oRx8BHWxSNOrf0zOBtElLG3M0nCzdn2YXp8vkr6ZN
         yN18RlhXguauU6HiIg2VMkyeHcB9BcW96j6MYv52us+RBqkKIvff4q9uri111D2SbK4V
         Cw/eKtwygAOA7HuBqv7lwid+9aZ75Tqs76jokxr76SRw5lki5j4C007DNJRamw4S0fug
         dI4qOeHFqIBA+m5IEN5b/cBMzdexA1Z/RXrsGp3hKJdrSInB9vtiFt2zC/PlUIajWAqp
         zZAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WqzStTDme1iRCeMFGoEp8Qdz7FeziR1yr/cuI448uRs=;
        fh=eKH88/ZvvOC2wRMZvTWbUcKx8AV7jdwA3V3171nGNjY=;
        b=OFzqS3kh6iElLNiZVvCW37WnS7lQSYvIgWJMCHe3zdehZsS794cnBBPxxBvi8KcdD8
         CdjJ2eYbOY947Tfgzz5T3WX03pNdTLdtL5f8m6SD6pfQe2F2r69T/NsXLOVd3jRlHewu
         uZ+unQnnRceDeLwwrxAdurcBl0DgQoxVV4wJtA7pHuXFVxuRzrEboC3E/lolX8ilA2UG
         iV0mT3jibYLNkRhg3jGH5QFQ5M32jlUWvEWidZ752HtMfX5Fpu+gA38BnACu4tl4zxy6
         PwkHxzMpWXkv9d+1XDplB/LXCSEu/KOlG8ynz5g9WQkT7fsjtet5PwG88eNiRlP1EM6v
         bxCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773662320; x=1774267120; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqzStTDme1iRCeMFGoEp8Qdz7FeziR1yr/cuI448uRs=;
        b=rGj8sgx6svxA12DAS2Dn4FcLPc0lL4DDr3IMJDqSyYAGmjI91xp3o6NtVmzR1eiMx9
         ikLgdE4AyfHUGqnrn2kiDVkgm9e/YM5FfGsNlSUWEbeMGnfv1bsen/BHuuubzdoa/gqZ
         Vr7CIXLWF9I/X4iVkug/wNMcduL7+V85v99wLxIDJi0oGKxVQygXLSZuJBbjmdsHaojh
         FGys47NeXS0px/Bqgv5pVfXtkXW10jIs/CoxWMgRxx965iyzbDNFX+gmZAckFy+d1+oA
         8ThWMbc4QkJiBkjtSXAsnP7aOOkYiq1S3mgkbISkjq6hFnslB+7LRty4LtYqZLwwHkmW
         OvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662320; x=1774267120;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WqzStTDme1iRCeMFGoEp8Qdz7FeziR1yr/cuI448uRs=;
        b=QbKlmJfE1jJJkicc9Jb96QAj8MRTwAV37G4squ0GyriikdVSzp3R2n60/yL79l3sYQ
         /ZLUCdycxKe4nS3YGzOgjHRl7Jx09oQ3XvVn9zZ1ynvs+cfs8Ow1Krpqm2GFEsEEdBpd
         wOlDHfohkFOSmDdTNOWRx1qk9cM48Eb31zwzQqGZAQ+CPg0P1xfzw3BgDlRRR2xq48Lc
         ZnEG2EhGp5I3x8DXZXPwncKo7CFkyWE7mhv3NKxHfwd3eCw8kuYAX9fK1+Pf5XrgK1v1
         Ili0mtAgUT2ULF+/oPtXelnZRns5czp9HPaQokAxoH/ArkMn9hDiXbmdnYGdXigGvYb0
         uNHA==
X-Forwarded-Encrypted: i=1; AJvYcCVTvqjgJmeb9q3lNWLAtdL1VdVU3qC/cDnldFF0AMN/AFSon3pNL9e2k0jWChrbqELBSYXS7Bi7hI5qzVpfIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsu/5uAa4AAHwyjyfu81QZErLUykUorBEsbSoIyEqVhfg51eUh
	N5SqdPCqPEkCUW/fUy1Q+u+dl+C7CJgPNZETnJ9DUvTpy+SVQK2++3cMHFYDsYvIyEEjX6ZDdGe
	B+TdN5XK921xNYmptGaVSdxAajU3wSczP96jHLnY0
X-Gm-Gg: ATEYQzyUCt9UT7mCCZ0q11rZdIqMdmI/TN35mVtl5WEYpdd2sDD9QSipSdVUwdf0TZ4
	0XWWUsk9ev1iM22wHxORNHn6y0lC8daBgmViB4XKRbPbcqlX/8bakYifxVlDjWynL4h909I2cKE
	vQLfoJEtxV9C5Jl+wMlhy0QDUE5thszrT+PmPjocxZlO6E50kv2Aj/J1QQINHCEp5Z9J4az4jF4
	kBf4EStsXVSmavfaj0Aq+gwkzlyb8z1K0yLhlH9WAgpvWPBhTlnlbYwbhbFoFuCGWtUwb+uvmEg
	yYwkVV77sX4aIzoT9D7CQuY+XUmhzU0ZFLgcYyz5QVEabnPoN9OYwkBAWuCJVGPxncQ4ag==
X-Received: by 2002:a05:6000:288c:b0:439:ac8f:5db1 with SMTP id
 ffacd0b85a97d-43a04d79bdbmr23658023f8f.15.1773662319287; Mon, 16 Mar 2026
 04:58:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216-rnull-v6-19-rc5-send-v1-0-de9a7af4b469@kernel.org>
 <20260216-rnull-v6-19-rc5-send-v1-4-de9a7af4b469@kernel.org> <abfNByL15D4s69Al@google.com>
In-Reply-To: <abfNByL15D4s69Al@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 16 Mar 2026 12:58:26 +0100
X-Gm-Features: AaiRm52S0Hs2FH4817i5Rr-RXaUi8EC4_IqQnN2448mAAelNGeUh-DsUEfywyig
Message-ID: <CAH5fLgi+K_5So-kLwyZGhaagEx-rRXPmk=zCOTqG3yh=bSe9Ww@mail.gmail.com>
Subject: Re: [PATCH 04/79] block: rust: fix generation of bindings to `BLK_STS_.*`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 10:27=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Mon, Feb 16, 2026 at 12:34:51AM +0100, Andreas Hindborg wrote:
> > Bindgen generates constants for CPP integer literals as u32. The
> > `blk_status_t` type is defined as `u8` but the variants of the type are
> > defined as integer literals via CPP macros. Thus the defined variants o=
f
> > the type are not of the same type as the type itself.
> >
> > Prevent bindgen from emitting generated bindings for the `BLK_STS_.*`
> > defines and instead define constants manually in `bindings_helper.h`
> >
> > Also remove casts that are no longer necessary.
> >
> > Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> It'd be ideal to change the C header to use an enum, but that may not
> work as I'm not sure you can specify the integer width you want for an
> enum.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Honestly, it might be better just to declare a Rust module somewhere
with each constant redeclared:

const BLK_STS_FOO: blk_status_t =3D bindings::BLK_STS_FOO as blk_status_t;

Alice
