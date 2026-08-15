Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE8B4229C6
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Aug 2026 14:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786805752; cv=pass; b=MlyTeCX9FzI4Y2QQ3gZgoEwkJjyuYVbqxj/0+Xu2aRQfFRGQKb8X1QlkraeEGGegsQL7m8ZWDNcJCjobimU1U1kfNCI+lxllHUv2L8/fa5kV/EKLUdlUSj6vp+tbJuHs30HjHWCHRkl3gEItGEUxENDIkIpPLCyaBm+g8OYxvYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786805752; c=relaxed/simple;
	bh=Bs7AE5xwnfhkYLaQ+usHQbTHTWeoi6PVJzqtcaJ14ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uteFIGA6bnqyjJRBtzbSmPcHT9BscDyrblOLGsMmjbrTu8/hxx5EqZ7eQEWO7Rdtmq3KKVbfLGgYtaw0D+dqS1O4PnFaRIQPno7igM3JWV90tzdgZCQzRrJaD1dU/+il8Zz+c9tqhtk+VO0ArvBllboLS5Cq98f8jm8FjQH0K2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWDuxBV1; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWDuxBV1"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf110997efso5661415ad.2
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Aug 2026 07:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786805748; cv=none;
        d=google.com; s=arc-20260327;
        b=m7SI5FHBJnr5nY+t9uZL4KHiDsesFbutBxjp0Ysr8dw3AmEtSo+kbw1YrOOEbNUROt
         n6wK7Vv5yVwhlEuTG5IG0lPDwMmZHLKw0pNHvUSnlcDsRfS58mcHgD5AyD6zuCN44Pju
         hdQaQLZVTwxEyQOmCH5BaJx2bdVydYO1YMIJNhWbiuwzAAweN7Flnz9QvOthDBVF6dJX
         +qI4G0k51WwnZCGA9UAD4tNDnIkkUkhhBNwEmv3nGv+msCYoMhQ1TSUhdtgcKFimzU9q
         jo85mCHeHR5wiUhFyVhAQARffE9/6DaeHx+YSdjl45CCkeeZHvFIHMDPVKW6ZuIh5zg/
         pJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bs7AE5xwnfhkYLaQ+usHQbTHTWeoi6PVJzqtcaJ14ts=;
        fh=UvxYPt71bxQwYjLUET/viR97lZtnSnQaDaP2lEMEGi0=;
        b=nDlq4DdexL5Cs4/A7OSFeOfWDaRuQq+QvGfkN0M5chjuz7K9l+e/JEdSMmCSKkwukC
         ehcEW8LPTnG1CJG75RlvaeLoH1O1QkWSsrfNyKMyDeGi9t1D0nO4WXqVQXa/+ytRwJs2
         fVz8LrQO4blpIqUaqVIhjLK+LOaKVjYpkTxGiH/0jK/FJli2WpEESjzEcFtRzVrSdCkV
         Xv9NX0nJlZB0eJ+cmCjGnum+ainA2GDxtZv3StmyOhqnw+W2G51BGCG6rpv8lqr32oqZ
         vtpkQNCDLUf5ghMg1iFoxOeQwSRHHW65E1feAN32nTayEOAYh9r8DTEUNcMemm1WlPUG
         06LQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786805748; x=1787410548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bs7AE5xwnfhkYLaQ+usHQbTHTWeoi6PVJzqtcaJ14ts=;
        b=cWDuxBV1cJ1yRVSvegh8PKgPzeM5C1nkbibaecfHYeURX6ST/4CWBk8BGjsLB04q1H
         gCeC5wduGT5cVLWblK5F8kGJY4VhTi8cqCLd2F6s0UCV8KkrDrzP9jE7YmUdZLn1XSiR
         sa9HAr4/aJoCbPIdQ7zIejkEoDi8aY1DYSUVL/KJhNY1oWvmG7LiilRAa8Zz2DApfJCA
         NnV0qKn3MXfLE26XrAVHQbx/D9id3xqYc51VC0nFH9BEy+f1rPi0iKQO0C5dLgExlya7
         Kt+UAU2EeR5HpEi+gJx9U9QnHX81zANSABFHmaArYyvmxeZe71UFnvjYIkXlOzg+VJ3D
         fjtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786805748; x=1787410548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bs7AE5xwnfhkYLaQ+usHQbTHTWeoi6PVJzqtcaJ14ts=;
        b=hfkSt/SbD8roOLBgper9indPQSkQOSTgIrmzHX75WiAD5+KHgFTJL7EfhuwJ4I0Uo5
         k+H046x8kP9Gp7vJoURDp0ClC2xGDGqd58tv1krmcg5geZtQpAIqSZlBBkzaPY5HqBHS
         2TD9eGiSkTqHk2zvI2xTinSiqLhcJ9f22lPmUUFq+JVl49raTjLWwpCQhtCrjnezOsTo
         N2OhQ5dpSpkhbiCAZf3I3kSEUNOCqH0IbsHb1G8hKeU/7HzV1LeP44un66gZ9zpDmm1A
         MnlDOUlG77kgYYGxrx5LF337h7f3YXKi3UgEOTFyZivsb835fKItgmH9HdRWBdaDUZWc
         6zOg==
X-Forwarded-Encrypted: i=1; AHgh+RoFcioRt47sEdQtCwR0yD9BHMf6LFRdfXI1GNDSrMQ27yLGhKYF4X5j3l0uZUFq7MOTZyQUa77bfBCm0C736A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw585D62ST7VpArWuCKR1D/2MyZYlMw33mQ/FR1Vh+kkIwTMerV
	b/qufpR7hcadAwiiulNCUCv94Q1esIHTGSN5u9Hs98DGG2Ng6vEh3dRcQaYl3MqqVrYz2OjmLWw
	JUgSDmZu+k5P6d9mMqqI98/0C2/cxb2M=
X-Gm-Gg: AR+sD13a1wYVaiux/jubelyGZrCdIdr1m5Msdim6D9mwuzXOL9YzizxnzZSu7iICJgU
	JnJwd1sbbw3etMIR4GaNlSXP8rvUPd75MGSC2KejZAhRQf+dYnJVx1RhAXVSWuaXb1GC2pQX009
	4tCc4JBJzZUHyFllESpEh/57VwtRGSIxfjbTl/aK9DsqZ1QBBUAqk7ZAVzZyh+WOMKbjXZZclL/
	DTG+9BpNHTUVjDcpUlfph2DBVvXuy/IG0Mu18Ns0KJSo4FzVp3UQQUcRyu+DKSBFaLEXv3SgNhu
	zJDTn/ZuM8r4SJdxRkHbWgUwPBCkc9zA2rf35tD0mTBI6BdoJBD/h44vb6in0ukl9y7hn3n8FyK
	4YrFMb8FZWh5wFXRyQQNl3nAlDi4hrT88w93nbmEJg+Tn8v9ecSfF88Zd0i1C
X-Received: by 2002:a17:902:fd90:b0:2d3:71af:782a with SMTP id
 d9443c01a7336-2d3b080bfb7mr111577345ad.0.1786805747955; Sat, 15 Aug 2026
 07:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805144524.233362-1-ojeda@kernel.org>
In-Reply-To: <20260805144524.233362-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 15 Aug 2026 16:55:35 +0200
X-Gm-Features: AcwNN1XET-nDOFiVjEcSQSRuW3YUMsb9orAASajtSzPa2T6jEXdJHhnRkLQJpZU
Message-ID: <CANiq72kBrbV827gHUXd4R3AJrMTAVwxA=vGvzJ_AuOcNjVfVtg@mail.gmail.com>
Subject: Re: [PATCH] objtool/rust: add one more `noreturn` Rust function
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, Ke Sun <sunke@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 5, 2026 at 4:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> When the pointer formatting series [1] is applied and KUnit tests
> are enabled, `objtool` would report an error with any of our
> supported Rust versions. For instance, with Rust 1.97.1:

With the version that I applied of that series, this was not strictly
needed anymore.

Cheers,
Miguel
