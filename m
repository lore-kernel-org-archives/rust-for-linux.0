Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D66E1CB31C
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Nov 2024 17:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730481844; cv=none; b=tUpulgWkyZigVYRFFUcgk635j+QgNzrkA1zU+UwA6f8UIil9hqpPSxO6K6pCn1utW+3EkCJLHR4kGUnvnL7PdFCMcmPupY8IMisdE860iQzRwD24f1x48anV4vgRW/ErNvG6TkuAU/bUrX/BjGtxT1KGaLEywXgSl+dlLKYmja8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730481844; c=relaxed/simple;
	bh=5Ze0oMVpd7esn17n48EUZ828ncrIkV3f/lwhsAsJY8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C1WLb6R0yrNLNhpPe8I3gEsHMp5abMM/YDDDYMPtGLbnt4QBOZuAq4QvUHx4TfmjHR0DkUq6BlVQK433qoLn7aqLyWyDWnvfdSEa8CdgtGmTcq/A/GxFq11aFR0qRTe8IeQTEPLisvpJ8w9keqFZV0sLmeSpVMm9/fGHtrtCiF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BcMkgBSZ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BcMkgBSZ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d4821e6b4so1285426f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Nov 2024 10:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730481841; x=1731086641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8U8boQju9UD7cMDd+o8Hz/4j/OEfee/wZzmom4khjls=;
        b=BcMkgBSZSGzjSA2aSwlo3a+/hkzsuQgtY+yjss8JyTLJtojWDcYLW1ySgiPnTzHVU8
         rMEUUW/aaSS+T1lDTJnZwCDOGVJ8Z03+Ps5Olpn016y8fVnaMNzqi+1kTtplusk/ahCT
         mYm00Bom+TFW+lKaePe7aktNPcU0WTT85yau6SGeuZwhqP3dEkVk3TyN9db1KVPmhVuR
         EEM8p4pyObROAHzz/2f/OUj6N8m1q1vxIq59rsDTQNQ8J94wwt0m0/7HUdHquYTNCt8H
         MHVjJ8ZeLBdPRzRuRgu1hH72TamdTDQnTR2JlHJmvKmHw+d1OteqAiXTQazDBxgBCqz3
         UKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730481841; x=1731086641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8U8boQju9UD7cMDd+o8Hz/4j/OEfee/wZzmom4khjls=;
        b=GytGmPnFpluwQM4hMZVKvl7IWXZosZpAmzyA/4aru9ZZs44T9jh6YUdqGesNTXDKdD
         ILf/Kl9TkF5+B8Wn0f6pkGzMwu+1PR6aH0zSER4h9dnXPEyI2iJ2wbUKm6IQqvTNIUI4
         OjJz3tA7r76CuAWmtFk1O+D+XJm/QRw7kDGw6U7LTvCdSTaJX176z4ynxKMXprgpkChT
         q4kw8WJC/PmAYWoiexHS2uGngAkyF7Mmro2YoqbUSjRkikcjvvtxCcqbhOOTVlp3Sn3P
         3e2LEMeSpDut/8gZxIyMfUoL/n0UukF6NvickBc7bEJMLKzzhnawozZYsyY9hW/ACOMC
         0xPA==
X-Forwarded-Encrypted: i=1; AJvYcCU43nuYvTx64TpDhZwM3EQ3AksFM/8u0RSUMPMPs8VvLtimhoTevfriMSLQ3WjT50Co93+g7hCv6EmGfAOPVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnOcoiJsnFleWkl1CujkBPETRdypPZlDNsmJAw5u7lnFn12y82
	BnhY0u0ouLBhpsdnekjnDizl1/RQOhnlZdXA83/HdaV4wkncrTAJsd4DgzDmSjOANZr3RyQWt+4
	6dIXTtXDZA/Ga7gI8FzyUT7K7dBp5kwu3cVD4
X-Google-Smtp-Source: AGHT+IF4hcxyedLIMOPn8nMy7+F641Gd27skBE/RYnN0eX7rdXQ6YzSyerup1MTKbgeibRz0uXbWgXKA/vaNrfr5FlE=
X-Received: by 2002:adf:f18c:0:b0:374:c621:3d67 with SMTP id
 ffacd0b85a97d-38061137930mr17910173f8f.24.1730481841156; Fri, 01 Nov 2024
 10:24:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYv_Y2tzs+uYhMGtfUK9dSYV2mFr6WyKEzJazDsdk9o5zw@mail.gmail.com>
 <20241101095620.2526421-1-aliceryhl@google.com> <CAHC9VhS5wLQeF4LX67UgUYVG3oViA7CmSZS_kugH+M5J0XS2Vg@mail.gmail.com>
 <CANiq72kcvpEqpwFTNFmxfJsfBMeBNiDrrvFBf_iS7+ozaECJzw@mail.gmail.com> <CAHC9VhTQMo11s7mWg=zzDusJompOp01uJat-q9HjQCoEWzHRRQ@mail.gmail.com>
In-Reply-To: <CAHC9VhTQMo11s7mWg=zzDusJompOp01uJat-q9HjQCoEWzHRRQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 1 Nov 2024 18:23:47 +0100
Message-ID: <CAH5fLgi+JJHCA_XTPC0-kaacZC6=aGSa-+DiNt06GSJNFhKc3w@mail.gmail.com>
Subject: Re: [PATCH] rust: lsm: replace context+len with lsm_context
To: Paul Moore <paul@paul-moore.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, naresh.kamboju@linaro.org, 
	casey@schaufler-ca.com, anders.roxell@linaro.org, arnd@arndb.de, 
	brauner@kernel.org, dan.carpenter@linaro.org, kees@kernel.org, 
	linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, ojeda@kernel.org, 
	regressions@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, lkft@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 6:11=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Fri, Nov 1, 2024 at 1:04=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> > On Fri, Nov 1, 2024 at 5:56=E2=80=AFPM Paul Moore <paul@paul-moore.com>=
 wrote:
> > >
> > > Thanks Alice.  Would you like me to pull this in via the LSM tree wit=
h
> > > the associated LSM changes, or would you prefer to do this some other
> > > way?
> > >
> > > I'm going to merge this into lsm/dev for now so that we fix the issue
> > > in linux-next, but I'm happy to drop it or do something else, let me
> > > know.
> >
> > Christian has the VFS side, and both are needed for this -- do you
> > mean you will cross-merge vfs' branch too?
>
> I think our last emails crossed paths.  I'm not going to merge this
> via the LSM tree as we don't have the Rust security.c helpers.
> Ideally it would have been better to have the Rust LSM/security
> helpers in the LSM tree for reasons like this, but it looks like it's
> too late for that now.

If Christian is okay with rewriting the vfs.rust.file tree, we can
drop commit 94d356c0335f ("rust: security: add abstraction for
secctx") from there and I'll update it and send it for inclusion in
the LSM tree instead. I'll need to drop the piece that ties together
`struct cred` and `secctx` from the patch, but I can follow up with a
small patch for that for the 6.14 merge window.

Alice
