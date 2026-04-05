Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266762F7462
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Apr 2026 19:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775417525; cv=pass; b=ZPtJd8GXn0L8yTA/XLaC/iudtr8KMRVk9tp65Q+PuinTCSeuICj3qXRXiVf04hcakhX10RFbZBBy+xpsNu8S6Pn5OCoudkzIFaJ7x9Akw2GppQzn5j/g1PXaMTIb5UE2YLyVsvW7xsaifPcr9VNQ/2UpnUuzpC4iT/LPDV5E0jA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775417525; c=relaxed/simple;
	bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bT64Mz24nNjWTuwJNJ4x3Tg9DOsImOYaKq2yNGJa5RERPF10Ns4badDStptYPsYnZFG4cZh1bU5oZ1Z8kuycBkmeqCj/fk9gNTkfnOg6X5Axn1L8SQy/l10IWYObWK1r6FCuen2Sh754cwWnHNtP4CWvS3LHKA8+sCd2TYFsVCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTQnoJHW; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTQnoJHW"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-127337e3870so153193c88.2
        for <rust-for-linux@vger.kernel.org>; Sun, 05 Apr 2026 12:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417522; cv=none;
        d=google.com; s=arc-20240605;
        b=FaeBvJQ0RtJzjdpYDBZn8/bSsthP+m5fKalZ8UwQnHgyyFFyTWoKnrrLccXtxncvb7
         OsgFAgwl1848JTcrx8mhpDOjBSBFbSdO3WAf7VGtVOZ0MbtOg9fywQ51vhV9plm3aC8u
         z/LuJ+dbqJep4XgtVqD4fPdOhRq1gP+Tzg8/K5jPWWbqYAF8tRoeNun7fTTQTsdaLkd4
         RKoo9tyNAsz0fNIct5YYKaiAOEwEqK2oHs6gg0lY+SIJBVT0v6Cp89JeKuXOwSaBqxx0
         pdomZmErkEgFMQO4VBjJNmaKeQ7sjnYZ8fjiwcgHsC4A5LFRbtHGWB5X+He65ZT8n27y
         VMBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
        fh=eUwoIa5WcWqgrV7xsY1808yTXZ/gTHP0EFYF4sfkrko=;
        b=Y/d3o9PG3XB94zEcLThzyt0vl+qmt3OXRWYoY5b6HRLiCX27d+aPcdX696l/MJvCC4
         Kz804tql4U8efQgFLW68pl74KmbFNFA4nsq26WEnNiIzg4gshskCcMCwnrCgZKa8+5N0
         IQdZoM4QytnD88ilm4Iy/Fm8+x2eL4+9hM5gj6XF0sZvgyU2k/abi+Obbeyj1yFeiMe/
         cY3GzODh75rut4vTcy7taKYfN0us0jaKlFcS2OljVNRcsR9CKwmnlepTPjCJ7PtH9vEI
         kqMG+YRFGI9ecb5UvGvP1R/IU8xiclE6qqt4bY6JpK38UaZMDD/t/8VnuZx2uTfAVmWV
         2BSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417522; x=1776022322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
        b=sTQnoJHW55XIOLQxTa/0ehf0g7O/5fqfreTXKUXc2JHcCniV1llpf87rmHdA4lOpTC
         MwB2O2JOTBUGOcMHQdnTwRc+9zDCTBVqj6jol9Gj88fkUJzP7xdqlqvAczMbkihun9pk
         tOyyu5TtBT6dGhanj3/xCmW4QDFclZUZHVQpnHDkn851pqs9Svq58p4q40XfzrXhsMp2
         dGofuYw2zhZuLPavKH4QgFYvPnQ3LgvcdtlzMuFvWkOfnu+AHqQVFjusoSm/+1uMnJ2h
         DZMwoGLm2iYuPXj5zMAZwDu7uZcKqLlyCVgtI22iva9fGR0cKL14VDNzzyKNZUscIkM+
         PmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417522; x=1776022322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MZ97OnLKNSw2H58dmZtpb4byqUPHuyWTZL1aRVE8w44=;
        b=frzoH5G9zuhkL2Qprjgre+ybhqetbf/c3nXRyHNMR5QHuZ9lyDkt8HYdVxOv7SaFst
         cVRsuM8XtR1gvmRw7lVs2k8AWugnY6bzJgHxamPyXf1DZKPc1c4/FXaNKmygqmhdyBgu
         7N1Yg9lBHdLNogkNHa4YDK/xB9AR/56ErJ8ugUXoylOQ0OTdIhrGl0WDDIZMiPTqyNuJ
         0WR5vfddG/2uqtXYHeIAXspXIYCY+XyhIaGcGJcUir8Xg3YjMQD4deG9asklw0ZaS2sA
         LpdH1b3+Z/KvQIlW48hoGcnmotBWZw1lY+wMXsCWMNuek6QyYwibEZw+WwB1NmNYVhKN
         imVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa0swxAMe+0ezUTP//q/ED/PQ03VXDQqPSLGOLkqiXj45qVC2PkoWs9geP1gwBAJ3tis+lpJDfrzSKN1bung==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcny0Q2XW/ri/r12jKS+wq782IcRrAKYgdCBMwSuToSUvApJ+p
	pQWlgbCVe7q1OsqTh+jbkkHz8GdbJW2fPSv4UDewFcBEd3CNzU8TVtBr/5PKiWZ1KlwT1aamKRp
	eG0aehxa0vkeabjjjyVptdZoRN+mJKY8=
X-Gm-Gg: AeBDiesTAimZtW/cfBN0f9wGFyT6LrtPIGepHXN+xeLPrfxbwoNLR998D+AAa6kLsBB
	C+7smLwnRFxUL60QLqOf6yXWVMT5tBi5Mvdbyo9LJsXbSNItgxbWDpHxFIA6RPBbWNTf5xsHg2L
	YRPF5u+55tljk0MIcu0cTM3q6YCltghb6klCmgHD3WkKWIS8c9G7kVdXuv9PrqHpcS+lx4noUXw
	cZDWtLqAYQ9qEiDYfoD8mGjqgeRTKLZ7khmyxaff6fOMjK1MzWlo4mWJvmv+XQgSIJMNUdfI2Bw
	75sfUz8PGAgOSenSum2bETvp7/UbKPoiyBfgXQNjgMz371tkyW85CAg2uRYrD75vyvwtpQO9i//
	RCA+qn4YIwuXuMOVkAGnyRrTN8rBhkD2R2g==
X-Received: by 2002:a05:7022:418f:b0:12a:7181:2f12 with SMTP id
 a92af1059eb24-12bfb745195mr2138075c88.3.1775417521967; Sun, 05 Apr 2026
 12:32:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-18-ojeda@kernel.org>
 <177508434455.73816.15756486388132647025.b4-review@b4>
In-Reply-To: <177508434455.73816.15756486388132647025.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:31:48 +0200
X-Gm-Features: AQROBzC24JtVqMf2jJjrf2a1W5TmgldNN6NvGBvsNhQ1qBgBmbTFc7OPu1-U-ac
Message-ID: <CANiq72kh47Nss9+OdHf=wRhO2=79dxPaL_vcPv8U8qG64bYfmw@mail.gmail.com>
Subject: Re: [PATCH 17/33] rust: kbuild: update `bindgen --rust-target`
 version and replace comment
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 1:00=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> Some citations pointing to the upstream changes would be good.

I added a couple links as usual, plus a reference to commit
7a5f93ea5862 ("rust: kbuild: set `bindgen`'s Rust target version")
that has most of the details.

[ The comment already mentioned the version, and the commit that added
that message has the details, but I agree it is a good idea to add
some references. ]

Cheers,
Miguel
