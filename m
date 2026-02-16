Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2E1239099
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 11:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771241731; cv=none; b=WZaOzqniwaWBloXvHS4p8/TvNdWxKyOUpqt7p771dpM7ZatasikoKNlYmbcs7j7a0nyfw+Npcfe7nETS87wL1hwNVTLDc61HdKV5uqE2jGIn9NnXPMmqNC1jEds3ErF0KA/oPnztkaU+6TYqlxVdSFQpaGcQKjBVTcZtxGoTTDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771241731; c=relaxed/simple;
	bh=uE/mjFeTnHKZN0Len2sn8q0P9apJrQkgfX6J6zKwBhE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=icrmaMmrj4mRLD3RfsTsD/1ryQRXbLyoVPxVUWcGFC3XzMza8HGF/+Ty09f0uVamY2OOwBNli0b3Fi8zbqj995/Gb86PGNDp4IlgwJuhXpI9rhkEsVmoJ0Qvu+hUlvPYYpFS+9lXHW0r+tWIKhhsiushkkUVKguLRDq067np754=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1cxEb3vt; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1cxEb3vt"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4803e8b6007so25452715e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 03:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771241729; x=1771846529; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F67modHH25Y5O5ELxZwmixMWUpgeSd637tYygFtD4MM=;
        b=1cxEb3vtKBRj65FbFD4eB+c7UBBTJ9s5B92qlbyU/Dlr9O4s6chQDfOqOSC5xu9dMK
         0zyEY+VNUI8Qn84SD/ALZW0lyMjrX7K+MbPpa/rGmldFysxZVcATFo5BMn+5GYkJ42ew
         rBU+npX/E3DGrUMGRl6vBH8WDRGS3QsxqJB9TkRZ3F0QppjHWHVjilWIzLUZG6Cm0ipY
         aZAQ9qCBwZ8w+0L0ywL8CyjLlbtGXOEIiWr4haYIo5r3mMS4V1lbyatRXmqBaQNg8P0i
         UZjHJWFVuTkov03QU1sFp5r3iIjR+mOhZoR9DuWv9vkh8pFobJDZzu2r2vgYcZs1ouPE
         kDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771241729; x=1771846529;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F67modHH25Y5O5ELxZwmixMWUpgeSd637tYygFtD4MM=;
        b=FmMC8T+ZONikWx0sYQ6rRKIyEbZi3jqepjZBUZAjYCmUU2UGbFI40SitxUXQ7K3vzh
         mHmquAnKBpEwkkL/3Etu42vZGTdJA4w/YnR6n+p/A1phKXEFPZl2DZ3QISWUECSg0KZk
         AnuI5j7270cBDK0fq43SfI1ImS2G5NtUxdQWMcM16I10ydQRIFhHvX8twkRLscmsGhkj
         5SHuqDL8gwLZqe6nvVMn7UAyZDxZE9Il/wNjlqeyLoxm7anTiwwY+5UsZPqOCv0hB7uL
         L51AM5lrGCRb9yrSlN9S1wdsp+pMoGf66n6XNQxLB7y18VTBOiCH0A3VpUon04GJ5QtX
         WaUg==
X-Forwarded-Encrypted: i=1; AJvYcCWPzDjvpDxgJsSiLkH0cw0m4Sm0aAludx3wAipKE5noivBZQnU4DxUEjEmXc8rFCeAymwKMldXP3+rjObl8QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwG8U+4Z3PcNOPtt7B0pPcKh20yMeF/LTnjsBsgfEV+jvTHTv+k
	1gEDQ1sdfmkGubOt/qb3h+P68kO5lsDhGCVjHPenhAQs59ci5pyw7zIovxIE2zbPZh3CM/pWIC+
	0480rnDrbXpxDE7n+nA==
X-Received: from wmph41.prod.google.com ([2002:a05:600c:49a9:b0:483:509d:729b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8486:b0:47a:7fdd:2906 with SMTP id 5b1f17b1804b1-48373a1b533mr161837985e9.12.1771241728861;
 Mon, 16 Feb 2026 03:35:28 -0800 (PST)
Date: Mon, 16 Feb 2026 11:35:27 +0000
In-Reply-To: <aZL-09Wk-KrDrroy@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260215-set-once-lazy-v1-1-6f5bd2efda11@kernel.org>
 <4EYpvxiPLRBBb2fUI9n8ZrVkve50KAvXwj7oFqoYhtpIuY_U7eVtiwnjA-ZR8n7jCwoJL67EI1ex2_DmBs5UMg==@protonmail.internalid>
 <aZLZbN5C3wXgt3kL@google.com> <875x7xdjvr.fsf@t14s.mail-host-address-is-not-set>
 <aZL-09Wk-KrDrroy@google.com>
Message-ID: <aZMA_3CBEnV1Sg68@google.com>
Subject: Re: [PATCH] rust: sync: add lazy initialization methods to SetOnce
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Feb 16, 2026 at 11:26:11AM +0000, Alice Ryhl wrote:
> On Mon, Feb 16, 2026 at 12:10:16PM +0100, Andreas Hindborg wrote:
> > "Alice Ryhl" <aliceryhl@google.com> writes:
> > 
> > > On Sun, Feb 15, 2026 at 09:27:17PM +0100, Andreas Hindborg wrote:
> > >> Add methods to get a reference to the contained value or populate the
> > >> SetOnce if empty. The new `as_ref_or_populate` method accepts a value
> > >> directly, while `as_ref_or_populate_with` accepts a fallible closure,
> > >> allowing for lazy initialization that may fail. Both methods spin-wait
> > >> if another thread is concurrently initializing the container.
> > >>
> > >> Also add `populate_with` which takes a fallible closure and serves as
> > >> the implementation basis for the other populate methods.
> > >>
> > >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> > >
> > >> +    /// Get a reference to the contained object, or populate the [`SetOnce`]
> > >> +    /// with the value returned by `callable` and return a reference to that
> > >> +    /// object.
> > >> +    pub fn as_ref_or_populate_with(&self, callable: impl FnOnce() -> Result<T>) -> Result<&T> {
> > >> +        if !self.populate_with(callable)? {
> > >> +            while self.init.load(Acquire) != 2 {
> > >> +                core::hint::spin_loop();
> > >> +            }
> > >
> > > We should not be implementing our own spinlocks.
> > 
> > That is a great proverb. I'd be happy to receive a suggestion on an
> > alternate approach for this particular context.
> 
> You can add a spinlock to SetOnce. Like I mentioned previously [1],
> support for waiting will require the addition of extra fields.

By the way, back then I suggested renaming it from OnceLock to SetOnce
because you did not support waiting for the value to be populated, and
you said you didn't need that. If you add that feature, then we should
rename it back to OnceLock, or create a new type OnceLock for users who
need that additional feature.

Alice
