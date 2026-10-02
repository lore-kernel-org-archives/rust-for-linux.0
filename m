Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB44246A5F1
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932036; cv=pass; b=nQCohYbsb176hVySZ4xkDVDmJHPyiFZtQOdQ0380iZOj68mwTlX3d33mNE9j4hdv3C5xm3wZjH0RCVEce0oZqpAK9NUreNrmDf5LS8NAZvBsbM5VZp0itgkgQPzYr812lWfv5GdY4k+EbjKXyiyPT1eacHNVZSpyNBpgqVm7wlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932036; c=relaxed/simple;
	bh=6asYzfWcqkpjsT6QII5zc3j/Jwh7cBWVPuz7U/pndck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oHgZ51ClEznOrXNYkkeiJFF2h/T8/eGliVt9WTNprOM/m2rlZ6umoNa4Wms6v8/1rDpVMNtZ/XQqs995UsF7zfsKrGOXmJf/p0OTeR98Ydr5NRIoAo7H7jOFb4L5BE57JcDr8bWuLxfAccoOkPy3om8T+B4nK8LS//Bua2r2WjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKkQ07Qu; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKkQ07Qu"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c5d196b0bso368581eec.3
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Oct 2026 02:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790932034; cv=none;
        d=google.com; s=arc-20260327;
        b=QhnxhHlzX7tSr/cy6Fw5ddF4JdVxHlzcrqLErC0qbxxDArcApX6a+cHa3iGBctfxwz
         V1pIi1nC944NCcQzrwtkLnN/Var+06xocQY6pgjhWQUP9NXZGwU9uWtQWJ8yGY1zoUqP
         fnf8tNOg2regyIQX3y9Wg76HUUB2M4iHfCTJR7GDgRdf9FSbd0KB4dihXhKKzv6Ma89O
         K6Z1MbA90iAyLveJ2Con0U1BWCBSLOdMW0GTZaGrocERw7icSUzg879AWCv8TBUOmgT4
         YQCq/z3irhO5SSueZfYJecs6y2MsvYyDqfrHdcJkGYf/6+se6OyQKqQLpBjCBAJZ3Hca
         fBNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6asYzfWcqkpjsT6QII5zc3j/Jwh7cBWVPuz7U/pndck=;
        fh=MZSWesEVXWA/iCcUxdO5IATZDWMqrviVgwq0s0/Sdtg=;
        b=YSW7glxb3YwkZ+4Xrae3ckmO9MClbYtBxFqiBKXk6WzzACpNJXPgBQMRA9vfVrcwhh
         0Kcu41ZKBExXvMyz4hsXbLghWNnod90XHO0LnIIVFvyR5qvGJYPNsQBOOtrPIeb6lsTC
         NWL1GeZVS4otxkufX7N+IHXUc35jDAmsSwu+x3QrwtdZunnA5xf9WuvNoWOg6hxoPZHN
         hodONtGElhUyPe2sW+Lr2h3BRlTsZOdbA9mro4xrNEvbc5f3kzBA37d5kZEvfTOErKtF
         PWT0bJtSK+Zk5yyF30V9oc7asEuatIdrqhVyzudw4qJ24PXKkqOtNatsbQETibPmdQM2
         Lkyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932034; x=1791536834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6asYzfWcqkpjsT6QII5zc3j/Jwh7cBWVPuz7U/pndck=;
        b=kKkQ07QutNr4y+SGRojLktAZvrjADk+7kx6zTKs0tf/h5XCNj2gSM5TaUYjpEGKaaz
         Iyo/G/s5MULaAgk3c/WYUkiZM0oaDGpAQWuUwu6Mjt6ZG2jler1kM2MydTs9ZWoG95KA
         +2y8yil1tIOdK5O53fBTgTkqgPSxTqACnmj0TkjrxLuyXO+Gi2ltXt0EZlb0EbelVUw/
         4vLq7k2VpYsEaaf++mN88gmiFI901a6mae9o07cp55VS4fGqNK4W9RnxWyyU2EgSLBlS
         vFCgUseLHRKtJQIHigSQRy3t18Nvc3qqspDu4wsbRVF7rhcxG/u1XdqZ9MFR2q9E6W0/
         dJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932034; x=1791536834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6asYzfWcqkpjsT6QII5zc3j/Jwh7cBWVPuz7U/pndck=;
        b=gExKuo8s2TvDvqwkLemnDzpfk9Wl+GdlvnEx5xP8UtRIvt+uZD3mNUHMVPnQBpEjf8
         URMtaLNGrTEmSmXEDW2ttUs9ExRJTenuxyIgezDp3+Y3xjiQmvqnfC6Ee0fsh7IY91WZ
         BENTQwCWDBFcpT1x5ce6y+erqvKmi7hnvMHIsgw0K4iSnSnr2YgzioswTkgltAGms4Gu
         5wjz0sUEIcc/JtnRRXQtLzypAVXmHExz9ZfuvpEs90jNftoTMvtKMze+H1A5bjOSt/Yk
         h3PjCepq0Glb7aA+8qVn+mSBZ6NnGnm8rtJU3mcEHM/faxwWiuxrkvHCk4PNfSVAjEYp
         FhPw==
X-Forwarded-Encrypted: i=1; AKwUvBzXSK9mS9q6cudyQ5expiDDHRPvdXZdqCE11JcoYfy+bhdpHIxu1JbP1iyLTw7E2mpt6eQi+01Ob3I98dTC3g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJR0QuYLNkDmH5Uyra2nStg0xfYYpxrHfVw2g6zVYcHJ/XuiEAM
	e1F9C8atx+8n6gfhH5rWPAo3Lzlem7ejlqH8ts8fSAfNDnk/ATWLBoabVsoPDCGG4hUfopw9qp5
	mdPU/hCH0rizun53TiYSLD4I8XLPz1LM=
X-Gm-Gg: AYBFou043QxMOtR9NB7G4eYtf0OfiEV58Eeqswz5xgjLnFj1dRr9M17Yuse+rKjEyXp
	FC6v1auD0ajNVCwOl2sf+1XQgaPZ92xFTRTT41UCEN0JOy+zzsLBf6d9YiVsDfWhAViRo9yaWvQ
	eZPhAZD9wvZEkI5ufav2vYX2QnHPd87HGg2t9V1NN9mSIFd4OPafmD2/ef5uMwNKheAdRiHWKEB
	/B68NtO2bCEw0bsV3Y8QCieHRJaRMnzfFtT/Is4Kp9pYKe2dzN+EEad/uIWN0fiwCQ5UBoqFIlK
	0jKZW8RfJ6yyakS+08CLMh+kCAKjSXEGv5f2B2N4duF6Dgm6aasd01a6xEirDPTQhEF+taKasU/
	JJqEdHiGTJwmbX0Eeiydt0lAaWp2Gmql10Xapx+7okN5qObnPkxD9nH3uET/cIlp04m6KoFVD+b
	UaeQrKNtPHXPUP7CCZEkM/YP9Mc4s8OxFdjcYDbQ7UpMqMnp3nTZQ=
X-Received: by 2002:a05:7300:54c3:b0:34b:47b2:677e with SMTP id
 5a478bee46e88-34f14ff2bb8mr3926108eec.1.1790932033786; Fri, 02 Oct 2026
 02:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org> <CANiq72k-_LX5GVSKWQQ5EJV25GDfXOhOebv3TLqdA63tQHNd-Q@mail.gmail.com>
 <87cxtvb2qm.fsf@t14s.mail-host-address-is-not-set> <CANiq72kZh4a39hcy0g9sqEmzx3m+dcPRW=omOB2r5DhpRq3BXw@mail.gmail.com>
 <87a4ozas7q.fsf@t14s.mail-host-address-is-not-set> <CANiq72ki4Pc6y8og2ROLRSeRTZBbnpY41v5EC+qJaTiZWVhwAw@mail.gmail.com>
 <TlsfpzyqG6QHcTMb-dOQPUP6uXU2G9urfH8AK0nzNO3j5rY0QWjn2ni9zhJ41CpVeppXhpH2E_yJ3LgUTibqbA==@protonmail.internalid>
 <CANiq72nXsGHbSQ1LfbG1zYaMaZv3X=u0+XzT6vHh=9vxLE8QTg@mail.gmail.com> <87qzi8a4ds.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87qzi8a4ds.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 11:07:00 +0200
X-Gm-Features: AclHuK-RObMvbRFt28R6tCI9hkGgaSU-cAI22KyuJJxz2MS6peiMo9quk4wXYGg
Message-ID: <CANiq72=j1nD6Qy9qKwNKjBw1gc8RPr8CmXKXSSNBp7mARv48VQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus` C function
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Burak Emir <burak.emir@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 10:33=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> I don't think we need to split the helper C files by the headers they
> are defined in. We can include multiple headers in a C file that
> logically lumps things together. If you are worried about finding things
> becoming difficult because they are not in the file one expect, I do not
> share the concern. I usually just grep in the directory through my
> editor.

Of course, it doesn't need to be a strict split. But, where possible,
I think it is better to match the C side for the helpers, because they
are thin wrappers that need to be updated and maintained at the same
time as the C side.

In any case, I mentioned it especially because `cpumask.h` already
exists and because it avoids an extra `#include` as I mentioned.

> I don't think we need that kind of granularity at the moment. If things
> become messy, we can just refactor.

Just in case: `cpumask.rs` already exists, i.e. we are not adding new
granularity (or what do you mean by "at the moment" otherwise?)

Cheers,
Miguel
