Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B923530B53C
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 19:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770320080; cv=pass; b=AZR12noo5+o/S2C2CS3PbMwA0iz5RUyQTjr5JTf1GcXRk7OPTUIzIZtt/K3qdzQguNenWdGRzBOaxL8fw35DKleSjJZJrrL6iJY2RzyqncmPOidKR60b66/xA9psLusyLh2J8jUJS+SqHHbp4k9rKzKxS1kCqpNlbRdT8BiLFdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770320080; c=relaxed/simple;
	bh=Fkc9V2w5LCx5vxvCS4OBbSZnYWzsDBvR693KSERcN+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W8s+zJQvsLxz8+dSJ0vy9hPDtQWf7UlKZe7MlGMxdymnBEj4NUrcBmZkplDOQMWekXZZ+zc+abjFs6PvOogj9q41m3WoZxL8nBSR2QZ4bekjTrpWUvgPpbueZKYU6jrpzKCFTh5AgDJYI6GUhsx1wMc+GmlHD4omoQeOAqvu9k4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pl4qgpiB; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pl4qgpiB"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-124b07e5fe4so73420c88.3
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 11:34:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770320080; cv=none;
        d=google.com; s=arc-20240605;
        b=ligSZiwao6YrE7GCku/3OH01NSEfUJkv9DQ2Y4wgouhyYwMOgWY8avR/uBw/61U0vf
         6OzhkIfDoVNMLspoR6niU1G30lkscV+q62oZaiLpI3rHOkNkPB1FZGZHMROVwLBhJrCS
         9hGOCXCwykanAOvlN4vV1/gcKvi3Kz8ZQYk6vYWpatoouJeGF+k5+REVNHrgEEjDv0kZ
         JtRABq+FQRxe3BjRyXLcQ440QQvSnxXur6sahS2EN/mNfg4SRCoEm6MYJtY4PoUg0sEY
         Oi8K3n6VPDvkObVQs+v+QYJgCoiO4RFHIVmIS5uNGX8m+candryZFANY9r40y9/2JK8R
         u+fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fkc9V2w5LCx5vxvCS4OBbSZnYWzsDBvR693KSERcN+g=;
        fh=UdOKAGUUDhR6daBy8To9pfhvITDKwsRp89KW2W6UbA4=;
        b=UM/Pa/oxidmkU3ZBwDbdMKHYw+FtnvZY/3XC9GOhqgg6z4++lq9renxGiwB3/k9cm+
         Y/i3+iRu3DB66ME3O2qkfxIrNSapMRHbGMuGi/MscXIExgf44jiIbVn3biq+CfGv4i/r
         VEzXxS1AEqRe7ziAshlLQn9PkYqXlKU6QcHW/qRN3V+q0QFLrguL/PsRccUscmpOyFom
         aEF55SUv408QqPV0ihMAOCn6W0lTWn2g8P6NJ8YdBa9VYf2Bw2QNb5c1aA42LnwPTL/m
         ctZAPy7Q5kTRWHOOfmprQBehdWV5fg+7EK3Ed7YlqLJJaZAnTrKnxvq+nEF+aNWrqUP6
         LDOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770320080; x=1770924880; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fkc9V2w5LCx5vxvCS4OBbSZnYWzsDBvR693KSERcN+g=;
        b=Pl4qgpiBz3Ep0LW1nXK/Fm3tEsrOxZMWBFmPCG5C86+z2yUX0Ku4VAsBpfAk8XzfOY
         v08Guguxr3tPQadRlI2YHWFi3gq61Zo83w0N1fBTacNuRa4oMSySxGwFwDG3YqKMxk29
         YaC1EPR8kLZ7fewjjutcfL+dPUVl2iKwLhFa+X8Na8VKkjzQyhGZ7TWzs+nDjj/53np0
         BGc6V5lSaGCvd9rx8iBXg9CljYxAb7yo5ndHq0E+q+pUZHI2Z41QBvb/57305j68EWYR
         xg1IWKrAP44iMn1BV8iz61tVFRGMqG1lWYkFuAbJD+MQUjblF2c70WliYULSu1K8mU/K
         vbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770320080; x=1770924880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fkc9V2w5LCx5vxvCS4OBbSZnYWzsDBvR693KSERcN+g=;
        b=AinFBnU7MmzjL9zkl2ErJmjTTkZwe2B1lb/nyHAOPrSJa8rcDAKFqbQLlPODYmJtQD
         8eMwvt1jcmyY4L5mN9vhUBH5BD4CZ2ONQ5m9D2mekBKEKaqG2eGdD923kCDkRAbKaUHg
         s1qIT/gQ8M5Pvaara+nvi/kl25JAcpO7kD7BfeRYBt717XUSP79I+Fgedj4IpqqQFjqg
         VTDeG7AQ5ceLuIot5M0wU1fs5DuNOoOhKOTYZ26SvZO61JwYVgVGhWw0hXy/jtXoGPkR
         BzRQgrb+Vo+x90WXqaVNlc44VLochtmNV0D3jJ+xuRuzXH02HqDScrMjF7BL1KXlDy9M
         ELFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOYlRsNk0CFKYrJ/8Lmbwpefz7oB3WXU6t02y/TwEYF+TxzOp1xe0mNQ0vecohHVTtJy8FuszU9StpqN8fnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVgF9SESMynza1obmw+qNcGHOZlZQkhv49escMgMgqEFwfHRXW
	kjqZZR1zzOHokuY4RlYHlOeyRHonk/rlLPRYljisONzJDYIzwvFMrXAPWnF4ph1R0wz4scXwjHU
	8YVdJvTm9ztp0ZBSzMMZm5cQrHJrPkxM=
X-Gm-Gg: AZuq6aKFQMf9uO+lkKUJS0Asvvq41ZyxCEfCuwmXBhcnUk+nWJgAVSZ2nLsF05/d6Z3
	p2tWg3ckjuBHknKKX7/0lQIfBGtwoeH51fjxuudI95EPxuexi9HEVGbf5e8bKwaa/X6lZUEawbC
	WVaB1TsMCeAv2bUJ8Wk7chZOFmQyJiR4K7GcFQNJHEvdxHP0j7zaAtW7kXn/TrAjP+MO31eTt56
	pREzAShGJ4DPGGt+Xf0cOvef431ceLjfimkZTmajngjvk+dAN1f1HGvmyMm1LLawG9cVam9Rzfv
	GljT+RXbHbAhlzeuAFI62eQoSA5Sz6GlTHGUD2luqSBpPZdh8QIKp4F5wIUr5wjUBN9222tB3Z4
	nPbix+NLxPPEW
X-Received: by 2002:a05:7301:1f05:b0:2b7:fac6:a9f4 with SMTP id
 5a478bee46e88-2b856a4c965mr38975eec.4.1770320079827; Thu, 05 Feb 2026
 11:34:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260204210125.613350-1-mkchauras@gmail.com> <20260204210125.613350-4-mkchauras@gmail.com>
 <aYSgjPD5KRcNN0j4@luna> <1ed12a72-06e4-461b-907e-2581e25e3e38@linux.ibm.com> <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <aYS2oWCE0ZCC3don@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Feb 2026 20:34:27 +0100
X-Gm-Features: AZwV_QiXdOwsA6Cs9ikWk94o2hhbKT_np0MzoS_FXf6_Mvy8gIUKQAkUYwzBM0s
Message-ID: <CANiq72mi-V_SF+JErMJu1wZEd27HPHqhsxE8dELtd5e3ZEaA4w@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] powerpc: Enable Rust for ppc64le
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Jubilee Young <workingjubilee@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Link Mauve <linkmauve@linkmauve.fr>, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 5, 2026 at 6:29=E2=80=AFPM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> use rust version nightly-2026-01-28
>
> the latest one has some issue. I just raised a bug for the rustc
> here[1].
>
> [1] https://github.com/rust-lang/rust/issues/152177

It appears to be a bug in LLVM 22 for ppc64, not present in 21.

If I understand correctly, then it may be fixed in 22.1.9 if it gets releas=
ed.

Thanks Jubilee for the quick reply there!

Cc'ing Clang/LLVM build support, in case they didn't hear about it.

I linked it in our usual lists.

Cheers,
Miguel
