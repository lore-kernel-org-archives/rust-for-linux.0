Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794995878;
	b=XJYm5Xp3ggMmH0Pa6lGni+Z0exQrLVPobl+YZ1PBE7N5x2qPm90aKRmjvtT0VBgaXW4O
	 FedLb3B14vI1v8aFtUTw5kmLXbYwiU9GNC5rYko9PoQ+MHrGk889TUrOgeDpCXkHelnPl
	 sbTT+obL/CA+gjDNTi7iSJbob665mz8derN0B+Y5LPS2nMTp56Hr5VfwtKfAFWj6Rk8zT
	 BYLiWDMq7JvpyyNyKfsu3Po2/fkKqsnqITMLEL0TqGnFY+i/M559SikdwN7VNfRiU3dK4
	 RP/LjNbogDYLDgcgTncTKnEABpEbl7PK8Ko4bCmbAF2eGOEvdT2RB5FZ6KG7IKAjUUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MjUb3k4y1D0WlpKOHllSo4xeoIvFc83LLhlj9sNTY0M=;
	b=BPmAXCLXuNS4XYb/D06Fj8R3PukXl7so37n25QzC/Ap7Rk20kQ05t07Oz9cUNbszZfXm
	 5OzfUNwMkVYrvT/rZwpLn+LWue1TJadLIOg/P90PyZBFmjAsQfY+4F4SLJoWCn+8I3hJS
	 oeUyFKtFD05WByD8dYj901PRvpcFpkQCpQ7Zcx5x12IgOAbCzBEBOYpLmUSUI1nRFfJDd
	 kzh/IFbBizS0vg/KYWhxS/ocNT+y4GAoZtMSrEgMayki0jZaxORrhgF1z9y/jtpUD5ODJ
	 hqOvjvG/lq8a9ZzCST2Karv4sq+L/57HC9LCPLtEDNuGt3AVO2HAeZ7k6TRXJAnUUqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=THEBCTkh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10488606A32A
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 09:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10488606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=THEBCTkh
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so3540275e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 01:57:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794995876; cv=none;
        d=google.com; s=arc-20260327;
        b=UQN0lKXi5bPVaTy2xEtARmFaGOXvmN1i3Ot6j161jq188tFAWZjTVavJK6FJHYUEsY
         p+GZkGeU2w3Pm/xmqtir1/NfcrNTdGCECuNmWUfhFYYehLIQ7Tn/iOrGohnr4KXgRunj
         9TieFe1425sbBer3MTU95F3mR9v3aAbsGR8a5M1EE9m0+wpnwSY9XkceDhfcgdeCxMyW
         S1i53DTNsH5i4lNZz4POuNCx6YmH2Wk7VH1fnksniTChDFgaWVzbcpXaTcTSY8wposEF
         J6iM2F4axF2/LDgXQhtGHSzmpgWESGs8j9mmCWr3oqPN3seiyUFq4DgcVnlO5JaEoi0U
         iLGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MjUb3k4y1D0WlpKOHllSo4xeoIvFc83LLhlj9sNTY0M=;
        fh=bxkCcIoluytLZUHSP/MfDxWXgRFnUu3jGH0sUXOfD4E=;
        b=Lrnz4jAKsHOsJCkR2eQmwYBPtEwNTF8bL2hlLTAZeZPPhhf6XCrDdr3QECOQRkAWuR
         RukwyPNbKbj+N7T6FvOE0zijCgM/82DS9pYJfhRwbEfAUqcdAj/ZAX8/Vf8R5mr0E+jP
         cJ5jet239KWBSHMfXKpTP/BfpbKjioTX1YO9C5C2r/trX9iahLDkhobdY/5mIFhGPHWX
         ZSvrswVFGUdZfqaWWbOCofHwwbgdAS7WGybbBNhcsUg87ub+tLyz9URz2pgmmDxE5F4C
         UXjQ7y0Qyy0pplp2Rca+rziENTPEW2CeSmhSzliT6wIxXQCfll2lR3j184T7bPxg57mO
         5dwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794995876; x=1795600676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MjUb3k4y1D0WlpKOHllSo4xeoIvFc83LLhlj9sNTY0M=;
        b=THEBCTkhDaIj9RmoNF4LMTOL9oowM3Y4L++ejGG0swuE5SWcqzZ3Fm0cbNnMT7gQX/
         lFsXGvsSx0fTnTECCMqkdycImYjidmXHi35LTyCR5gd8zhuDXSk5OQ9CQyGDd3Ae9nAL
         zS3gzc5DJ0QGeC+Ri05xWzzrJjiUrGOE3el+1F4665cKmTz//DnelXie8/5O24xGomdg
         3uIGkrxSDGEee98W2JoQix1x80x/+wu9HBtUJ7WzYlJQ90JLeIhpkGy1Pht8KuleFUyA
         uApyHEi+/6pmXmByHQ/OZKiTcWMluPP7FXxcyIv+NSl1/PyIzybhD7BPMIwgYPnMnpmA
         XW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995876; x=1795600676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MjUb3k4y1D0WlpKOHllSo4xeoIvFc83LLhlj9sNTY0M=;
        b=j7aGQL65Wkc2z2fUrxIS/j7q1kykvBPnz07DAeG4pTR7Jo1HfKaTkWBIKEPn6dgcdT
         yV7aIMEZCYoyAoP18vlbslRKZZ1YmzFSXUwBb89QRm9DBCMSUdIhJGNerwd8vUo3TMsd
         Z487uR/g5h7c6wCcXP7mOjLjBR6H7eLfBC7s8UQKm9b3SaC3BZbgLlr8N559N6VeRK//
         l/5A5cBFqAWfAkn2PZS3ljjFzr4GvHEtsem91u/lepqALMAYhWg4m4OhTFxg+gEgP/Ru
         2cdSxuyqSBEwSyjVQqLGokdZl8HvAr3u8B3GmWOeshj4si8Qewr/6XDd3nnU0rKWm7pT
         BmWQ==
X-Forwarded-Encrypted: i=1; AL+hErF9Ei5DFRJZx9fueP7zUsyWwuuE84wU+uiHrlS5mCbo1Ce+mnz8J1rniTO8fs7GoXpngHufayVLFhd/OfVbPw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VFNFgjuqSDnq4aKWs3s2/HVqX4c2uCvTBedjFyHAdVMrYpsfK
	8e5pyaDavCwTR8gQnemqzeEzH+GBgLC7yuzEgZw5FerHMQn6N/8AV+o+8FoWeYKbhyiMLUMaHAd
	weTMqvB5Gs7UCmxR1QTBmowfeiffB6i/2zfvjHrrS
X-Gm-Gg: AYBFou2HgG21n3Dh71RLzRvE4M5PogfoAORiNHECZm903Bq0EkchOO2+4BcL8Xm3Ymt
	9B5zY0WH3x5GopqK3Z9bPod5jIZZFaiK2yjdCv4nKr2r8fXf32Y1liZrEWMu+kNDNIMFtwTkCGS
	6hqews0B7fQWFJJOpvOy54mt4qbtKAYPgvkK7nWSwVASNUehM3oQ3wkporydcmjg8QR83U/BYVR
	Y2gvcelH/c2+UPqRN8GfLfrm4xrabb7w1s0hNyPlZHyLySmmzVlmtwsP8JwYLgc2rIFmiFRl5ZB
	nGQkkYMBMocYCMdlteMaEDedWc7jyB67rKH4mU9eu4/PkSB5KAe6Ewu+SNRw606t5KvvQu52ulq
	6sUdX6gzuUOyyE32fHxIf81Ruhzwe6KzzEZLm53ByloUyGI9PUH2cSdgcvmxX4A1XtayjnA3750
	JILH8MCG9vpjIyH3N8ZBdyt028GcM2Ng==
X-Received: by 2002:a05:600c:6095:b0:4bb:6238:cd81 with SMTP id
 5b1f17b1804b1-4bb7d9fb3e1mr33299535e9.10.1794995875720; Wed, 18 Nov 2026
 01:57:55 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org> <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
 <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com>
 <CANiq72m9v0V5Nnc_E1LUt24ofUUGxbRZdUC-UBz2NEbY_MA=Rg@mail.gmail.com>
 <avy_9SPRaPSKD8b4@google.com> <CABCJKue=wV7gx5D1PuBWOgWnAFC2kzGSFSqshun3=AoLg6b=_w@mail.gmail.com>
In-Reply-To: <CABCJKue=wV7gx5D1PuBWOgWnAFC2kzGSFSqshun3=AoLg6b=_w@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Nov 2026 10:57:43 +0100
X-Gm-Features: Aa3M54owhO-6y_6OcVgrrG5ngHvNLszf1Fezq3bAT0KDUQTiMvc4EQOCOXnAIEg
Message-ID: <CAH5fLggoZNruFqpXsUP+rUP7L3g252Mvs+_=A01w7NiBBfT+bA@mail.gmail.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel test robot <yi1.lai@intel.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:03=E2=80=AFPM Sami Tolvanen <samitolvanen@google=
.com> wrote:
>
> On Tue, Nov 17, 2026 at 12:58=E2=80=AFPM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > Function merging should also be disabled with gendwarfksyms. It causes
> > faux::Registration::as_raw() and Page::as_ptr() to get merged, which
> > incorrectly causes the former to get the CRC of the latter.
>
> Sounds reasonable to me. Although, I assume this is only really a
> problem if the functions stop being merged later on, e.g. because
> they're no longer ABI compatible?

They take pointers to different things, so the one that got merged
definitely got the wrong CRC. They do not have the same signature.

Alice
