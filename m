Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EEB2D05D
	for <rust-for-linux@vger.kernel.org>; Sun,  2 Nov 2025 12:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762084853; cv=none; b=FJcNn10fCfCEX3ZUJ9bJdSGz+hyoXK5tv3B1QNWCcFunP/8y5/Y6rd17MXU8YzomfrducbWfavCINzaQEMROqb+eiZvQmZ9BOkBSxOlSgu9VZfsoQsnd8KTp9lB7o5IONynhGFXbHeUYLZMkJPh4+1WtxAihdUFLi95F9IcAcp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762084853; c=relaxed/simple;
	bh=ImPMRxZE4lvqKQdH+wgO71LR1NW3tyk8kMwFImMi8M8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OToCSaqHVeWyB4xqtWwZk7ykkj2I3znmRA4uyShQnLKLIYoR7CwILInIgr3oI/7IGJuRnKA79xisK0W/CdFKkYbCNs42mcm7G0yCbw1SZdcVownRNWnBZ+0dEVfHOWWlqOr0VuWWViUudYNt4PZCFz2LmgIFJfbi3MVMyQ3Mi2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNF+/GA+; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNF+/GA+"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7aacc98b904so41420b3a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 02 Nov 2025 04:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762084852; x=1762689652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImPMRxZE4lvqKQdH+wgO71LR1NW3tyk8kMwFImMi8M8=;
        b=WNF+/GA+oenV6oX0hToWpSZCPYGFt35BVbRPVsIX8XJSYp8Hd7i1pRt++3/2ZATxAi
         CWjUa2/oFWjBSqFP7i2OvOX97HKMsclwvHGQa1aLQLyHMqNHw3/u+bk+y7Ml+kW+77Ih
         4OCFE+jByBkJMBfGDRt3azoe9mADmHCZ2+6z9ZpYk0nzGkH0u9ViTaaEdYQSRYgh+BG+
         kBSlBHgmRXTdL3XakBeqkW6qB+oDRPo3fyCccn8r/00o/ezxRhThCcHi7aARiHVem/x8
         He+8qz0nfXXOBoZ8Hqn1Mg35J5HWxiOrufhQwlRVyTz7Mpwmg99UQfg8mZBIoUWic4Eu
         AL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762084852; x=1762689652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ImPMRxZE4lvqKQdH+wgO71LR1NW3tyk8kMwFImMi8M8=;
        b=tKIbwDMmaKygijSZZ34wMbAZotI2KxAuEBW5Ygk68djbFsGSrF7fUpXJXr5+/7QYYA
         ie/TAx8fd7UqtoT/jZbsHVJUEfw3VF44+an/BDdgo/PORGUYUyQsRxp+7LA6TbybaWDi
         3v7cLA/3/Ui2pDytFDcGVeFVYip06Nf7taApSLCtchP5OvxZhBifgOkuOsC3EyJKV12Q
         ZDF1NL9UbDvQVP32Bm5v8sX/k0NffMtPdoyAMwWhjTisVkBsw2ntybQDbxLxEyMrzifd
         Ga6i0R/gkLsIqdYCMAC9/JiSHC5YLl8RKFMLEqxghxFLJUNLH2+3fNjDOsDm/e6KF+bB
         8GSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIqOWfGUnvfF8/+FBltF6CLzZQsasQTGtSiS5x/MPTU4+GjlWeDscVFQvt6Bq3EoFq9ya+6KvlJc5EebH+lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwG+awAMkHmDP+t3HCTyzt8ovgYmgWPcAVrj3/I8lywzyZs6eKy
	gm02e6Fd9+yzF1OfVSXZa3vZt7b+QkkT72enXfvPugIYRwmPMab22ubtIAEtiGVQlDtCKwQinvx
	SJms8acxtzy0hmCId8R4QpaTYMD44FkFwGLrm9KA=
X-Gm-Gg: ASbGncvp4CRXYDetOCWG85g+DflMB8CJUeV5WmvnECZayuWiYiPMOsT4dxu8WmUzHHx
	eHVl4tfFZ7o7jAKB9R9n/J2iYRMq+wjS0l/UaIgWDhomyOvW+Kozcq13/MKtPaF+Ki4Idqhdqxo
	762sHUldNSclWbC+a3R3wpLOaht7gZqiI8RGPQSZ3MMwMljs1muRyhDY/G7+CNUPoGCdqhta3pM
	0JSaO+TeRY/o5+BgZ2a25kpmMiTBN2VqgYwEGft1cbYxY/3mGmnBtXpoP7jhBO+vG/4qX4TcSw7
	8JZjRysqYaEaMgRY4Al7pbJqcyRL0itpQLXvgl4xwt8637rCJ1/khpVoH1kXXQAAbqF987FQ+Vp
	vrPEI8b6LAmJ64w==
X-Google-Smtp-Source: AGHT+IFlgxIxcweJjpgvdwNQZG2ObtUFGP6xwJxym9cLEe/yblvm5Um+k4aAXaoyZYzWM0OT+gOTsLm5UbIq0wEpl3A=
X-Received: by 2002:a17:902:ec87:b0:295:8da5:c633 with SMTP id
 d9443c01a7336-2958da5cad3mr14628385ad.10.1762084851701; Sun, 02 Nov 2025
 04:00:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101-b4-as-flattened-v1-1-860f2ebeedfd@nvidia.com>
 <CANiq72n6KLjA5XQmAhy=SRTnWY8sCCmp9ETnB-dTSVZ84-mjzw@mail.gmail.com> <DDXUPAELH6C2.3JK5JVGP87V8N@nvidia.com>
In-Reply-To: <DDXUPAELH6C2.3JK5JVGP87V8N@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 2 Nov 2025 13:00:38 +0100
X-Gm-Features: AWmQ_blSZ_mArdZ9J5G_VoH8zTPY8nJrqB6TsxhMMXSS3qgYUhTO7Nq8nGrdlro
Message-ID: <CANiq72nakhVrfK=pyz8VBo95NJHpoeDXRkqUBc4GXSdroYuAQQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] rust: enable slice_flatten feature and abstract it
 through an extension trait
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 2, 2025 at 3:25=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Also not all of these seem to be tied to a feature;
> `RUSTC_HAS_FILE_AS_C_STR` appears to refer to the
> `Location::file_as_c_str` method, which is behind the `file_with_nul`
> feature.

So what happens there is that there are 3 states: "not implemented",
"unstable" and "unstable but changed". That is, one transition is when
the stdlib added it and the other when it changed.

Now, normally there are only 2: "not implemented" and "unstable", and
thus using the feature name makes sense there, because we use the
Kconfig symbol to enable the feature conditionally, not individual
methods (and a feature may contain different methods or even language
features etc.).

There is also the "stable" state of course -- the features don't get
removed internally when stabilized, and in fact there is a lint that
tells you about it (using that information), but we allow it, so it
all works without extra complexity.

In this case, we have 2 states but the other ones: "unstable" and
"unstable but changed", because `slice_flatten` exists for way longer
than our MSRV. And for this transition, for the other feature, we used
the renamed method name, which makes sense since that is what got
renamed, e.g. it could happen that a feature has 10 methods, and 2 get
renamed in version X.

So I think what you have in your patch actually makes more sense,
since you are in the rename transition, not the feature addition one
(i.e. we unconditionally enable `slice_flatten`).

I guess we could come up with a different naming scheme to distinguish
both cases or similar. For instance, we could add `FEATURE_` to the
cases of the first transition. Anyway, it is not a big deal since we
don't expect to have a ton of these -- quite the opposite, hopefully
we can get rid them soon. And I wouldn't invert the logic of those
equations, I think that gets even more confusing.

So apologies for the noise there :) At least I hope it clarifies a bit...

Cheers,
Miguel
