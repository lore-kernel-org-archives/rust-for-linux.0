Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FAC7081C
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Oct 2025 21:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759441393; cv=none; b=YzrHTF8hVdXVzsTq+kloCt3u7kYbFM6Rwuo31OaTghDc7VULmRCSgeBj3Q25R0liHgWl6kb0NTpaOq0IqeZeH60A+HVQjxOx4UDK9dMoaNaNurv9jUligtZ05JEkElBV6kJUhhL7PQ72ZWOYVMvTu7QNGlUaN/sZTT+/1KBLZ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759441393; c=relaxed/simple;
	bh=EC/JwrRzEfWyNU1MymFPlAzzZzaW3cKzpLn7u1s1Ig4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N6YELyuCS/IF88L8QgjziXA+mZl5fJjiXxL55WEgCQIXnK8l5fthHlNUAaSImK31Lk5v8y2oO4syxrlef61WqnsrYFeLGzCUiLleRFVvVrLblplFqmVjAQBOcIOaG7MzaorOpeMdxsqvqUKUrdETg47ZE5kzwFNwmOcBaTNYeaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F408cyjN; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F408cyjN"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b591e9bca49so33186a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Oct 2025 14:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759441391; x=1760046191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPcXFzKT5wVu+oYSVpByRjAYmnWsxgWqvNHhKj+wPuQ=;
        b=F408cyjNmdYeyFZRst3OmqN9NiPPVUn2v4If0bPAwW3wkV/isWndXIBkpQHCOkn7pM
         RFeCstzRPWMTJMLz9fawGQWj+fxpJ5Nk+iPQ5/KwnUyIkBXL4h8fgfkutFLOUJYZIti+
         CoxXsv6LWQFHuGmAZ0qW35cYblTbX7iZ1FNfuG9dyrQ+d7OMnwVDQN1Hb4+gEF1a74Q6
         /QPD/BmFNA/K6Y3YB3srbymaQZK8cn7pQIlCjySesYzOEStktkKhUgmvkeYfP5ZNLnhK
         Iiw9mXahzwX17y9+agN8bhT+ySrsul77rZe2uFKbLnB4mc9dKh8n6N3bIFkX2qpIkIAH
         Td2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759441391; x=1760046191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPcXFzKT5wVu+oYSVpByRjAYmnWsxgWqvNHhKj+wPuQ=;
        b=iSxDkcrinS20H2uMEACzZjEXePCKSlgb9ODTIzBVQOrGOYZ7BIn/w+5xZI4Djjoe74
         kaEz8YekSfQUC7737B8X5nHSmhXAI11dodOhS9vSN/BllYd6sb1nKuJ9cOj4ap7xrajM
         0XIbZ7FF9huRQFOwiYNiykw+d+1JTXBkAne0+E4Fj0LAwAhMVablcw2H+VbORVGblH0v
         j4dET/zPvthU8PCL9pkg9ACiyCFEWvwq/rsU+ts8NT2oADXL/1Sb7ySq9kvorfAR7m1H
         UHWFyTiElFV7oy9pu6LLccdx4oZ0U4EEjEBuvLDAw0neqPvbaQXiuVa5DTDyLpOO3jX0
         KnbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnt1Wyu0GyLvac2qerB2/iWG6b285YyRAQjP3N/em6o61cs5YbTVRegzWn9jgC1Bn5Vkz4rzxabYlD2uh5CA==@vger.kernel.org
X-Gm-Message-State: AOJu0YywxFP+8gN9EK7tBhIdzOFE+TOTfzQlq8f9kuAfGPJFhZWtQbJl
	fdLlKaWmb+BiBQ8/eUigEysttyZrFrbF5mQ28HJw2i4oaITk5HlpMcZuNPXQhdOfquGAYE9kE4f
	JX4xWlhyGwApCYh+RbccC63AJdGDskps=
X-Gm-Gg: ASbGncs0h0+rlOJu5XFpXRztFkYib39NFCTXl12nqr9PyclvjTg1tQqC4Lf0CPGgJZl
	Ny0ySAtK7pzqCM2f8oDgulS+N/MbVNDIjyj+ubb+LUjAbr74r9jAXalZM0Q9fS+htapB8LxJNcq
	Cow8wyeBEuWOzbfFHfDvYTbdxWbu807Z8UF6+8BMMjanbYNk1hxAGSDhLRUSOkm/t/bNstb/XOx
	YqloeJciIvsnU5mYJOO7iGNEFfs6vtSI3tNCHxK5ScDSdEH2kpXW8/ZEvbJRuhmVzZ+zHOFXizO
	t/Wp17xZaCxmMrvtdvjswCoophFmMUtYIy7kvbHZ3QApUWUFCQ==
X-Google-Smtp-Source: AGHT+IFZzSxiqDHj6MHdqyQ1Q1hdzZXvFd6lioB0p3uh+24Ijmg973MsU4BcCXMws2SWUfETRmGWtCjrkLphe1TQaL8=
X-Received: by 2002:a17:902:d2ca:b0:288:8c30:f08c with SMTP id
 d9443c01a7336-28e9a5d22c7mr5070435ad.2.1759441391458; Thu, 02 Oct 2025
 14:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202510030449.VfSaAjvd-lkp@intel.com> <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
In-Reply-To: <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 2 Oct 2025 23:42:59 +0200
X-Gm-Features: AS18NWD7b1CZpOPQhwI0Dn5y2ltKsgZ6GaZnx5tlIYsi0bLzqLKsPKXfvkSWyuI
Message-ID: <CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com>
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Jakub Acs <acsjakub@amazon.de>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 2, 2025 at 11:19=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> No idea.  Let me cc rust-for-linux.
>
> It's a one-line patch:
>
> --- a/include/linux/mm.h~mm-ksm-fix-flag-dropping-behavior-in-ksm_madvise
> +++ a/include/linux/mm.h
> @@ -296,7 +296,7 @@ extern unsigned int kobjsize(const void
>  #define VM_MIXEDMAP    0x10000000      /* Can contain "struct page" and =
pure PFN pages */
>  #define VM_HUGEPAGE    0x20000000      /* MADV_HUGEPAGE marked this vma =
*/
>  #define VM_NOHUGEPAGE  0x40000000      /* MADV_NOHUGEPAGE marked this vm=
a */
> -#define VM_MERGEABLE   0x80000000      /* KSM may merge identical pages =
*/
> +#define VM_MERGEABLE   BIT(31)         /* KSM may merge identical pages =
*/
>
>  #ifdef CONFIG_ARCH_USES_HIGH_VMA_FLAGS
>  #define VM_HIGH_ARCH_BIT_0     32      /* bit only usable on 64-bit arch=
itectures */

Yeah, non-trivial macros confuse `bindgen`.

For the moment, you can do e.g. [1].

Other times, we have changed `#define`s into `enum`s -- that also works.

I hope that helps.

Cheers,
Miguel

[1]

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helpe=
r.h
index 5128e2f12038..918f4c74067b 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -106,3 +106,5 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRESENT =3D XA_PRE=
SENT;

 const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC =3D XA_FLAGS_ALLOC;
 const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 =3D XA_FLAGS_ALLOC1;
+
+const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE =3D VM_MERGEABLE;
