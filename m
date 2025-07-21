Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527D72BEFFE
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 11:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753098984; cv=none; b=QRpmBcSrhB+sCZKc4ApsE/F8orkQ14LRfsDuFssXKMuW3+fcPXYq/iPnSHoSXy79praa9FmDns+Vys3iFgvCROjvrScFzvanp5JpgD3BHuqaT8pI2gUDbBp9+DQyIeBqHHCcC7IJB8kDj+UCBbpUrY7s6CWF9yx83KDTTmx9JhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753098984; c=relaxed/simple;
	bh=MQgb7py7kA8qFAawQP8Xi376AvWUHjEvnrKVu5HiRW0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CTIaYQpRVlOZcs2Ep7OhjgISNZzkZYImnsF/Gfw6I5fXG16pgQkTJl6K/cP+4QbYCY9h/w5LXvaaKMGgX6dTc0HICpINft+gOAncA/NG2cJC9f1VriQ8/KlRKT3J8jFAP85G7CPAt/MWont9MXFrUdt2IFZD4uR3rVwmpKRt6cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q1a1Wtlb; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q1a1Wtlb"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a5281ba3a4so1800556f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 04:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753098981; x=1753703781; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PYI2UsizWZCb5wSLeFRus42pLlQIGazAov/EfOWZBzY=;
        b=q1a1WtlbKlMkvl5z3gQe9QARP77PcX2iHGFhUuYAQbhmQTcnSPkUCgHx0zIDU3PLRT
         ukuy1vgmMRs3HdzxGMJou7PleAOnK3CdmfRovNCGdBLB7G0rPCJMFAqGSRkrzQ1iHRIJ
         6EpIWowK+hFA0vfQakOnoVBl3bJsiXsg5pUZTdipx7cF8kQtLo8d+2jh/SBJ2CNmFdar
         HOWUe59YrmBihEOE/2pdKQJM7DUJF4NPMygmTjbd2Y6p+LPDwRL5RQiYIgofcsBy/Qd7
         Wi97oeFFVwjp41+smN2miWHOKCh9312DvFpJgo2g6QQi2lLHc63+tIdamL3u8Bk0KphP
         5ljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753098981; x=1753703781;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PYI2UsizWZCb5wSLeFRus42pLlQIGazAov/EfOWZBzY=;
        b=I7dp3r/kWwtSFwZ15bCUcX2OB8MzVRORsFrM0UdIQR28xfNTCtCbG3ENAIExB8t9xu
         1/BK+v5RUJzrLpjRG/oi/hXU+EB8Syua0Tfanz2iCcvXilLbv/m/Z9zlVrxYcFJ1TL6B
         i8PDWn6IaEuX80VhdH6siqtHQLMTblQnuBJDfRHWXD/gCK/ajLX8rCgpF2RLPIKn99tj
         ZkxeRYMzjZ5VRS3sFtFRtM0dBu+M1O3I+b1vCYZtB1dhdj23Uk23p6XWFB8sI6iieXaT
         zipisW2p16KJjfR+ukKgfr7I26ZIwDOPk6R8Kxv/XMSkaQlqIUE/HPf/9p+I1HCdk7sZ
         X1Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXD/DX2B3B782LZt+Edfu4TpVSEAFHQaKcsbSG2RLmvhiu4QexHT28cUvNl1yzSaHM/BXdQVfb0mXROrl9CvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2K2gph23V2QVsd3TnMzDwQlMc24x/McMt8u7q2TZCFblms7Kz
	gVM+GhvWFQy20Q6J63GTethlCuEo+0trqaWUcdzMljpyJ4b0jpUu5wybYysP5tk8jz+x56bMOdo
	pWa1SaWNiywB+4zQ2bw==
X-Google-Smtp-Source: AGHT+IEcFbj4EFix3ciRpXJYDPsXwCXJhfsHqcvc311AYGTCfDwpV/wkDnDzlBmx+/8BP4664mzipt5VeEQf3xc=
X-Received: from wmqd13.prod.google.com ([2002:a05:600c:34cd:b0:456:23aa:8bf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2282:b0:3b7:54b3:c512 with SMTP id ffacd0b85a97d-3b754b3c63dmr5273340f8f.58.1753098981719;
 Mon, 21 Jul 2025 04:56:21 -0700 (PDT)
Date: Mon, 21 Jul 2025 11:56:20 +0000
In-Reply-To: <20250720-rust-remove-compiler-builtins-deps-v3-1-0df3a493973f@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250720-rust-remove-compiler-builtins-deps-v3-1-0df3a493973f@gmail.com>
Message-ID: <aH4q5CA6SfFFtpwc@google.com>
Subject: Re: [PATCH v3] rust: remove spurious compiler_builtins dependents
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Jul 20, 2025 at 01:20:40PM -0400, Tamir Duberstein wrote:
> The dependency on `compiler_builtins.o` was first added in commit
> 2f7ab1267dc9 ("Kbuild: add Rust support") to `alloc` which matches the
> standard library[0] but was copied to other targets in:
> - commit ecaa6ddff2fd ("rust: add `build_error` crate")
> - commit d072acda4862 ("rust: use custom FFI integer types")
> - commit 4e1746656839 ("rust: uapi: Add UAPI crate")
> - commit d7659acca7a3 ("rust: add pin-init crate build infrastructure")
> 
> The alloc crate was removed in commit 392e34b6bc22 ("kbuild: rust:
> remove the `alloc` crate and `GlobalAlloc`"). As far as I can tell none
> of the other dependencies are required; it is only required that
> compiler_builtins be linked into the rust-enabled kernel. In the
> standard library, compiler_builtins is a dependency of std[1].
> 
> Remove these dependency edges. Add a dependency edge from
> `compiler_builtins` to `core` to `scripts/generate_rust_analyzer.py` to
> match `rust/Makefile`. This has been incorrect since commit 8c4555ccc55c
> ("scripts: add `generate_rust_analyzer.py`")
> 
> Link: https://github.com/rust-lang/rust/blob/f820b75feef00654924c9351a2faca8d34818339/library/alloc/Cargo.toml#L19 [0]
> Link: https://github.com/rust-lang/rust/blob/f820b75feef00654924c9351a2faca8d34818339/library/std/Cargo.toml#L21 [1]
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/rust-analyzer.20improvements/near/510200959
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
