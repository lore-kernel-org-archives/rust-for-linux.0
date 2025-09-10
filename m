Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF552D77E6
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Sep 2025 10:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757499556; cv=none; b=Hs/N0AoQQWexIPwlQadNd3y9SdxDCNlsOQCQ6xZkgYn67qKJLpYFbJ6p9Pfp3aQrP/OYcKmvvjAlBIjvpjyEugI9Xd7P9XHuQK0LPVo7dy4ZhC7PXt4xsIQOOnYDlxDivVjdaSI/l77nsRiaHw+dKW5C6DNtlvAhX0JQyTI3u8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757499556; c=relaxed/simple;
	bh=wHz9SsGajPNBHN651vynes9IY74+1qSVzpbURRJCVXs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=opxlJ8LmDdnncBDGfrNmXbOUCJLCUgTLyBWRmoSvcAUCZWfp7D3UUefSLEiy8oqbOC06TlaE+t3II3GWxs2nXixN/UvsWfGJDgZy1CrYVTxW4SkpSkiMh+HCg3g+a/nLSXpmt3yT141RHu6lPl/WqC+tY5f7G6vPy06I/8t7zXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gE2XCIuo; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gE2XCIuo"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45b9a856d58so52236115e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Sep 2025 03:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757499553; x=1758104353; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1id+5OvuvqKyGBWl/taL6/LjlzotK8J0LksRsZS7ZSw=;
        b=gE2XCIuogG+6OS8WNgeyXp21IgdLrlkeNK/cKxa0IVqInCKlVMdWkgBANrdtcLhlli
         kkNfB3VA2zw3Xc8+67iEGORGUKcxQznfkBGGMwkSLoXR03MtI3pidpya+VoudiN/cIAu
         Mbna1KeL/aACsfKerrAzNUfZpyovLW74whgjd1jGj5F88nD7lbwKmsnPsRHXFJuYgJYK
         eGgqcmnXychLcRLi9Hk3babLF49k7vZtrSqBOIQodo/VESXsvn65Q2UQuazIBBzx5eef
         nZnyx1ILlq3jblTnN7Kf47L1z20H6cOOVUqbBkOKzUSmb6iWqclQ2669ubNauGeBeD98
         Y5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757499553; x=1758104353;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1id+5OvuvqKyGBWl/taL6/LjlzotK8J0LksRsZS7ZSw=;
        b=rloWgtxy0sHo2BW2p/StsOfUeQOrBb4ogTbtVRtgv692KJ0s607jUx9KE2V0D7v9qb
         U9UyPxjB5pJJNAfELqWtEZtyjPJseWlCKbG1z36jpWkBCIVKgNQg0z2Bv3ivkaJ2k+96
         S9f5xzKrlon983ED4yEogsl1HdgJ26GY4BYMkj0OiC188EAW6ji0I0i2nEBp6lr8D42r
         5Dall4abESlwhIqi35K0Zols3nDvovFjcJJ71RC/QwxNNZYzleC/vmUoHIogrvAqBr/W
         9EyTQkV0WfhuCWkaMTnh5ejiRJPM3MS6XtFE0YVeinDy0gMgm4G4DWxBtGBj8+2XL8MK
         5nrA==
X-Forwarded-Encrypted: i=1; AJvYcCUY5THg3qblPuclS2drpEXTug9ovM8gc3yKqJ8xRZfMVNZIS2z1Se1mflW52kjP0PiSP/pwQZXBl6RNBC9Dlw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+a4K0wh+ilh9Vn4UzjtsixLH3Uh5B5ykdT/FH4RDR1DOEkXZL
	dCxhUM+NGSM70A4LjDN2QTexaUrh8lFCDLVYXXz0We9yG1aLalrv7hjjfukhdZIIBVIzObOMx9r
	VW4sLoqQ5srBQl2Gj0A==
X-Google-Smtp-Source: AGHT+IG6yPMkO9jM7petOD8J9NTleSm/goiR/WLTyxvYA+RDKwpsQ+z3Wdkkp8ZmZDL9W2QNPMGOPXGF1tzIdys=
X-Received: from wmsr3.prod.google.com ([2002:a05:600c:8b03:b0:45b:79d1:abcb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:45c9:b0:45d:d50e:20c3 with SMTP id 5b1f17b1804b1-45dddec9282mr120206755e9.29.1757499553488;
 Wed, 10 Sep 2025 03:19:13 -0700 (PDT)
Date: Wed, 10 Sep 2025 10:19:12 +0000
In-Reply-To: <20250905140534.3328297-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250905140534.3328297-1-lossin@kernel.org>
Message-ID: <aMFQoM8-SRrOmN1t@google.com>
Subject: Re: [PATCH] rust: pin-init: add code blocks to `[try_][pin_]init!` macros
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Alban Kurti <kurti@invicto.ai>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Sep 05, 2025 at 04:05:31PM +0200, Benno Lossin wrote:
> Allow writing `_: { /* any number of statements */ }` in initializers to
> run arbitrary code during initialization.
> 
>     try_init!(MyStruct {
>         _: {
>             if check_something() {
>                 return Err(MyError);
>             }
>         },
>         foo: Foo::new(val),
>         _: {
>             println!("successfully initialized `MyStruct`");
>         },
>     })
> 
> Link: https://github.com/Rust-for-Linux/pin-init/pull/84/commits/2880a9b898336e2d54f80715f00ce00f21f74d2f
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

