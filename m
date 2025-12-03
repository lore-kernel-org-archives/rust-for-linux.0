Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4E9316198
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Dec 2025 18:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764786893; cv=none; b=XxLznma5WwR0snB8ZdSknwfkyFm9CEQLNHWCkoGHdTjP2zDDH8OfSMdMcsalOiXAMRi5XdyxaY6oq8h1I4mKbSdthwfK3/teiXqeTJw8Woepr/22deI/tbiM2HeuEM4JPeevLvHqgUJ6HZFcbUlguS3W5tx0oEYmk9PMX0WNRgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764786893; c=relaxed/simple;
	bh=2CMWZ3qAwUwyBhAnMKin7Wcb6R/EuH1ID91cRmby9KI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/etZRbJ0iyxtXCc8t0ZjYYCkEghmN2b0pNMdZ7UvQ69+Zb4Xe24igJf4jMb5n9RjEno+0XoS92U1kG5XCnrlRDcawosZwxc40H8i1KtIrTH9yRSAodRqCMGrPee5oZz/lxBwMvtA/UWFFJbB74yXHW9GgkNg6DvJ0bYTVEnOhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjqEMxLV; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjqEMxLV"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b9a2e3c4afcso1047a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Dec 2025 10:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764786892; x=1765391692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CMWZ3qAwUwyBhAnMKin7Wcb6R/EuH1ID91cRmby9KI=;
        b=BjqEMxLVUwTM+IZ6XRQsGVwbyhUMYAral7g3cqrhAJVnlbZbLRl8mGAU55SKsAgrbm
         CgqVNxHUKeQFwRcWRTNeR4adwqFgijUoUTWOI92rE83g6lC969r86Oqg943iCAnJ7HGr
         3KEUq1oc7fKzmZBCfKuUMM/m0yO5N3q8atmPm5e+UVgzvxG5Y3JNB3ovfh7rcylxfC1g
         Gf3lftd0KArdVIDLiizjTsxlOtm1j+Z2jvkyXxZx8xEF6E4Ciu7bfp0lCrUTZywZkbgk
         xT66KoRLXg1JF2PDTtjStdslhX33r9Yx5vmw9XD2mivqn9nadAr4dnjbzN2k64MSBuYv
         Lo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764786892; x=1765391692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2CMWZ3qAwUwyBhAnMKin7Wcb6R/EuH1ID91cRmby9KI=;
        b=OaQTk6pT7/KEvCc0eRFDD7npkGWFQy+NfHkKhJkmpBqWI+0X/n3mvH0h+IB65WnRmV
         a12OmzrjrbcbkNrS8ZZ0fiUHE7/4BeDDu0hkcGlEgvU2aEY43rwyJGSEehwt06PFSaNY
         VPyVHSbCuns4DU2mDUFlnRGDcr3cUE7OOXNshzKLMHAlVYxI/MSYO+T9m6l9SJobLNOW
         tHlMT4biaBsudMXN7+2JD3fJHiB1VHHswl0oAE1YqjQ53ZADttXumf16BZJHkc5pBTZs
         v3jx+h3uXMeMAhQg0X7QTRlTs4bPowdWQ+EgNLPHIdrPLqKqK7fiLnP95cCtjjfCnafR
         RJmg==
X-Forwarded-Encrypted: i=1; AJvYcCWsTa3eTOTtxCeBf0T5doh04s22DdIhFMbAFt+Bto6IPkuCnb5RaTfYUdy80+6G4w4ijAriaQ8fCSOrXy+lzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr9y3kilzDGqlheyEJj/qBKG0uKbMCi+/HGFzEPwW1/ZJUQCiV
	ddSZDVyioDJbNjEXUObWWJ5O97bsf0B3gMm8O3qqofV9DUFgOgwR4jsGU2+aoheXNdvVK7xt0be
	ValaNVPU71CilL091WMGfJDIumLJij0Q=
X-Gm-Gg: ASbGncvjXkZDpeL/cBFwRU5dIWnd4CNmE/sLx4Xq77F+m6jPx3qCGXENA8vV43NECuM
	7VwKJJvgOvpwJly+iljSk57Y9Tt3gtthyAj0HgWQdbAo1CZSV4abCssN6SuFycd3s6p3Fbmkwwr
	n2S7+0+DVxp7C9LGPBxoZX/LpfnezA68EHlIqIP8rIBNhwWAxX+F1QP1SobOEWZtylpcNMj9i/7
	BAumC6hvOIZD99H1I8HKXqlDGwIv4ORMgeiY/hzjgHnAYMR+RiTg3AQ4k8SJ+btf5vA183iSfQs
	lM8w2hvDcO2cd52IPWKexoZiPdnbaPens8f/SABxtf9ZQWOBLqgXJJgvWaWLRtBipufyqyOlqNf
	jbriivyAh4uCqAw==
X-Google-Smtp-Source: AGHT+IFa4V+Y9FyhlTVYSyy1JMkmi9f/NngzmjjE3IEzgbmLwubfh9xfKe7h/9zsaCRjThZ3LBCKnOLaWeErPRtNuyM=
X-Received: by 2002:a05:7301:e0d:b0:2a4:3593:5fc8 with SMTP id
 5a478bee46e88-2ab97ca970amr1171255eec.2.1764786891475; Wed, 03 Dec 2025
 10:34:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114233045.2512853-1-ttabi@nvidia.com> <20251114233045.2512853-11-ttabi@nvidia.com>
 <DECCV8XB5U56.1NBFD1KFJ59LU@nvidia.com> <b28cff274d79de78496c7f0fcc3627b2f816d3dc.camel@nvidia.com>
 <DEOK871CSNZB.W94R3SDUDZ22@nvidia.com>
In-Reply-To: <DEOK871CSNZB.W94R3SDUDZ22@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 3 Dec 2025 19:34:39 +0100
X-Gm-Features: AWmQ_blu305YpWSaZPgtyEsvUY-AE81K5BtUh2D6y_BVZiUesA5SswVgugi5Dmg
Message-ID: <CANiq72n-E3Yhgn=zioZvOLbKStLbrTfqDbEVY1-vbETqRYmWxA@mail.gmail.com>
Subject: Re: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument size
 must be page aligned
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, 
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>, 
	"lyude@redhat.com" <lyude@redhat.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	John Hubbard <jhubbard@nvidia.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"nouveau-bounces@lists.freedesktop.org" <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 12:54=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> I know it's a very edge case, and clearly indicates a bug, but the
> general rule is: don't panic the kernel. And in Rust, if possible, don't
> even let me compiler insert panic-handling code. If you don't want to
> change the return type of the method, then maybe use `unwrap_or` and
> `inspect_err` to print an error before returning e.g. `0`.

In general, indeed, but if it is truly something that cannot ever
happen (as in one can prove it due to how the local code looks like),
then adding error paths for it isn't good, especially if they change a
signature.

In any case, if it is decided to continue execution (either with an
error or with a "default" value etc.), then please use EB, i.e. adding
`debug_assert!` and possibly `pr_warn!` (or perhaps `pr_warn_once!`
once available).

Thanks!

> But others have already thought "naah, that's never gonna happen" and
> got burnt very publicly [1], so let's learn from that. :P

That sounded to me like a higher-level design issue, not so much about
`unwrap()`.

Cheers,
Miguel
