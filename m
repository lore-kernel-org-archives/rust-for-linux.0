Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792516184;
	b=uCSKJPdJzh41vZPnbWxMPl2y7zV2iNqy/SKrzX0RG73bEuoiJqIpzkFFqMfYpTQmkmuT
	 4P7MorKVhuWE5P7/CZgxOmRwyOCfzOUittBUcNwJZmmpRWXE3CHMcx8+p4CPZReFSZnO2
	 ZrbQc5LFkfHITEfB49LvL2NN1PsynZ3z4V2m35or5kSrkFQnyYIT3gxfA2K8pHtotzMF5
	 e1+l688nTI6kxMY0hK4DudD3sQJtuRFN6cEmz4MWpSv0V9iKRAk22KYzOQ2cUHX9FNIe1
	 FE2aAvUdi8noQFIWqo//3wx6hX3FLTPlSek+99NjjqVwU73/9pxPpEd6Ay0fpy8HAJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
	b=zeWi5wgfWWbyo0XlHpqiHUgfSP/Q5KFG7GWyCO4/WI0oKAceGwBM98MgCaJX0m7UiDiO
	 504imOkAXTGzvGGZdLRyiMlQq+a0ToLdeiRuViz71FVaRtoOZiym6/8zn8fkQ4aA2qRa/
	 nPeQ/F6vMzJssraT+gumLqSiBSQzM7tf1aoDGNTCCFEF4SGkN1ZGd6gwnjmzcWgCBuctW
	 Kq5CNkaUhhgL1c779j9wXClHI07iOQhTo0gVBmGdC9L66BLG4W68a3XvktrJiYJplp22s
	 R8MH/fMlSrz+BVOWbtJ2MyLLRtXUaUg+BQWeX89JE/37cSUKyk7kRBUidhZB36gV0Rw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GgmF2Jax;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3EC606A31B
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 17:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C3EC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GgmF2Jax
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-34c522572bfso363796eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 10:09:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792516183; cv=none;
        d=google.com; s=arc-20260327;
        b=jFi3yqnPBLFWDpSh6+aNYbRsP+xUtyrlzYoztbYg0IFsPDPeBQvISPP/NrjkXpJzdJ
         odspdDOwx+N2zG370AQojf7Fb8UUNWAuYT5k4lYz5Mfe+spJVQlhMu0fwAoxoGBe6Fax
         pGSG18JiCKCkP2Fp86Uowq6PHcJxvyZNTng+7YYiiCOEnWjo2toPDMZDUlfvplYhm5VS
         LWb/CcqQgcjHob8h6nQdTlC3S7XI26iv9g2nEfDiKgWeFuhIPtvzy7Z+iZQErYgEWiwX
         S302KgSw+RmznHNiERVGjdYj4LIxCCosiBY86hZfxKY9XhCQmPa1MgNMOjuKeibVdjeM
         C3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
        fh=OVFi98KPTzU6W4qAezW+Ml8dawdcTwHPY9392OPZl8w=;
        b=octfhKOqVFAOPO9DcMxDC86MNyjRUnZ0ZsvKLDRmayMCGFe4HGZqjMtDIG6+yqoTYE
         WTrAGFnnpHY/NSgnNGxF15JFE7hGvCkH8SGwu/3kfHhmpREd/euDpSOmzZfUwo7sIQlh
         UCfPMx48IKW0hnWaciAnRXBil/6qyEx0m4lyUHDl2IjVOT2zXH03fno94jsdZaPNPvqM
         S4uygI4KT36WG4HC7OwD7fVhSlK0ZuIVPbQMIUZduzcUxRwKeciEF+7dmvDgO5dG0OPT
         KjEc6gMEPwuoNGAPsqiPPsD1J4c/qzjPihg9MmcFigLba6RUsTlZY2XFYy4WuLS2LtYF
         H/8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792516183; x=1793120983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
        b=GgmF2JaxWihTIKDQ6w9Iw49mFFy5aK7i+arMpdqj1xFBZLC/BS6rk5OF/MK6uP3C5W
         Jm9AVWMUFJh71vwBZX3czhYiBhPmmlT5Kac9X/v+QcHpJQ8f9DqjtSVviuIYnrEbUEQN
         HrLBLhDBH6fz6JaVN/0P8fjbNrPFw2VkAC4oSASuN5StwnebufW+K5n02y4z1Brz8C2j
         Je7MfkrR4VD6tZWibyrGI9bieSv5thwGC5hCQFe3lz7lL1hplpRFHxXl1e6ZlXE0+nts
         pLDPKbetGl6E42S5j+URmNQBC5/Z5LZ9ilfOpLld+c9Fpb3jJggJWBhJRv1wg7lcyCL5
         xQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792516183; x=1793120983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
        b=Q7skxhqDNCqnryRjjyAhNoajeVgTA5yBmyKqU71lVZipRNotykRAwMQxj0TBfP1Smm
         s3fCos1WwcXdmH35NHLocTo3ZdE/voYs/GEHYJygGpzCyZPbnGaaBrpJ4dgMkXNf+mFv
         fGt2YcqVam58sgHAUmXuR08n3OkNdWYEajZWv5ayx/e39RJrl//mWjlLiN0n+/yw3xAE
         Os63d50inKyiypIv4CJ6q3F9aOxQIdP3lYWT4a+0UfdrOjlTeSi0lIdsBpX3JgKAxeXy
         IQjUMC+1ZW/lrmsAPjR5klzeK5FFM97EQqH+ISmsJD3y8NWMs9AsQcd6b5T9JUmipcV3
         IHmw==
X-Forwarded-Encrypted: i=1; AKwUvBziC308GSB8HuCGX9h2UjjNezbP/kgLoNxnxlpJfM54+SUbHSy+0lTveBOETY6rA8A0Qj4czQ3uJS12Xoz9PA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJCCDhJMvmtPrIUsIZPFjgRUm154lclsTIjmorWJg5sd9h/loXi
	z8n/1+k9Ro6qjTmrIb8wnr+1yqg9lKbm9OiqE9qHlhdK9heuZ5hXZDGKmKD5PJNGticAbMq/HhK
	NsDTG6WxAB8bNkrj0KttEaGvQLAj+h9I=
X-Gm-Gg: AYBFou03VExh6bGaoWpNB7KQXEgt5dVxASj/mG8kPchjTmb6RXCP7OlZ+B96YVjMu2e
	7bDN32o672Ca/tAqbqgPp/FpCBm+N486ROAzboOm1v83Tiz7RTSmVQc7rLaBIHQoPMekDCw7KBq
	20mVP2m9NTe/SnOdZK0j9Z13fsIDVrWE0K5JYcNHkqG/FPzkZDtsHaaN6BMVviU0m+UpkOtvF/a
	sV4h+DU8kstgYzwcDwa7nJEyb1VwrXwLJfU/TP2teN5amlkJB8MNvrbkTmW+U2h/I302H8FM7V0
	bnWZkgeXoc77CXyGqX872HS68tYd/5n3Je5X2Ptx4pPF1+PDBXsGGK64ROjU+2O2VgCKkdbiSsQ
	NBIqMpVqI08AS6Me1QS6HA6FUx1UWzjXF8pOTNSbtBGYv88DzW0uIty2DVCl3Nu49dTZq95gIvo
	vzo2mDfV4oGGsUWlX6LWAiP/Vm2jncoOPEqW8iZ43pdi9BboPy8vg=
X-Received: by 2002:a05:7301:da84:b0:358:7ed4:a049 with SMTP id
 5a478bee46e88-3619b212ef3mr24985185eec.0.1792516182799; Tue, 20 Oct 2026
 10:09:42 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
 <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com> <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
In-Reply-To: <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 19:09:28 +0200
X-Gm-Features: AclHuK9D4Eg255wKZ2sPBwolmAnynFBIgoIfmMAgFcQGyxFl5TrsNoPPIa_966w
Message-ID: <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Gary Guo <gary@garyguo.net>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 12:34=E2=80=AFPM Marco Elver <elver@google.com> wro=
te:
>
> Happy to take it - but in the interest of avoiding conflicts, thought
> it might be better suited for the Rust (or Kbuild trees).

Same -- happy to take it too next cycle, whatever you prefer.

> Needs some -next time, too.
>
> If I don't hear otherwise, I'll pick it up later this week / next week.

Do you mean for this cycle? Linus may not like that, but up to you of cours=
e.

Cheers,
Miguel
