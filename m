Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFAE29DB6A
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 09:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160185; cv=none; b=jngUBUvZhOQfBYDlb2E8qdc5hJ3KLEqsgz3qJ7womv1ULBtALqJ6UvtekUuQN2oBOpkZv6ocAmj4SOUMYybAOF0SbL7IAq3mok9I1IG4HOrkLLUWyihtMYn5X5kw9ICmRY5/M8icZzPDb9PuTm9Jo+Lc1qUPjmtwSvCWt7oaCaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160185; c=relaxed/simple;
	bh=jmRzwHbiBDRhvUStizcooMOirVVk+Rjihob918JmbUE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AyfN7j7swL/x7rZ9g/myB+bOJf+9I9/E9t4JofufYfX9z+ajzmpnbFIpABOM4CwyCwYmbJPfwLG1Xxx2UvLQ5CheF4wVppSafivHDgKHopfFwXmspvYIrHW9hpdCGnlN5N38kgIW7BZktEFMQM/z3i2Lj0AwRO+ew6zjpZ/0nek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XgC/Sbp0; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XgC/Sbp0"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b8842248611so138679766b.0
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 01:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769160182; x=1769764982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krQTROe4H3NUeXd/bSNRIGoEhdSPybqAT9gUYqiaTP0=;
        b=XgC/Sbp0nA1R18XWzbNvm2XRskOFg1IavMFRlAW3cBbpqs7STRnhu4cMVHCsBo/T+4
         TWdUHSCKLVPZRY1ON4EvJ7tVleflmERQunjxoVdJBjWThX3lSBK+oVBM3Pjj1nXOFg2D
         x5I3+Q+wCzp4Ji8Trv3EpJU7+swa+XAcXHribzWFYruCJtIU7y69CUFKESngX8AGiCGv
         0J1/NDLWzNY5CWdOjBP7PD8QaaX6YvIUdmlSKmp8VnnHJAYlzcsg254/bj9MTY7gTaFE
         rFSHcx7RApkklqkVTQZILI5o47hGz68KytfUKXiaF0wsRYnd8sM5WvWZVP6arUrt9F+d
         n98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769160182; x=1769764982;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=krQTROe4H3NUeXd/bSNRIGoEhdSPybqAT9gUYqiaTP0=;
        b=hsa4lZKa2nHEvyIopx/vQMHm2h1++MnDose4msAaX/vVWSIIDpJtlaAiXDkc487OEM
         blR/ED+Q2imxAagz13W75YKMGotbBePBqdB8nsCBl/YTB6ypz3cPErm8I+J98WOHxfGX
         NNaNG7OweJ26tMPeWIS6JgGH6r+z+Atp+S4+VuyImTMRsWxiiFTBC9RzBCpJ+okdcEBX
         R42q1T2OWtdD5KUfJI/CozLAO5JtwNYs/hTU3ZJewHJzv25KmB9q6r8a9hAkg+CCL7r1
         q6PhX7doCdqMCl8dViWAVlBNR52lAJDLkxk888z9YwFSbH74KFKLgD/CG+4tou6TZtvL
         nz1w==
X-Forwarded-Encrypted: i=1; AJvYcCXsRZhhocclyrWdnuqtMPQqyuijDw0xNRLfnSFuW98JdMKaO9VZjsyHHK2+RBMleDmKl7Gnq1+qG49niURIuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7SwgSn77Ve1+87F3WWZCR8QP47zoiOk0cawvbudMWSXCm87zg
	voZOqxi2XYRuj1j0r22atxHLVIbsoT1kjOlItn9C+eQZEoWKZcy+3eWG6yGfG/rhDoeMXjtVrZg
	d4sWGlU1Ivn2jGPN+uw==
X-Received: from ejrp15.prod.google.com ([2002:a17:906:6a8f:b0:b88:39f3:89d1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:1c1b:b0:b87:380f:f576 with SMTP id a640c23a62f3a-b88673667bamr47886066b.30.1769160181881;
 Fri, 23 Jan 2026 01:23:01 -0800 (PST)
Date: Fri, 23 Jan 2026 09:23:00 +0000
In-Reply-To: <180E0324-383E-4813-8CD0-CA15EC3B3EFB@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260121-gpuvm-rust-v3-0-dd95c04aec35@google.com>
 <20260121-gpuvm-rust-v3-5-dd95c04aec35@google.com> <180E0324-383E-4813-8CD0-CA15EC3B3EFB@collabora.com>
Message-ID: <aXM99J8s5ltmZ1hE@google.com>
Subject: Re: [PATCH v3 5/6] rust: gpuvm: add GpuVmCore::sm_unmap()'
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Janne Grunau <j@jannau.net>, Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 07:43:11PM -0300, Daniel Almeida wrote:
> Hi Alice,
>=20
> > On 21 Jan 2026, at 08:31, Alice Ryhl <aliceryhl@google.com> wrote:
> > +/// Represents an `sm_step_unmap` operation that has not yet been comp=
leted.
> > +pub struct OpUnmap<'op, T: DriverGpuVm> {
> > +    op: &'op bindings::drm_gpuva_op_unmap,
> > +    _invariant: PhantomData<*mut &'op mut T>,
>=20
> Would have been cool to explain why we have a pointer in this PhantomData=
.
>=20
> Same elsewhere, IMHO. Helps with maintainability in the future.
>=20
> (To be honest, I=E2=80=99m not really sure what=E2=80=99s going on here..=
)

Normally, when you have an OpUnmap<'long, T> Rust will let you convert
that into an OpUnmap<'short, T>, but I don't want that in this case.
Making such coercions impossible means that callers of sm_step_unmap()
cannot return the "wrong" OpUnmapped from the closure because the only
way to get an OpUnmapped with the right lifetime is to call remove() on
the OpUnmap you received.

(Otherwise, it may be possible to return an OpUnmapped from one
sm_step_unmap() call in another sm_step_unmap() call.)

There are various different types one can place in PhantomData to have
this effect. A mutable pointer is one choice. I could also have used:

	PhantomData<fn(&'op mut T) -> &'op mut T>

or a few other options.

Alice
