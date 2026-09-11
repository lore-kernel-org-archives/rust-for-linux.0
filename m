Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4128746AA65
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Sep 2026 09:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117715; cv=pass; b=jRXD5mfxCd6+Xs1njalb+wcpEvbs0RivOvj6NVqz72yHEa15YpIy5lDXzitOKZqN+hlA9CloMKBRzEqMgaIPzAVDineXgijUDt6dbYUdwRruSWXjZ0F1Xxe/plT8PJiw805BLKVAlieaTaHoMXPdMRiPKRUjXXrgqbS5h8Ztd94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117715; c=relaxed/simple;
	bh=9AitBb1GHyxUD8itXAfWQrOndn4vr+DMbiE1kW67HMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ibKZDplQCe13cibloq9Vuz8KjIw4/54fgsFqnsXCphj6LgfRaAGvHBIWhSTcbiPbYUsHNoVIAqZUpg2Nz6oIGbSEqK1UfzRgbJ9KFtKiuJkcRF2S8eUGaOATQ1k912SMJp4oIaVWaV3v15zIuS0oV4mnYnRFL+CaYFXVtcSNFL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ntc0+0D2; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ntc0+0D2"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4843e397f74so406022f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Sep 2026 02:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789117711; cv=none;
        d=google.com; s=arc-20260327;
        b=Af7v/o//AfrsKFUmLKsm92fh7KNtCwtOSpHdLpql2UOhYsou63a3iLH5ha+4WvDh+V
         d9sehHhYpQDf8P+rr5VpYp6652BIESxgFoPn1CaxVpux8yy+ONjN1i0eyGyQxGxYcCJ7
         J2W8TzZC7tBo/3mOj/ygr9PYh+9x1eSxJX73V73YivNjAf4CigFh3SpTrpHts/AuiKa4
         DrbaZPKyyBpqIKEU+dwnE9Z/iu9EUR/JMyzWQm5A0aQ+lZs9saZHpopunWtQKLk/dWTa
         TD5VK9hQj1u1W/sjMQedUsEvkVEGeHJlGxWJIWBfETEljDYGm97+4NHWyanKis8Kr1rp
         wX2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8V6E7xJ2vtTyuoasuWVTwqEDTbAd7Nywgb6H8W3xPYA=;
        fh=cEKxmyrzLdVE5OpEJPhHYd53Y+1aafIsRvV+Y5e4e+U=;
        b=aryzFx14HftmsKoQspeRz6lJO1r5A1xyWZ3VZML9hYyw7UIhxP4y71YewXh3Rrcp+r
         3u0Ij3WldKek6Dn0laY7Y+ePA+Tj7xBwkYDWfNMeRLp8bUF3s/K3kRfhHuEMu71m9eWt
         0ASSAdphyF+Fa5jjKU3CkMmfWNOSshhPkCrPkAsbybYJ9BJsA+Po47LuVh9C424bB3GD
         0H5i+WW3OMetALBnhaIYhyclva6U2RCPciA1bzvzsFECLoo1dTdcalc6l24l6+I0o6TB
         SDG0K6eVCIM1Wr/JU6dIjGA5scn+Kn37Cn9uAk24MjaWSoAJAiacymNOCOUYAiNy6IsZ
         82RA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789117711; x=1789722511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8V6E7xJ2vtTyuoasuWVTwqEDTbAd7Nywgb6H8W3xPYA=;
        b=Ntc0+0D23+YujkzMEy4eJ6nXRpHFOnm4AtVkxEhi5vnpCexhU7KW4PmGmKyNMt+kZa
         TPGlSB3IBPA9MiD4PQN6ttGdFWT2WqMR0/+bikrH32dyf3RHlyaDpdo24c0XMpHO5GJU
         lDTJahlTxAMonEnDUsydvsqrYYCX0kfnhBDCQrNCn+atyDFTDkDtjvAsv2M6xPLh4eMe
         a/AWqeYbYlOAESo9Wgc1GsNr33dNbudqVttD6Sl4VuL4rsbQ/aL6gINrZx4FRE2ZMT3U
         4K5dculSYJThgW463pZtuOMCZuRhxZHA32PPtyLFovJ2VLCOKrv7CixBauixl/iB/3rB
         IKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117711; x=1789722511;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8V6E7xJ2vtTyuoasuWVTwqEDTbAd7Nywgb6H8W3xPYA=;
        b=owxl+epbQxjAPzzdb9Afvr+j6Vs4H+vlCJRrz4lHlV3ZyHEAspxec827G6YI+zVAYj
         Y69OLRpn9OFGFCLn0NS+2TKIFWPrOVO992s2mZy/i+x46lGm5LqLlE9Ekx94BD7Nu3+a
         sjY2Aya4X6QnhNPrJYYXczGjTwKAmgfwaYanmofbDGnC2EOof2IVwQl4ndT1c4CveqWQ
         ev8paxGT0O9tUoMlaMW9QhbL2ycKkuh6+R1Ri3DEwJel4CTY4i9g9uXSv1f3ZbEGZb8n
         TLPCnPePam51MWLfEcT5JZMn2uvik4ZdWho5F3Pw2AXom2sAqFpQ9VWUFK1TQ8p9Usq+
         6IZg==
X-Forwarded-Encrypted: i=1; AKwUvBzwfiqb54vvhEiycbb2w+zMwcdCjonbEWIlqxLbqy4nypmY+yHgqLSIpT1Bj0GhIDJg0J3g8tssvbw9WiggLA==@vger.kernel.org
X-Gm-Message-State: AFuF++leqeZdEjJGcwjMIi8m+iCN548pTec1ItDI25uShKFfNuzVwHhv
	KZAHwi5i5ipQnEvdvmIBxUdCutxtHaJhNg/TIEOwNYge0rcEk6lgrAp5jAfBJYBGfVA3ZWX8PWz
	YdXYm5pAsfjMCFXa6EXwopATTB0QiEEI4kaCl8zMc
X-Gm-Gg: AYBFou1jUY7kUG6pKnJwselh5senUxz+sKkLCNQaUmsYb7aS0qbPjmb+m6AdGwcn/pF
	eq5dhW86TL1BTWBc14+b9gcyn7JWmKEqTeyqYMhe0HMiyrsnN+mv8cjuvNEQ7A435fVNu523vX6
	7dXAIvk7J6mNYF/PNN9gBf6lMj+lHMeXgnkk/5tlyfhGz5s+chFkk17oFbHIjKQkuY6DOrJWmLE
	+jGdjrPRwNsvhbOgvMSZL9du+Of9Hq/e/ns2HAXK8sqDX3IT1AwMA4Hi/vu+LS0bCEzk9uO61Yx
	O8XGoqLT+7quY/Wbhu+b8RJ40ArT1du4B6TVed9iM3PaMId0eCRiRpFuNoAo6VQkvUfLummBFTE
	Q6UCl4UfCEhbAKa25SqzavZpXic79VCaZpIBPrGYMgP7TCggJ6TPcNIr6pEqLZhDl
X-Received: by 2002:a05:6000:46d0:b0:485:8226:c691 with SMTP id
 ffacd0b85a97d-486e0f6ce92mr8157059f8f.16.1789117710377; Fri, 11 Sep 2026
 02:08:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-unique-ref-v21-0-e83257373062@kernel.org> <20260910-unique-ref-v21-4-e83257373062@kernel.org>
In-Reply-To: <20260910-unique-ref-v21-4-e83257373062@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 11 Sep 2026 11:08:18 +0200
X-Gm-Features: AcwNN1Wcpw91RcC64bgI4fLKPGdY59qIT8O1U-qjeWGvrNCV-tRUtkCYbazUk4w
Message-ID: <CAH5fLghUQW5urTfLCCDT4BhuqoFVoLUAG46TS-SxaS37bJcgWQ@mail.gmail.com>
Subject: Re: [PATCH v21 4/9] rust: rename `AlwaysRefCounted` to `RefCounted`.
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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
	Ira Weiny <iweiny@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Oliver Mangold <oliver.mangold@pm.me>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 11:01=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> From: Oliver Mangold <oliver.mangold@pm.me>
>
> There are types where it may both be reference counted in some cases and
> owned in others. In such cases, obtaining `ARef<T>` from `&T` would be
> unsound as it allows creation of `ARef<T>` copy from `&Owned<T>`.
>
> Therefore, we split `AlwaysRefCounted` into `RefCounted` (which `ARef<T>`
> would require) and a marker trait to indicate that the type is always
> reference counted (and not `Ownable`) so the `&T` -> `ARef<T>` conversion
> is possible.
>
> - Rename `AlwaysRefCounted` to `RefCounted`.
> - Add a new unsafe trait `AlwaysRefCounted`.
> - Implement the new trait `AlwaysRefCounted` for the newly renamed
>   `RefCounted` implementations. This leaves functionality of existing
>   implementers of `AlwaysRefCounted` intact.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> [ Andreas: Updated commit message and rebase on rust-next (7.2) ]
> Acked-by: Igor Korotin <igor.korotin.linux@gmail.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Assisted-by: LLM
> Co-developed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

This has a lot of safety comments of the form "This does not implement
Ownable, *therefore* it can implement AlwaysRefcounted". But I think
the safety comment should instead explain that it's okay to create an
ARef<_> from an &_ for this type. The fact that Ownable is not
implemented is not sufficient argument.

Alice
