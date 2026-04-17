Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEAB3B19C2
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 09:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776416750; cv=pass; b=JkQyVFKauqR/TYv0Ge/6Mka16MGz9BpAylKnpVYJt/QC7eNHdrdIeNwlAdO4YR/ryNxVPhT/WAn1PSeWwFMUaaTfnEneuoleHSgCgXSRBWPlF5blzYSbXXsVpOMJXnwFq2G5grWJ2KyqCd3GkQN1ChuoyYpTbRFst/IlIjBeaJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776416750; c=relaxed/simple;
	bh=MiuYHW7wVgwTgBMl8xglfNia3wv18RcOD3OJCDOP2AA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uES+dg09ixAE77sN1uQ8EN6Hf95nlEQhvG2NAE78zHNV+HIcWF1sKPa7ExLNYNItPliTPVRNBxoFseXuGa8gJyjT/ZpSKAkIXhRtP898qGRDtm1Oovlz0rqv3QIGof4md6vgIvV/CjofauZGjbLw2TPG5SimY9awyyizJaj67qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sq+VPdjZ; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sq+VPdjZ"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c55e3858cso1171515c88.0
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 02:05:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776416748; cv=none;
        d=google.com; s=arc-20240605;
        b=K7HgfzRQZjGfIcV1Ukdc+NL4PgyvOoyb9h50gVDGdTFmqVWnbRikHqlc+lgNn52uCt
         fpFflu2pg6U3bndMR3nYlR147BTDx8oid1VWIDeXkvJ0JOdg15O1RD2iIAtT9O+fqxX4
         REplgQnzTW4HEq8ZH+5VVBBnjKwzOnsdqXRKpFUFGJtpOMlCdXuO2w8uJG+0iZi2eciY
         xzNfvFyMWNYPtkNpf6cu3ySagl8lnQ6F2s8aafZYPxAezF3VEcwrOSuNTldHq26yzsv4
         kYoyQg6Vr72nziHTOYzrJnCFBkg/lXyhMXrZJXSZ9BB0UEp3ocnKCuBajOABAEyHHoZ8
         D3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m6h+hUT8JrfeVoyladjL7W9cfNjf2SDBTuYVEHwKaoo=;
        fh=aF0IhOqqpLF1HOTaB7No62Md998dOClBFhoXY9+pH6g=;
        b=ca9UPL/9Icqkbr342veiXokZdUx6Kt1ZNCDdl2YtAEyk9jYNR1h5LtDXDFBkyrVeNi
         SfSuJVk9YDMde/vdOpejE85i2y/KwZszlt43s7Te52L8hyFcMP8UglyVJHVprcDmXGJZ
         Vsg+021qE2PT0MF++tZcQ2KESy5VQBjtW54JUUi6vd8FDqZfjJ9AyNMjMwrQ2R96aUPf
         MHtrNTBgrNRiNNWaTI1AtEZ2HeNYmAkZj+frscKHhWcB6APxLcCq3nHo2Gp8I87LsD4i
         BwLH7M6RTvLzuVZBSB6aOpdCpnRkOy3AJ5Noxve7N5/91DrzvHpSQ2zJ3s5t31tBxpvM
         7IKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776416748; x=1777021548; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m6h+hUT8JrfeVoyladjL7W9cfNjf2SDBTuYVEHwKaoo=;
        b=Sq+VPdjZS0STDPF6M3zXRgdOlQvuHu0VN6Bhyt7lJ3TSefSDv829jR91cmgDiOIBFM
         B0iozmEFikyy3i7NLmO8NV678Ujkt0i4ux8AUrp3PzQwY7cJ30x1yWodenMawIO/uZ5l
         MGeuf2ilDcT0VT2S3pJZN11OzX+mwuCYwiUxdZaz2jtmwGzbFP/xJ7i01FDBO0nWBjQ2
         FYDr38d860QiftMOk5c5Qjnn7CGi5r5ON8EsH04F+Oj3m5Xwn+ImWC53HsKOHSFc0rNC
         csy27YB7CROYqNgIAfStmEJBO7j4gv0yL16vvx1GdOtp+sRZ6bMAQAbQENMjf077l7+j
         r8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776416748; x=1777021548;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6h+hUT8JrfeVoyladjL7W9cfNjf2SDBTuYVEHwKaoo=;
        b=EkMN1jhKv4uE2hd9ICtQpww5rfr9xABBXjvKxZEr/MPN/jpMIob/asHuvp9ZOpn5QF
         dAOxLaqGTGvectaCKwHoQuzpZNTneKfVe4ioZk+DqCVQaYyUsmXUxRU0h5fw4578x9Cc
         dKZeo8mhIU+put2Rwqne6ZtJmH5quTUCQ785gbnDNKqw4iim6bJR3Ml+oAVdLc7Qu3Km
         DQvva+Sm5EG/HwFU6dcZnANtTlqfRcGOp2IXvHNiQdapgBcpYdigmLBAuIERYp3t4YOs
         iRd133qErAbGUOQKsengv1sK7zBeJxXyS6kGNwqZQRTQKO6eIpoecgxqxs6dwCuZlDDr
         1RrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9P3NWXSdLQXzLjF1ej9Xd/rioD8hCF9y2AnCitFQrpfojK0Md1TUSESyftEiEHYci2ANsAR5bEB4uG83B7Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2rcAdgBbdXx2vCc+cbGExuQbbzdegv+44KbBPzfaJf79CR8Oc
	oSP+VSOKN0SSvLbz75TMXwZEPJhCTDZmbdCWleIrQQ2OCVTtNHpYb5qG+bamRSu+GQO2WmnH1Sp
	hKn66yLMBfTqV0FerKEGpi+7Wyb6vE9Pm9Bj4j+0r
X-Gm-Gg: AeBDietT2NomtdA67NmQTWsK2uIzA7DtckjGeZNNWmMP0Nqes8p9rMBB1/6RCiFPF9l
	63Rvug78X7Xtix0z/vmyhkeTbvBnn16zFEUmpQfOjK5l/5mkbn0a6tV18hOfA1FSs9BjBA7zjpx
	ROn2wtgOB9qTL1oS6DFw6Rf4qwxtuc5Bq+UeJZ+CI0H0/LdDlyFcBMNDId7/SJU/VKr0Y+G7y3e
	EwLHk+29nt1UlRCO+pDRHiPpIm/09u5ExyoP2doA0a0JCZU2ExhES6aXAUjYzWVy/RBynDJqAoD
	f0PrKgatHReZoN8oZnDFFjGLphKIAzL+sB3z4V9FlVyGx3Lr0460qqt31Iu4NWWYrrvl/A==
X-Received: by 2002:a05:7022:6085:b0:128:bac0:2edf with SMTP id
 a92af1059eb24-12c73fb6c49mr915659c88.34.1776416747190; Fri, 17 Apr 2026
 02:05:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416132837.3787694-1-elver@google.com> <aeG6RG41sgZuerYa@hyeyoo>
In-Reply-To: <aeG6RG41sgZuerYa@hyeyoo>
From: Marco Elver <elver@google.com>
Date: Fri, 17 Apr 2026 11:05:09 +0200
X-Gm-Features: AQROBzBPHFPjIQbZYgiVCtPkYdTt_jdnGikf9TMYOKgcXpS_D48owm4g6Ox5x3k
Message-ID: <CANpmjNPMxDkzvVnD9pXy1YBTO4n-abQZ+if6XdDj-u4dnfks5A@mail.gmail.com>
Subject: Re: [PATCH] slub: fix data loss and overflow in krealloc()
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, stable@vger.kernel.org, 
	Vitaly Wool <vitaly.wool@konsulko.se>, Uladzislau Rezki <urezki@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Alice Ryhl <aliceryhl@google.com>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Apr 2026 at 06:42, Harry Yoo (Oracle) <harry@kernel.org> wrote:
>
> [+Cc relevant folks]
>
> On Thu, Apr 16, 2026 at 03:25:07PM +0200, Marco Elver wrote:
> > Commit 2cd8231796b5 ("mm/slub: allow to set node and align in
> > k[v]realloc") introduced the ability to force a reallocation if the
> > original object does not satisfy new alignment or NUMA node, even when
> > the object is being shrunk.
> >
> > This introduced two bugs in the reallocation fallback path:
> >
> > 1. Data loss during NUMA migration: The jump to 'alloc_new' happens
> >    before 'ks' and 'orig_size' are initialized. As a result, the
> >    memcpy() in the 'alloc_new' block would copy 0 bytes into the new
> >    allocation.
>
> Ouch.
>
> > 2. Buffer overflow during shrinking: When shrinking an object while
> >    forcing a new alignment, 'new_size' is smaller than the old size.
> >    However, the memcpy() used the old size ('orig_size ?: ks'), leading
> >    to an out-of-bounds write.
>
> Right. before the commit we didn't reallocate when the size is smaller.
>
> > The same overflow bug exists in the kvrealloc() fallback path, where the
> > old bucket size ksize(p) is copied into the new buffer without being
> > bounded by the new size.
> >
> > A simple reproducer:
> >
> >       // e.g. add to lkdtm as KREALLOC_SHRINK_OVERFLOW
> >       while (1) {
> >               void *p = kmalloc(128, GFP_KERNEL);
> >               p = krealloc_node_align(p, 64, 256, GFP_KERNEL, NUMA_NO_NODE);
> >               kfree(p);
> >       }
> >
> > demonstrates the issue:
> >
> >   ==================================================================
> >   BUG: KFENCE: out-of-bounds write in memcpy_orig+0x68/0x130
> >
> >   Out-of-bounds write at 0xffff8883ad757038 (120B right of kfence-#47):
> >    memcpy_orig+0x68/0x130
> >    krealloc_node_align_noprof+0x1c8/0x340
> >    lkdtm_KREALLOC_SHRINK_OVERFLOW+0x8c/0xc0 [lkdtm]
> >    lkdtm_do_action+0x3a/0x60 [lkdtm]
> >    ...
> >
> >   kfence-#47: 0xffff8883ad756fc0-0xffff8883ad756fff, size=64, cache=kmalloc-64
> >
> >   allocated by task 316 on cpu 7 at 97.680481s (0.021813s ago):
> >    krealloc_node_align_noprof+0x19c/0x340
> >    lkdtm_KREALLOC_SHRINK_OVERFLOW+0x8c/0xc0 [lkdtm]
> >    lkdtm_do_action+0x3a/0x60 [lkdtm]
> >    ...
> >   ==================================================================
> >
> > Fix it by moving the old size calculation to the top of __do_krealloc()
> > and bounding all copy lengths by the new allocation size.
> >
> > Fixes: 2cd8231796b5 ("mm/slub: allow to set node and align in k[v]realloc")
> > Cc: <stable@vger.kernel.org>
> > Reported-by: https://sashiko.dev/#/patchset/20260415143735.2974230-1-elver%40google.com
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
>
> Looks good to me, but I think we still have a similar issue in
> vrealloc_node_align_noprof()? (goto need_realloc; due to NUMA mismatch
> but the new size is smaller)

Good find.
That's a separate patch, though, since it's in the vmalloc subsystem
(it's also not confidence-inspiring that vrealloc_node_align_noprof
has a bunch of TODOs sprinkled all over...).
Since you found that, do you want to claim it?

Also by the looks of it slub and vmalloc patches go through different
trees these days per MAINTAINERS.

Thanks,
-- Marco
