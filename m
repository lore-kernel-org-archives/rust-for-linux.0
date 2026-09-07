Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96B0443313
	for <rust-for-linux@vger.kernel.org>; Mon,  7 Sep 2026 09:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773079; cv=pass; b=WtRfpqdzfApvOEpHPwrYYwT2dmPAhZ8o+l3omWMrNrQ1w+1gUW462K+e4S12eyb0Fo4CvZJfln0ornq6T1ffnwj015JnBE0cO8GuT1J7gjYmdbV/eS92DuMRgAe5wcVhiiNr+HYDO+B3g1b0Nw/rGddjzNwPWUw5e2lUZjjFQAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773079; c=relaxed/simple;
	bh=cSfmMGgIFwjjaaI7Bk9duU/SsMv1zgWa3X4ow3p9Z0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KU8RfTaGEiKFuH21zYwqVvFj/HXO54ClMLJLv5GGRVlxFYl3sxbXySK3EMupr1xjP8leFVsLnvgBu51YfnHnqpmZLBVpse4S72pArGrth4Ug2mV4tXDBQJNj1eZcO1ter/sd0F6PTFfiZVrNPF+HxEJ4k/omXe+vVx0zpufHWh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bYzWZS6h; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bYzWZS6h"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-484362f5c4aso4214917f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 07 Sep 2026 02:24:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788773075; cv=none;
        d=google.com; s=arc-20260327;
        b=s/uRjwSrDYX3fDAKoltcf4WGGtJgiSHO0+0/7DOHr5qaCa5nFQ1Vj4k+mker/kSvPl
         VwqJpDjIO1Nh2Eyez9KR0SCYnwj3K3juDOV0B7PwVm/PoVNI9IW4hv4jBqbWsw0GgJqm
         JG1lWXyKjdcuD+Z7mQ1Z+1w2+LF3eE3SZ8cTxhcuQ1RI8Jalj1LoE4+hv/9Wj88PtQIg
         9/40IwwnfEvkhExofr4s1iVjG/6dyp48QM8IxriN17VSkYvFH2/iAb+XkBL2FJDAGZZC
         DGrJVvQufOlg/dStf+CYQ8XzA3NA9iRorkPCwdF2YBkNCKytqaeM4zGV/Z0Qrh7FKrZD
         VI0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hfGjfP8T35WEV6rGIAsKY4f5Rwo6my7dAG0voowddxQ=;
        fh=9ho6jKuGwb38sYMoljuBUcBZV9EvAuy0B1wQut3jqSA=;
        b=OYmI6OrXWxb3xmsuo+UCs6AtSASYuMcKcXfMZdEKQUP8H/JhMc45CQCG9wgp6ykQRP
         XKE3Bf/x9x5AXlpkQoQIIw8/SPukV7e/cUzkygOgAQEsxq41M/IoUcTXUqxutuHn1rVo
         wBclPUTLWyJB1v4IYhr8kHU+asemuOOeJcr173sC8MDmoP0nY7OH01XFqAIHVbNgYOcv
         UnMi6Z1cyzrjnffT+dWit+m6pAsuTlGPDWffytt9nQ2wS3pHKS2wpil1/6xbwkAgdmV6
         pLVfraxQiMZi1PQbCNu2bRU75GWFHpFvKZFXQBSmLTD2ppKS3sFhIMXGqJFe2YPSIFlM
         1s3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788773075; x=1789377875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hfGjfP8T35WEV6rGIAsKY4f5Rwo6my7dAG0voowddxQ=;
        b=bYzWZS6hvyblgTmL2WcmqKBFUHHD7UV1gkXyod2CvfAo9EbydIVeGF++9jABbnZPte
         ys7ocRIu1X8wdEIGp96wY0ZJwuX9iep0RRInWAVJmxBvFDn1O/SCyei+2Uu4DEx9EFWy
         Ju0SX+/3BqiQeyfykHFwlXZNMjTYSHT9Hz+p1tge65xlQefntxQdIOB//wajbELDPR6l
         bZSz7BV5hpdU91s0tZALuvzT0BaGoZvdwZ+37h8mSbXVV8RthaPq9o6xvdh7qixRCia5
         5aTu+haqTXNlK7d6WQD6MLUT44ym0DOgw7EgnQhTgLv5A9qh2xRN6Nek2Upj1f/kRQ35
         VQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773075; x=1789377875;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfGjfP8T35WEV6rGIAsKY4f5Rwo6my7dAG0voowddxQ=;
        b=OMOhnMoZBBHahGSvLUP4xLJhwNwKM0TxYgSmGfA4TmDeHCgaY/uyIaopltAWhOV1eX
         5WcBYbrbdhkMaM/3gH52ONCFOc4H1jqrKMYD2JJ/gVd85BZD3/QI7U/5rlx+Eg87Uc2N
         28QPZQ6yunZqgVgT5tUIe8SlmoP5JWjy+lvynbr9e2YbMTMabbm7PEeHb6jcdXN0zCrj
         A0gboncAtIS0Ha3v+gKsgBuvZKCVrs1AV+acR3Pocp0t4wbh7FVsxQquyAH145/t3Jgh
         ou4mE9AMOBC1bmKZa8PMQ0nnxdh5fwIUkS7K8Nt1QBg6CJP5ilOo1vmN8aLFId5uMOt0
         sYXA==
X-Forwarded-Encrypted: i=1; AKwUvByBx78B0hhMH9wkicawfZ6SZDtvzWZ3UflfwSgC+v6I4KtfIlvqNwr8AARWlJVHq3XYAb0f4L+5ssWlbYp8NA==@vger.kernel.org
X-Gm-Message-State: AFuF++nttKT/MLvCfbr+VOASuWJiR9LExPZbpWwxhkwiSwWFM+z85zU+
	ZJepZcwRdwNN6rtxSJfiI/aXjnaOW8WzcWXwJZm/g7hEFbB4H1kAiVfpt36NFdX+xX6ee8bt5My
	hROnoAieVy/BMI6GC0zy6tI6cSYGhwRysGzgyJQDb
X-Gm-Gg: AYBFou1JVqCD0+i1WogOhSy5kU1p61+ggFaf2xiuz5gouJPL7w6tCsuPJlMHn5X/XLP
	dc6mZzJ4RcqCusU6JHFybPqN+PdN06sUpChuFwtYBPfPVXpbfEunufOYkdfHtQ4jCRsIhQ2ak+K
	bsTq5sOHTqmF1UWYPP5YeF/hS/JdsPq+uid+oPXRGmCa9JN/TAyMUWp89sGzEGX78cy7VhrL9FD
	yNGO2nhRFo6RlcEmeQe5YfYXGKGg1YTfNyAhbp/SoOzxO+dDxPmlNZdJjkUCBwuK319pRfHIivt
	spu7IaGCvf5RwLbUDTseNda7DOdvOlCT5AV+Cyyb8jYlNGZSvxtiftX1Lz8aYypobeXsZmVDbji
	GMk/Qp/aAYwE5p9YY5S8UJgKbRi/tKrk=
X-Received: by 2002:a05:6000:430b:b0:485:8ad6:3752 with SMTP id
 ffacd0b85a97d-4858ad63a6fmr37026021f8f.5.1788773074197; Mon, 07 Sep 2026
 02:24:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-unique-ref-v20-0-490735672187@kernel.org>
 <20260824-unique-ref-v20-4-490735672187@kernel.org> <ao2WubjLtDuHvRzx@google.com>
 <DL894TFXM5AT.2QOXN683UKXIF@garyguo.net>
In-Reply-To: <DL894TFXM5AT.2QOXN683UKXIF@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 7 Sep 2026 11:24:21 +0200
X-Gm-Features: AcwNN1V4plkowyMHAsnIxTQwxzR-aYAz331pg1N8okzwNx7uKX70uWh-YG4Yx6I
Message-ID: <CAH5fLggAMfBcxprKJxs4JbieKadC_mKg4B0xNETOH1QUi72UGQ@mail.gmail.com>
Subject: Re: [PATCH v20 4/8] rust: page: convert to `Ownable`'
To: Gary Guo <gary@garyguo.net>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin@linux.dev>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Ira Weiny <iweiny@kernel.org>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 3:02=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Aug 25, 2026 at 2:20 PM BST, Alice Ryhl wrote:
> > On Mon, Aug 24, 2026 at 01:17:56PM +0200, Andreas Hindborg wrote:
> >> +        // SAFETY: We just successfully allocated a page, so we now h=
ave ownership of the newly
> >> +        // allocated page. We transfer that ownership to the new `Own=
ed<Page>` object.
> >> +        // Since `Page` is transparent, we can cast the pointer direc=
tly.
> >> +        Ok(unsafe { Owned::from_raw(page.cast()) })
> >
> > This doesn't satisfy the safety requirements of Owned::from_raw()
> > because the page may be used with vm_insert_page(), which increments it=
s
> > refcount and causes it to be shared the vma system, and this occurs
> > before Page::release() is called.
>
> I suppose the existing vm_insert_page() abstraction we have is already
> problematic, because it uses `&Page`?
>
> Maybe we want to change the API to use `ARef<Page>` so it already has to =
be
> shared? Conceptually it takes a reference count from a `&Page`, which isn=
't
> possible because `Page` is not `AlwaysRefCounted`, so it needs a `&ARef<P=
age>`
> to be able to do that op.

Honestly, the problem is the safety requirements of Owned::from_raw().
Pages have a "special" main reference, and free_page() does more than
put_page(). It even does something when the refcount does not hit
zero.

The correct behavior for Page is to allow the user to hold one
Owned<Page> whose drop calls free_page(), *plus* any number of
ARef<Page> references that invoke put_page() on drop. This way, the
owned page controls the special drop codepath.

Alice
