Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C143F86E1
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 09:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724319; cv=pass; b=dBGZA5QxzbBo+fP2CPF1GKDv3WCwlclo6ugUbq5ZI/zuE2EmiXVuodJ+QdNM2jqleqLTqoKF5oUQjbvQi7n05qTsSc80eH9IzOLofFhkQSwtLsaqTkY8XcnbGs0Ui/3EDcZ3zrBoAknGiyeYLGPQF729+ebn0I7id9RljULYFd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724319; c=relaxed/simple;
	bh=5T5WebhApI2QU7tVIw9fLdCQvq2s3y9zxINx2el0WJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ISxey6eV00f5/Qohs2kSyMyUPBi3+Xec38K1Ljd9OX6b1aOJ+4PwIKPaNvMe7qNhN1umgghU/yrd1L5MIzEvYteDE5RuyQ0YXZGr9nU7wLwmPU9zJC+GocuIyZXbwM3FTR9I7q1KsCyt8Xly70mp5uS1hSBeoDCg8tVJG+L903k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Si0u9LNu; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Si0u9LNu"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-137eb8e3491so254419c88.3
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jun 2026 02:11:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782724317; cv=none;
        d=google.com; s=arc-20260327;
        b=pdymGRpS32B3sjE5S2kuWYFetu4zYgk9hGRvpF2pVAxF7sLJCk9hF0egXvlXMXx/Da
         e4d7K53ViXAJDsZjlb9BXcOvN9F+dn73I8sT1fZYg8beevIsEXAi9ySqm7Bb8kqW5iEl
         lE7LA1Vkpl3d5OFBr3bve6yZlIG41lrRWjVZ4/Jxo3y63bRQmAe9iwVff/bebxVux9n8
         glHFciUzGeHxbjgqRI6CP3KiWvshpSaBa375Cns7KYPkQHc6Kh+8SeitMRidEyUHXzjl
         bkbouVeP7sqdjE+vr3+/EPhtF7Y6TAx3bGxZB+QeY8x8I6yrpU6lGvLdggpYv9pqzUuJ
         LYjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5T5WebhApI2QU7tVIw9fLdCQvq2s3y9zxINx2el0WJc=;
        fh=B5TEoyF1Sbh1Q+mY07b/1AbU9d5fD8MI6gYoLhFa500=;
        b=WrasroFaNKIbgaE7qsIVg3l5lW+9z0llEIc2kg4j+EFBjSTPV4DNXkyTpGuf/+j6fo
         Px3BrKGaWdGXke5QKT/ithtWuiqvyp1SaXPPpPidsXD2EyNtFjRHj5LXmX466XwlYdlJ
         BTf1J6h/Qdmv61Xliz2TBqPrqhcDxnsQnKeBLrZeMph0oNJiXm6El+9msuLXW1W1eWMj
         jb2FsRKSwz3F25IyDQUkMbjGodbDKIvOmv7ZbwOqyatoLMrtoU5MtCnYwyKa/a7jBeO1
         Qv4mbxRBRKiX+cpiW+q7yDjDyxaop9kWLJerokAAU4ivvu4yb+8WBAQCJP5DpBJQDsKC
         XKSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782724317; x=1783329117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5T5WebhApI2QU7tVIw9fLdCQvq2s3y9zxINx2el0WJc=;
        b=Si0u9LNuZBzY3Up9vXr05CnKUaK5kqgtDQkZLfpVv7K9OLpUKygWVgfgzkGCNeUiuQ
         D/ZxqvEdOVrIbHEyd8Ep8gfE1IIgz9zURHHI7Mzc62aY/vdK9Tps7E1yHQHXIytC/sPL
         YTAWdIq4bboe/zgvs2S2IhJG5sPiMLxV/u6lxb5xF7XQBtDBtVjlYqjKnpmWiv51wdCh
         95zmuM+4x3gVpxaEBClqv35/MenWmVWIZ3wAZAqugxiyUF0lnVmvwMcizWOxu1YmwSmM
         xSSfVk/yNMtcQwK3j2XrJjMxtsLBgd7pnMAtwnkIxWQKfJ+ZIB6DAW1Fty9bc1F4QFU2
         18UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724317; x=1783329117;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5T5WebhApI2QU7tVIw9fLdCQvq2s3y9zxINx2el0WJc=;
        b=RSKMzyHuNEgtoyeTp+576zRpeQImia6tvus4v9K8E5Onn2GmwgktbUYt87Fz52EqSX
         +bnQ72nMaxqMDs+fGNig7FgpxkT+3KS1vCTurL913hv1sfqZRkvOUqoq04m3E2fB2++z
         fzHO5SIidP8hEK06NG98iDRujoCffNwMqXNoM/wWjCCgz5ZorqWrGZB6dRyiz+n6Z2B3
         G1nzSnzSl9OOdrcXcIq6PFUFiXeptAk304xBCSfs6oDGmi0S52gmc6cPEkajoOKGqjwi
         zTSAi0XGnkelLKJYwjCXi2r0j1hCMtQ3kWrBA4OuODkBPAT2wPamd8Lm8dkaFRCUCuFY
         duHA==
X-Forwarded-Encrypted: i=1; AHgh+RovPRiFu5gn2+MhY6DpXrbPWJa3jp1gOnEsL9BQUExEfWUw55M5cFy7KfPEFAXN82HGkMMsj80ToGTLlkw8eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrnPBhIbiTuSGLXoPoXE1lPLY7X7TGIL4Hg9KIJD+eWOwh6UWV
	A8/AuBN/um2fKNXFfv+YYAsi1axj0+QBOHKz+FFDcE/c05gXNMZYqMTxvUsVQkNJL2F91FNQggS
	AEbFSfIQnu5EhQvXXrE7XZs72qdmQIVU=
X-Gm-Gg: AfdE7clKbhzTJv6CBOVifpC90oE8PBIdtfOkhYW9+jith625jMBobfSFLZe9pov/fOz
	S2uv5TF6GfdzGtVxKDcHTHeci9Iajj23DDJnkEWtwb3Nq94JdKzg3eqRCW5yy/Du31uRr+SCKzU
	FWz0CE+I6vE8DVhmNGRwUmkY6YqSLr+F2fQjNcAsu4DlqVTxQfhrPpgFa5m3FW0xXaxQeib6Kqh
	OUMqdAOwb1yc60pLqlT7z+Pz8ZwIjNUEfin+DkKjLon77Z7O5OkFKhoYYy++J1Hps/AyYBYu38u
	iYPxIt1APanfVNUKV0gFMqmVwg67AYyNrEF12puqXwMnA+xB+iQr/iT89vOG+6yx9m6ZldYa8B8
	1pt08LP0hPBEB
X-Received: by 2002:a05:7300:e82c:b0:304:5074:83b1 with SMTP id
 5a478bee46e88-30c84d1d771mr6422203eec.6.1782724317312; Mon, 29 Jun 2026
 02:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520064630.1785283-1-mkchauras@gmail.com> <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
 <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aj4gAdy2siBxONpo@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72=EVsTFkQK3LWrT2Gs5UKKViemGkv1WuitY6NOEtvcsNg@mail.gmail.com> <akH6yuDH9ZwXVoVA@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <akH6yuDH9ZwXVoVA@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jun 2026 11:11:44 +0200
X-Gm-Features: AVVi8CdD4UZYMSdVoz4Zj4b5OG2locYG8F0KrVqjoorstpkR9yzH0nWzAh9oltU
Message-ID: <CANiq72mj1P9QykK6vbPK37hZkMLwd7RcgVWEcxxuE=9OL+4bAg@mail.gmail.com>
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, acourbot@nvidia.com, fujita.tomonori@gmail.com, 
	gregkh@linuxfoundation.org, prafulrai522@gmail.com, tamird@kernel.org, 
	kees@kernel.org, lyude@redhat.com, airlied@gmail.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 6:57=E2=80=AFAM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> Sure i'll bisect. Meanwhile i would still like to get this upstream.

It is very early on the cycle -- I would suggest bisecting first.

But it is up to ppc, of course.

Cheers,
Miguel
