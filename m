Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DB634D912
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Feb 2026 12:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770638553; cv=pass; b=BzyuTqkb8x1dYcMP9psu/t3Sexh+MWKpdwztBp39Dg880aafUmniX0WhDjyoIbd9/AXFpKQn8cF1iQRJLFaJtiyU2xxmijxbdRhHiC3dIliokK1b97fDRrogU00LhO3TaR6p/8jDBDs+0KWFfx/FhEh+EnLt4oXB63Si4dPQFRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770638553; c=relaxed/simple;
	bh=4aNQGxtrrEdzV2sLkA1xkh3R9gSFeyePvFhc254cg14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ajf77F5pVz4Lq99UxGl3SOwhwogiHpTWPtzOpYMH7jwlA2bBCtEYY4z+iuNIJfS65pRgIUJ9lKpTMTz1pw7PXKZYRTyvGYiV4Q5SirT5hqTONnUvijhu/deY2eMqoRcVbJxiAMN3gMOK+d2AH5MsTKtzBy3DjLfxdbpLfcoQ9vE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXimIWKl; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXimIWKl"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ba76d64d14so35383eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Feb 2026 04:02:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770638553; cv=none;
        d=google.com; s=arc-20240605;
        b=bvPmkuo61TFh6WXn9+Z1ysrdUUUILt8WU0RkuT9V74A5+zNQkfosdpIu7cdkA0Qo1n
         VpLFgwX6us4ct9uKrpgppb4TbDoOezj2DjyDdaUWoPig4o5KTetEx6meOeySCDLRsICO
         yt8xtsKFVCIFqM5ZK4/a1Xsb2j2mvnObIOheyNdppvFn3uxabmKN4h8zujHYzafHCtaa
         /JPST8tTRuN+X3qFQRW1CdXajJNX8xfPevTyB/IlY1n/gQJASzKHvVleeSFikUgy7e1y
         k8y8SzyjC5C/psJm1oDdtQRRv8bqOoPTY96Cr5lrGvPrhMQwg64C9zKp+dIMj4vD6B+o
         /Caw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dZhWDaNsdwvI4rNW3NtCt5JiKEi9H9HsfZTRb8EfKk0=;
        fh=lTuX6BnJPUBC1EgAqupHWsWdXaGbiSzAybbHFgY1pZc=;
        b=doi486tqiIvZbbdvqMow6FlLuVUBGK/SHdFWsjkBui6L8UBpJoWNnN340/3A1UtKbG
         BPDEfH9zWxDR2eBEg1YPBuib/TAF5/xkSrGw4Ve8Tq3QWKx2f83P3+gS4DrHFq8JbsJs
         GoopimrDmEamvRLOV8V0VgV2T9Ue/CW0MMPoDWRz/ruz9EbEdtsdbiMZFfoQFkvBsvda
         jxvqta/UfLnkcID87Ojv9dPnGUOmG4vI4619YrmWHwbPkVPZsZf8FvGvkvHjic9No3Te
         07ZftpzIwcFrUONI+JuaJa+oP/mUnza0zXG8abg2eaceULxyV6vP74oB0apcm5e2Y4Gn
         tDQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770638553; x=1771243353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZhWDaNsdwvI4rNW3NtCt5JiKEi9H9HsfZTRb8EfKk0=;
        b=AXimIWKlJR8bH1ueiSRf8KqGT7rZyKXn3uTki1QyUFxYIjL3PZ+r8XUw1BR8bWYbgJ
         1MMLrz1I3GcroR4GYPWhu4XZlqhl+cvP31FWcDWk2k9XTwN2HkiJWC+Dw+tWvf3bhtEG
         RL+pP5pq4nD+y25mSViXOsnOj5og4j3+BcmJiUSLQx6nEWTYehSGMfByJAggpybZKAzD
         2O3/oqLyC1RKQJE4xu4sP7Yw7f2muJF2qZXqGzldRXdDiAyAr8A5bOf5/MYdDMpeGn/i
         ICfvMi9o4xgMg1Dia7v4Y//bpCnsJi02Rr5MECLJ9GKrOn61ZKD6kWX92DruN45Z33je
         gENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770638553; x=1771243353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dZhWDaNsdwvI4rNW3NtCt5JiKEi9H9HsfZTRb8EfKk0=;
        b=bDQVpx2TxBYcxRYUEjIBjZaQqbXeGCpN8L1pK67LJmkaRuAbNiB+OfdmJ+VCzB7kZx
         mj+fu1UqoIZb+a+abGleKyhoQuwsSozDoWE6ePcNIeROwvIld6CmtMrnzvqTQlGnrNgu
         IQqYts2ty0oX/sFhHtVpcFwWt1H9B7HPhTRsa0XeLBAMzUAs5w9Rmx2D42rntL1/qqoS
         lvEYK6GRB6EUzMyBdFe0PMN2gyJq600MNY3Z1fMy9yS33jyPD+dQ/fqNjeheiXtPmMIp
         2i/mUW8NIPbNBCuf9igkWiadjKYq/grbpOESYTGWLpWDgz8k0i0rVUONeSz2mMU8yDQ6
         gLJw==
X-Forwarded-Encrypted: i=1; AJvYcCVFFOQPPjv5GZpu3sRzfn/fB324Qi6AVb7GWIs0pEsqD9rA2F5NeNOwi1B3plX+0a577yKbtv7fRlHNgrWdug==@vger.kernel.org
X-Gm-Message-State: AOJu0YySj1oB/jfS7o33HPqVVzevab9vuQTgMwifF6dcN9P9FY3EMVLU
	uuO+Ijvw4FEbjJlIghQaqwkwLKPfKYvcxyioBaz4PCXoc2C5RfWfF+3lQuVhAFiCBoj9R5GCAmH
	rTWyksonoD3G2JHMBokrnSTavGpMzGQA=
X-Gm-Gg: AZuq6aJAh4JmBVUZyMTcyGni3xcHIQ89sfE505CQIfGvdMUYOIOQ3ktInXxrUghp1Lv
	vO99gqw4gFz6Rtb27WPxEvl5jBrQ1RX5Lv+Q7R1b1TozHyzZt8VbcL/KXrtS9iB8/tnlht5mhZI
	n/B3Kn9AWenSLpbmxtX4NCZZ3z9VDtwg7Kx7UMsfqKS4uoqCsGtvhtvc1n/i4bbtF4eyhwj4EyL
	Z5gzUTYBzgVJu+PVVh8fhdNzyqCkrVEyJua3Bsl0wMEIqp5sgrYiR1sgJxzLBz4iF2wpwLkdZ2L
	dE1cOalFacDR3iz9WOeUQQZxQYsnG3DRtPkBEGZFD+4lH4oV47UyoGhv/CBXE7aHdkYnpaRivjI
	9EBiOtEG8i98H
X-Received: by 2002:a05:693c:6085:b0:2b9:ddef:2c13 with SMTP id
 5a478bee46e88-2b9ddef3bcdmr780273eec.5.1770638552639; Mon, 09 Feb 2026
 04:02:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209105456.1551677-1-mkchauras@gmail.com> <20260209105456.1551677-3-mkchauras@gmail.com>
In-Reply-To: <20260209105456.1551677-3-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Feb 2026 13:02:20 +0100
X-Gm-Features: AZwV_Qj0qLrj8jckFchFsbULIvtu6ZjFQsKyUw2LAuw6MCkfc5efrXbsku0JQ84
Message-ID: <CANiq72nqH=H4a_Yo17KPmku5pPRMVRBADgj8j+=TcR=3r0vOdQ@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] rust: Add PowerPC support
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 11:55=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> These changes aren=E2=80=99t the only ones required to get the kernel to =
compile
> and link on PowerPC

Is this patch not complete, then? It is up to the PowerPC maintainers
what they want to merge, of course, but I don't think we should add
the line in `Documentation/` if it does not work yet.

By the way, regarding that:

> +``powerpc``    Experimental      32-bit Big Endian only.

These levels are mapped to `MAINTAINERS` ones:

    Below is a general summary of architectures that currently work. Level =
of
    support corresponds to ``S`` values in the ``MAINTAINERS`` file.

But there is no "Experimental" level there. The idea is to know if
there is someone being paid to work on this, or not, etc.

This should also be changed in the other patch that adds ppc64le --
e.g. Mukesh, is IBM supporting this?

I guess it may be simpler to not add this line here until it works
properly, and only add the ppc64le one in the next patch, with a fixed
level to one of the `MAINTAINERS` ones.

Thanks!

Cheers,
Miguel
