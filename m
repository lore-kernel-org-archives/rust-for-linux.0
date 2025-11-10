Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7BF225762
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 10:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770820; cv=none; b=Fg/tE9TwD5EWEdbRcgkWcFZ1P4ucdgMZnvVhhcL1uMAzBj6DSCc9wUqLki4r7rPbxq/+Fohua+sIplMwtdANQicWqe3oOpX1LNcPW+zDxnpwAB5YRrIkxxuZtalvCQwR7/S3L+e1qEktnT0ryHE+xOlQp6+nVLjdWxhUdLG3rlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770820; c=relaxed/simple;
	bh=GoL3gN4h5eYU7litgF4qiXRimx4qE9CB8i92qSY1F7w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i1P10yhxZoJOmEYKR8BTV5SS25vMyEl+nhMnxSuOQu8rWjQMR+AsXdGP3JK74Hi21zxCTyTGxcYd5kY53s8RpsTOwbXBwJdjbEQRZ6fBOdaK8c+sz7YgtVX2p1TGtKi0h1H2/OhXME+nmY7m76YSK1YrPP2Gg3dAw0/WhKQf104=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nlYQiiz3; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nlYQiiz3"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6407bd092b6so4420562a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 02:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762770817; x=1763375617; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CCzpwObG7lLSpKChT0Fx+ByLzoerKxd9DaM7EmJ24AM=;
        b=nlYQiiz3BD+lyjdyVnTBmWTZ2IG/XAysTS2skjDE1SjQDsJ+ZkQUFOR74gvf9/CCGo
         JMoafsnCZBBH6TZlXy9Xpx98yBEnozv7kiIaMZwAZ4BLES2BrXtWrTPRG+92T7R4sb+i
         y9e+vzAXhhZgOebdiutYHp8mIVqjzdLldc/KFiTrPIMfFVkmdjR/TaT7/Em8OktiDMdW
         /Ru75aupcw9+lPOT7I6tUuwDeM14GXQ/EskgBiT4j3bWELt4Tw3jAFcGMyuHnTU1E9cx
         n6eD77h1IF5kWQ2I4W5ze1H8XfsGl6K+pxtyv9vymECVrLJ0B5EK4mWXElhI9TVLkwcf
         vZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770817; x=1763375617;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CCzpwObG7lLSpKChT0Fx+ByLzoerKxd9DaM7EmJ24AM=;
        b=B0CP2/T0JGnwYfDQ6UX9JH0srlh/NZyZQFnSaGcAZqP52T0TBYCfKhJYV5mfS8l5Ed
         H6AxxyFjB9ZzRZnEBJ5gYuS1mxjsvmuMwBw4cZqU7pGKw0LRwqBSpooBzoujDtWbN9Cc
         gPdqruyCl2RbZlVaSSCLOaiy1ek5ntGH4wCTNSQiWOAZxNm5Da5Farbr9teG6CzlxTfC
         f7GvJ2mb6IautkydrKy3om9pYxvkEpzFQrvDbr268K1/0VSxJvaq/+6Nqdtva+iG0/En
         WryvlAISuPewnu8w8eNXszcz1RBjv83jizwN1unNmSsWJ3luxLPIGhxsrzuv/93srL7q
         Wc0A==
X-Forwarded-Encrypted: i=1; AJvYcCVYn69iRb1RjORziyb+KL0v/gjnu1xoj0NPsNffAOa6nZQdLL6/iYflhfuufj/C/e0MAPBF/EUAAqP6QuETuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3turWlWyGRwoXkQs53Dipo6YDhevaCPP7TqJniLsZjduoF+1V
	o+VNiS7PeAnKtnGzYFRfvDHW/SL2I+7zsWB0k274plwK4c+d5+a/fZ1/vJ9NiXCqi7zapKU8+9U
	5MpRuZ4sVm0Iw329JkQ==
X-Google-Smtp-Source: AGHT+IGrQByfI9wokfMWFe7K1Ttk8ewEB37twW8Y2YwoEzQNcIfJcFh4xKKTJ6P4DH7/NHxDz4jf6iOvc30RilE=
X-Received: from ede25.prod.google.com ([2002:a05:6402:20d9:b0:641:3d6a:4b38])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:27d4:b0:640:9eb3:3673 with SMTP id 4fb4d7f45d1cf-6415dbfbd56mr5809440a12.4.1762770816828;
 Mon, 10 Nov 2025 02:33:36 -0800 (PST)
Date: Mon, 10 Nov 2025 10:33:36 +0000
In-Reply-To: <20251110095025.1475896-4-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-4-ojeda@kernel.org>
Message-ID: <aRG_gJu_yZeJWPuo@google.com>
Subject: Re: [PATCH 03/18] rust: kbuild: simplify `--cfg` handling
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Mon, Nov 10, 2025 at 10:50:08AM +0100, Miguel Ojeda wrote:
> We need to handle `cfg`s in both `rustc` and `rust-analyzer`, and in
> future commits some of those contain double quotes, which complicates
> things further.
> 
> Thus, instead of removing the `--cfg ` part in the rust-analyzer
> generation script, have the `*-cfgs` variables contain just the actual
> `cfg`, and use that to generate the actual flags in `*-flags`.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

For anyone else reviewing this, here is the relevant part of the
makefile that calls generate_rust_analyzer:

rust-analyzer:
	$(Q)MAKEFLAGS= $(srctree)/scripts/generate_rust_analyzer.py \
		--cfgs='core=$(core-cfgs)' $(core-edition) \
		$(realpath $(srctree)) $(realpath $(objtree)) \
		$(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(srcroot)) \
		> rust-project.json
