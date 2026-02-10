Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8C632E68F
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 20:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770753956; cv=pass; b=c5/gtgep/7yna/1UdA9ChOtymWcS4bKWBGm5WaYeN3WXdSlac6Qb525J9+rn9VopAbmaQ04aeq+Vl60lX8o33AbeEqywrBGoAaG/i+qmj2kfi01rpGbpovtKSMnDbIMNLNIgkNzCj5Q0uCfnLIHr268COg1spQjE++cA+jhqHFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770753956; c=relaxed/simple;
	bh=TG70rAe4bi79Nn3Fe5H19OmeCDCzk57gnPng23gUpas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PIH5tDBMSPptc3ZGZiXUODrbT2OXcNr65fUVMMm1XYVNE58eDrBchcjEu7vlFS1m/IjQPJCuAg+ag8NAPgRB/GQNqh9X60Dg5CYAQEI9f02S6dzNUy0x3xvdVyCzhk06oRrMWp5rroNs2FunaSi4uZz+/FyY+q67SyWVY0WHNmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oELoCeXO; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oELoCeXO"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4376c0bffc1so2159976f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 12:05:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770753954; cv=none;
        d=google.com; s=arc-20240605;
        b=jMcs4UNfShqzPvuAPb4j3UnqlQS9Mc8pWSwQrAHMFAcn1bEEW1iD4/NQXTnLEg2NJD
         BrJK2mraFvJu8qQYDBs/21pchuM6inWA0VH15Kj8uBnbF968iZHguPsVwSoYtaHFTnge
         cwwBTj8txGtGH9e+FaYnd/mE5xtuJagqmOBjODcqHy2RmpyMn+45H3b5fAYkGrR3ClES
         zWdVo2PfRoEmZS+yU7Dh+HXZnB31KoW04GLTQm2AxHpAmcwD8VFO8ltksDgq5SxZQiIJ
         suM/dgTb1fVAakLtp0Ia5wA0zh8qpztMVYXFsVFLLYRKvrRz/LB2hXp6/mOcs9cO3tY+
         CQYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=upMEByLIYrDaXmazI9p93LGMVNC8opBBuofCSNsUE4M=;
        fh=uMgr2zqj7FD3yz3xVlws7wPE383+cSykP8f60MLb+Go=;
        b=eA/VL/ETLoKlvRzobn/fXGlLrzOk5j/uRHqtay70XoHjPh3WEJxm7twyfBkWTCHwEa
         IZgdNP/qHDYpGoBF660ron0A4RTImyHPBgOPW72FKim/1whXQGPqarGT3+WuiGL91vRL
         H8p+Q0UWRDBLKGJEvxn42Lox/FgWU9qXFpQOnM8lb1j2PNTbJp5VKqKC1BIEcr3uhDzP
         xDvlXj2Z/ghJVxD9kWM92IfShK/RMSb+exaMLOAFLMhEQU/m/8p+voxfhFtuMyYHs5nS
         WC5+dbYx+n3l6zhQS3XY54O6vFzA7Fll88I0cml+iEKrrtodfpL8WohIL/R44gWD5jCW
         UikQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770753954; x=1771358754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upMEByLIYrDaXmazI9p93LGMVNC8opBBuofCSNsUE4M=;
        b=oELoCeXOVSAMRwmr7kVrA4rQ8Y1Z9dGqJGptO74IiEGLQCrtLS356aXSQp8q1A9s6Y
         bjTdpApTlGIgxgAapDO3/8fv/etPWxJiPuOmkDO9T5uZBCP1b5ho7la9Ev/f7qMb+ep7
         ibeWUFWOKW3a0Io/VpBWH8UOkNTzsF+WvtMM3fhW7/WoDKHP0pca08WxVTA8diJnDxPS
         iW0rvXkc2hjOzcHVFRm0jx066aysKtWf2FF3eHmyVmvh/CaldQCCbVQwpURpAvQmqPxN
         MekXs/BoAGT9fpBayj/iSVkkZQSi7NDniPtY0e5/yUm4k5OTVhfBiUn4tbrEhAXSX7Ye
         k7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770753954; x=1771358754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=upMEByLIYrDaXmazI9p93LGMVNC8opBBuofCSNsUE4M=;
        b=EUXGwpd2eoNm0Ogw2jslVEnXKUS0hTu3VGYhrKlOeCyYCVDRZR4M62fIon/60hkorr
         bK1nEvZY/1fQ+qnUTZuqoMCJmrUwPwaYip9OKcs70ZMUWuLu0fCMZgYHob6m4BNzwtBs
         8w8ilFh7W+NuB5+cuLacVLAHGjcLzJzSn2uyxxavh1R6AWlav/zDeFLxZSHqS58NnTY3
         /UgUDjDoTY4i6vV+XY3Z/hUM/Ns1K93jyMEshlklfDlJ3trqxN2lUckJeEnqrSJVBVaA
         mtPD3swq0JbOi9DduOy4dysCdHe0gb9hkjgqtIywVfLtWqJ8mpHinh4eWgFI5/sae/j4
         MoNg==
X-Forwarded-Encrypted: i=1; AJvYcCWkZ+Ju2OPUt6lZkLcfQ4sl2sU2aj/WYp6Cyay99/ZWX9qOZIppbOLzdn62X+liMHMWlQ+LYEuiCuW4095HOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnLqUjaX/2UeABpV6T2734n55qHwgMSinp2rvNKtSC0M51PnSO
	/N3RlJ3iZPePvyv7bCnslbBnpOJCjZMrqGuFMUeA+GXtaTO1M2q5jNFcw5bfT+0AJ6bkjQCFiMX
	q6f7y4YkzILPA9Za3J7XF+dIjpK+vVXznZHab8eH5
X-Gm-Gg: AZuq6aJPtK0/EqQr79Ag/9HdYoUPiSw5POmx/5+8pFh54tdQXGPLS28f19sW/iIQeGp
	7vQ0cf3W5fJVm4I4YzwfQVBBhQAqjElVdiOnUvngNKE/LFLfe2KfTCvjGJzROc6KgHQ456/c0x7
	kzcDzuypfFTiKPj4D/o0M+HGmY/Rt6TOpggbJWPGirQEGLZDFNJ/6D/SOsmSuZ/4kkz4KSl14kl
	4YZzxJpeJP/ktgsWOuNgH8r9QRVAUEj70R4lHDYfRvfYsSaAHTo3/PmxYhbBcu+7OCsfphR8Tgx
	lwtqlYaokTSdpPmDsvdJiG6Mk8TS+ri6On8wmWUYG0dJ53aE
X-Received: by 2002:a5d:584e:0:b0:435:a501:359 with SMTP id
 ffacd0b85a97d-4362967defbmr24139457f8f.41.1770753953623; Tue, 10 Feb 2026
 12:05:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li>
 <0d336a3f-f317-4a70-942a-d87a3faa3a89@gmail.com> <aYs5L1aG5S34teKT@google.com>
 <DGBDHMI9Z4JK.3QHCOS1O8WGLB@kernel.org>
In-Reply-To: <DGBDHMI9Z4JK.3QHCOS1O8WGLB@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 10 Feb 2026 21:05:42 +0100
X-Gm-Features: AZwV_QhNxva9w60kKC7-C1wP75Xv_vQNEnTCiAjZ4kB53k0JnFkMFs0ZdF9MYNY
Message-ID: <CAH5fLghy3_J_in-o=y8yh94+RLn6XihNOTzTiT2kk9DkXBMPVA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] rust: alloc: add Vec shrinking methods
To: Danilo Krummrich <dakr@kernel.org>
Cc: Shivam Kalra <shivamkalra98@gmail.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 4:05=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue Feb 10, 2026 at 2:57 PM CET, Alice Ryhl wrote:
> > On Tue, Feb 10, 2026 at 07:08:09PM +0530, Shivam Kalra wrote:
> >> This is a follow-up to my v3 series:
> >> https://lore.kernel.org/rust-for-linux/20260207-binder-shrink-vec-v3-v=
3-0-8ff388563427@cock.li/
> >>
> >> Hi all,
> >>
> >> Thanks for the feedback on v3. Before I respin, I want to confirm
> >> the direction for v4 to avoid unnecessary iterations.
> >>
> >> Proposed changes for v4:
> >>
> >> 1. Drop the Shrinkable trait entirely. Make shrink_to() a normal
> >>    method on Vec<T, A> that calls A::realloc(). (Danilo)
> >>
> >> 2. Add a temporary ShrinkQuirk trait to handle the vmalloc workaround
> >>    (page-boundary check + manual alloc+copy+free) until vrealloc
> >>    gains in-place shrinking support. (Danilo)
> >
> > I don't think you want any new traits at all. What types would even
> > implement the trait? The special code can go in the realloc() method of
> > Vmalloc struct in rust/kernel/alloc/allocator.rs.
>
> I did not propose to move this into the realloc() functions of the corres=
ponding
> allocators intentionally, as there is a difference between calling reallo=
c() and
> shrink_to().
>
> I don't want that some user of e.g. Vmalloc::realloc() experiences page w=
ise
> shrinking by copy. This is acceptable for Vec::shrink_to(), but not for
> realloc() in general.

Ok. In that case we can add a method on KVVec directly for this
purpose, but I still don't think we need a trait?

Alice
