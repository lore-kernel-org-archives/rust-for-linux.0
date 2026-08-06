Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39943E6DD9
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 08:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004850; cv=none; b=Qvw3Zfyx8EeQymF/SuiYyU4Zyv9bjAqocf9kMO097ddoZcgzNjsFnMhf4YT4QRrfSguRc/dOMVKjDeHXB8slb8rqXJ12BKnXM3WlyX5ROwpKS/npfusUfdJQB9fMVG17Didy286YJ5OsPbfpZEk/aK/UZlmIJ8aQlyaEdxVl+vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004850; c=relaxed/simple;
	bh=RaZq+ylxQETsG2grpkNGQnzDvEI7yp2tMeXTkC8BLko=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TVCPkmtZLk7gkXY9HamTG8ha8wGs/kw7Lh0wEXmy+PGIMh2BBuTf5CZ0rf1r4Iv8q8UmB8Rfu37I3QJzaKaseRX44jmsCkOKv8W8K9ez9U1bjfl4x9dXOC2h3rxBPiWkMi2R5YZOV4pZXaag9v/zvZfI1JQ1+8f+X89CIb1I8ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IK0tQADd; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IK0tQADd"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-496b6f97676so18980205e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Aug 2026 01:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786004836; x=1786609636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BAOIkOcqalO/o7wmswIlVoL44WUmFncYhIvpomELsHc=;
        b=IK0tQADdCf8/KVhOQP3RWiCiJVjotuMmstTkKSOmuMzwI+ue2CDtLhtVUPn08XRFml
         3aUj/ztIwuBbxQV/vFC/XrgxH3vf1/AKmBvWFELahp2EFF6ktIeYFj7nTaDP1J2gq+xa
         tMchVAWFfjSa20c9P07ALmE5PEU7SV7UXlOlH3TSzQdsgS2fklfcNCjFkW8SbsPcOT/q
         /MbUEK3N0tMwXT4b+mqbxyGrtN7cHGXK26jaxyJ6tcVc70If7QPh4CeXCdnd9RDnSyf6
         I7yjualeHt2HgQN4pu0K7zayCmZ39sJA0bZlgte/LZNIgjXCeEkLKPyZuYJ0zbZUsu2f
         JNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786004836; x=1786609636;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BAOIkOcqalO/o7wmswIlVoL44WUmFncYhIvpomELsHc=;
        b=kAA+k5wpBJIY9svP5M5QEL11vYd/DV48BlLlAT64yB/Hh0PIVirXIoKjbJf21VtDoj
         8rCxiLi3NixqfM6HrFDUfPadlnxqhROmLdGASPvb47ul0WydZvgKIMEEPSLemNlCbMLO
         prP1w5KvhhHz1HLnuwBwmrfIQrpCUKPzLPqx8uAQNmYTSAciNc9Ohbekowf+TXVn0Fv0
         lV9bPKHLLGpvwxiEbmnGrhivmGDkhm3nMQaX/uMAlYnrNvGgNN23WMi1rK2ZegMIiR+8
         kWLXEH5/Ha0fOmDxxxX9q5s3YaQ1WNkd9Gpdo27+CBgy+hDhA4vm8s+FAMIAxjnH9KmI
         EbMg==
X-Forwarded-Encrypted: i=1; AHgh+Rqo4SDN3IWSzGstt4cndbWTE7GfNmTJ6bYtTKD/LZRpshRSb7/mT7DNkQ03o3wUAi7TgfCPypUaQvJUF70RaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSOC8H9oEh/jaOIevBLdqwL9a81GGgnJrJz8zyEAjPicG3XhWi
	rEuYhsqf/pNV/oGfZFDMpwTt2c6qRsi/RHw0oRaOLuuueIrICHxdPMtk1egLGBA0UKe5YjurOZB
	g+GkoUpPUnbvrE9sVKA==
X-Received: from wmix24-n2.prod.google.com ([2002:a05:600c:e558:20b0:497:ffd5:d12])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a21b:b0:495:4e89:3f30 with SMTP id 5b1f17b1804b1-4994e7c5e49mr131672365e9.15.1786004835498;
 Thu, 06 Aug 2026 01:27:15 -0700 (PDT)
Date: Thu, 6 Aug 2026 08:27:14 +0000
In-Reply-To: <20260805104815.104154-1-laura.nao@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <anHZpHh_5CZhH5N3@desktop> <20260805104815.104154-1-laura.nao@collabora.com>
Message-ID: <anRFYgjaEswOCB2L@google.com>
Subject: Re: [PATCH v3] drm/tyr: add Job IRQ handling
From: Alice Ryhl <aliceryhl@google.com>
To: Laura Nao <laura.nao@collabora.com>
Cc: linkmauve@linkmauve.fr, a.hindborg@kernel.org, acourbot@nvidia.com, 
	airlied@gmail.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, deborah.brouwer@collabora.com, 
	dri-devel@lists.freedesktop.org, gary@garyguo.net, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, lossin@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, simona@ffwll.ch, tamird@kernel.org, 
	tmgross@umich.edu, work@onurozkan.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2026 at 12:48:15PM +0200, Laura Nao wrote:
> Hello,
>=20
> On 8/4/26 14:23, Link Mauve wrote:
> > Hi,
> >
> > On Mon, Aug 03, 2026 at 03:34:37PM +0200, Laura Nao wrote:
> >> Add a threaded IRQ wrapper for Tyr interrupt sources and use it to
> >> handle the firmware Job IRQ.
> >>
> >> The Job IRQ reports requests from the CSF firmware, including global
> >> interface requests and CSG attention bits. Only the GLB bit is current=
ly
> >> handled, as it will be used to check firmware readiness. CSG bits
> >> handling will be added at a later stage. Add a Job IRQ handler that
> >> masks the interrupt in the primary IRQ handler, processes pending raw
> >> status in the threaded handler, clears the handled bit, and reenables
> >> the mask before returning.
> >> Add a wait queue and a bool flag so the handler can signal firmware
> >> readiness when the GLB bit is set.
> > [=E2=80=A6]
> >> diff --git a/drivers/gpu/drm/tyr/fw/irq.rs b/drivers/gpu/drm/tyr/fw/ir=
q.rs
> >> new file mode 100644
> >> index 000000000000..6eeb1399a7b3
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/tyr/fw/irq.rs
> >> @@ -0,0 +1,105 @@
> > [=E2=80=A6]
> >> +/// Requests a threaded IRQ registration for the Job IRQ.
> >> +///
> >> +/// # Safety
> >> +///
> >> +/// Callers must not `mem::forget()` the resulting registration or ot=
herwise prevent its
> >> +/// [`Drop`] implementation from running.
> >> +pub(crate) unsafe fn job_irq_init<'a>(
> >> +    pdev: &'a platform::Device<Bound>,
> >> +    iomem: Arc<IoMem<'a>>,
> >> +    fw_ready: Arc<AtomicBool>,
> >> +    job_irq_wait: Arc<WaitQueue>,
> >> +) -> Result<impl PinInit<ThreadedRegistration<'a, TyrIrq<JobIrq<'a>>>=
, Error> + 'a> {
> >> +    iomem.write_reg(JOB_IRQ_MASK::zeroed().with_glb(true));
> >> +    let job_irq =3D JobIrq {
> >> +        iomem: iomem.clone(),
> >> +        fw_ready,
> >> +        job_irq_wait,
> >> +    };
> >> +    // SAFETY: The caller guarantees the resulting registration will =
not be leaked.
> >> +    unsafe { TyrIrq::request(pdev, c_str!("job"), job_irq) }
> >
> > Nowadays we use the shorter c"job" way of creating a &CStr, and I think
> > the macro will even generate warnings in some configurations (perhaps
> > CLIPPY=3D1?).
> >
>=20
> Got it, I didn't get the warning with CLIPPY=3D1, I'll double check my
> configuration.=20

There's not any warning for using it, because macros still need it
sometimes.

Alice
