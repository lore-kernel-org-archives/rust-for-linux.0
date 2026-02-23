Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A4134EF02
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 11:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771845768; cv=none; b=lXmV3eAB7zI+Ue8OWlUsIiONwgOZx4UtdSYVOdiR1KkBVbOaIwH5TNGH1iZ17qyGVLJJQutPO9/bVCh+XtG5jRFEwsSEIWizhJoCLsn6KUBEc9ZBRU0LRuAbrLk+rA4xgh4S87pKZZHswQ2Hoxmhclt/BlaBA/tdfb6DN4h+7rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771845768; c=relaxed/simple;
	bh=rNwPGmhwj2ALlaJUUs0+8tA0iNVj/xRk1HADmk42YWE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Tave8pxzMMmImIyAxQ/10C6zOHD8OA5tgiSFnBDohd/dl2UgMpnb1DU/tp+9tNo1DoCnF4mcrobCSijzaMjy4pwKHIfUGHuVRrG1mwx4FssXP5hZoae+Ua0sTrh693KaHHTlc8zoIByGD3dWStkmjdBRCeFKrUF6xZj19T2Bmnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=By1XFl21; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="By1XFl21"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4839fc4cef6so29806715e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Feb 2026 03:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771845765; x=1772450565; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ezzn5ZoGBmTqaL/WoWOOmJY3hi0ECWwZN/jUNRe/4RY=;
        b=By1XFl21Ny/bO84IazQfzIceE3zhMspqj9vVXG87d3ZXVEWjMBGn1yqoZ25fvGRzxd
         OHaskh4ci8RXHg93JfpuTD2gotmK+ruoWckYPPo5CP93D7oh+Jt0SVZjKAlOY9d7tMRK
         9bWln6nsmu9YxVsBBOftwodIJGrqqZmiVSvkfENTBRIYgGc3gYN3t/itMUR4LCqFV5Xr
         znUiIB2kmXnzsbDbnR0wcwgF0dZzoyIq2AKwWRo+TfW6tYWDXONXLrFdm9p4ygMLsJaH
         4fJL0VyJY75Ocmwozrsz4IX6VyNZO6ltyBXPF1Fv+XKXxvuYUnmLNSu/4mOD3INWt0yO
         EY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771845765; x=1772450565;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ezzn5ZoGBmTqaL/WoWOOmJY3hi0ECWwZN/jUNRe/4RY=;
        b=qi8WptktmjOxway9mo9yxwQKNnk+A0ErzoJyuFZbiiMJ7iouUn4d2S8/2ACgztIbWY
         wel2ygCSPOIpvwOzLvauDJw0cReC2yPN/xNooEPBRLln+HkY6PNBKAvXgmaeUSwGEaht
         Dle1ouUpl5qKwY6HcL8h/bGaNZGI9lhie2oToYing7+8gFo6gieRD4EJj0ZS3d82ZXLH
         j9AJrD4CWcGmV7Z08dTaWWo2AH7NSzN1Ol1sl0qcaimCZh8f0m6CSvOKFPbUffIrMiBV
         8eIYY0Xa9MVw1V+w852rBrhuYLc4NLNQxZhyDQMR0JzT4LZLoXJjA+Tpyvo1ZzUO1EQz
         zlvA==
X-Forwarded-Encrypted: i=1; AJvYcCXyw95AKmWWBBRDhANitLONBK6oGRoiWyZS0TtypYoNwP6A55GDnl+NJP/nFyI46jeBOX0RcWBruTXFKooTqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzte9jLogP37tvB0ONH0QRAHqKLfJi9m0gTHAW9nQf9l0NbfsMf
	bFIomEiB8A/FwXE98uwkAIvN1abse2BzlqNQwutVOuDgqBRszZuKTDEAOxycKd4VzANiqfRjXc4
	AyX4DYZtp80OToLq+8w==
X-Received: from wmqc1.prod.google.com ([2002:a05:600c:a41:b0:483:702a:341c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f08:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-483a94c996fmr127902415e9.11.1771845765025;
 Mon, 23 Feb 2026 03:22:45 -0800 (PST)
Date: Mon, 23 Feb 2026 11:22:44 +0000
In-Reply-To: <DGMA3158PGED.1BQ63TEC2FC60@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260130-gpuvm-rust-v4-0-8364d104ff40@google.com>
 <20260130-gpuvm-rust-v4-3-8364d104ff40@google.com> <DGJ6LHIVMV03.MM7RWYBJHBIQ@kernel.org>
 <aZgYY_fetgz_GDR8@google.com> <DGJX3FI97W1G.371MAMC60FX24@kernel.org>
 <aZlw3SGmLetHwaTM@google.com> <DGKQH7Q9QONY.4GLSDMQ8DOY1@kernel.org>
 <aZwalt_6KlOIDzkN@google.com> <DGMA3158PGED.1BQ63TEC2FC60@kernel.org>
Message-ID: <aZw4hCxvx_2oFIha@google.com>
Subject: Re: [PATCH v4 3/6] rust: gpuvm: add GpuVm::obtain()
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Janne Grunau <j@jannau.net>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Lyude Paul <lyude@redhat.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Feb 23, 2026 at 11:44:12AM +0100, Danilo Krummrich wrote:
> On Mon Feb 23, 2026 at 10:15 AM CET, Alice Ryhl wrote:
> > On Sat, Feb 21, 2026 at 04:09:41PM +0100, Danilo Krummrich wrote:
> >> On Sat Feb 21, 2026 at 9:46 AM CET, Alice Ryhl wrote:
> >> > So, should we get rid of GpuVmBoRegistered in favor of ARef<GpuVm<T>>?
> >> 
> >> I wanted to avoid exposing the reference count, as I suspect drivers might not
> >> need it in Rust, but I don't know for sure.
> >> 
> >> We could also define it as GpuVmBo<T>(ARef<GpuVmBoInner<T>>), where
> >> GpuVmBoInner<T> is private, but I also don't want you to go back and forth with
> >> this in case it turns out we do need drivers to be able to take a reference
> >> count and I also don't think it hurts too much exposing the reference count,
> >> even if not needed.
> >> 
> >> So, either is fine with me, ARef<GpuVmBo<T>> or
> >> GpuVmBo<T>(ARef<GpuVmBoInner<T>>).
> >
> > I don't think GpuVmBo<T>(ARef<GpuVmBoInner<T>>) works because we need to
> > be able to talk about both ARef<GpuVmBoInner<T>> and &GpuVmBoInner<T>.
> > The reference type is returned by several different APIs, so the Inner
> > type can't be private.
> 
> I meant NonNull<GpuVmBoInner<T>>, analogous to the current GpuVmBoRegistered.

Not sure what you mean.

Ultimately there is GpuVmBo<T> which is just an Opaque wrapper. Around
that, we need two pointer types: &_ and owned. The owned one can be
ARef<_>, or it can be a custom pointer type like the patch has right
now. Or maybe it could be Owned<_>, but it's honestly not a great match
as it's not really unique.

Alice
