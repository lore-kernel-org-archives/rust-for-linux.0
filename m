Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ED742EEC4
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Jul 2026 07:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784619298; cv=pass; b=ORtC4laItrWHyytD+KNEsN1/FrOUerpaXTadgqGDsnLp7qGwS4xxr83WGIyhwZIL4bW6UYjxOHlUV+9ou2zZuBBwwT1zYjuXlmibsEgABWk/lH4T/HB3xmvJ8oc7HB3jmph6TWWDX0t+Uth/JFmt/QLaYu1g+hv+dVvooCwt++Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784619298; c=relaxed/simple;
	bh=IH+fA/tWIwhGXGABscWzwYwKIxTnu6htnra/ydQjCMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KnXclkrAcJXJyzrYfW86D09XeJ8t1U5x79w3/U8WJtLh4g456KSixqGkupjBDl9CiO4CZYE1CdJSFfNaK8psawWp/wSugMwxCQc4Xj++klPrWx3VnKE4JsxE1ahNgiFtgaENYctmgQhZ7rndNjTJDvfDyE1EK11i2DahmZk/CmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NAlg+NBJ; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NAlg+NBJ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso7127702f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Jul 2026 00:34:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784619295; cv=none;
        d=google.com; s=arc-20260327;
        b=sXJozV34FaLrBOCSXksDY71SMQcqJdwxFhQfi/SvB0zkYfHPrPlfekT+/4gTn5qnuq
         j3OWVPO+Typp93+XIyEywtN+Tlud4m4ERDvFjl8SuAKkF8Cs/rov/eglN/52pxtWn68v
         suDelAYzkc2eXghCvIT5Xi6kafINtNZz/GncmYRWmGJhRR98ayZo2UiDOJG366vJnX4g
         XCZ33uLlkSl6YVh0O/tDhxTEyxLqnK9n+eUmYVVDhTRCzDo/8oHbAwUPZYBtrZyIVabD
         QWkAz586moWItcS6QjDp25MM2E+8L7UbTmXtr3MpY8PSGudNsKv6H0fWRi//ozGiJ87g
         H1gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IH+fA/tWIwhGXGABscWzwYwKIxTnu6htnra/ydQjCMM=;
        fh=XMSlWvGfoII7zgYh+XG1Bdlh9uzGpiZGKeQ77V7qrSk=;
        b=nWtQVBh6lKHGASEeTDrMGWsm49I3GzarJ5pQ0A8N3JDBFaksTrOXaa2odg0lJ1fbuz
         l/bkEgkS5A6k5dvXBy0yyvzgBfehQW72tOippVnz+FvF467bglc12BMMgJQwhHRRm2Pf
         O/Y2Qtl1mh+45Qog3Aw/sMimO8QvYtPSykNdoHu/ZylMebtJj3QkcNQAZ26K8g+5V0a8
         MHWd+7aAi+hRUyEqAsDdvRAyGh+agqw0SIvX9VLkb3R3LxKpQxAgaZqkbW54bfsOntIC
         RIxDkgXpwuVI8BpYEbciun18UgZAmloB5lpGkRR2k/5dt+3D/S+rytSIiNaWfV8ghUAv
         rCuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784619295; x=1785224095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IH+fA/tWIwhGXGABscWzwYwKIxTnu6htnra/ydQjCMM=;
        b=NAlg+NBJ1w0CbG2ujx801xWzOyTGne3uf5qZTKTIkvVqS9JntvvQWWvvlfX7Cx4HDr
         imXJaifMVhkgFmmymryIOo0KQQm6c0cVLtTDzXdcSDs9TH8FMff84+o0SHM82t38o/Xm
         GlrOnN+WSA9lncfC6XfENX8j0Q/+2c5I/9vBJ/o15XNDZ+1t5JZYyNW5FsbHA4U0XOML
         IrIE4pUpbwUNBzEHNrHDOcq9FW8J9kox80nXmP/qvUfxNyTgrWQVYNypKAuFAXWdM1GE
         MqUSn4LBdp33BDtnWZO3TwZqDjtDZHVfo/PDGumXitg7Hbe+5879bEaIto4VZ0bqss98
         JO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784619295; x=1785224095;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IH+fA/tWIwhGXGABscWzwYwKIxTnu6htnra/ydQjCMM=;
        b=lIG7geHZNZ2WBNYoKkyM9y1Nd2X8p3bdXPC9x7p16RNsTij/NUlUA2bvsnRqM2fg/E
         bQi0zKzfY0xJBaH1OyhjA69ClrVljWEdwpcx6MeiOGnIAckDvH2krhWu0mJzSqiJX+en
         k2Q/TqmajVI9ka3IW/TdNp1SBwqGEKn5joT5BiNbTjs/OxsNLUTQnaeMqnmWuj7uf8JP
         LTPedOLmW/+dojErDcXhrdMS4EaPMf7TTcN8ff4p4pmbrKVYIiPG3cc+ecUovOqHLGkc
         GcDYNsAkTWB/BhmLzKkET0ug1nmkuB0SNCvvhuzR8YdnE4BohMLNQWSvZtVuLDlhJdho
         y9lw==
X-Forwarded-Encrypted: i=1; AHgh+RqmgCHcWAPKeNXL4fxCYP5T2C+UePYJWA+SFvDlTRhLMo/tzFMRnQnw2hJy9A9Xa2bgPK667k1TfOfoG9Ud0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcMHA/9BbYASqYTLX2IKjt92RiaUS2j52Lf/A45Vpe4el7lvJe
	kMAJ+yqtoxu5TGqVA3mMxtT6MSd7DH2A2QOHgsD2L5/muYG9p8HPp0L6cznhvBB7UPQjFwck6av
	J3KgpNOu2XM7fLJlHcEb7rEtJ1c4t8E9QVu7RbMKj
X-Gm-Gg: AR+sD10HqfQayt03hjhnMbVmmEYLvmnrl5l6cXdBs91J7DqyGg+hGJvFkZsuzaqLhSU
	eVJaDRTanQ9gRPu7DZ6K3jgpO3suzle/nnoJfaY8UkdJ406g/ciMNGEOh7ydjLCnt6uldoYsCjO
	5MGrbds5Vh3JgNzR6UMoSDtteTwBADrcXmtgLOAllgi0F5pjv+5uqZwYVhdar6jKQs2mHYzl1sz
	TZn2/Mmh5SRYKFs7eFw43ekQgDy454xQWlxksBbIM+x3Fni7yuNzxP3bmVANco5UQ0ti+yXFtYm
	/bM+y2tvTz74znpcYYqs/1pzyRQWmO3uyM6+wzLl6NkLVK8=
X-Received: by 2002:a05:6000:3113:b0:477:47c6:36e5 with SMTP id
 ffacd0b85a97d-47f6230dc46mr22141711f8f.25.1784619295093; Tue, 21 Jul 2026
 00:34:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610133241.374115-1-georgeandrout13@gmail.com> <20260616170956.2580772-1-georgeandrout13@gmail.com>
In-Reply-To: <20260616170956.2580772-1-georgeandrout13@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 21 Jul 2026 09:34:37 +0200
X-Gm-Features: AUfX_mzHCGDGgiLZZ7_h2z_pCj13NSac0WMLZ0VWES0nh-G_NKnTO0Rh_qv0PlI
Message-ID: <CAH5fLgjk0BxY142AfJZC14ZYsU5_rO3NNSrP3oLm53pjy4yzyw@mail.gmail.com>
Subject: Re: [PATCH v3] rust_binder: add ownership assertion to Node::add_death
To: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: gregkh@linuxfoundation.org, cmllamas@google.com, arve@android.com, 
	tkjos@android.com, brauner@kernel.org, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	paul@paul-moore.com, work@onurozkan.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 7:10=E2=80=AFPM Georgios Androutsopoulos
<georgeandrout13@gmail.com> wrote:
>
> The `// SAFETY:` comment in NodeDeath::set_cleared assumes that a
> NodeDeath is never inserted into the death list of any Node other than
> its owner. However, this invariant is not enforced by the safe function
> Node::add_death, which inserts NodeDeath into the death list without
> checking that death.node =3D=3D self, leaving a risk for future code that
> may miss this implicit invariant and cause undefined behavior.
>
> Add an assertion to make this precondition explicit and catch potential
> violations early.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1237
>
> Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
