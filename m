Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10437279DC8
	for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 11:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771672676; cv=none; b=HG1Un+tNfvNDidsH6XGghOmakOPDHtURwry8GfcsH1LSPycMXiCccM+jr0UAuBNtM70NZN5gGVlK9WwyjI+NiYhn4ErRuedl1QKBeBNZ18jEQeu1oAA5btQq7VTmTPFKTjIYL8rONX3kRto3bVzQ3X0ipVkLh5RZJ+H9+j0MMjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771672676; c=relaxed/simple;
	bh=Up2UUqGZzUPmRm3jyaqpQNdnHP+sJXlCbrdgYnNug2A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=asbRwUWe1ojAOipHHiRB08SvIq6HGJ0MqW+dbg94Ht+ax6EckCp0+NStP1u8fmB9hnteaN9s4hhwyVS8Amm798DmdHjAmGluKzPCV0o2UPEmgdICxFqlFfvAu4qpwL34p7CdLrRFC3/eXhtNqEVoJXr3+7UKrj/QKdqrhrte178=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NBzGXw0W; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NBzGXw0W"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4836b7c302fso23748765e9.1
        for <rust-for-linux@vger.kernel.org>; Sat, 21 Feb 2026 03:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771672673; x=1772277473; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nLgfgkjh77J46ZUln9D17ln2Gi3ljJZ5rCGVfoowYl0=;
        b=NBzGXw0WozFVuItcMClScQ92J8SAshASvG385ZWwvhYO5RnCEEl6c2uuwudRcQrUkW
         XkKPqm1WtiJ+6A2qT0zAWHs8ugDQiKCdA1Qj1gRqwPIuyLTNQVIl7yGusM2j5/buHDl5
         Q37jVl5J2P945IT/++4Jalo/Xnh5wSo9yZps5lCupT1DXzDVEL0Md8uo+PBr7d0Xu235
         Xuo6QtejGmYQd8Bwy+eh/5Od+b3a17p6X1fPwO9W5B4P+fdj0RXef+l+He2OkCIwF3Y4
         pDvH2di2mldR23U4oX8o1LNtJMPgma+18U/Iqx8cjk+tEiH8JJXz1tVcgG5UIvtR5HVm
         AfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771672673; x=1772277473;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nLgfgkjh77J46ZUln9D17ln2Gi3ljJZ5rCGVfoowYl0=;
        b=ZbFl5BE5btuhVdVhuM82XuMZHSEBTDkmm36RT96V1avzdoSBIlHu1Yu3+85OxTk4ca
         l3G1eyolnXuPvbM+zXrPPP6HMfZdxUaWpiBBmAJ2cYdCZEtiP5A7ovp79wb7jP8HD0t+
         vxovoTPhXQY8Lpk3NjUgm9XxLlm3EHfKLtPSf8bMytKdXeN0TvUq7PjzzWvwyOPYULh5
         f9iPUc9uqxDQ8jWXS9f8sxtQ9BjRMZFyGIVY7D2tIc8oRyZxt0AGUa36/NaIZQIQPLzo
         A76lyYQYEfIdtyanVlAPpa1MNSn4yWYdDzSV8aYvof4tilOmFCCvkiBB8Q81j5F4wPII
         OOEw==
X-Forwarded-Encrypted: i=1; AJvYcCWCdH6qFL2uHf+bq+1f0c7JZI9mF8B3ZxKU09D9KD7G97QdjdjNv/yU0Gd5nNT3bBdm0vC7OyGJMGLMm6JcvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9nSSHHoc7i08nh9qxZvUWar0VqeMTBXe8x7wwj3I9BZ0R5wcV
	uy0IBfBl4iiEvAD8o/v3Mleh+NnMdGthByrLG6r9geid7wU4b8kaGu42EoNEkbzSc6RGN3zL+2B
	8chm/l0vEcUb7x0sJcA==
X-Received: from wmqt10.prod.google.com ([2002:a05:600c:198a:b0:47e:e27f:e298])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5020:b0:483:a2db:6743 with SMTP id 5b1f17b1804b1-483a95eb82amr44441335e9.4.1771672673212;
 Sat, 21 Feb 2026 03:17:53 -0800 (PST)
Date: Sat, 21 Feb 2026 11:17:52 +0000
In-Reply-To: <20260212120538.13f81d8a@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-9-deborah.brouwer@collabora.com> <20260212120538.13f81d8a@fedora>
Message-ID: <aZmUYJeV1F24m3kN@google.com>
Subject: Re: [PATCH 08/12] drm/tyr: add MMU module
From: Alice Ryhl <aliceryhl@google.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com, 
	beata.michalska@arm.com, lyude@redhat.com
Content-Type: text/plain; charset="utf-8"

On Thu, Feb 12, 2026 at 12:05:38PM +0100, Boris Brezillon wrote:
> On Wed, 11 Feb 2026 17:37:09 -0800
> Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> 
> > +
> > +impl Mmu {
> > +    pub(crate) fn new(
> > +        pdev: &platform::Device,
> > +        iomem: ArcBorrow<'_, Devres<IoMem>>,
> > +        gpu_info: &GpuInfo,
> > +    ) -> Result<Arc<Mmu>> {
> 
> Maybe the Mmu should be wrapped in a Devres, like we do with other HW
> components that require the underlying device to be bound to access
> registers. I mean, we do have iomem wrapper into a Devres, so maybe
> that's not needed, dunno.

I wouldn't add Devres just for fun. If none of the fields require it,
then I wouldn't bother.

Alice
