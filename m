Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50AF4CDDF7
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 12:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771995; cv=pass; b=MhNYXD8Z9odpwG/f6I8YbcZKZ+eiFWGoCBAHL7r6n9lib47XDTGgt2VtysK/MrerGDpeVPPV5AjkUMJQDjKXp7gvSXqZG3UedHfEO3HcX3vXpgbDI1vWzu3FYImZEH83cXqvtLs76CoKRsnlyZ9UUJko0ui4lkIa+NigVXfzpWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771995; c=relaxed/simple;
	bh=puIJOSdAjxGqRiaiV8MmV9MmKvzEIue4jK9dygO9uOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYabGgD7kAe7fBrB/FRTbT7XgxlcRity0B8AXmTDduH0pSW4PfFXjEUPWrNJE2bWaN3NVbzrE6zL1b/kULFSkyu+zzouYkxO7kRbEYk6bLCvqydImYFARcnDs4WAZnevvBzOwekRiv5YIzMvsXJDPx/LyE9biTtgJ1BJAcYuCyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cBwhjtAM; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cBwhjtAM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso55293085e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 05:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790771990; cv=none;
        d=google.com; s=arc-20260327;
        b=IPDOYDBiqPb6igih8DLdL+1KKSiN4v4W+Se9i3qorKvVCL9p93dkE5hJOAILZflp3F
         XZ4dYIyY9rgTuIF36IK3dj3VfWodJdOVoLJibrgISFzRWqR7+D6b+XG63+M3e3yPnCn1
         7Sd/EDhN6GEO21bGdpt1JDhtxie8gq9xiLtin4vSt2uETD5IaV+vi30ZMnMSSe0giMKz
         bWYdNghh5vd2fyCMBvnDQfrTmQ8cKhzCLeHadGJjTciT3bzKH0gzruLwhBUXj3nmN/iR
         zgdmVhCUvv2G8QPZCgcLrZnMNznVZRbqmjg2N0gAg0XwpG62d0LhEWwEf2QUTwFPB1iA
         26iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=puIJOSdAjxGqRiaiV8MmV9MmKvzEIue4jK9dygO9uOI=;
        fh=4QEO4xxboiegSFMEFMSPblDvo+zaaZCWVB6o1Im0Q7g=;
        b=P66SgtGekamGWYn6nDMJkGonDDVKAzUYFdFEvWdlQ89cbdi0yMQWzkRBQQLkukrWWy
         pVjks5N8CmMeRwB971BDPINPfDLBbTY1JqMl8VTnV+LSrlgjgU9PtCkLwQoDZ0Vj2N4H
         0oWqYofrRaOHX53VtZjGRalGgyP+pxLAxbwRql68tTyEDLTyAMiyWShVGBkyYAi85Rh8
         4GYYQ7DcTTM2Xda7Z0PQFgKo+Pe4/Y5YQtXAxzbMcWZen3f8ZasWp3fWGW4ijMbJI+CO
         MMFw8aFQF9PZixL5yc2UUdbpfqjbOhrvSSMX0ism7qZsS624ZbfoieuHrUgls3S20c1Z
         PA1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790771990; x=1791376790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=puIJOSdAjxGqRiaiV8MmV9MmKvzEIue4jK9dygO9uOI=;
        b=cBwhjtAMFSdtVnG6LRzegpNIxy9hg8p60HgTCj7BnKMvCeDsJ115ZolPwKhdNlUw8u
         g3fCIDIxnj39GyepQgrChVrn7IAKGAklFHLRnl4SquKBx1lhh5J8KWJ2TlfUu1VrBCVE
         ufpwR6MdHg5LIkMWU+wgtg9fDnk0+nfx1c3mmq3n8zSCGax/ksSXTuny15pQ07nlcrpB
         iCACO9vmtuUehCBPuNz0Jgt3ICycQXb0q9F5XuCd0BjpcIUuYR2o5q6mN49IFcUWBJJd
         KLBhPiOOXcqg81Dcpbk2u43KJM5e9JDRPJZF0eRzKOtR6PrJHAUKwcLEOCiDcHt1q6Bb
         cWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790771990; x=1791376790;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=puIJOSdAjxGqRiaiV8MmV9MmKvzEIue4jK9dygO9uOI=;
        b=Fr8Jas7ulII+Me//DWdtOHjCNMlzJH3zW0HdETmtAc3y/a9mVSBAFLqSfBZakqHwfR
         /nryypWzHFiX5D2PrjMIUle+uLbt1LeBW2lEkBFTyP+7OX29TE6vOZ+mixdULB18rhjq
         o5zHIPXZN6AstIxzPYS2WY/D99Lfk6aJq5yv9UrlWy6wEg1N67merwXQS9nnfJXzdrP8
         8R5lmIUTUjibpWK5HViH5+ydBFauopIONBpmJk81PLLBDp4P0iAGvgK3TCoGxbxomp4i
         hpa0iVBvPXsaJx0xBw5U/xi3zlkdX6FGxonNX3cu8vkosUL8MkOMUKp5G4k/WC2cs9Ji
         3mkA==
X-Forwarded-Encrypted: i=1; AKwUvBxLT36X6ppzHdmFZkQNSUljhYcSMAZpUFCAoU2/O7qW2svwLwAJfcoLJJnJ5M72/SQoeqjoiR5kS+PjmHxs6A==@vger.kernel.org
X-Gm-Message-State: AFuF++kY4RQfRCWmFC3Zrznuovxldc3F4giOxJn5HPdH5BfLBK155mo7
	5Uv4HMXgIBiGe58Y2rFswrKMq3xywYTYfBgrw2ehslX2cWQVVHO22pvX1kulp7Ljd8TBEklDpL+
	L/GIf9J4RmtrWecC9bMLrN+N0Khw/v2aB8PuEX7ZW
X-Gm-Gg: AYBFou0hUmmujlq1Mh0pY2bi6kurlzUR7yKASDYUvBVsKTfd1qCXTns970xRVoPJd+N
	cgcXXC8GxH1yT6pclfxLy+xGwlL0X02SsFIaLcVWwGgsBqeJ16IudY0IbF44qeeuxKjg59iIq0v
	dQK9lXHUrlItBKdWmM5kxb+7eMT0atKdyq2UXzZkNe85JkD/QW8hetbnXv+ahSqQbpGDUWBRu2q
	cdEUAkldQu2gE8rRjH+ARD4Xe0fYUCpeYfc7DNs/HDNzX8Zco+Eq9zYygwakblErPbzGYVQ1fZw
	j7C6X9yqpPD21qkKYA6O9BA/y9wbKOW2yke2yRIjCaHZSnJoOVx2lIcNEc6/X12a3wHEqiW+pqe
	IBCR0HE4QSCFksTxyCZvex/pu82XQTMWBueBAFKnBbrPuqWPoVR5A9BmwHr2/aD8=
X-Received: by 2002:a05:600c:45d3:b0:4a0:317:1996 with SMTP id
 5b1f17b1804b1-4a01affb6e0mr19906585e9.27.1790771988560; Wed, 30 Sep 2026
 05:39:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930123645.302318-1-ojeda@kernel.org>
In-Reply-To: <20260930123645.302318-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 30 Sep 2026 14:39:36 +0200
X-Gm-Features: AclHuK-nnHolXXuoRh47s39oDXL_U03hT_173aRcXTb3_dZm8vbu2krhGYddJ6c
Message-ID: <CAH5fLgi067ZcHT-F641tMZ-2cUN_7judeK_YTTrmX=OLqsNtnw@mail.gmail.com>
Subject: Re: [PATCH] rust: bindings: fix VM_MAYSHARE blocklist entry
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:37=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Commit 2b6a3f061f11 ("mm: declare VMA flags by bit") added constant helpe=
rs
> for the VMA flags and blocklist entries to suppress their direct bindings=
.
> However, it listed VM_MAYEXEC twice and omitted VM_MAYSHARE.
>
> Thus fix it.
>
> Fixes: 2b6a3f061f11 ("mm: declare VMA flags by bit")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
