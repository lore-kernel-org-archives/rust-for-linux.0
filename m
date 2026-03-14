Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85077231827
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Mar 2026 11:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773486946; cv=pass; b=XuuNsliVRt05P4c56qz7KZRQVS7TiDyIbhXCoi2Qq9O6z/+nJL0cmreFkHwnSGW262mFEz+lPlwqPWJTE0MM1L/om7QRkc+EulKi/LleeZqyneMZkYFMT0DoyT2XTNuRAKmgOnTnJpsg0kkFPyqynRaxOaRjOIY/29VH9TfBNsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773486946; c=relaxed/simple;
	bh=zcMk2juHKP2RohK/1BK8E8XwH+Ave8HercTkx4NfKUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GogbVAnd3GjZNYpo2g6+TPYgVkLRFRmlLSiRMQcsSCLEXm1vqEpEq7eyUo6u7fPXHvTniln3mWpgAVU/57tVCwWOu0KfJTZtaBTEqxJkDLh/30eetIpoUuSkZngyWkRp/GyhgpDEfJMtYYND49lqysVwBpXwIkqQe+JLp+lozPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t1Se/17r; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t1Se/17r"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439fe4985efso2698715f8f.3
        for <rust-for-linux@vger.kernel.org>; Sat, 14 Mar 2026 04:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773486943; cv=none;
        d=google.com; s=arc-20240605;
        b=VHJLvADyLL3V7YE3WnrzxdmUGLZ3nSlnZXlbfIgd3ghtPGyUg1OrWueu9u9yjaPJMv
         Whumr/20mA+6NwwJ2mjyI8igTjJxh92aPnxp4jjxRfNM4cp24hKLgN8iICplrWP2KfYT
         Nh39kNwQAqxNWVBy5k5JclRQC2BVPAdL4AZX7+WC9vs2lhaydQsLi1wg6X21GGEGFKi2
         sJpInyHGc+4rnFUcTCUSbErZ9vvRy0wnAj0nEiqHBa7u/0wSRK6sUZkFDRIfVoifYL5f
         E1KvgNzqLGD7UIFZ3gTG8YmvMHuK76MH/GOrUSdMzEcpTMAuClmnxo77WHyJhShSsKJc
         EUUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zcMk2juHKP2RohK/1BK8E8XwH+Ave8HercTkx4NfKUI=;
        fh=sYPLQcm1W52mF+DxWUVOKFfpHl+lQseozTWuebrt/AE=;
        b=UktNBKP1/xvZH0jX15ISc1TfqWUp1pq+EbvfW9IlUt9CUdS/Kvcg05PA30CXJxkJaZ
         CeHraTqrz3Z7AftUns9ldcjuHd3fWKMkOsdvSwp8oRqu0SZ9V1X1fRU/vArD2vFEbMar
         YKT24miphp50SNGR1dVVO8qBI3pJdSyREWaT7KHaT/McK9dlRp0WyspCqU5ESXpCyj6c
         KgsaRGrbtXkTwKY2SwNGjSIYfYdJG4mgyEvcSkt67T7tFe5Dan0UZcdTCjqRFWnPmg+Q
         w38iml+e1NopyEQkhPgk7eyPeAIlNx/G8ReSMGchSDW8jnrtvT328ms+n3xqMpeKX4Jg
         sIQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773486943; x=1774091743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcMk2juHKP2RohK/1BK8E8XwH+Ave8HercTkx4NfKUI=;
        b=t1Se/17rUOPi1Dcx4Ss21tssMLGZ7M2WT2qvK8z8RRazMiTjUjQtokfHO4xqSiBPOt
         tiKNVVjMBySCeZoQamUiyQYvyoFtijp4ZAmn1YY/MBBEdzgl27bZ94nuxu7nIlDJ+B/c
         ZjzGtDn8qv0kUGQPjWDNQIhp/FDy7dtKby+Be4wmMWwRAfuK0OZN43fFUC2LSi0lOBHa
         gxPxSZHwDaGzXozxOZIdauJWbdbEw4gTXS+BNpm3NQG1HdA1Luc4cbwHYhdKp3F53vX+
         ElWsttToSJedTbNTSard6+00HwMv/Wl8lwxGrXF/tD0YydeZOe/m0ypuvFUZ9advwBf5
         9flQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773486943; x=1774091743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zcMk2juHKP2RohK/1BK8E8XwH+Ave8HercTkx4NfKUI=;
        b=b2zfktTfBocbucAKO9djn9yIZZnmptFa3ItAJ1pGTqMMXlFQ2/9YNFY660Ju3vxKWF
         p9ArKmggUUS/6arCLb65AetM5Y2rDjQFmpZMperZPYmhHQrR7oZ6kbnAouM+eBXbgoDs
         t2DPhAP90OQHx24Qb35RHoC4Tey4TGAXKUttAUpzpdD+6bvqCCr/hLWdDUTiSzZckDFA
         luY8Lr73xfaTxSQU9KT8Kprtu3oR8knLoh5kdpAS+TdHgDXfRKYdZMrA5J3OzzWQXmZJ
         wevb72powUrtl3ipUAcUyGCxU9QKbppkZhWcPbEKJJdZx25IzxJCEmRQEXnvuVwgSlBt
         uNRw==
X-Forwarded-Encrypted: i=1; AJvYcCXvToZ7pvswLLU7oMPsE5eYBeaQANq905Bbtegc9mvx5z0Y5nmvEU5+D27MQBiiclmzP+/3SorELcv8hhwxpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpKLzwMOCa5c47/QZs/FhB66LX3lHe23WFp30sSc+F+pmOnRDf
	hNhKlTZVFnyB6xV7kb5gs3GdJq8tGN9RsyAlTwX0eIRRcLQVtIy+FhUo0PtEkfUjXxlecKokvTE
	brez+WkNozyx7m0mdIXeKpG6WF7FASfJCKHkF8AqS
X-Gm-Gg: ATEYQzwfeyBHnVCQP/FK5PoCuO20XZDl3Dhrn8Oymkhd9yK5jY4tVKr5CeDS8S99Alj
	fASJaOTz+oMCGcjb6nRStlcCHoEmLg7QBzYn8qiOa7ov8ilDNP1dt/ziRQselDSjwTSyJeSfClq
	RQVplldR32TwDTdRUjXUohKbjcu8Pb6ReowtLzh8JJo8Pnr7JtHMya1KkGDjSGF1n3uztIP+1a9
	SuGXzNzeD13FVyOJ5iF0QIwGfPSM9IhATPsNbbtP9bN3hXU9/0YM2pY43Q2NeKzTepvmw1rarFD
	UGbx1BX1hc9fm8jV/7S9LU0C3b4SfFcuOBxY5w==
X-Received: by 2002:a05:6000:1ac8:b0:439:bc79:9f8f with SMTP id
 ffacd0b85a97d-43a04d14d83mr12829860f8f.0.1773486942418; Sat, 14 Mar 2026
 04:15:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202603121235.tpnRxFKO-lkp@intel.com> <20260313213638.GA147391@ax162>
 <CANiq72mzEzjNg7O_2dWT_6QOJvJ3TwV+HyxNd_F4j6v9C+pc7A@mail.gmail.com> <2026031422-catsup-rectal-f886@gregkh>
In-Reply-To: <2026031422-catsup-rectal-f886@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 14 Mar 2026 12:15:30 +0100
X-Gm-Features: AaiRm51ckUfgkRssBsogIj0VIQkDe2Z-Te-pFSaEkqjwee_TzN5cwYkr8WTmMWw
Message-ID: <CAH5fLgixE9MGXxNEnU5b0EXdgLQoTs5CMv_0OdnfCX3v=coUpw@mail.gmail.com>
Subject: Re: [linux-next:master 5585/5731] error[E0277]: `*const
 kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, kernel test robot <lkp@intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Mark Brown <broonie@kernel.org>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 12:13=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Mar 13, 2026 at 11:39:14PM +0100, Miguel Ojeda wrote:
> > On Fri, Mar 13, 2026 at 10:36=E2=80=AFPM Nathan Chancellor <nathan@kern=
el.org> wrote:
> > >
> > > It looks like this is a conflict between Alice's "rust_binder: check =
ownership
> > > before using vma" [1] (currently in char-misc-linus [2]) and Mike's
> > > "userfaultfd: introduce vm_uffd_ops" [3] (currently in mm-unstable [4=
]),
> > > hence why it was bisected to the -next merge commit.
> >
> > Thanks Nathan, yeah, adding a raw pointer (not function pointer) to
> > the struct makes the type `!Sync` in Rust.
> >
> > I assume this is best handled with a patch on top of char-misc-linus.
> > Perhaps creating a wrapper to assert it is `Sync`, since the
> > `BINDER_VM_OPS` contents are unused (so far).
> >
> > Cc'ing more folks related to the commit.
>
> char-misc-linus should get merged into Linus's tree "soon" and then we
> can fix up the mm-unstable change for this.

I'm working on the fix as we speak. It would be ideal if it went into
char-misc-linus, because the commit that is wrong is mine, not the one
in mm.

Alice
